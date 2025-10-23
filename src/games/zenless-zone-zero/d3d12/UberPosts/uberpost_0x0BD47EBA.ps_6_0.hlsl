#include "../../tonemap.hlsl"

// Uberpost - Letterboxed cutscene, WIPEOUT (VR Training)

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
    noperspective float4 SV_Position: SV_Position,
    linear float2 TEXCOORD: TEXCOORD,
    linear float4 TEXCOORD_1: TEXCOORD1) : SV_Target {
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
  float _435;
  float _436;
  float _437;
  float _447;
  float _448;
  float _449;
  float _450;
  float _489;
  float _490;
  float _491;
  float _617;
  float _618;
  float _619;
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
  float _197 = ((TEXCOORD.x * 2.0f) - _ChromaCenter.x) + -0.5f;
  float _199 = ((TEXCOORD.y * 2.0f) - _ChromaCenter.y) + -0.5f;
  float _203 = dot(float2(_197, _199), float2(_197, _199)) * -0.3333333432674408f;
  float _205 = (_203 * _197) * UberPostBasePacked0.z;
  float _207 = (_203 * _199) * UberPostBasePacked0.z;
  float _209 = rsqrt(dot(float3(_205, _207, 9.999999747378752e-05f), float3(_205, _207, 9.999999747378752e-05f)));
  float _216 = UberPostBasePacked0.z * 0.9428090453147888f;
  float _221 = exp2(log2(sqrt((_205 * _205) + (_207 * _207)) / _216) * _ChromaCenter.z);
  float _223 = ((_205 * _209) * _216) * _221;
  float _225 = ((_207 * _209) * _216) * _221;
  float4 _230 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_58 + TEXCOORD.x) + (_94 * _86)), ((_59 + TEXCOORD.y) + _98)));
  float4 _238 = _BlitTex.Sample(s_linear_clamp_sampler, float2((((_60 + TEXCOORD.x) + (_95 * _86)) + _223), (((_61 + TEXCOORD.y) + _100) + _225)));
  float4 _248 = _BlitTex.Sample(s_linear_clamp_sampler, float2((((_62 + TEXCOORD.x) + (_96 * _86)) + (_223 * 2.0f)), (((_63 + TEXCOORD.y) + _102) + (_225 * 2.0f))));
  float4 _250 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_56, _57));
  float4 _262 = _OldCRTPattern.Sample(s_linear_repeat_sampler, float2(((UberPostOldCRTPacked.x * TEXCOORD.x) * _OldCRTPattern_TexelSize.x), ((UberPostOldCRTPacked.y * TEXCOORD.y) * _OldCRTPattern_TexelSize.y)));
  float _274 = frac((_GlobalTimeParamsA[1].x) * 25.0f) - (1.0f - TEXCOORD.y);
  float _275 = 0.4000000059604645f - _274;
  float _288 = (UberPostOldCRTPacked.w * max(((select((_275 < 0.4000000059604645f), 0.0f, 1.0f) * ((saturate(_274 + 0.05000000074505806f) * 10.0f) - _275)) + _275), 0.0f)) + 1.0f;
  float _293 = 1.0f - UberPostOldCRTPacked.z;
  float _303 = (((((_262.x * 12.0f) * _288) * _293) + UberPostOldCRTPacked.z) * _230.x) + _188;
  float _304 = (((((_262.y * 12.0f) * _288) * _293) + UberPostOldCRTPacked.z) * _238.y) + _189;
  float _305 = (((((_262.z * 12.0f) * _288) * _293) + UberPostOldCRTPacked.z) * _248.z) + _190;
  bool _312 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _312))) {
    float _322 = fmod(((_ScreenSize.y * _57) * _VREffectsScanlineParams.x), 2.0f);
    float _330 = (((select((_322 > 1.0f), (2.0f - _322), _322) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _56;
    float _333 = _ScreenSize.w * _ScreenSize.x;
    float4 _352 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_330, ((select(((frac((((_330 + abs(_VREffectsSliceParams.y)) * _333) - (_VREffectsSliceParams.y * _57)) / ((_333 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _57)));
    float _389 = ((((-0.699999988079071f - _352.x) + (exp2(log2(abs(_352.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_352.x < 0.30000001192092896f), 0.0f, 1.0f)) + _352.x) * UberPostBasePacked3.x;
    float _390 = ((((-0.699999988079071f - _352.y) + (exp2(log2(abs(_352.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_352.y < 0.30000001192092896f), 0.0f, 1.0f)) + _352.y) * UberPostBasePacked3.x;
    float _391 = ((((-0.699999988079071f - _352.z) + (exp2(log2(abs(_352.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_352.z < 0.30000001192092896f), 0.0f, 1.0f)) + _352.z) * UberPostBasePacked3.x;
    float _392 = dot(float3(_303, _304, _305), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _395 = (UberPostBasePacked4.x > 0.5f);
    float _408 = select(_395, ((((_389 * _392) - _389) * _250.w) + _389), _389);
    float _409 = select(_395, ((((_390 * _392) - _390) * _250.w) + _390), _390);
    float _410 = select(_395, ((((_391 * _392) - _391) * _250.w) + _391), _391);
    do {
      if (_312) {
        float4 _421 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _56) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _57) + _DirtTexTillingOffset.w)));
        _435 = (((_421.x * _389) * UberPostBasePacked3.y) + _408);
        _436 = (((_421.y * _390) * UberPostBasePacked3.y) + _409);
        _437 = (((_421.z * _391) * UberPostBasePacked3.y) + _410);
      } else {
        _435 = _408;
        _436 = _409;
        _437 = _410;
      }
      _447 = (_435 + _303);
      _448 = (_436 + _304);
      _449 = (_437 + _305);
      _450 = saturate((((_436 + _435) + _437) * 0.33329999446868896f) + _250.w);
    } while (false);
  } else {
    _447 = _303;
    _448 = _304;
    _449 = _305;
    _450 = _250.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _467 = abs(_57 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _469 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_56 - _Vignette_Params2.x);
    float _475 = exp2(log2(saturate(1.0f - dot(float2(_469, _467), float2(_469, _467)))) * _Vignette_Params2.w);
    _489 = (((_475 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _447);
    _490 = (((_475 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _448);
    _491 = (((_475 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _449);
  } else {
    _489 = _447;
    _490 = _448;
    _491 = _449;
  }
  float3 untonemapped = (float3(_489, _490, _491));

  float3 tonemapped = applyUserToneMap(untonemapped, _Lut_Params, _InternalLut, s_linear_clamp_sampler);

  float _579 = tonemapped.x;
  float _580 = tonemapped.y;
  float _581 = tonemapped.z;
  // Internal LUT
  /*
  float _496 = saturate(_489);
  float _497 = saturate(_490);
  float _498 = saturate(_491);
  float _526 = select((_498 <= 0.0031308000907301903f), (_498 * 12.920000076293945f), ((exp2(log2(abs(_498)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) * _Lut_Params.z;
  float _527 = floor(_526);
  float _533 = ((select((_497 <= 0.0031308000907301903f), (_497 * 12.920000076293945f), ((exp2(log2(abs(_497)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _535 = (((select((_496 <= 0.0031308000907301903f), (_496 * 12.920000076293945f), ((exp2(log2(abs(_496)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) * _Lut_Params.z) + 0.5f) * _Lut_Params.x) + (_527 * _Lut_Params.y);
  float _536 = _526 - _527;
  float4 _538 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_535 + _Lut_Params.y), _533), 0.0f);
  float4 _542 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_535, _533), 0.0f);
  float _552 = ((_538.x - _542.x) * _536) + _542.x;
  float _553 = ((_538.y - _542.y) * _536) + _542.y;
  float _554 = ((_538.z - _542.z) * _536) + _542.z;
  float _579 = select((_552 <= 0.040449999272823334f), (_552 * 0.07739938050508499f), exp2(log2(abs((_552 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  float _580 = select((_553 <= 0.040449999272823334f), (_553 * 0.07739938050508499f), exp2(log2(abs((_553 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  float _581 = select((_554 <= 0.040449999272823334f), (_554 * 0.07739938050508499f), exp2(log2(abs((_554 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  */
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _596 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _599 = (_596.w + -0.5f) * 2.0f;
    float _603 = 1.0f - (sqrt(dot(float3(_579, _580, _581), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _617 = ((((UberPostBasePacked1.x * _579) * _599) * _603) + _579);
    _618 = ((((UberPostBasePacked1.x * _580) * _599) * _603) + _580);
    _619 = ((((UberPostBasePacked1.x * _581) * _599) * _603) + _581);
  } else {
    _617 = _579;
    _618 = _580;
    _619 = _581;
  }
  SV_Target.x = _617;
  SV_Target.y = _618;
  SV_Target.z = _619;
  SV_Target.w = _450;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
