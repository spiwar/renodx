#include "../../tonemap.hlsl"
/// Uberpost - Trigger Aftershock (open world)
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
  bool _17 = !(_Distortion_Params2.w == 0.0f);
  float _54;
  float _61;
  float _62;
  float _95;
  float _96;
  float _97;
  float _98;
  float _99;
  float _100;
  float _101;
  float _102;
  float _176;
  float _183;
  float _184;
  float _227;
  float _234;
  float _235;
  float _280;
  float _287;
  float _288;
  float _422;
  float _423;
  float _424;
  float _434;
  float _435;
  float _436;
  float _437;
  float _476;
  float _477;
  float _478;
  float _565;
  float _566;
  float _567;
  if (_17) {
    float _22 = _Distortion_Params2.z * (TEXCOORD.x + -0.5f);
    float _23 = _Distortion_Params2.z * (TEXCOORD.y + -0.5f);
    float _33 = (_22 - _Distortion_Params1.x) * _Distortion_Params1.z;
    float _34 = (_23 - _Distortion_Params1.y) * _Distortion_Params1.w;
    float _38 = sqrt((_33 * _33) + (_34 * _34));
    float _42 = _Distortion_Params2.y * _38;
    do {
      [branch]
      if (_Distortion_Params2.w > 0.0f) {
        _54 = ((1.0f / _42) * tan(_Distortion_Params2.x * _38));
      } else {
        _54 = ((_Distortion_Params2.x * (1.0f / _38)) * atan(_42));
      }
      float _55 = _54 + -1.0f;
      _61 = ((_22 + 0.5f) + (_55 * _33));
      _62 = ((_23 + 0.5f) + (_55 * _34));
    } while (false);
  } else {
    _61 = TEXCOORD.x;
    _62 = TEXCOORD.y;
  }
  if (_DistortionRgbShift.w > 0.0f) {
    float4 _67 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _71 = _67.x * 0.10000000149011612f;
    float _72 = _67.y * 0.10000000149011612f;
    float _77 = (_71 * _67.z) * _DistortionRgbShift.w;
    float _78 = (_72 * _67.z) * _DistortionRgbShift.w;
    _95 = (_71 + _61);
    _96 = (_72 + _62);
    _97 = ((_77 * _DistortionRgbShift.x) + _71);
    _98 = ((_78 * _DistortionRgbShift.x) + _72);
    _99 = ((_77 * _DistortionRgbShift.y) + _71);
    _100 = ((_78 * _DistortionRgbShift.y) + _72);
    _101 = ((_DistortionRgbShift.z * _77) + _71);
    _102 = ((_DistortionRgbShift.z * _78) + _72);
  } else {
    _95 = _61;
    _96 = _62;
    _97 = 0.0f;
    _98 = 0.0f;
    _99 = 0.0f;
    _100 = 0.0f;
    _101 = 0.0f;
    _102 = 0.0f;
  }
  float _109 = ((TEXCOORD.x * 2.0f) - _ChromaCenter.x) + -0.5f;
  float _111 = ((TEXCOORD.y * 2.0f) - _ChromaCenter.y) + -0.5f;
  float _115 = dot(float2(_109, _111), float2(_109, _111)) * -0.3333333432674408f;
  float _117 = (_115 * _109) * UberPostBasePacked0.z;
  float _119 = (_115 * _111) * UberPostBasePacked0.z;
  float _121 = rsqrt(dot(float3(_117, _119, 9.999999747378752e-05f), float3(_117, _119, 9.999999747378752e-05f)));
  float _128 = UberPostBasePacked0.z * 0.9428090453147888f;
  float _133 = exp2(log2(sqrt((_117 * _117) + (_119 * _119)) / _128) * _ChromaCenter.z);
  float _135 = ((_117 * _121) * _128) * _133;
  float _137 = ((_119 * _121) * _128) * _133;
  float _138 = _97 + TEXCOORD.x;
  float _139 = _98 + TEXCOORD.y;
  if (_17) {
    float _144 = _Distortion_Params2.z * (_138 + -0.5f);
    float _145 = _Distortion_Params2.z * (_139 + -0.5f);
    float _155 = (_144 - _Distortion_Params1.x) * _Distortion_Params1.z;
    float _156 = (_145 - _Distortion_Params1.y) * _Distortion_Params1.w;
    float _160 = sqrt((_155 * _155) + (_156 * _156));
    float _164 = _Distortion_Params2.y * _160;
    do {
      [branch]
      if (_Distortion_Params2.w > 0.0f) {
        _176 = ((1.0f / _164) * tan(_Distortion_Params2.x * _160));
      } else {
        _176 = ((_Distortion_Params2.x * (1.0f / _160)) * atan(_164));
      }
      float _177 = _176 + -1.0f;
      _183 = ((_144 + 0.5f) + (_177 * _155));
      _184 = ((_145 + 0.5f) + (_177 * _156));
    } while (false);
  } else {
    _183 = _138;
    _184 = _139;
  }
  float4 _185 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_183, _184));
  float _189 = (_99 + TEXCOORD.x) + _135;
  float _190 = (_100 + TEXCOORD.y) + _137;
  if (_17) {
    float _195 = _Distortion_Params2.z * (_189 + -0.5f);
    float _196 = _Distortion_Params2.z * (_190 + -0.5f);
    float _206 = (_195 - _Distortion_Params1.x) * _Distortion_Params1.z;
    float _207 = (_196 - _Distortion_Params1.y) * _Distortion_Params1.w;
    float _211 = sqrt((_206 * _206) + (_207 * _207));
    float _215 = _Distortion_Params2.y * _211;
    do {
      [branch]
      if (_Distortion_Params2.w > 0.0f) {
        _227 = ((1.0f / _215) * tan(_Distortion_Params2.x * _211));
      } else {
        _227 = ((_Distortion_Params2.x * (1.0f / _211)) * atan(_215));
      }
      float _228 = _227 + -1.0f;
      _234 = ((_195 + 0.5f) + (_228 * _206));
      _235 = ((_196 + 0.5f) + (_228 * _207));
    } while (false);
  } else {
    _234 = _189;
    _235 = _190;
  }
  float4 _236 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_234, _235));
  float _242 = (_101 + TEXCOORD.x) + (_135 * 2.0f);
  float _243 = (_102 + TEXCOORD.y) + (_137 * 2.0f);
  if (_17) {
    float _248 = _Distortion_Params2.z * (_242 + -0.5f);
    float _249 = _Distortion_Params2.z * (_243 + -0.5f);
    float _259 = (_248 - _Distortion_Params1.x) * _Distortion_Params1.z;
    float _260 = (_249 - _Distortion_Params1.y) * _Distortion_Params1.w;
    float _264 = sqrt((_259 * _259) + (_260 * _260));
    float _268 = _Distortion_Params2.y * _264;
    do {
      [branch]
      if (_Distortion_Params2.w > 0.0f) {
        _280 = ((1.0f / _268) * tan(_Distortion_Params2.x * _264));
      } else {
        _280 = ((_Distortion_Params2.x * (1.0f / _264)) * atan(_268));
      }
      float _281 = _280 + -1.0f;
      _287 = ((_248 + 0.5f) + (_281 * _259));
      _288 = ((_249 + 0.5f) + (_281 * _260));
    } while (false);
  } else {
    _287 = _242;
    _288 = _243;
  }
  float4 _289 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_287, _288));
  float4 _291 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_95, _96));
  bool _299 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _299))) {
    float _309 = fmod(((_ScreenSize.y * _96) * _VREffectsScanlineParams.x), 2.0f);
    float _317 = (((select((_309 > 1.0f), (2.0f - _309), _309) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _95;
    float _320 = _ScreenSize.w * _ScreenSize.x;
    float4 _339 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_317, ((select(((frac((((_317 + abs(_VREffectsSliceParams.y)) * _320) - (_VREffectsSliceParams.y * _96)) / ((_320 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _96)));
    float _376 = ((((-0.699999988079071f - _339.x) + (exp2(log2(abs(_339.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_339.x < 0.30000001192092896f), 0.0f, 1.0f)) + _339.x) * UberPostBasePacked3.x;
    float _377 = ((((-0.699999988079071f - _339.y) + (exp2(log2(abs(_339.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_339.y < 0.30000001192092896f), 0.0f, 1.0f)) + _339.y) * UberPostBasePacked3.x;
    float _378 = ((((-0.699999988079071f - _339.z) + (exp2(log2(abs(_339.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_339.z < 0.30000001192092896f), 0.0f, 1.0f)) + _339.z) * UberPostBasePacked3.x;
    float _379 = dot(float3(_185.x, _236.y, _289.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _382 = (UberPostBasePacked4.x > 0.5f);
    float _395 = select(_382, ((((_376 * _379) - _376) * _291.w) + _376), _376);
    float _396 = select(_382, ((((_377 * _379) - _377) * _291.w) + _377), _377);
    float _397 = select(_382, ((((_378 * _379) - _378) * _291.w) + _378), _378);
    do {
      if (_299) {
        float4 _408 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _95) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _96) + _DirtTexTillingOffset.w)));
        _422 = (((_408.x * _376) * UberPostBasePacked3.y) + _395);
        _423 = (((_408.y * _377) * UberPostBasePacked3.y) + _396);
        _424 = (((_408.z * _378) * UberPostBasePacked3.y) + _397);
      } else {
        _422 = _395;
        _423 = _396;
        _424 = _397;
      }
      _434 = (_422 + _185.x);
      _435 = (_423 + _236.y);
      _436 = (_424 + _289.z);
      _437 = saturate((((_423 + _422) + _424) * 0.33329999446868896f) + _291.w);
    } while (false);
  } else {
    _434 = _185.x;
    _435 = _236.y;
    _436 = _289.z;
    _437 = _291.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _454 = abs(_96 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _456 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_95 - _Vignette_Params2.x);
    float _462 = exp2(log2(saturate(1.0f - dot(float2(_456, _454), float2(_456, _454)))) * _Vignette_Params2.w);
    _476 = (((_462 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _434);
    _477 = (((_462 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _435);
    _478 = (((_462 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _436);
  } else {
    _476 = _434;
    _477 = _435;
    _478 = _436;
  }
  float3 untonemapped = (float3(_476, _477, _478));
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _527 = tonemapped.x;
  float _528 = tonemapped.y;
  float _529 = tonemapped.z;
  /*
  float _501 = saturate((log2((_478 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _502 = floor(_501);
  float _508 = ((saturate((log2((_477 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _510 = (_502 * _Lut_Params.y) + (((saturate((log2((_476 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _511 = _501 - _502;
  float4 _513 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_510 + _Lut_Params.y), _508), 0.0f);
  float4 _517 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_510, _508), 0.0f);
  float _527 = ((_513.x - _517.x) * _511) + _517.x;
  float _528 = ((_513.y - _517.y) * _511) + _517.y;
  float _529 = ((_513.z - _517.z) * _511) + _517.z;*/
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _544 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _547 = (_544.w + -0.5f) * 2.0f;
    float _551 = 1.0f - (sqrt(dot(float3(_527, _528, _529), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _565 = ((((UberPostBasePacked1.x * _527) * _547) * _551) + _527);
    _566 = ((((UberPostBasePacked1.x * _528) * _547) * _551) + _528);
    _567 = ((((UberPostBasePacked1.x * _529) * _547) * _551) + _529);
  } else {
    _565 = _527;
    _566 = _528;
    _567 = _529;
  }
  SV_Target.x = _565;
  SV_Target.y = _566;
  SV_Target.z = _567;
  SV_Target.w = _437;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
