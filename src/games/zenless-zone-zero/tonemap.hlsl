#include "./shared.h"

renodx::tonemap::Config createTonemapConfig(float3 color) {
  float vanillaMidGray = renodx::tonemap::unity::BT709(0.18f).x;

  renodx::tonemap::Config config = renodx::tonemap::config::Create();
  config.type = injectedData.toneMapType;
  config.peak_nits = injectedData.toneMapPeakNits;
  config.game_nits = injectedData.toneMapGameNits;
  config.gamma_correction = injectedData.toneMapGammaCorrection;
  config.exposure = injectedData.colorGradeExposure;
  config.highlights = injectedData.colorGradeHighlights;
  config.shadows = injectedData.colorGradeShadows;
  config.contrast = injectedData.colorGradeContrast;
  config.saturation = injectedData.colorGradeSaturation;
  config.mid_gray_value = vanillaMidGray;
  config.mid_gray_nits = vanillaMidGray * 100.f;
  config.reno_drt_dechroma = injectedData.colorGradeBlowout;
  config.reno_drt_flare = injectedData.colorGradeFlare;

  config.hue_correction_type = renodx::tonemap::config::hue_correction_type::CUSTOM;
  config.hue_correction_color = lerp(
      color,
      saturate(renodx::tonemap::unity::BT709(color)),
      injectedData.toneMapHueCorrection);

  return config;
}

float3 applyUserToneMap(float3 color, float4 lutParams, Texture2D<float4> lutTexture, SamplerState lutSampler) {
  float3 outputColor = color;

  bool useSDRLut = (lutParams.w > 0.0f);

  renodx::lut::Config lutConfig = renodx::lut::config::Create(
      lutSampler,
      useSDRLut ? lutParams.w * injectedData.colorGradeLUTStrength : 0,
      injectedData.colorGradeLUTScaling,
      renodx::lut::config::type::SRGB,
      renodx::lut::config::type::SRGB,
      lutParams.xyz  // precompute
  );

  renodx::tonemap::Config config = createTonemapConfig(color);

  return renodx::tonemap::config::Apply(outputColor, config, lutConfig, lutTexture);
}
