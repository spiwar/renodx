/*
 * Copyright (C) 2023 Carlos Lopez
 * SPDX-License-Identifier: MIT
 */

#define ImTextureID ImU64

#define DEBUG_LEVEL_0

#include <algorithm>

#include <embed/shaders.h>

#include <deps/imgui/imgui.h>
#include <include/reshade.hpp>

#include "../../mods/shader.hpp"
#include "../../mods/swapchain.hpp"
#include "../../utils/settings.hpp"
#include "./shared.h"

namespace {

renodx::mods::shader::CustomShaders custom_shaders = {__ALL_CUSTOM_SHADERS};

ShaderInjectData shader_injection;
const std::string build_date = __DATE__;
const std::string build_time = __TIME__;

renodx::utils::settings::Settings settings = {
    new renodx::utils::settings::Setting{
        .key = "toneMapType",
        .binding = &shader_injection.toneMapType,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 3.f,
        .label = "Tone Mapper",
        .section = "Tone Mapping",
        .tooltip = "Sets the tone mapper type",
        .labels = {"Vanilla", "None", "ACES", "RenoDRT"},
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapPeakNits",
        .binding = &shader_injection.toneMapPeakNits,
        .default_value = 1000.f,
        .label = "Peak Brightness",
        .section = "Tone Mapping",
        .tooltip =
            "Sets the value of peak white in nits."
            "\nDefault: Display peak brightness",
        .min = 80.f,
        .max = 4000.f,
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapGameNits",
        .binding = &shader_injection.toneMapGameNits,
        .default_value = 203.f,
        .label = "Game Brightness",
        .section = "Tone Mapping",
        .tooltip = "Sets the value of 100% white in nits."
                   "\nDefault: Reference white value for display peak brightness",
        .min = 80.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapUINits",
        .binding = &shader_injection.toneMapUINits,
        .default_value = 203.f,
        .label = "UI Brightness",
        .section = "Tone Mapping",
        .tooltip =
            "Sets the brightness of UI and HUD elements in nits."
            "\nDefault: Windows SDR content brightness",
        .min = 80.f,
        .max = 500.f,
    },
    new renodx::utils::settings::Setting{
        .key = "gammaCorrection",
        .binding = &shader_injection.toneMapGammaCorrection,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Gamma Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates a display EOTF.",
        .labels = {"Off", "2.2", "BT.1886"},
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapHueProcessor",
        .binding = &shader_injection.toneMapHueProcessor,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Hue Processor",
        .section = "Tone Mapping",
        .tooltip = "Selects hue processor",
        .labels = {"OKLab", "ICtCp", "darkTable UCS"},
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapHueCorrection",
        .binding = &shader_injection.toneMapHueCorrection,
        .default_value = 100.f,
        .label = "Hue Correction",
        .section = "Tone Mapping",
        .tooltip = "Hue retention strength.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType >= 1; },
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ToneMapHueShift",
        .binding = &shader_injection.toneMapHueShift,
        .default_value = 50.f,
        .label = "Hue Shift",
        .section = "Tone Mapping",
        .tooltip = "Hue-shift emulation strength.",
        .min = 0.f,
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType >= 1; },
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeExposure",
        .binding = &shader_injection.colorGradeExposure,
        .default_value = 1.f,
        .label = "Exposure",
        .section = "Color Grading",
        .max = 10.f,
        .format = "%.2f",
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeHighlights",
        .binding = &shader_injection.colorGradeHighlights,
        .default_value = 50.f,
        .label = "Highlights",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeShadows",
        .binding = &shader_injection.colorGradeShadows,
        .default_value = 50.f,
        .label = "Shadows",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeContrast",
        .binding = &shader_injection.colorGradeContrast,
        .default_value = 50.f,
        .label = "Contrast",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeSaturation",
        .binding = &shader_injection.colorGradeSaturation,
        .default_value = 50.f,
        .label = "Saturation",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "ColorGradeHighlightSaturation",
        .binding = &shader_injection.colorGradeHighlightSaturation,
        .default_value = 50.f,
        .label = "Highlight Saturation",
        .section = "Color Grading",
        .tooltip = "Adds or removes highlight color.",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType >= 1; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeBlowout",
        .binding = &shader_injection.colorGradeBlowout,
        .default_value = 0.f,
        .label = "Blowout",
        .section = "Color Grading",
        .tooltip = "Controls highlight desaturation due to overexposure.",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType == 3; },
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeFlare",
        .binding = &shader_injection.colorGradeFlare,
        .default_value = 0.f,
        .label = "Flare",
        .section = "Color Grading",
        .tooltip = "Flare/Glare Compensation",
        .max = 100.f,
        .is_enabled = []() { return shader_injection.toneMapType == 3; },
        .parse = [](float value) { return value * 0.02f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeLUTStrength",
        .binding = &shader_injection.colorGradeLUTStrength,
        .default_value = 100.f,
        .label = "LUT Strength",
        .section = "Color Grading",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "colorGradeLUTScaling",
        .binding = &shader_injection.colorGradeLUTScaling,
        .default_value = 100.f,
        .label = "LUT Scaling",
        .section = "Color Grading",
        .tooltip = "Scales the color grade LUT to full range when size is clamped.",
        .max = 100.f,
        .parse = [](float value) { return value * 0.01f; },
    },
    new renodx::utils::settings::Setting{
        .key = "swapChainCustomColorSpace",
        .binding = &shader_injection.swapchainCustomColorSpace,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Custom Color Space",
        .section = "Display Output",
        .tooltip = "Selects output color space"
                   "\nUS Modern for BT.709 D65."
                   "\nJPN Modern for BT.709 D93."
                   "\nUS CRT for BT.601 (NTSC-U)."
                   "\nJPN CRT for BT.601 ARIB-TR-B9 D93 (NTSC-J)."
                   "\nDefault: US CRT",
        .labels = {
            "US Modern",
            "JPN Modern",
            "US CRT",
            "JPN CRT",
        },
        .is_visible = []() { return settings[0]->GetValue() >= 1; },
    },
    new renodx::utils::settings::Setting{
        .key = "intermediateDecoding",
        .binding = &shader_injection.swapchainIntermediateEncoding,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Intermediate Encoding",
        .section = "Display Output",
        .labels = {"Auto", "None", "SRGB", "2.2", "2.4"},
        .is_enabled = []() { return shader_injection.toneMapType >= 1; },
        .parse = [](float value) {
            if (value == 0) return shader_injection.toneMapGammaCorrection + 1.f;
            return value - 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "swapchainDecoding",
        .binding = &shader_injection.swapchainDecoding,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Swapchain Decoding",
        .section = "Display Output",
        .labels = {"Auto", "None", "SRGB", "2.2", "2.4"},
        .is_enabled = []() { return shader_injection.toneMapType >= 1; },
        .parse = [](float value) {
            if (value == 0) return shader_injection.swapchainIntermediateEncoding;
            return value - 1.f; },
    },
    new renodx::utils::settings::Setting{
        .key = "swapchainGammaCorrection",
        .binding = &shader_injection.swapchainGammaCorrection,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 0.f,
        .label = "Gamma Correction",
        .section = "Display Output",
        .labels = {"None", "2.2", "2.4"},
        .is_enabled = []() { return shader_injection.toneMapType >= 1; },
    },
        new renodx::utils::settings::Setting{
        .key = "swapchainClampColorSpace",
        .binding = &shader_injection.swapchainClampColorSpace,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 2.f,
        .label = "Clamp Color Space",
        .section = "Display Output",
        .labels = {"None", "BT709", "BT2020", "AP1"},
        .is_enabled = []() { return shader_injection.toneMapType >= 1; },
        .parse = [](float value) { return value - 1.f; },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "RenoDX by ShortFuse, game mod by Maple.",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "Note: Changes to the Tonemapping/Color Grading sections may require a scene change to apply!",
        .section = "About",
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "HDR Den Discord",
        .section = "About",
        .group = "button-line-1",
        .tint = 0x5865F2,
        .on_change = []() {
          static const std::string obfuscated_link = std::string("start https://discord.gg/XUhv") + std::string("tR54yc");
          system(obfuscated_link.c_str());
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "Github",
        .section = "About",
        .group = "button-line-1",
        .on_change = []() {
          ShellExecute(0, "open", "https://github.com/clshortfuse/renodx", 0, 0, SW_SHOW);
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "ShortFuse's Ko-Fi",
        .section = "About",
        .group = "button-line-1",
        .tint = 0xFF5F5F,
        .on_change = []() {
          ShellExecute(0, "open", "https://ko-fi.com/shortfuse", 0, 0, SW_SHOW);
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::BUTTON,
        .label = "HDR Den's Ko-Fi",
        .section = "About",
        .group = "button-line-1",
        .tint = 0xFF5F5F,
        .on_change = []() {
          ShellExecute(0, "open", "https://ko-fi.com/hdrden", 0, 0, SW_SHOW);
        },
    },
    new renodx::utils::settings::Setting{
        .value_type = renodx::utils::settings::SettingValueType::TEXT,
        .label = "This build was compiled on " + build_date + " at " + build_time + ".",
        .section = "About",
    },
};

void OnPresetOff() {
  renodx::utils::settings::UpdateSetting("toneMapType", 0.f);
  renodx::utils::settings::UpdateSetting("toneMapPeakNits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapGameNits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapUINits", 203.f);
  renodx::utils::settings::UpdateSetting("toneMapGammaCorrection", 0);
  renodx::utils::settings::UpdateSetting("colorGradeExposure", 1.f);
  renodx::utils::settings::UpdateSetting("colorGradeHighlights", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeShadows", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeContrast", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeSaturation", 50.f);
  renodx::utils::settings::UpdateSetting("colorGradeLUTStrength", 100.f);
  renodx::utils::settings::UpdateSetting("colorGradeLUTScaling", 0.f);
  renodx::utils::settings::UpdateSetting("processingInternalSampling", 0.f);
}

bool HandlePreDraw(reshade::api::command_list* cmd_list, bool is_dispatch = false) {
  auto* shader_state = renodx::utils::shader::GetCurrentState(cmd_list);

  auto pixel_shader_hash = renodx::utils::shader::GetCurrentPixelShaderHash(shader_state);
  // 0xDF092A7C and 0x2E1A6F79 are used to unclamp the main menu.
  // 0x9E8F1321 is the first Uberpost used and it's here to unclamp the main game at 0.8 render scale
  // 0xBB3FD02D is used to unclamp the character portraits
  // 0x811A49EB is an UI shader and we use it to unclamp the dialog RTV.
  // 0x7FC3C83A is an Uberpost used on the Map menu screen
  // 0x28F74247 is an Uberpost on the Agent Archives screen
  if (
      !is_dispatch
      && (pixel_shader_hash == 0x9E8F1321 || pixel_shader_hash == 0x2E1A6F79 || pixel_shader_hash == 0xDF092A7C
          || pixel_shader_hash == 0xBB3FD02D || pixel_shader_hash == 0x811A49EB || pixel_shader_hash == 0x7FC3C83A
          || pixel_shader_hash == 0x28F74247)) {
    auto rtvs = renodx::utils::swapchain::GetRenderTargets(cmd_list);

    bool changed = false;
    for (auto rtv : rtvs) {
      if (renodx::mods::swapchain::ActivateCloneHotSwap(cmd_list->get_device(), rtv)) {
        std::stringstream s;
        s << "Upgrading RTV: ";
        s << reinterpret_cast<void*>(rtv.handle);
        s << ", shader: ";
        s << PRINT_CRC32(pixel_shader_hash);
        s << ")";
        reshade::log::message(reshade::log::level::debug, s.str().c_str());

        changed = true;
      }
    }
    if (changed) {
      renodx::mods::swapchain::FlushDescriptors(cmd_list);
    }
  }

  return false;
}

bool OnDraw(reshade::api::command_list* cmd_list, uint32_t vertex_count,
            uint32_t instance_count, uint32_t first_vertex, uint32_t first_instance) {
  return HandlePreDraw(cmd_list);
}

bool OnDrawIndexed(reshade::api::command_list* cmd_list, uint32_t index_count,
                   uint32_t instance_count, uint32_t first_index, int32_t vertex_offset, uint32_t first_instance) {
  return HandlePreDraw(cmd_list);
}

bool OnDrawOrDispatchIndirect(reshade::api::command_list* cmd_list, reshade::api::indirect_command type,
                              reshade::api::resource buffer, uint64_t offset, uint32_t draw_count, uint32_t stride) {
  return HandlePreDraw(cmd_list);
}

bool OnDispatch(reshade::api::command_list* cmd_list,
                uint32_t group_count_x, uint32_t group_count_y, uint32_t group_count_z) {
  return HandlePreDraw(cmd_list, true);
}

}  // namespace

extern "C" __declspec(dllexport) constexpr const char* NAME = "RenoDX";
extern "C" __declspec(dllexport) constexpr const char* DESCRIPTION = "RenoDX for Zenless Zone Zero";

BOOL APIENTRY DllMain(HMODULE h_module, DWORD fdw_reason, LPVOID lpv_reserved) {
  switch (fdw_reason) {
    case DLL_PROCESS_ATTACH:
      if (!reshade::register_addon(h_module)) return FALSE;

      // Check if we're a raytracing pipeline using NvAPI SER, it follows this layout:
      // [0] | TBL | 1885845696336 | TUAV, array_size: 1, binding: 0, count: 1, register: 0, space: 2, visibility: all
      renodx::mods::shader::on_create_pipeline_layout = [](auto, std::span<reshade::api::pipeline_layout_param> params) {
        if (params.size() != 1)
          return true;

        bool has_tbl = std::ranges::any_of(params, [](auto param) {
          return (param.type == reshade::api::pipeline_layout_param_type::descriptor_table);
        });

        if (has_tbl && params[0].descriptor_table.ranges->type == reshade::api::descriptor_type::texture_unordered_access_view
            && params[0].descriptor_table.ranges->dx_register_index == 0
            && params[0].descriptor_table.ranges->dx_register_space == 2)
          return false;

        return true;
      };

      renodx::mods::shader::expected_constant_buffer_index = 13;
      renodx::mods::shader::expected_constant_buffer_space = 50;
      renodx::mods::shader::force_pipeline_cloning = true;

      renodx::mods::swapchain::expected_constant_buffer_index = 13;
      renodx::mods::swapchain::expected_constant_buffer_space = 50;

      renodx::mods::swapchain::use_resource_cloning = true;
      renodx::mods::swapchain::use_resize_buffer = true;
      renodx::mods::swapchain::use_resize_buffer_on_set_full_screen = true;
      renodx::mods::swapchain::use_resize_buffer_on_present = true;
      renodx::mods::swapchain::swap_chain_proxy_shaders = {
          {
              reshade::api::device_api::d3d11,
              {
                  .vertex_shader = __swap_chain_proxy_vertex_shader_dx11,
                  .pixel_shader = __swap_chain_proxy_pixel_shader_dx11,
              },
          },
          {
              reshade::api::device_api::d3d12,
              {
                  .vertex_shader = __swap_chain_proxy_vertex_shader_dx12,
                  .pixel_shader = __swap_chain_proxy_pixel_shader_dx12,
              },
          },
      };

      /*//  RG11B10_float (UAV stuff)
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({.old_format = reshade::api::format::r11g11b10_float,
                                                                     .new_format = reshade::api::format::r16g16b16a16_float,
                                                                     .ignore_size = true,
                                                                     .use_resource_view_cloning = true,
                                                                     .usage_include = reshade::api::resource_usage::render_target | reshade::api::resource_usage::unordered_access});*/

      //  RGBA8_typeless
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({
          .old_format = reshade::api::format::r8g8b8a8_typeless,
          .new_format = reshade::api::format::r16g16b16a16_float,
          .use_resource_view_cloning = true,
          .aspect_ratio = renodx::mods::swapchain::SwapChainUpgradeTarget::BACK_BUFFER,
          .aspect_ratio_tolerance = 0.02f
          //.use_resource_view_hot_swap = true
      });

      {
        auto* setting = new renodx::utils::settings::Setting{
            .key = "swapChainEncoding",
            .binding = &shader_injection.swapchainEncoding,
            .value_type = renodx::utils::settings::SettingValueType::INTEGER,
            .default_value = 4.f,
            .label = "Encoding",
            .section = "Display Output",
            .labels = {"None", "SRGB", "2.2", "2.4", "HDR10", "scRGB"},
            .is_enabled = []() { return shader_injection.toneMapType >= 1; },
            .on_change_value = [](float previous, float current) {
              bool is_hdr10 = current == 4;
              shader_injection.swapchainEncodingColorSpace = (is_hdr10 ? 1.f : 0.f);
              // return void
            },
            .is_global = true,
        };
        renodx::utils::settings::LoadSetting(renodx::utils::settings::global_name, setting);
        bool is_hdr10 = setting->GetValue() == 4;
        renodx::mods::swapchain::SetUseHDR10(is_hdr10);
        renodx::mods::swapchain::use_resize_buffer = setting->GetValue() < 4;
        shader_injection.swapchainEncodingColorSpace = is_hdr10 ? 1.f : 0.f;
        settings.push_back(setting);
      }

      /*reshade::register_event<reshade::addon_event::draw>(OnDraw);
      reshade::register_event<reshade::addon_event::draw_indexed>(OnDrawIndexed);
      reshade::register_event<reshade::addon_event::draw_or_dispatch_indirect>(OnDrawOrDispatchIndirect);
      reshade::register_event<reshade::addon_event::dispatch>(OnDispatch);*/

      break;
    case DLL_PROCESS_DETACH:
      reshade::unregister_addon(h_module);
      break;
  }

  renodx::utils::settings::Use(fdw_reason, &settings, &OnPresetOff);
  renodx::mods::swapchain::Use(fdw_reason, &shader_injection);
  renodx::mods::shader::Use(fdw_reason, custom_shaders, &shader_injection);

  return TRUE;
}
