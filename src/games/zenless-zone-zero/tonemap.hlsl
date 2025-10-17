#include "./shared.h"

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

  float3 gradedColor = renodx::lut::Sample(
      renodx::tonemap::renodrt::NeutralSDR(color),
      lutConfig,
      lutTexture);

  return renodx::draw::ToneMapPass(outputColor, gradedColor);
}
