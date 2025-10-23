#include "../../tonemap.hlsl"

// Uberpost - Trigger Ult 
Texture2D<float4> _BlitTex : register(t0);

Texture2D<float4> _Grain_Texture : register(t1);

Texture2D<float4> _InternalLut : register(t2);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t3);

Texture2D<float4> _NoiseTexture : register(t4);

Texture2D<float4> _GlitchTex : register(t5);

Texture2D<float4> _NapBloomTex : register(t6);

Texture2D<float4> _DirtTex : register(t7);

Texture2D<float4> _OldCRTPattern : register(t8);

cbuffer $Globals : register(b0) {
  uint _DebugFeature : packoffset(c000.x);
  float4 _InvCameraViewProj[4] : packoffset(c001.x);
  float4 _ScaledScreenParams : packoffset(c005.x);
  float4 _MainLightPosition : packoffset(c006.x);
  float4 _MainLightColor : packoffset(c007.x);
  float4 _DrawObjectPassData : packoffset(c008.x);
  float4 _ParticleLightParams : packoffset(c009.x);
  float4 _SceneParticleFogColorMultiply : packoffset(c010.x);
  float4 _KodamaGIParams : packoffset(c011.x);
  float _SampleLightmapAreaDirect : packoffset(c012.x);
  float4 _GlobalTimeParamsA[4] : packoffset(c013.x);
  float4 _GlobalTimeParamsB[4] : packoffset(c017.x);
  float4 _GlobalSceneEffectParams : packoffset(c021.x);
  float4 _AvatarPosition0 : packoffset(c022.x);
  float4 _FXCC_LutToneParams[4] : packoffset(c023.x);
  float _ShadowPancaking : packoffset(c027.x);
  float4 _GlobalLightParams : packoffset(c028.x);
  float4 _GlobalLightParams2 : packoffset(c029.x);
  float3 _WorldSpaceCameraPos : packoffset(c030.x);
  float4 _SceneWeatherParamsPart1[4] : packoffset(c031.x);
  float4 _SceneWeatherParamsPart2[4] : packoffset(c035.x);
  float4 _SceneWeatherParamsPart3[4] : packoffset(c039.x);
  float4 _SceneWeatherParamsPart4[4] : packoffset(c043.x);
  float4 _SceneWeatherParamsPart5[4] : packoffset(c047.x);
  float4 _SceneWeatherParamsPart6[4] : packoffset(c051.x);
  float4 _SceneWeatherParamsPart7[4] : packoffset(c055.x);
  float4 _ProjectionParams : packoffset(c059.x);
  float4 _ScreenParams : packoffset(c060.x);
  float4 _ZBufferParams : packoffset(c061.x);
  float4 unity_OrthoParams : packoffset(c062.x);
  float4 unity_CameraWorldClipPlanes[6] : packoffset(c063.x);
  float4 unity_CameraProjection[4] : packoffset(c069.x);
  float4 unity_CameraInvProjection[4] : packoffset(c073.x);
  float4 unity_WorldToCamera[4] : packoffset(c077.x);
  float4 unity_CameraToWorld[4] : packoffset(c081.x);
  float4 glstate_matrix_transpose_modelview0[4] : packoffset(c085.x);
  float4 glstate_matrix_projection[4] : packoffset(c089.x);
  float4 unity_MatrixV[4] : packoffset(c093.x);
  float4 unity_MatrixInvV[4] : packoffset(c097.x);
  float4 unity_MatrixVP[4] : packoffset(c101.x);
  float4 unity_MatrixInvVP[4] : packoffset(c105.x);
  float4 _PrevViewProjMatrix[4] : packoffset(c109.x);
  float4 _PrevInvViewProjMatrix[4] : packoffset(c113.x);
  float4 _NonJitteredViewProjMatrix[4] : packoffset(c117.x);
  float4 _NonJitteredProjMatrix[4] : packoffset(c121.x);
  float4 _PrevViewMatrix[4] : packoffset(c125.x);
  float4 _PrevProjMatrix[4] : packoffset(c129.x);
  float4 _InvViewProjMatrix[4] : packoffset(c133.x);
  float4 _ScreenSize : packoffset(c137.x);
  float4 _TaaFrameInfo : packoffset(c138.x);
  float4 _TaaJitterStrength : packoffset(c139.x);
  float4 _FxFogParamsPartA[4] : packoffset(c140.x);
  float4 _FxCustomFogColorNear : packoffset(c144.x);
  float4 _FxCustomFogColorFar : packoffset(c145.x);
  float4 _FxCustomFogColorFinal : packoffset(c146.x);
  float4 _SceneFogParamsPart1[4] : packoffset(c147.x);
  float4 _SceneFogParamsPart2[4] : packoffset(c151.x);
  float4 _SceneFogParamsPart3[4] : packoffset(c155.x);
  float4 _SkyHorizontalParam : packoffset(c159.x);
  float4 _AlphaBlendAlphaParams : packoffset(c160.x);
  float4 _FullscreenProjMat[4] : packoffset(c161.x);
  float4 _HDRParams : packoffset(c165.x);
  float4 _PixelCoordToViewDirWS[4] : packoffset(c166.x);
  float4 _SunDiskColor : packoffset(c170.x);
  float4 _MoonParams : packoffset(c171.x);
  float4 _MoonColor : packoffset(c172.x);
  float4 _MoonGlowColor : packoffset(c173.x);
  float4 _MoonAndGalaxyDir[4] : packoffset(c174.x);
  float _SunDiskIntensity : packoffset(c178.x);
  float _MoonPhaseAlphaBlend : packoffset(c178.y);
  float _GalaxyIntensity : packoffset(c178.z);
  float _StarsTwinkSpeed : packoffset(c178.w);
  float _StarsIntensity : packoffset(c179.x);
  float4 _MoonGlow2Params : packoffset(c180.x);
  float3 _HighCloudColor : packoffset(c181.x);
  float _CloudSwitch : packoffset(c181.w);
  float4 _CloudParams0 : packoffset(c182.x);
  float4 _CloudParams1 : packoffset(c183.x);
  float4 _CloudParams2 : packoffset(c184.x);
  float4 _CloudParams3 : packoffset(c185.x);
  float4 _CloudPhaseColorG : packoffset(c186.x);
  float4 _CloudShadowMoveSpeed : packoffset(c187.x);
  float4 _CloudLightParams1 : packoffset(c188.x);
  float4 _CloudLightParams2 : packoffset(c189.x);
  float4 _GlobalWindDirection : packoffset(c190.x);
  float _OverrideSkyWeight : packoffset(c191.x);
  float4 _OverrideSkyBtnColor : packoffset(c192.x);
  float4 _OverrideSkyTopColor : packoffset(c193.x);
  float4 _OverrideLowCloudLightColor : packoffset(c194.x);
  float4 _OverrideLowCloudDarkColor : packoffset(c195.x);
  float4 _OldCRTPattern_TexelSize : packoffset(c196.x);
};

cbuffer UberPostBaseCBuffer : register(b1) {
  float4 _Lut_Params : packoffset(c000.x);
  float4 _UserLut_Params : packoffset(c001.x);
  float4 _Bloom_Params : packoffset(c002.x);
  float4 _LensDirt_Params : packoffset(c003.x);
  float4 _Distortion_Params1 : packoffset(c004.x);
  float4 _Distortion_Params2 : packoffset(c005.x);
  float4 _Vignette_Params1 : packoffset(c006.x);
  float4 _Vignette_Params2 : packoffset(c007.x);
  float4 _Grain_TilingParams : packoffset(c008.x);
  float4 _Bloom_Texture_TexelSize : packoffset(c009.x);
  float4 _Dithering_Params : packoffset(c010.x);
  float4 _DistortionRgbShift : packoffset(c011.x);
  float4 UberPostBasePacked0 : packoffset(c012.x);
  float4 UberPostBasePacked1 : packoffset(c013.x);
  float4 _RgbShiftParams : packoffset(c014.x);
  float4 _NoiseParams : packoffset(c015.x);
  float4 _LineParams : packoffset(c016.x);
  float4 _GlitchMask_ST : packoffset(c017.x);
  float4 _RandomOpacity_ST : packoffset(c018.x);
  float4 UberPostBasePacked2 : packoffset(c019.x);
  float4 _DirtTexTillingOffset : packoffset(c020.x);
  float4 UberPostBasePacked3 : packoffset(c021.x);
  float4 UberPostBasePacked4 : packoffset(c022.x);
  float4 UberPostOldCRTPacked : packoffset(c023.x);
  float4 _ChromaCenter : packoffset(c024.x);
  float4 _VREffectsScanlineParams : packoffset(c025.x);
  float4 _VREffectsSliceParams : packoffset(c026.x);
  float4 UberPostGlitchParkedParams1 : packoffset(c027.x);
  float4 UberPostGlitchParkedParams2 : packoffset(c028.x);
  float4 GlitchTex1And2Scale : packoffset(c029.x);
  float4 _CharacterGhostParams : packoffset(c030.x);
  float4 _SceneWeatherSandstormParams01 : packoffset(c031.x);
  float4 _SceneWeatherSandstormParams02 : packoffset(c032.x);
  float4 _SceneWeatherSandstormParams03 : packoffset(c033.x);
  float4 _SceneWeatherSandstormParams04 : packoffset(c034.x);
};

SamplerState s_linear_clamp_sampler : register(s0);

SamplerState s_linear_repeat_sampler : register(s1);

SamplerState sampler_CameraDistortionTextureOverlay : register(s2);

SamplerState sampler_NoiseTexture : register(s3);

SamplerState sampler_GlitchTex : register(s4);

SamplerState sampler_NapBloomTex : register(s5);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float _56;
  float _57;
  float _58;
  float _59;
  float _60;
  float _61;
  float _62;
  float _63;
  float _157;
  float _158;
  float _159;
  float _188;
  float _189;
  float _190;
  float _394;
  float _395;
  float _396;
  float _406;
  float _407;
  float _408;
  float _409;
  float _448;
  float _449;
  float _450;
  float _537;
  float _538;
  float _539;
  if (_DistortionRgbShift.w > 0.0f) {
    float4 _28 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _32 = _28.x * 0.10000000149011612f;
    float _33 = _28.y * 0.10000000149011612f;
    float _38 = (_32 * _28.z) * _DistortionRgbShift.w;
    float _39 = (_33 * _28.z) * _DistortionRgbShift.w;
    _56 = (_32 + TEXCOORD.x);
    _57 = (_33 + TEXCOORD.y);
    _58 = ((_38 * _DistortionRgbShift.x) + _32);
    _59 = ((_39 * _DistortionRgbShift.x) + _33);
    _60 = ((_38 * _DistortionRgbShift.y) + _32);
    _61 = ((_39 * _DistortionRgbShift.y) + _33);
    _62 = ((_DistortionRgbShift.z * _38) + _32);
    _63 = ((_DistortionRgbShift.z * _39) + _33);
  } else {
    _56 = TEXCOORD.x;
    _57 = TEXCOORD.y;
    _58 = 0.0f;
    _59 = 0.0f;
    _60 = 0.0f;
    _61 = 0.0f;
    _62 = 0.0f;
    _63 = 0.0f;
  }
  float _66 = frac(_GlobalTimeParamsA[1].x);
  float4 _71 = _NoiseTexture.Sample(sampler_NoiseTexture, float2((_66 + (TEXCOORD.x * 5.0f)), (_66 + (TEXCOORD.y * 5.0f))));
  float _73 = _71.x + -0.5f;
  float _83 = ((_73 * 0.019999999552965164f) * _NoiseParams.y) * select((abs(_73 * 2.0f) < _NoiseParams.z), 0.0f, 1.0f);
  float _86 = cos(_RgbShiftParams.w);
  float _87 = sin(_RgbShiftParams.w);
  float _94 = (_RgbShiftParams.x * 0.10000000149011612f) + _83;
  float _95 = (_RgbShiftParams.y * 0.10000000149011612f) + _83;
  float _96 = (_RgbShiftParams.z * 0.10000000149011612f) + _83;
  float _98 = _94 * _87;
  float _100 = _95 * _87;
  float _102 = _96 * _87;
  float _110 = _NoiseParams.x * (frac(frac(_GlobalTimeParamsA[1].x) * 88.0f) + TEXCOORD.y);
  float4 _114 = _NoiseTexture.Sample(sampler_NoiseTexture, float2(0.5f, (_110 + _98)));
  float4 _116 = _NoiseTexture.Sample(sampler_NoiseTexture, float2(0.5f, (_110 + _100)));
  float4 _118 = _NoiseTexture.Sample(sampler_NoiseTexture, float2(0.5f, (_110 + _102)));
  float _121 = frac(_66 * 1234.0f);
  float _128 = (((_121 * _121) * (select((_LineParams.y < _LineParams.x), _LineParams.x, _LineParams.y) - _LineParams.x)) * _121) + _LineParams.x;
  float _135 = select((_128 < _114.x), 0.0f, 1.0f) * _LineParams.z;
  float _136 = select((_128 < _116.x), 0.0f, 1.0f) * _LineParams.z;
  float _137 = select((_128 < _118.x), 0.0f, 1.0f) * _LineParams.z;
  [branch]
  if (UberPostBasePacked2.z > 0.5f) {
    float4 _151 = _GlitchTex.Sample(sampler_GlitchTex, float2(((_GlitchMask_ST.x * TEXCOORD.x) + _GlitchMask_ST.z), ((_GlitchMask_ST.y * TEXCOORD.y) + _GlitchMask_ST.w)));
    _157 = (_151.x * _135);
    _158 = (_151.x * _136);
    _159 = (_151.x * _137);
  } else {
    _157 = _135;
    _158 = _136;
    _159 = _137;
  }
  [branch]
  if (UberPostBasePacked2.w > 0.5f) {
    float4 _182 = _GlitchTex.Sample(sampler_GlitchTex, float2((((_RandomOpacity_ST.x * TEXCOORD.x) + _RandomOpacity_ST.z) + frac(UberPostBasePacked2.x * (_GlobalTimeParamsA[1].x))), (((_RandomOpacity_ST.y * TEXCOORD.y) + _RandomOpacity_ST.w) + frac(UberPostBasePacked2.y * (_GlobalTimeParamsA[1].x)))));
    _188 = (_182.y * _157);
    _189 = (_182.y * _158);
    _190 = (_182.y * _159);
  } else {
    _188 = _157;
    _189 = _158;
    _190 = _159;
  }
  float4 _195 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_58 + TEXCOORD.x) + (_94 * _86)), ((_59 + TEXCOORD.y) + _98)));
  float4 _201 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_60 + TEXCOORD.x) + (_95 * _86)), ((_61 + TEXCOORD.y) + _100)));
  float4 _207 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_62 + TEXCOORD.x) + (_96 * _86)), ((_63 + TEXCOORD.y) + _102)));
  float4 _209 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_56, _57));
  float4 _221 = _OldCRTPattern.Sample(s_linear_repeat_sampler, float2(((UberPostOldCRTPacked.x * TEXCOORD.x) * _OldCRTPattern_TexelSize.x), ((UberPostOldCRTPacked.y * TEXCOORD.y) * _OldCRTPattern_TexelSize.y)));
  float _233 = frac((_GlobalTimeParamsA[1].x) * 25.0f) - (1.0f - TEXCOORD.y);
  float _234 = 0.4000000059604645f - _233;
  float _247 = (UberPostOldCRTPacked.w * max(((select((_234 < 0.4000000059604645f), 0.0f, 1.0f) * ((saturate(_233 + 0.05000000074505806f) * 10.0f) - _234)) + _234), 0.0f)) + 1.0f;
  float _252 = 1.0f - UberPostOldCRTPacked.z;
  float _262 = (((((_221.x * 12.0f) * _247) * _252) + UberPostOldCRTPacked.z) * _195.x) + _188;
  float _263 = (((((_221.y * 12.0f) * _247) * _252) + UberPostOldCRTPacked.z) * _201.y) + _189;
  float _264 = (((((_221.z * 12.0f) * _247) * _252) + UberPostOldCRTPacked.z) * _207.z) + _190;
  bool _271 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _271))) {
    float _281 = fmod(((_ScreenSize.y * _57) * _VREffectsScanlineParams.x), 2.0f);
    float _289 = (((select((_281 > 1.0f), (2.0f - _281), _281) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _56;
    float _292 = _ScreenSize.w * _ScreenSize.x;
    float4 _311 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_289, ((select(((frac((((_289 + abs(_VREffectsSliceParams.y)) * _292) - (_VREffectsSliceParams.y * _57)) / ((_292 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _57)));
    float _348 = ((((-0.699999988079071f - _311.x) + (exp2(log2(abs(_311.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_311.x < 0.30000001192092896f), 0.0f, 1.0f)) + _311.x) * UberPostBasePacked3.x;
    float _349 = ((((-0.699999988079071f - _311.y) + (exp2(log2(abs(_311.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_311.y < 0.30000001192092896f), 0.0f, 1.0f)) + _311.y) * UberPostBasePacked3.x;
    float _350 = ((((-0.699999988079071f - _311.z) + (exp2(log2(abs(_311.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_311.z < 0.30000001192092896f), 0.0f, 1.0f)) + _311.z) * UberPostBasePacked3.x;
    float _351 = dot(float3(_262, _263, _264), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _354 = (UberPostBasePacked4.x > 0.5f);
    float _367 = select(_354, ((((_348 * _351) - _348) * _209.w) + _348), _348);
    float _368 = select(_354, ((((_349 * _351) - _349) * _209.w) + _349), _349);
    float _369 = select(_354, ((((_350 * _351) - _350) * _209.w) + _350), _350);
    do {
      if (_271) {
        float4 _380 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _56) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _57) + _DirtTexTillingOffset.w)));
        _394 = (((_380.x * _348) * UberPostBasePacked3.y) + _367);
        _395 = (((_380.y * _349) * UberPostBasePacked3.y) + _368);
        _396 = (((_380.z * _350) * UberPostBasePacked3.y) + _369);
      } else {
        _394 = _367;
        _395 = _368;
        _396 = _369;
      }
      _406 = (_394 + _262);
      _407 = (_395 + _263);
      _408 = (_396 + _264);
      _409 = saturate((((_395 + _394) + _396) * 0.33329999446868896f) + _209.w);
    } while (false);
  } else {
    _406 = _262;
    _407 = _263;
    _408 = _264;
    _409 = _209.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _426 = abs(_57 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _428 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_56 - _Vignette_Params2.x);
    float _434 = exp2(log2(saturate(1.0f - dot(float2(_428, _426), float2(_428, _426)))) * _Vignette_Params2.w);
    _448 = (((_434 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _406);
    _449 = (((_434 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _407);
    _450 = (((_434 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _408);
  } else {
    _448 = _406;
    _449 = _407;
    _450 = _408;
  }
  float3 untonemapped = (float3(_448, _449, _450));
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _499 = tonemapped.x;
  float _500 = tonemapped.y;
  float _501 = tonemapped.z;

  /*
  float _473 = saturate((log2((_450 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _474 = floor(_473);
  float _480 = ((saturate((log2((_449 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _482 = (_474 * _Lut_Params.y) + (((saturate((log2((_448 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _483 = _473 - _474;
  float4 _485 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_482 + _Lut_Params.y), _480), 0.0f);
  float4 _489 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_482, _480), 0.0f);
  float _499 = ((_485.x - _489.x) * _483) + _489.x;
  float _500 = ((_485.y - _489.y) * _483) + _489.y;
  float _501 = ((_485.z - _489.z) * _483) + _489.z;*/
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _516 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _519 = (_516.w + -0.5f) * 2.0f;
    float _523 = 1.0f - (sqrt(dot(float3(_499, _500, _501), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _537 = ((((UberPostBasePacked1.x * _499) * _519) * _523) + _499);
    _538 = ((((UberPostBasePacked1.x * _500) * _519) * _523) + _500);
    _539 = ((((UberPostBasePacked1.x * _501) * _519) * _523) + _501);
  } else {
    _537 = _499;
    _538 = _500;
    _539 = _501;
  }
  SV_Target.x = _537;
  SV_Target.y = _538;
  SV_Target.z = _539;
  SV_Target.w = _409;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
