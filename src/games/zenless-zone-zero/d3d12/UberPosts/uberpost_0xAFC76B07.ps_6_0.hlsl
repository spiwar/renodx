#include "../../tonemap.hlsl"

// Character menu
Texture2D<float4> _BlitTex : register(t0);

Texture2D<float4> _Grain_Texture : register(t1);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t2);

Texture2D<float4> _NapBloomTex : register(t3);

Texture2D<float4> _DirtTex : register(t4);

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
  bool _16 = (_DistortionRgbShift.w > 0.0f);
  float _46;
  float _47;
  float _48;
  float _49;
  float _50;
  float _51;
  float _52;
  float _53;
  float _73;
  float _74;
  float _75;
  float _207;
  float _208;
  float _209;
  float _219;
  float _220;
  float _221;
  float _222;
  float _261;
  float _262;
  float _263;
  float _299;
  float _300;
  float _301;
  if (_16) {
    float4 _18 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _22 = _18.x * 0.10000000149011612f;
    float _23 = _18.y * 0.10000000149011612f;
    float _28 = (_22 * _18.z) * _DistortionRgbShift.w;
    float _29 = (_23 * _18.z) * _DistortionRgbShift.w;
    _46 = (_22 + TEXCOORD.x);
    _47 = (_23 + TEXCOORD.y);
    _48 = ((_28 * _DistortionRgbShift.x) + _22);
    _49 = ((_29 * _DistortionRgbShift.x) + _23);
    _50 = ((_28 * _DistortionRgbShift.y) + _22);
    _51 = ((_29 * _DistortionRgbShift.y) + _23);
    _52 = ((_DistortionRgbShift.z * _28) + _22);
    _53 = ((_DistortionRgbShift.z * _29) + _23);
  } else {
    _46 = TEXCOORD.x;
    _47 = TEXCOORD.y;
    _48 = 0.0f;
    _49 = 0.0f;
    _50 = 0.0f;
    _51 = 0.0f;
    _52 = 0.0f;
    _53 = 0.0f;
  }
  if (_16) {
    float4 _57 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_48 + TEXCOORD.x), (_49 + TEXCOORD.y)));
    float4 _61 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_50 + TEXCOORD.x), (_51 + TEXCOORD.y)));
    float4 _65 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_52 + TEXCOORD.x), (_53 + TEXCOORD.y)));
    _73 = _57.x;
    _74 = _61.y;
    _75 = _65.z;
  } else {
    float4 _68 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_46, _47));
    _73 = _68.x;
    _74 = _68.y;
    _75 = _68.z;
  }
  float4 _76 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_46, _47));
  bool _84 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _84))) {
    float _94 = fmod(((_ScreenSize.y * _47) * _VREffectsScanlineParams.x), 2.0f);
    float _102 = (((select((_94 > 1.0f), (2.0f - _94), _94) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _46;
    float _105 = _ScreenSize.w * _ScreenSize.x;
    float4 _124 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_102, ((select(((frac((((_102 + abs(_VREffectsSliceParams.y)) * _105) - (_VREffectsSliceParams.y * _47)) / ((_105 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _47)));
    float _161 = ((((-0.699999988079071f - _124.x) + (exp2(log2(abs(_124.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_124.x < 0.30000001192092896f), 0.0f, 1.0f)) + _124.x) * UberPostBasePacked3.x;
    float _162 = ((((-0.699999988079071f - _124.y) + (exp2(log2(abs(_124.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_124.y < 0.30000001192092896f), 0.0f, 1.0f)) + _124.y) * UberPostBasePacked3.x;
    float _163 = ((((-0.699999988079071f - _124.z) + (exp2(log2(abs(_124.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_124.z < 0.30000001192092896f), 0.0f, 1.0f)) + _124.z) * UberPostBasePacked3.x;
    float _164 = dot(float3(_73, _74, _75), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _167 = (UberPostBasePacked4.x > 0.5f);
    float _180 = select(_167, ((((_161 * _164) - _161) * _76.w) + _161), _161);
    float _181 = select(_167, ((((_162 * _164) - _162) * _76.w) + _162), _162);
    float _182 = select(_167, ((((_163 * _164) - _163) * _76.w) + _163), _163);
    do {
      if (_84) {
        float4 _193 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _46) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _47) + _DirtTexTillingOffset.w)));
        _207 = (((_193.x * _161) * UberPostBasePacked3.y) + _180);
        _208 = (((_193.y * _162) * UberPostBasePacked3.y) + _181);
        _209 = (((_193.z * _163) * UberPostBasePacked3.y) + _182);
      } else {
        _207 = _180;
        _208 = _181;
        _209 = _182;
      }
      _219 = (_207 + _73);
      _220 = (_208 + _74);
      _221 = (_209 + _75);
      _222 = saturate((((_208 + _207) + _209) * 0.33329999446868896f) + _76.w);
    } while (false);
  } else {
    _219 = _73;
    _220 = _74;
    _221 = _75;
    _222 = _76.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _239 = abs(_47 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _241 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_46 - _Vignette_Params2.x);
    float _247 = exp2(log2(saturate(1.0f - dot(float2(_241, _239), float2(_241, _239)))) * _Vignette_Params2.w);
    _261 = (((_247 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _219);
    _262 = (((_247 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _220);
    _263 = (((_247 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _221);
  } else {
    _261 = _219;
    _262 = _220;
    _263 = _221;
  }
  float3 untonemapped = (float3(_261, _262, _263));

  float3 tonemapped = renodx::draw::ToneMapPass(untonemapped);

  _261 = tonemapped.x;
  _262 = tonemapped.y;
  _263 = tonemapped.z;
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _278 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _281 = (_278.w + -0.5f) * 2.0f;
    float _285 = 1.0f - (sqrt(dot(float3(_261, _262, _263), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _299 = ((((UberPostBasePacked1.x * _261) * _281) * _285) + _261);
    _300 = ((((UberPostBasePacked1.x * _262) * _281) * _285) + _262);
    _301 = ((((UberPostBasePacked1.x * _263) * _281) * _285) + _263);
  } else {
    _299 = _261;
    _300 = _262;
    _301 = _263;
  }
  SV_Target.x = _299;
  SV_Target.y = _300;
  SV_Target.z = _301;
  SV_Target.w = _222;
  SV_Target = renodx::draw::RenderIntermediatePass(SV_Target);
  return SV_Target;
}
