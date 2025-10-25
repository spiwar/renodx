#include "../../tonemap.hlsl"

// H0 Complete screen

Texture2D<float4> _BlitTex : register(t0);

Texture2D<float4> _Grain_Texture : register(t1);

Texture2D<float4> _InternalLut : register(t2);

Texture2D<float4> _FXMaskForScene : register(t3);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t4);

Texture2D<float4> _NoiseTexture : register(t5);

Texture2D<float4> _GlitchTex : register(t6);

Texture2D<float4> _NapBloomTex : register(t7);

Texture2D<float4> _DirtTex : register(t8);

Texture2D<float4> _OldCRTPattern : register(t9);

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

cbuffer UberPostFXColorCorrectionCBuffer : register(b2) {
  float4 UberPostColorCorrectionPacked0 : packoffset(c000.x);
  float4 UberPostColorCorrectionPacked1 : packoffset(c001.x);
  float4 UberPostColorCorrectionPacked2 : packoffset(c002.x);
  float4 UberPostColorCorrectionPacked3 : packoffset(c003.x);
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
  float _58;
  float _59;
  float _60;
  float _61;
  float _62;
  float _63;
  float _64;
  float _65;
  float _159;
  float _160;
  float _161;
  float _190;
  float _191;
  float _192;
  float _437;
  float _438;
  float _439;
  float _449;
  float _450;
  float _451;
  float _452;
  float _491;
  float _492;
  float _493;
  float _580;
  float _581;
  float _582;
  float _722;
  float _723;
  float _724;
  if (_DistortionRgbShift.w > 0.0f) {
    float4 _30 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _34 = _30.x * 0.10000000149011612f;
    float _35 = _30.y * 0.10000000149011612f;
    float _40 = (_34 * _30.z) * _DistortionRgbShift.w;
    float _41 = (_35 * _30.z) * _DistortionRgbShift.w;
    _58 = (_34 + TEXCOORD.x);
    _59 = (_35 + TEXCOORD.y);
    _60 = ((_40 * _DistortionRgbShift.x) + _34);
    _61 = ((_41 * _DistortionRgbShift.x) + _35);
    _62 = ((_40 * _DistortionRgbShift.y) + _34);
    _63 = ((_41 * _DistortionRgbShift.y) + _35);
    _64 = ((_DistortionRgbShift.z * _40) + _34);
    _65 = ((_DistortionRgbShift.z * _41) + _35);
  } else {
    _58 = TEXCOORD.x;
    _59 = TEXCOORD.y;
    _60 = 0.0f;
    _61 = 0.0f;
    _62 = 0.0f;
    _63 = 0.0f;
    _64 = 0.0f;
    _65 = 0.0f;
  }
  float _68 = frac(_GlobalTimeParamsA[1].x);
  float4 _73 = _NoiseTexture.Sample(sampler_NoiseTexture, float2((_68 + (TEXCOORD.x * 5.0f)), (_68 + (TEXCOORD.y * 5.0f))));
  float _75 = _73.x + -0.5f;
  float _85 = ((_75 * 0.019999999552965164f) * _NoiseParams.y) * select((abs(_75 * 2.0f) < _NoiseParams.z), 0.0f, 1.0f);
  float _88 = cos(_RgbShiftParams.w);
  float _89 = sin(_RgbShiftParams.w);
  float _96 = (_RgbShiftParams.x * 0.10000000149011612f) + _85;
  float _97 = (_RgbShiftParams.y * 0.10000000149011612f) + _85;
  float _98 = (_RgbShiftParams.z * 0.10000000149011612f) + _85;
  float _100 = _96 * _89;
  float _102 = _97 * _89;
  float _104 = _98 * _89;
  float _112 = _NoiseParams.x * (frac(frac(_GlobalTimeParamsA[1].x) * 88.0f) + TEXCOORD.y);
  float4 _116 = _NoiseTexture.Sample(sampler_NoiseTexture, float2(0.5f, (_112 + _100)));
  float4 _118 = _NoiseTexture.Sample(sampler_NoiseTexture, float2(0.5f, (_112 + _102)));
  float4 _120 = _NoiseTexture.Sample(sampler_NoiseTexture, float2(0.5f, (_112 + _104)));
  float _123 = frac(_68 * 1234.0f);
  float _130 = (((_123 * _123) * (select((_LineParams.y < _LineParams.x), _LineParams.x, _LineParams.y) - _LineParams.x)) * _123) + _LineParams.x;
  float _137 = select((_130 < _116.x), 0.0f, 1.0f) * _LineParams.z;
  float _138 = select((_130 < _118.x), 0.0f, 1.0f) * _LineParams.z;
  float _139 = select((_130 < _120.x), 0.0f, 1.0f) * _LineParams.z;
  [branch]
  if (UberPostBasePacked2.z > 0.5f) {
    float4 _153 = _GlitchTex.Sample(sampler_GlitchTex, float2(((_GlitchMask_ST.x * TEXCOORD.x) + _GlitchMask_ST.z), ((_GlitchMask_ST.y * TEXCOORD.y) + _GlitchMask_ST.w)));
    _159 = (_153.x * _137);
    _160 = (_153.x * _138);
    _161 = (_153.x * _139);
  } else {
    _159 = _137;
    _160 = _138;
    _161 = _139;
  }
  [branch]
  if (UberPostBasePacked2.w > 0.5f) {
    float4 _184 = _GlitchTex.Sample(sampler_GlitchTex, float2((((_RandomOpacity_ST.x * TEXCOORD.x) + _RandomOpacity_ST.z) + frac(UberPostBasePacked2.x * (_GlobalTimeParamsA[1].x))), (((_RandomOpacity_ST.y * TEXCOORD.y) + _RandomOpacity_ST.w) + frac(UberPostBasePacked2.y * (_GlobalTimeParamsA[1].x)))));
    _190 = (_184.y * _159);
    _191 = (_184.y * _160);
    _192 = (_184.y * _161);
  } else {
    _190 = _159;
    _191 = _160;
    _192 = _161;
  }
  float _199 = ((TEXCOORD.x * 2.0f) - _ChromaCenter.x) + -0.5f;
  float _201 = ((TEXCOORD.y * 2.0f) - _ChromaCenter.y) + -0.5f;
  float _205 = dot(float2(_199, _201), float2(_199, _201)) * -0.3333333432674408f;
  float _207 = (_205 * _199) * UberPostBasePacked0.z;
  float _209 = (_205 * _201) * UberPostBasePacked0.z;
  float _211 = rsqrt(dot(float3(_207, _209, 9.999999747378752e-05f), float3(_207, _209, 9.999999747378752e-05f)));
  float _218 = UberPostBasePacked0.z * 0.9428090453147888f;
  float _223 = exp2(log2(sqrt((_207 * _207) + (_209 * _209)) / _218) * _ChromaCenter.z);
  float _225 = ((_207 * _211) * _218) * _223;
  float _227 = ((_209 * _211) * _218) * _223;
  float4 _232 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_60 + TEXCOORD.x) + (_96 * _88)), ((_61 + TEXCOORD.y) + _100)));
  float4 _240 = _BlitTex.Sample(s_linear_clamp_sampler, float2((((_62 + TEXCOORD.x) + (_97 * _88)) + _225), (((_63 + TEXCOORD.y) + _102) + _227)));
  float4 _250 = _BlitTex.Sample(s_linear_clamp_sampler, float2((((_64 + TEXCOORD.x) + (_98 * _88)) + (_225 * 2.0f)), (((_65 + TEXCOORD.y) + _104) + (_227 * 2.0f))));
  float4 _252 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_58, _59));
  float4 _264 = _OldCRTPattern.Sample(s_linear_repeat_sampler, float2(((UberPostOldCRTPacked.x * TEXCOORD.x) * _OldCRTPattern_TexelSize.x), ((UberPostOldCRTPacked.y * TEXCOORD.y) * _OldCRTPattern_TexelSize.y)));
  float _276 = frac((_GlobalTimeParamsA[1].x) * 25.0f) - (1.0f - TEXCOORD.y);
  float _277 = 0.4000000059604645f - _276;
  float _290 = (UberPostOldCRTPacked.w * max(((select((_277 < 0.4000000059604645f), 0.0f, 1.0f) * ((saturate(_276 + 0.05000000074505806f) * 10.0f) - _277)) + _277), 0.0f)) + 1.0f;
  float _295 = 1.0f - UberPostOldCRTPacked.z;
  float _305 = (((((_264.x * 12.0f) * _290) * _295) + UberPostOldCRTPacked.z) * _232.x) + _190;
  float _306 = (((((_264.y * 12.0f) * _290) * _295) + UberPostOldCRTPacked.z) * _240.y) + _191;
  float _307 = (((((_264.z * 12.0f) * _290) * _295) + UberPostOldCRTPacked.z) * _250.z) + _192;
  bool _314 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _314))) {
    float _324 = fmod(((_ScreenSize.y * _59) * _VREffectsScanlineParams.x), 2.0f);
    float _332 = (((select((_324 > 1.0f), (2.0f - _324), _324) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _58;
    float _335 = _ScreenSize.w * _ScreenSize.x;
    float4 _354 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_332, ((select(((frac((((_332 + abs(_VREffectsSliceParams.y)) * _335) - (_VREffectsSliceParams.y * _59)) / ((_335 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _59)));
    float _391 = ((((-0.699999988079071f - _354.x) + (exp2(log2(abs(_354.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_354.x < 0.30000001192092896f), 0.0f, 1.0f)) + _354.x) * UberPostBasePacked3.x;
    float _392 = ((((-0.699999988079071f - _354.y) + (exp2(log2(abs(_354.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_354.y < 0.30000001192092896f), 0.0f, 1.0f)) + _354.y) * UberPostBasePacked3.x;
    float _393 = ((((-0.699999988079071f - _354.z) + (exp2(log2(abs(_354.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_354.z < 0.30000001192092896f), 0.0f, 1.0f)) + _354.z) * UberPostBasePacked3.x;
    float _394 = dot(float3(_305, _306, _307), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _397 = (UberPostBasePacked4.x > 0.5f);
    float _410 = select(_397, ((((_391 * _394) - _391) * _252.w) + _391), _391);
    float _411 = select(_397, ((((_392 * _394) - _392) * _252.w) + _392), _392);
    float _412 = select(_397, ((((_393 * _394) - _393) * _252.w) + _393), _393);
    do {
      if (_314) {
        float4 _423 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _58) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _59) + _DirtTexTillingOffset.w)));
        _437 = (((_423.x * _391) * UberPostBasePacked3.y) + _410);
        _438 = (((_423.y * _392) * UberPostBasePacked3.y) + _411);
        _439 = (((_423.z * _393) * UberPostBasePacked3.y) + _412);
      } else {
        _437 = _410;
        _438 = _411;
        _439 = _412;
      }
      _449 = (_437 + _305);
      _450 = (_438 + _306);
      _451 = (_439 + _307);
      _452 = saturate((((_438 + _437) + _439) * 0.33329999446868896f) + _252.w);
    } while (false);
  } else {
    _449 = _305;
    _450 = _306;
    _451 = _307;
    _452 = _252.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _469 = abs(_59 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _471 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_58 - _Vignette_Params2.x);
    float _477 = exp2(log2(saturate(1.0f - dot(float2(_471, _469), float2(_471, _469)))) * _Vignette_Params2.w);
    _491 = (((_477 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _449);
    _492 = (((_477 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _450);
    _493 = (((_477 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _451);
  } else {
    _491 = _449;
    _492 = _450;
    _493 = _451;
  }
  float3 untonemapped = (float3(_491, _492, _493));
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _542 = tonemapped.x;
  float _543 = tonemapped.y;
  float _544 = tonemapped.z;
  // ARRI Lut
  /*
  float _516 = saturate((log2((_493 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _517 = floor(_516);
  float _523 = ((saturate((log2((_492 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _525 = (_517 * _Lut_Params.y) + (((saturate((log2((_491 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _526 = _516 - _517;
  float4 _528 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_525 + _Lut_Params.y), _523), 0.0f);
  float4 _532 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_525, _523), 0.0f);
  float _542 = ((_528.x - _532.x) * _526) + _532.x;
  float _543 = ((_528.y - _532.y) * _526) + _532.y;
  float _544 = ((_528.z - _532.z) * _526) + _532.z;*/
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _559 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _562 = (_559.w + -0.5f) * 2.0f;
    float _566 = 1.0f - (sqrt(dot(float3(_542, _543, _544), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _580 = ((((UberPostBasePacked1.x * _542) * _562) * _566) + _542);
    _581 = ((((UberPostBasePacked1.x * _543) * _562) * _566) + _543);
    _582 = ((((UberPostBasePacked1.x * _544) * _562) * _566) + _544);
  } else {
    _580 = _542;
    _581 = _543;
    _582 = _544;
  }
  float _587 = ((_581 + _580) + _582) * 0.3333333432674408f;
  float _594 = ((_580 - _587) * UberPostColorCorrectionPacked0.w) + _587;
  float _595 = ((_581 - _587) * UberPostColorCorrectionPacked0.w) + _587;
  float _596 = ((_582 - _587) * UberPostColorCorrectionPacked0.w) + _587;
  float _611 = (((1.0f - saturate(_594)) - _594) * UberPostColorCorrectionPacked1.w) + _594;
  float _612 = (((1.0f - saturate(_595)) - _595) * UberPostColorCorrectionPacked1.w) + _595;
  float _613 = (((1.0f - saturate(_596)) - _596) * UberPostColorCorrectionPacked1.w) + _596;
  float _621 = saturate((saturate(dot(float3(_611, _612, _613), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) - UberPostColorCorrectionPacked2.y) * UberPostColorCorrectionPacked2.z);
  // Remove Saturate calls 
  float _647 = (((UberPostColorCorrectionPacked0.x - _611) + ((UberPostColorCorrectionPacked1.x - UberPostColorCorrectionPacked0.x) * _621)) * UberPostColorCorrectionPacked2.x) + _611;
  float _648 = (((UberPostColorCorrectionPacked0.y - _612) + ((UberPostColorCorrectionPacked1.y - UberPostColorCorrectionPacked0.y) * _621)) * UberPostColorCorrectionPacked2.x) + _612;
  float _649 = (((UberPostColorCorrectionPacked0.z - _613) + ((UberPostColorCorrectionPacked1.z - UberPostColorCorrectionPacked0.z) * _621)) * UberPostColorCorrectionPacked2.x) + _613;

  // Original FX Mask
  /*
  if (UberPostColorCorrectionPacked2.w > 0.5f) {
    float4 _653 = _FXMaskForScene.Sample(s_linear_clamp_sampler, float2(TEXCOORD.x, TEXCOORD.y));
    if (UberPostColorCorrectionPacked3.w < 0.5f) {
      _722 = min((_653.x + _647), 1.0f);
      _723 = min((_653.x + _648), 1.0f);
      _724 = min((_653.x + _649), 1.0f);
    } else {
      float _690 = select((_647 > 0.5f), 0.0f, 1.0f);
      float _691 = select((_648 > 0.5f), 0.0f, 1.0f);
      float _692 = select((_649 > 0.5f), 0.0f, 1.0f);
      float _711 = 1.0f - _653.x;
      _722 = (((((1.0f - (((1.0f - _647) * 2.0f) * (1.0f - UberPostColorCorrectionPacked3.x))) * saturate(1.0f - _690)) + (((_647 * 2.0f) * _690) * UberPostColorCorrectionPacked3.x)) * _653.x) + (_711 * _647));
      _723 = (((((1.0f - (((1.0f - _648) * 2.0f) * (1.0f - UberPostColorCorrectionPacked3.y))) * saturate(1.0f - _691)) + (((_648 * 2.0f) * _691) * UberPostColorCorrectionPacked3.y)) * _653.x) + (_711 * _648));
      _724 = (((((1.0f - (((1.0f - _649) * 2.0f) * (1.0f - UberPostColorCorrectionPacked3.z))) * saturate(1.0f - _692)) + (((_649 * 2.0f) * _692) * UberPostColorCorrectionPacked3.z)) * _653.x) + (_711 * _649));
    }
  } else {
    _722 = _647;
    _723 = _648;
    _724 = _649;
  }*/

  // HDR FX Mask Blend
  float3 result = float3(_647, _648, _649);
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
  _722 = result.x;
  _723 = result.y;
  _724 = result.z;

  SV_Target.x = _722;
  SV_Target.y = _723;
  SV_Target.z = _724;
  SV_Target.w = _452;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
