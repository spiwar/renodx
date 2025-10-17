#include "../../tonemap.hlsl"

// Primary UberPost (Used in Open World/Most Combat Stages)

Texture2D<float4> _BlitTex : register(t0);

Texture2D<float4> _Grain_Texture : register(t1);

Texture2D<float4> _InternalLut : register(t2);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t3);

Texture2D<float4> _NapBloomTex : register(t4);

Texture2D<float4> _DirtTex : register(t5);

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

SamplerState sampler_NapBloomTex : register(s3);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float _47;
  float _48;
  float _49;
  float _50;
  float _51;
  float _52;
  float _53;
  float _54;
  float _239;
  float _240;
  float _241;
  float _251;
  float _252;
  float _253;
  float _254;
  float _293;
  float _294;
  float _295;
  float _382;
  float _383;
  float _384;
  if (_DistortionRgbShift.w > 0.0f) {
    float4 _19 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _23 = _19.x * 0.10000000149011612f;
    float _24 = _19.y * 0.10000000149011612f;
    float _29 = (_23 * _19.z) * _DistortionRgbShift.w;
    float _30 = (_24 * _19.z) * _DistortionRgbShift.w;
    _47 = (_23 + TEXCOORD.x);
    _48 = (_24 + TEXCOORD.y);
    _49 = ((_29 * _DistortionRgbShift.x) + _23);
    _50 = ((_30 * _DistortionRgbShift.x) + _24);
    _51 = ((_29 * _DistortionRgbShift.y) + _23);
    _52 = ((_30 * _DistortionRgbShift.y) + _24);
    _53 = ((_DistortionRgbShift.z * _29) + _23);
    _54 = ((_DistortionRgbShift.z * _30) + _24);
  } else {
    _47 = TEXCOORD.x;
    _48 = TEXCOORD.y;
    _49 = 0.0f;
    _50 = 0.0f;
    _51 = 0.0f;
    _52 = 0.0f;
    _53 = 0.0f;
    _54 = 0.0f;
  }
  float _61 = ((TEXCOORD.x * 2.0f) - _ChromaCenter.x) + -0.5f;
  float _63 = ((TEXCOORD.y * 2.0f) - _ChromaCenter.y) + -0.5f;
  float _67 = dot(float2(_61, _63), float2(_61, _63)) * -0.3333333432674408f;
  float _69 = (_67 * _61) * UberPostBasePacked0.z;
  float _71 = (_67 * _63) * UberPostBasePacked0.z;
  float _73 = rsqrt(dot(float3(_69, _71, 9.999999747378752e-05f), float3(_69, _71, 9.999999747378752e-05f)));
  float _80 = UberPostBasePacked0.z * 0.9428090453147888f;
  float _85 = exp2(log2(sqrt((_69 * _69) + (_71 * _71)) / _80) * _ChromaCenter.z);
  float _87 = ((_69 * _73) * _80) * _85;
  float _89 = ((_71 * _73) * _80) * _85;
  float4 _92 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_49 + TEXCOORD.x), (_50 + TEXCOORD.y)));
  float4 _98 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_51 + TEXCOORD.x) + _87), ((_52 + TEXCOORD.y) + _89)));
  float4 _106 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_53 + TEXCOORD.x) + (_87 * 2.0f)), ((_54 + TEXCOORD.y) + (_89 * 2.0f))));
  float4 _108 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_47, _48));
  bool _116 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _116))) {
    float _126 = fmod(((_ScreenSize.y * _48) * _VREffectsScanlineParams.x), 2.0f);
    float _134 = (((select((_126 > 1.0f), (2.0f - _126), _126) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _47;
    float _137 = _ScreenSize.w * _ScreenSize.x;
    float4 _156 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_134, ((select(((frac((((_134 + abs(_VREffectsSliceParams.y)) * _137) - (_VREffectsSliceParams.y * _48)) / ((_137 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _48)));
    float _193 = ((((-0.699999988079071f - _156.x) + (exp2(log2(abs(_156.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_156.x < 0.30000001192092896f), 0.0f, 1.0f)) + _156.x) * UberPostBasePacked3.x;
    float _194 = ((((-0.699999988079071f - _156.y) + (exp2(log2(abs(_156.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_156.y < 0.30000001192092896f), 0.0f, 1.0f)) + _156.y) * UberPostBasePacked3.x;
    float _195 = ((((-0.699999988079071f - _156.z) + (exp2(log2(abs(_156.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_156.z < 0.30000001192092896f), 0.0f, 1.0f)) + _156.z) * UberPostBasePacked3.x;
    float _196 = dot(float3(_92.x, _98.y, _106.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _199 = (UberPostBasePacked4.x > 0.5f);
    float _212 = select(_199, ((((_193 * _196) - _193) * _108.w) + _193), _193);
    float _213 = select(_199, ((((_194 * _196) - _194) * _108.w) + _194), _194);
    float _214 = select(_199, ((((_195 * _196) - _195) * _108.w) + _195), _195);
    do {
      if (_116) {
        float4 _225 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _47) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _48) + _DirtTexTillingOffset.w)));
        _239 = (((_225.x * _193) * UberPostBasePacked3.y) + _212);
        _240 = (((_225.y * _194) * UberPostBasePacked3.y) + _213);
        _241 = (((_225.z * _195) * UberPostBasePacked3.y) + _214);
      } else {
        _239 = _212;
        _240 = _213;
        _241 = _214;
      }
      _251 = (_239 + _92.x);
      _252 = (_240 + _98.y);
      _253 = (_241 + _106.z);
      _254 = saturate((((_240 + _239) + _241) * 0.33329999446868896f) + _108.w);
    } while (false);
  } else {
    _251 = _92.x;
    _252 = _98.y;
    _253 = _106.z;
    _254 = _108.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _271 = abs(_48 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _273 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_47 - _Vignette_Params2.x);
    float _279 = exp2(log2(saturate(1.0f - dot(float2(_273, _271), float2(_273, _271)))) * _Vignette_Params2.w);
    _293 = (((_279 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _251);
    _294 = (((_279 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _252);
    _295 = (((_279 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _253);
  } else {
    _293 = _251;
    _294 = _252;
    _295 = _253;
  }

  float3 untonemapped = (float3(_293, _294, _295));

  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _344 = tonemapped.x;
  float _345 = tonemapped.y;
  float _346 = tonemapped.z;

  /*float _318 = saturate((log2((_295 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _319 = floor(_318);
  float _325 = ((saturate((log2((_294 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _327 = (_319 * _Lut_Params.y) + (((saturate((log2((_293 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _328 = _318 - _319;
  float4 _330 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_327 + _Lut_Params.y), _325), 0.0f);
  float4 _334 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_327, _325), 0.0f);
  float _344 = ((_330.x - _334.x) * _328) + _334.x;
  float _345 = ((_330.y - _334.y) * _328) + _334.y;
  float _346 = ((_330.z - _334.z) * _328) + _334.z;*/

  if (UberPostBasePacked1.x > 0.0f) {
    float4 _361 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _364 = (_361.w + -0.5f) * 2.0f;
    float _368 = 1.0f - (sqrt(dot(float3(_344, _345, _346), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _382 = ((((UberPostBasePacked1.x * _344) * _364) * _368) + _344);
    _383 = ((((UberPostBasePacked1.x * _345) * _364) * _368) + _345);
    _384 = ((((UberPostBasePacked1.x * _346) * _364) * _368) + _346);
  } else {
    _382 = _344;
    _383 = _345;
    _384 = _346;
  }
  /*SV_Target.x = saturate(_382);
  SV_Target.y = saturate(_383);
  SV_Target.z = saturate(_384);*/
  SV_Target.x = _382;
  SV_Target.y = _383;
  SV_Target.z = _384;
  SV_Target.w = _254;

  SV_Target = renodx::draw::RenderIntermediatePass(SV_Target);
  return SV_Target;
}
