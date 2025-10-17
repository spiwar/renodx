#ifndef SRC_ZENLESS_ZONE_ZERO_SHARED_H_
#define SRC_ZENLESS_ZONE_ZERO_SHARED_H_

// Must be 32bit aligned
// Should be 4x32
struct ShaderInjectData {
  float toneMapType;
  float toneMapPeakNits;
  float toneMapGameNits;
  float toneMapUINits;

  float toneMapGammaCorrection;
  float toneMapHueProcessor;
  float toneMapHueCorrection;
  float toneMapHueShift;

  float colorGradeExposure;
  float colorGradeHighlights;
  float colorGradeShadows;
  float colorGradeContrast;
  float colorGradeSaturation;
  float colorGradeHighlightSaturation;

  float colorGradeBlowout;
  float colorGradeFlare;
  float colorGradeLUTStrength;
  float colorGradeLUTScaling;

  float swapchainIntermediateEncoding;
  float swapchainDecoding;
  float swapchainGammaCorrection;
  float swapchainCustomColorSpace;
  float swapchainClampColorSpace;
  float swapchainEncoding;
  float swapchainEncodingColorSpace;
};

#ifndef __cplusplus
#if ((__SHADER_TARGET_MAJOR == 5 && __SHADER_TARGET_MINOR >= 1) || __SHADER_TARGET_MAJOR >= 6)
cbuffer injected_buffer : register(b13, space50) {
#elif (__SHADER_TARGET_MAJOR < 5) || ((__SHADER_TARGET_MAJOR == 5) && (__SHADER_TARGET_MINOR < 1))
cbuffer injected_buffer : register(b13) {
#endif
  ShaderInjectData injectedData : packoffset(c0);
}

#define RENODX_TONE_MAP_TYPE                   injectedData.toneMapType
#define RENODX_PEAK_NITS                       injectedData.toneMapPeakNits
#define RENODX_GAME_NITS                       injectedData.toneMapGameNits
#define RENODX_UI_NITS                         injectedData.toneMapUINits
#define RENODX_GAMMA_CORRECTION                injectedData.toneMapGammaCorrection
#define RENODX_TONE_MAP_HUE_PROCESSOR          injectedData.toneMapHueProcessor
#define RENODX_TONE_MAP_HUE_CORRECTION         injectedData.toneMapHueCorrection
#define RENODX_TONE_MAP_HUE_SHIFT              injectedData.toneMapHueShift
#define RENODX_TONE_MAP_EXPOSURE               injectedData.colorGradeExposure
#define RENODX_TONE_MAP_HIGHLIGHTS             injectedData.colorGradeHighlights
#define RENODX_TONE_MAP_SHADOWS                injectedData.colorGradeShadows
#define RENODX_TONE_MAP_CONTRAST               injectedData.colorGradeContrast
#define RENODX_TONE_MAP_SATURATION             injectedData.colorGradeSaturation
#define RENODX_TONE_MAP_HIGHLIGHT_SATURATION   injectedData.colorGradeHighlightSaturation
#define RENODX_TONE_MAP_BLOWOUT                injectedData.colorGradeBlowout
#define RENODX_TONE_MAP_FLARE                  injectedData.colorGradeFlare
#define RENODX_INTERMEDIATE_ENCODING           injectedData.swapchainIntermediateEncoding
#define RENODX_SWAP_CHAIN_DECODING             injectedData.swapchainDecoding
#define RENODX_SWAP_CHAIN_GAMMA_CORRECTION     injectedData.swapchainGammaCorrection
#define RENODX_SWAP_CHAIN_CUSTOM_COLOR_SPACE   injectedData.swapchainCustomColorSpace
#define RENODX_SWAP_CHAIN_CLAMP_COLOR_SPACE    injectedData.swapchainClampColorSpace
#define RENODX_SWAP_CHAIN_ENCODING             injectedData.swapchainEncoding
#define RENODX_SWAP_CHAIN_ENCODING_COLOR_SPACE injectedData.swapchainEncodingColorSpace
#define RENODX_RENO_DRT_TONE_MAP_METHOD        renodx::tonemap::renodrt::config::tone_map_method::REINHARD

#include "../../shaders/renodx.hlsl"
#endif

#endif  // SRC_ZENLESS_ZONE_ZERO_SHARED_H_
