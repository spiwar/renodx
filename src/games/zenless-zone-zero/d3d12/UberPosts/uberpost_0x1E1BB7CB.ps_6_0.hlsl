#include "../../tonemap.hlsl"

// Intro VR Training

Texture2D<float4> _BlitTex : register(t0);

Texture2D<float4> _Grain_Texture : register(t1);

Texture2D<float4> _InternalLut : register(t2);

Texture2D<float4> _FXMaskForScene : register(t3);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t4);

Texture2D<float4> _NapBloomTex : register(t5);

Texture2D<float4> _DirtTex : register(t6);

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

cbuffer UberPostFXColorCorrectionCBuffer : register(b2) {
  float4 UberPostColorCorrectionPacked0 : packoffset(c000.x);
  float4 UberPostColorCorrectionPacked1 : packoffset(c001.x);
  float4 UberPostColorCorrectionPacked2 : packoffset(c002.x);
  float4 UberPostColorCorrectionPacked3 : packoffset(c003.x);
};

SamplerState s_linear_clamp_sampler : register(s0);

SamplerState s_linear_repeat_sampler : register(s1);

SamplerState sampler_CameraDistortionTextureOverlay : register(s2);

SamplerState sampler_NapBloomTex : register(s3);

float4 main(
    noperspective float4 SV_Position: SV_Position,
    linear float2 TEXCOORD: TEXCOORD,
    linear float4 TEXCOORD_1: TEXCOORD1) : SV_Target {
  float4 SV_Target;
  float _49;
  float _50;
  float _51;
  float _52;
  float _53;
  float _54;
  float _55;
  float _56;
  float _241;
  float _242;
  float _243;
  float _253;
  float _254;
  float _255;
  float _256;
  float _295;
  float _296;
  float _297;
  float _423;
  float _424;
  float _425;
  float _565;
  float _566;
  float _567;
  if (_DistortionRgbShift.w > 0.0f) {
    float4 _21 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _25 = _21.x * 0.10000000149011612f;
    float _26 = _21.y * 0.10000000149011612f;
    float _31 = (_25 * _21.z) * _DistortionRgbShift.w;
    float _32 = (_26 * _21.z) * _DistortionRgbShift.w;
    _49 = (_25 + TEXCOORD.x);
    _50 = (_26 + TEXCOORD.y);
    _51 = ((_31 * _DistortionRgbShift.x) + _25);
    _52 = ((_32 * _DistortionRgbShift.x) + _26);
    _53 = ((_31 * _DistortionRgbShift.y) + _25);
    _54 = ((_32 * _DistortionRgbShift.y) + _26);
    _55 = ((_DistortionRgbShift.z * _31) + _25);
    _56 = ((_DistortionRgbShift.z * _32) + _26);
  } else {
    _49 = TEXCOORD.x;
    _50 = TEXCOORD.y;
    _51 = 0.0f;
    _52 = 0.0f;
    _53 = 0.0f;
    _54 = 0.0f;
    _55 = 0.0f;
    _56 = 0.0f;
  }
  float _63 = ((TEXCOORD.x * 2.0f) - _ChromaCenter.x) + -0.5f;
  float _65 = ((TEXCOORD.y * 2.0f) - _ChromaCenter.y) + -0.5f;
  float _69 = dot(float2(_63, _65), float2(_63, _65)) * -0.3333333432674408f;
  float _71 = (_69 * _63) * UberPostBasePacked0.z;
  float _73 = (_69 * _65) * UberPostBasePacked0.z;
  float _75 = rsqrt(dot(float3(_71, _73, 9.999999747378752e-05f), float3(_71, _73, 9.999999747378752e-05f)));
  float _82 = UberPostBasePacked0.z * 0.9428090453147888f;
  float _87 = exp2(log2(sqrt((_71 * _71) + (_73 * _73)) / _82) * _ChromaCenter.z);
  float _89 = ((_71 * _75) * _82) * _87;
  float _91 = ((_73 * _75) * _82) * _87;
  float4 _94 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_51 + TEXCOORD.x), (_52 + TEXCOORD.y)));
  float4 _100 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_53 + TEXCOORD.x) + _89), ((_54 + TEXCOORD.y) + _91)));
  float4 _108 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_55 + TEXCOORD.x) + (_89 * 2.0f)), ((_56 + TEXCOORD.y) + (_91 * 2.0f))));
  float4 _110 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_49, _50));
  bool _118 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _118))) {
    float _128 = fmod(((_ScreenSize.y * _50) * _VREffectsScanlineParams.x), 2.0f);
    float _136 = (((select((_128 > 1.0f), (2.0f - _128), _128) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _49;
    float _139 = _ScreenSize.w * _ScreenSize.x;
    float4 _158 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_136, ((select(((frac((((_136 + abs(_VREffectsSliceParams.y)) * _139) - (_VREffectsSliceParams.y * _50)) / ((_139 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _50)));
    float _195 = ((((-0.699999988079071f - _158.x) + (exp2(log2(abs(_158.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_158.x < 0.30000001192092896f), 0.0f, 1.0f)) + _158.x) * UberPostBasePacked3.x;
    float _196 = ((((-0.699999988079071f - _158.y) + (exp2(log2(abs(_158.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_158.y < 0.30000001192092896f), 0.0f, 1.0f)) + _158.y) * UberPostBasePacked3.x;
    float _197 = ((((-0.699999988079071f - _158.z) + (exp2(log2(abs(_158.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_158.z < 0.30000001192092896f), 0.0f, 1.0f)) + _158.z) * UberPostBasePacked3.x;
    float _198 = dot(float3(_94.x, _100.y, _108.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _201 = (UberPostBasePacked4.x > 0.5f);
    float _214 = select(_201, ((((_195 * _198) - _195) * _110.w) + _195), _195);
    float _215 = select(_201, ((((_196 * _198) - _196) * _110.w) + _196), _196);
    float _216 = select(_201, ((((_197 * _198) - _197) * _110.w) + _197), _197);
    do {
      if (_118) {
        float4 _227 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _49) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _50) + _DirtTexTillingOffset.w)));
        _241 = (((_227.x * _195) * UberPostBasePacked3.y) + _214);
        _242 = (((_227.y * _196) * UberPostBasePacked3.y) + _215);
        _243 = (((_227.z * _197) * UberPostBasePacked3.y) + _216);
      } else {
        _241 = _214;
        _242 = _215;
        _243 = _216;
      }
      _253 = (_241 + _94.x);
      _254 = (_242 + _100.y);
      _255 = (_243 + _108.z);
      _256 = saturate((((_242 + _241) + _243) * 0.33329999446868896f) + _110.w);
    } while (false);
  } else {
    _253 = _94.x;
    _254 = _100.y;
    _255 = _108.z;
    _256 = _110.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _273 = abs(_50 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _275 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_49 - _Vignette_Params2.x);
    float _281 = exp2(log2(saturate(1.0f - dot(float2(_275, _273), float2(_275, _273)))) * _Vignette_Params2.w);
    _295 = (((_281 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _253);
    _296 = (((_281 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _254);
    _297 = (((_281 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _255);
  } else {
    _295 = _253;
    _296 = _254;
    _297 = _255;
  }
  float3 untonemapped = (float3(_295, _296, _297));

  float3 tonemapped = applyUserToneMap(untonemapped, _Lut_Params, _InternalLut, s_linear_clamp_sampler);

  float _385 = tonemapped.x;
  float _386 = tonemapped.y;
  float _387 = tonemapped.z;
  // Internal LUT
  /*
  float _302 = saturate(_295);
  float _303 = saturate(_296);
  float _304 = saturate(_297);
  float _332 = select((_304 <= 0.0031308000907301903f), (_304 * 12.920000076293945f), ((exp2(log2(abs(_304)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) * _Lut_Params.z;
  float _333 = floor(_332);
  float _339 = ((select((_303 <= 0.0031308000907301903f), (_303 * 12.920000076293945f), ((exp2(log2(abs(_303)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _341 = (((select((_302 <= 0.0031308000907301903f), (_302 * 12.920000076293945f), ((exp2(log2(abs(_302)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) * _Lut_Params.z) + 0.5f) * _Lut_Params.x) + (_333 * _Lut_Params.y);
  float _342 = _332 - _333;
  float4 _344 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_341 + _Lut_Params.y), _339), 0.0f);
  float4 _348 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_341, _339), 0.0f);
  float _358 = ((_344.x - _348.x) * _342) + _348.x;
  float _359 = ((_344.y - _348.y) * _342) + _348.y;
  float _360 = ((_344.z - _348.z) * _342) + _348.z;
  float _385 = select((_358 <= 0.040449999272823334f), (_358 * 0.07739938050508499f), exp2(log2(abs((_358 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  float _386 = select((_359 <= 0.040449999272823334f), (_359 * 0.07739938050508499f), exp2(log2(abs((_359 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  float _387 = select((_360 <= 0.040449999272823334f), (_360 * 0.07739938050508499f), exp2(log2(abs((_360 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  */

  if (UberPostBasePacked1.x > 0.0f) {
    float4 _402 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _405 = (_402.w + -0.5f) * 2.0f;
    float _409 = 1.0f - (sqrt(dot(float3(_385, _386, _387), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _423 = ((((UberPostBasePacked1.x * _385) * _405) * _409) + _385);
    _424 = ((((UberPostBasePacked1.x * _386) * _405) * _409) + _386);
    _425 = ((((UberPostBasePacked1.x * _387) * _405) * _409) + _387);
  } else {
    _423 = _385;
    _424 = _386;
    _425 = _387;
  }
  float _430 = ((_424 + _423) + _425) * 0.3333333432674408f;
  float _437 = ((_423 - _430) * UberPostColorCorrectionPacked0.w) + _430;
  float _438 = ((_424 - _430) * UberPostColorCorrectionPacked0.w) + _430;
  float _439 = ((_425 - _430) * UberPostColorCorrectionPacked0.w) + _430;
  float _454 = (((1.0f - saturate(_437)) - _437) * UberPostColorCorrectionPacked1.w) + _437;
  float _455 = (((1.0f - saturate(_438)) - _438) * UberPostColorCorrectionPacked1.w) + _438;
  float _456 = (((1.0f - saturate(_439)) - _439) * UberPostColorCorrectionPacked1.w) + _439;
  float _464 = saturate((saturate(dot(float3(_454, _455, _456), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) - UberPostColorCorrectionPacked2.y) * UberPostColorCorrectionPacked2.z);
  float _490 = (((UberPostColorCorrectionPacked0.x - _454) + ((UberPostColorCorrectionPacked1.x - UberPostColorCorrectionPacked0.x) * _464)) * UberPostColorCorrectionPacked2.x) + _454;
  float _491 = (((UberPostColorCorrectionPacked0.y - _455) + ((UberPostColorCorrectionPacked1.y - UberPostColorCorrectionPacked0.y) * _464)) * UberPostColorCorrectionPacked2.x) + _455;
  float _492 = (((UberPostColorCorrectionPacked0.z - _456) + ((UberPostColorCorrectionPacked1.z - UberPostColorCorrectionPacked0.z) * _464)) * UberPostColorCorrectionPacked2.x) + _456;
  // HDR FX Mask Blend
  float3 result = float3(_490, _491, _492);
  if (UberPostColorCorrectionPacked2.w > 0.5f) {
    float m = smoothstep(0.0f, 1.0f, _FXMaskForScene.Sample(s_linear_clamp_sampler, TEXCOORD).x);

    if (UberPostColorCorrectionPacked3.w < 0.5f) {
      // Simple lighten
      float3 blend_factor = pow(m, 2.2f);
      result = result * (1.0f + blend_factor * 0.5f);
    } else {
      // Overlay
      float3 blend = UberPostColorCorrectionPacked3.xyz;
      result = result * lerp(1.0f, blend * 2.0f, m);
    }
  }
  _565 = result.x;
  _566 = result.y;
  _567 = result.z;
  // FX Mask Original
  /*
  if (UberPostColorCorrectionPacked2.w > 0.5f) {
    float4 _496 = _FXMaskForScene.Sample(s_linear_clamp_sampler, float2(TEXCOORD.x, TEXCOORD.y));
    if (UberPostColorCorrectionPacked3.w < 0.5f) {
      _565 = min((_496.x + _490), 1.0f);
      _566 = min((_496.x + _491), 1.0f);
      _567 = min((_496.x + _492), 1.0f);
    } else {
      float _533 = select((_490 > 0.5f), 0.0f, 1.0f);
      float _534 = select((_491 > 0.5f), 0.0f, 1.0f);
      float _535 = select((_492 > 0.5f), 0.0f, 1.0f);
      float _554 = 1.0f - _496.x;
      _565 = (((((1.0f - (((1.0f - _490) * 2.0f) * (1.0f - UberPostColorCorrectionPacked3.x))) * saturate(1.0f - _533)) + (((_490 * 2.0f) * _533) * UberPostColorCorrectionPacked3.x)) * _496.x) + (_554 * _490));
      _566 = (((((1.0f - (((1.0f - _491) * 2.0f) * (1.0f - UberPostColorCorrectionPacked3.y))) * saturate(1.0f - _534)) + (((_491 * 2.0f) * _534) * UberPostColorCorrectionPacked3.y)) * _496.x) + (_554 * _491));
      _567 = (((((1.0f - (((1.0f - _492) * 2.0f) * (1.0f - UberPostColorCorrectionPacked3.z))) * saturate(1.0f - _535)) + (((_492 * 2.0f) * _535) * UberPostColorCorrectionPacked3.z)) * _496.x) + (_554 * _492));
    }
  } else {
    _565 = _490;
    _566 = _491;
    _567 = _492;
  }
  */
  SV_Target.x = _565;
  SV_Target.y = _566;
  SV_Target.z = _567;
  SV_Target.w = _256;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
