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

renodx::mods::shader::CustomShaders custom_shaders = {
    CustomShaderEntry(0x9496233C),  // Secondary lutbuilder, seems to be used on characters.
    CustomShaderEntry(0x9E8F1321),
    CustomShaderEntry(0xBBACCDAD),
    CustomShaderEntry(0x2E1A6F79),
    CustomShaderEntry(0xBB3FD02D),
    CustomShaderEntry(0xB30C1D4B),
    CustomShaderEntry(0xF8C68E05),
    CustomShaderEntry(0xD889AB3A),
    CustomShaderEntry(0xDA780F00),
    CustomShaderEntry(0xDF092A7C),
    CustomShaderEntry(0xF7EBAAB1),
    CustomShaderEntry(0xE6718C61)};

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
        .key = "toneMapGammaCorrection",
        .binding = &shader_injection.toneMapGammaCorrection,
        .value_type = renodx::utils::settings::SettingValueType::INTEGER,
        .default_value = 1.f,
        .label = "Gamma Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates a 2.2 EOTF"
                   "\nDefault: On with HDR",
        .labels = {"Off", "On"},
    },
    new renodx::utils::settings::Setting{
        .key = "toneMapHueCorrection",
        .binding = &shader_injection.toneMapHueCorrection,
        .default_value = 50.f,
        .label = "Hue Correction",
        .section = "Tone Mapping",
        .tooltip = "Emulates Vanilla hue shifts.",
        .min = 0.f,
        .max = 100.f,
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

  if (
      !is_dispatch
      && (pixel_shader_hash == 0x9E8F1321 || pixel_shader_hash == 0x2E1A6F79 || pixel_shader_hash == 0xDF092A7C
          || pixel_shader_hash == 0xBB3FD02D || pixel_shader_hash == 0x811A49EB )) {
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
      renodx::mods::swapchain::use_resource_cloning = true;
      renodx::mods::swapchain::swap_chain_proxy_vertex_shader = __swap_chain_proxy_vertex_shader;
      renodx::mods::swapchain::swap_chain_proxy_pixel_shader = __swap_chain_proxy_pixel_shader;

      //  RG11B10_float (UAV stuff)
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({.old_format = reshade::api::format::r11g11b10_float,
                                                                     .new_format = reshade::api::format::r16g16b16a16_float,
                                                                     .ignore_size = true,
                                                                     .view_upgrades = {
                                                                         {{reshade::api::resource_usage::shader_resource,
                                                                           reshade::api::format::r11g11b10_float},
                                                                          reshade::api::format::r16g16b16a16_float},
                                                                         {{reshade::api::resource_usage::unordered_access,
                                                                           reshade::api::format::r11g11b10_float},
                                                                          reshade::api::format::r16g16b16a16_float},
                                                                         {{reshade::api::resource_usage::render_target,
                                                                           reshade::api::format::r11g11b10_float},
                                                                          reshade::api::format::r16g16b16a16_float},
                                                                     }});

      //  RGBA8_typeless
      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({.old_format = reshade::api::format::r8g8b8a8_typeless,
                                                                     .new_format = reshade::api::format::r16g16b16a16_float,
                                                                     .index = 0,
                                                                     .ignore_size = true});

      renodx::mods::swapchain::swap_chain_upgrade_targets.push_back({.old_format = reshade::api::format::r8g8b8a8_typeless,
                                                                     .new_format = reshade::api::format::r16g16b16a16_float,
                                                                     .ignore_size = true,
                                                                     .use_resource_view_cloning = true,
                                                                     .use_resource_view_hot_swap = true});

      reshade::register_event<reshade::addon_event::draw>(OnDraw);
      reshade::register_event<reshade::addon_event::draw_indexed>(OnDrawIndexed);
      reshade::register_event<reshade::addon_event::draw_or_dispatch_indirect>(OnDrawOrDispatchIndirect);
      reshade::register_event<reshade::addon_event::dispatch>(OnDispatch);

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
