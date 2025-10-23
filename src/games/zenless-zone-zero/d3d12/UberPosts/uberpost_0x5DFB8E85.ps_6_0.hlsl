#include "../../tonemap.hlsl"

// Menu screen for Anby & Nicole

Texture2D<float4> _BlitTex : register(t0);

Texture2D<float4> _Grain_Texture : register(t1);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t2);

Texture2D<float4> _NapBloomTex : register(t3);

Texture2D<float4> _DirtTex : register(t4);

Texture2D<float4> _ScrFxMainTex : register(t5);

Texture2D<float4> _ScrFxMaskTex : register(t6);

Texture2D<float4> _ScrFxDissolveTex : register(t7);

Texture2D<float4> _ScrFxDistortionTex : register(t8);

Texture2D<float4> _ScrFxScrDistTex : register(t9);

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

cbuffer UberPostScreenEffectsBaseCBuffer : register(b2) {
  float4 UberPostScreenEffectsBasePacked0 : packoffset(c000.x);
  float4 UberPostScreenEffectsBasePacked1 : packoffset(c001.x);
  float4 UberPostScreenEffectsBasePacked2 : packoffset(c002.x);
  float4 UberPostScreenEffectsBasePacked3 : packoffset(c003.x);
  float4 UberPostScreenEffectsBasePacked4 : packoffset(c004.x);
  float4 UberPostScreenEffectsBasePacked5 : packoffset(c005.x);
  float4 UberPostScreenEffectsBasePacked6 : packoffset(c006.x);
  float4 UberPostScreenEffectsBasePacked7 : packoffset(c007.x);
  float4 UberPostScreenEffectsBasePacked8 : packoffset(c008.x);
  float4 UberPostScreenEffectsBasePacked9 : packoffset(c009.x);
  float4 UberPostScreenEffectsBasePacked10 : packoffset(c010.x);
  float4 UberPostScreenEffectsBasePacked11 : packoffset(c011.x);
  float4 UberPostScreenEffectsBasePacked12 : packoffset(c012.x);
  float4 UberPostScreenEffectsBasePacked13 : packoffset(c013.x);
  float4 UberPostScreenEffectsBasePacked14 : packoffset(c014.x);
  float4 UberPostScreenEffectsBasePacked15 : packoffset(c015.x);
  float4 UberPostScreenEffectsBasePacked16 : packoffset(c016.x);
};

cbuffer UberPostScreenEffectsRandomCBuffer : register(b3) {
  float2 _ScrFxDissolveRandomUV : packoffset(c000.x);
  float2 _ScrFxDistortionRandomUV : packoffset(c000.z);
};

SamplerState s_linear_clamp_sampler : register(s0);

SamplerState s_linear_repeat_sampler : register(s1);

SamplerState sampler_CameraDistortionTextureOverlay : register(s2);

SamplerState sampler_NapBloomTex : register(s3);

SamplerState sampler_ScrFxMainTex : register(s4);

SamplerState sampler_ScrFxMaskTex : register(s5);

SamplerState sampler_ScrFxDissolveTex : register(s6);

SamplerState sampler_ScrFxDistortionTex : register(s7);

SamplerState sampler_ScrFxScrDistTex : register(s8);

float4 main(
    noperspective float4 SV_Position: SV_Position,
    linear float2 TEXCOORD: TEXCOORD,
    linear float4 TEXCOORD_1: TEXCOORD1) : SV_Target {
  float4 SV_Target;
  float _26[3];
  float _27[3];
  float _28[4];
  float _29[4];
  float _30[4];
  float _31[4];
  float _32[4];
  float _40 = select((UberPostScreenEffectsBasePacked16.w > 0.5f), (_GlobalTimeParamsA[1].x), (_GlobalTimeParamsB[0].y));
  float _43 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _44 = (TEXCOORD.y * 2.0f) + -1.0f;
  float _54 = _ScaledScreenParams.z + -1.0f;
  float _56 = (_54 * _ScaledScreenParams.y) + -1.0f;
  float _58 = (_56 * UberPostScreenEffectsBasePacked1.x) + 1.0f;
  float _59 = _58 * _44;
  float _60 = _43 * _43;
  float _71 = select((UberPostScreenEffectsBasePacked0.z < 0.5f), min((1.0f - abs(_43)), (_58 * (1.0f - abs(_44)))), (1.0f - (sqrt((_59 * _59) + _60) * 0.7070000171661377f)));
  float _81 = saturate((_71 - UberPostScreenEffectsBasePacked0.w) / (((1.0f - UberPostScreenEffectsBasePacked1.y) * UberPostScreenEffectsBasePacked0.w) - UberPostScreenEffectsBasePacked0.w));
  float _87 = select((UberPostScreenEffectsBasePacked1.y > 9.999999747378752e-05f), ((_81 * _81) * (3.0f - (_81 * 2.0f))), select((UberPostScreenEffectsBasePacked0.w < _71), 0.0f, 1.0f));
  float _93 = select((UberPostScreenEffectsBasePacked1.w > 0.5f), (1.0f - _87), _87) * UberPostScreenEffectsBasePacked1.z;
  float _96 = select((UberPostScreenEffectsBasePacked0.w > 9.999999747378752e-05f), _93, 0.0f) * _93;
  float _163;
  float _164;
  float _198;
  float _199;
  float _200;
  float _201;
  float _202;
  float _203;
  float _204;
  float _205;
  float _225;
  float _226;
  float _227;
  float _359;
  float _360;
  float _361;
  float _371;
  float _372;
  float _373;
  float _374;
  float _413;
  float _414;
  float _415;
  float _451;
  float _452;
  float _453;
  float _764;
  float _846;
  float _847;
  float _848;
  if (UberPostScreenEffectsBasePacked14.z > 0.5f) {
    float _104 = ((_56 * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _44;
    float _106 = atan(_104 / _43);
    bool _109 = (_43 < 0.0f);
    bool _110 = (_43 == 0.0f);
    bool _111 = (_104 >= 0.0f);
    bool _112 = (_104 < 0.0f);
    bool _136 = (UberPostScreenEffectsBasePacked14.w > 0.5f);
    float4 _150 = _ScrFxScrDistTex.Sample(sampler_ScrFxScrDistTex, float2(((UberPostScreenEffectsBasePacked15.z + (UberPostScreenEffectsBasePacked16.y * _40)) + (select(_136, select((_110 && _111), 2.0f, select((_110 && _112), -2.0f, (select((_109 && _112), (_106 + -3.1415927410125732f), select((_109 && _111), (_106 + 3.1415927410125732f), _106)) * 1.2732394933700562f))), TEXCOORD.x) * UberPostScreenEffectsBasePacked15.x)), ((UberPostScreenEffectsBasePacked15.w + (UberPostScreenEffectsBasePacked16.z * _40)) + (select(_136, (sqrt((_104 * _104) + _60) * 0.6366197466850281f), (((_ScaledScreenParams.y * (TEXCOORD.y + -0.5f)) * _54) + 0.5f)) * UberPostScreenEffectsBasePacked15.y))));
    float _159 = (_96 * 0.10000000149011612f) * UberPostScreenEffectsBasePacked16.x;
    _163 = (_159 * ((_150.x * 2.0f) + -1.0f));
    _164 = (_159 * ((_150.y * 2.0f) + -1.0f));
  } else {
    _163 = 0.0f;
    _164 = 0.0f;
  }
  bool _167 = (_DistortionRgbShift.w > 0.0f);
  if (_167) {
    float4 _169 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _175 = (_169.x * 0.10000000149011612f) + _163;
    float _176 = (_169.y * 0.10000000149011612f) + _164;
    float _179 = _DistortionRgbShift.w * _169.z;
    float _180 = _179 * _175;
    float _181 = _179 * _176;
    _198 = (_175 + TEXCOORD.x);
    _199 = (_176 + TEXCOORD.y);
    _200 = ((_180 * _DistortionRgbShift.x) + _175);
    _201 = ((_181 * _DistortionRgbShift.x) + _176);
    _202 = ((_180 * _DistortionRgbShift.y) + _175);
    _203 = ((_181 * _DistortionRgbShift.y) + _176);
    _204 = ((_180 * _DistortionRgbShift.z) + _175);
    _205 = ((_181 * _DistortionRgbShift.z) + _176);
  } else {
    _198 = TEXCOORD.x;
    _199 = TEXCOORD.y;
    _200 = 0.0f;
    _201 = 0.0f;
    _202 = 0.0f;
    _203 = 0.0f;
    _204 = 0.0f;
    _205 = 0.0f;
  }
  if (_167) {
    float4 _209 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_200 + TEXCOORD.x), (_201 + TEXCOORD.y)));
    float4 _213 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_202 + TEXCOORD.x), (_203 + TEXCOORD.y)));
    float4 _217 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_204 + TEXCOORD.x), (_205 + TEXCOORD.y)));
    _225 = _209.x;
    _226 = _213.y;
    _227 = _217.z;
  } else {
    float4 _220 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_198, _199));
    _225 = _220.x;
    _226 = _220.y;
    _227 = _220.z;
  }
  float4 _228 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_198, _199));
  bool _236 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _236))) {
    float _246 = fmod(((_ScreenSize.y * _199) * _VREffectsScanlineParams.x), 2.0f);
    float _254 = (((select((_246 > 1.0f), (2.0f - _246), _246) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _198;
    float _257 = _ScreenSize.w * _ScreenSize.x;
    float4 _276 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_254, ((select(((frac((((_254 + abs(_VREffectsSliceParams.y)) * _257) - (_VREffectsSliceParams.y * _199)) / ((_257 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _199)));
    float _313 = ((((-0.699999988079071f - _276.x) + (exp2(log2(abs(_276.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_276.x < 0.30000001192092896f), 0.0f, 1.0f)) + _276.x) * UberPostBasePacked3.x;
    float _314 = ((((-0.699999988079071f - _276.y) + (exp2(log2(abs(_276.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_276.y < 0.30000001192092896f), 0.0f, 1.0f)) + _276.y) * UberPostBasePacked3.x;
    float _315 = ((((-0.699999988079071f - _276.z) + (exp2(log2(abs(_276.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_276.z < 0.30000001192092896f), 0.0f, 1.0f)) + _276.z) * UberPostBasePacked3.x;
    float _316 = dot(float3(_225, _226, _227), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _319 = (UberPostBasePacked4.x > 0.5f);
    float _332 = select(_319, ((((_313 * _316) - _313) * _228.w) + _313), _313);
    float _333 = select(_319, ((((_314 * _316) - _314) * _228.w) + _314), _314);
    float _334 = select(_319, ((((_315 * _316) - _315) * _228.w) + _315), _315);
    do {
      if (_236) {
        float4 _345 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _198) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _199) + _DirtTexTillingOffset.w)));
        _359 = (((_345.x * _313) * UberPostBasePacked3.y) + _332);
        _360 = (((_345.y * _314) * UberPostBasePacked3.y) + _333);
        _361 = (((_345.z * _315) * UberPostBasePacked3.y) + _334);
      } else {
        _359 = _332;
        _360 = _333;
        _361 = _334;
      }
      _371 = (_359 + _225);
      _372 = (_360 + _226);
      _373 = (_361 + _227);
      _374 = saturate((((_360 + _359) + _361) * 0.33329999446868896f) + _228.w);
    } while (false);
  } else {
    _371 = _225;
    _372 = _226;
    _373 = _227;
    _374 = _228.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _391 = abs(_199 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _393 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_198 - _Vignette_Params2.x);
    float _399 = exp2(log2(saturate(1.0f - dot(float2(_393, _391), float2(_393, _391)))) * _Vignette_Params2.w);
    _413 = (((_399 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _371);
    _414 = (((_399 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _372);
    _415 = (((_399 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _373);
  } else {
    _413 = _371;
    _414 = _372;
    _415 = _373;
  }
  float3 untonemapped = (float3(_413, _414, _415));

  float3 tonemapped = renodx::draw::ToneMapPass(untonemapped);

  _413 = tonemapped.x;
  _414 = tonemapped.y;
  _415 = tonemapped.z;
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _430 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _433 = (_430.w + -0.5f) * 2.0f;
    float _437 = 1.0f - (sqrt(dot(float3(_413, _414, _415), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _451 = ((((UberPostBasePacked1.x * _413) * _433) * _437) + _413);
    _452 = ((((UberPostBasePacked1.x * _414) * _433) * _437) + _414);
    _453 = ((((UberPostBasePacked1.x * _415) * _433) * _437) + _415);
  } else {
    _451 = _413;
    _452 = _414;
    _453 = _415;
  }
  float _457 = ((_56 * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _44;
  float _459 = atan(_457 / _43);
  bool _462 = (_43 < 0.0f);
  bool _463 = (_43 == 0.0f);
  bool _464 = (_457 >= 0.0f);
  bool _465 = (_457 < 0.0f);
  _26[0] = (((_ScreenSize.x * (TEXCOORD.x + -0.5f)) * _ScreenSize.w) + 0.5f);
  _27[0] = TEXCOORD.y;
  _26[1] = select((_463 && _464), 2.0f, select((_463 && _465), -2.0f, (select((_462 && _465), (_459 + -3.1415927410125732f), select((_462 && _464), (_459 + 3.1415927410125732f), _459)) * 1.2732394933700562f)));
  _27[1] = (sqrt((_457 * _457) + (_43 * _43)) * 0.5f);
  _26[2] = TEXCOORD.x;
  _27[2] = TEXCOORD.y;
  int _522 = min(max(int(round(UberPostScreenEffectsBasePacked6.z)), 0), 2);
  int _545 = min(max(int(round(UberPostScreenEffectsBasePacked11.w)), 0), 2);
  float4 _568 = _ScrFxDistortionTex.Sample(sampler_ScrFxDistortionTex, float2(((((_ScrFxDistortionRandomUV.x + _163) + (UberPostScreenEffectsBasePacked11.x * _40)) + UberPostScreenEffectsBasePacked12.z) + (UberPostScreenEffectsBasePacked12.x * (_26[_545]))), ((((_ScrFxDistortionRandomUV.y + _164) + (UberPostScreenEffectsBasePacked11.y * _40)) + UberPostScreenEffectsBasePacked12.w) + (UberPostScreenEffectsBasePacked12.y * (_27[_545])))));
  _32[0] = _568.x;
  _32[1] = _568.y;
  _32[2] = _568.z;
  _32[3] = _568.w;
  float _581 = ((_32[min((uint)(uint(UberPostScreenEffectsBasePacked13.x)), 3)]) + -0.49803921580314636f) * 2.0f;
  float _589 = select((UberPostScreenEffectsBasePacked3.x < 9.999999747378752e-06f), max(1.0f, (_ScreenSize.y * 0.0009259259095415473f)), 1.0f);
  int _593 = min(max(int(round(UberPostScreenEffectsBasePacked3.x)), 0), 2);
  float _608 = UberPostScreenEffectsBasePacked13.y * _581;
  int _622 = min(max(int(round(UberPostScreenEffectsBasePacked8.w)), 0), 2);
  float _636 = UberPostScreenEffectsBasePacked13.z * _581;
  float4 _650 = _ScrFxDissolveTex.Sample(sampler_ScrFxDissolveTex, float2((((((_ScrFxDissolveRandomUV.x + _163) + (UberPostScreenEffectsBasePacked10.z * _40)) + UberPostScreenEffectsBasePacked9.z) + (UberPostScreenEffectsBasePacked9.x * (_26[_622]))) + _636), (((((_ScrFxDissolveRandomUV.y + _164) + (UberPostScreenEffectsBasePacked10.w * _40)) + UberPostScreenEffectsBasePacked9.w) + (UberPostScreenEffectsBasePacked9.y * (_27[_622]))) + _636)));
  _31[0] = _650.x;
  _31[1] = _650.y;
  _31[2] = _650.z;
  _31[3] = _650.w;
  float _661 = _31[min((uint)(uint(UberPostScreenEffectsBasePacked10.y)), 3)];
  float4 _662 = _ScrFxMainTex.Sample(sampler_ScrFxMainTex, float2((((((UberPostScreenEffectsBasePacked6.x * _40) + _163) + UberPostScreenEffectsBasePacked2.z) + (((_26[_593]) * _589) * UberPostScreenEffectsBasePacked2.x)) + _608), (((((UberPostScreenEffectsBasePacked6.y * _40) + _164) + UberPostScreenEffectsBasePacked2.w) + (((_27[_593]) * _589) * UberPostScreenEffectsBasePacked2.y)) + _608)));
  float _670 = select((UberPostScreenEffectsBasePacked11.z > 0.5f), _661, 1.0f);
  _30[0] = _662.x;
  _30[1] = _662.y;
  _30[2] = _662.z;
  _30[3] = _662.w;
  bool _681 = (UberPostScreenEffectsBasePacked3.y > 3.5f);
  float _684 = saturate(UberPostScreenEffectsBasePacked3.w * _670);
  float _693 = UberPostScreenEffectsBasePacked5.x - UberPostScreenEffectsBasePacked4.x;
  float _694 = UberPostScreenEffectsBasePacked5.y - UberPostScreenEffectsBasePacked4.y;
  float _695 = UberPostScreenEffectsBasePacked5.z - UberPostScreenEffectsBasePacked4.z;
  float _707 = saturate((_670 * (_30[min((uint)(uint(UberPostScreenEffectsBasePacked3.y)), 3)])) * UberPostScreenEffectsBasePacked3.w);
  float _714 = select(_681, (((_693 * _684) + UberPostScreenEffectsBasePacked4.x) * _662.x), ((_693 * _707) + UberPostScreenEffectsBasePacked4.x));
  float _715 = select(_681, (((_694 * _684) + UberPostScreenEffectsBasePacked4.y) * _662.y), ((_694 * _707) + UberPostScreenEffectsBasePacked4.y));
  float _716 = select(_681, (((_695 * _684) + UberPostScreenEffectsBasePacked4.z) * _662.z), ((_695 * _707) + UberPostScreenEffectsBasePacked4.z));
  _29[0] = _662.x;
  _29[1] = _662.y;
  _29[2] = _662.z;
  _29[3] = _662.w;
  float _725 = _29[min((uint)(uint(UberPostScreenEffectsBasePacked3.z)), 3)];
  float _726 = _725 * _661;
  float4 _742 = _ScrFxMaskTex.Sample(sampler_ScrFxMaskTex, float2(((((UberPostScreenEffectsBasePacked8.x * _40) + _163) + UberPostScreenEffectsBasePacked7.z) + (UberPostScreenEffectsBasePacked7.x * (_26[_522]))), ((((UberPostScreenEffectsBasePacked8.y * _40) + _164) + UberPostScreenEffectsBasePacked7.w) + (UberPostScreenEffectsBasePacked7.y * (_27[_522])))));
  _28[0] = _742.x;
  _28[1] = _742.y;
  _28[2] = _742.z;
  _28[3] = _742.w;
  if (UberPostScreenEffectsBasePacked8.z < 0.5f) {
    _764 = (lerp(UberPostScreenEffectsBasePacked4.w, UberPostScreenEffectsBasePacked5.w, _725));
  } else {
    _764 = select((UberPostScreenEffectsBasePacked13.w > 0.5f), saturate((_726 - UberPostScreenEffectsBasePacked10.x) * UberPostScreenEffectsBasePacked14.x), select((_726 < UberPostScreenEffectsBasePacked10.x), 0.0f, 1.0f));
  }
  float _766 = ((_28[min((uint)(uint(UberPostScreenEffectsBasePacked6.w)), 3)]) * _764) * _96;
  float _770 = select((_766 < UberPostScreenEffectsBasePacked14.y), 0.0f, 1.0f) * _766;
  if (UberPostScreenEffectsBasePacked0.x < 0.5f) {
    _846 = ((_770 * (_714 - _451)) + _451);
    _847 = ((_770 * (_715 - _452)) + _452);
    _848 = ((_770 * (_716 - _453)) + _453);
  } else {
    if (UberPostScreenEffectsBasePacked0.x < 1.5f) {
      _846 = ((_770 * _714) + _451);
      _847 = ((_770 * _715) + _452);
      _848 = ((_770 * _716) + _453);
    } else {
      if (UberPostScreenEffectsBasePacked0.x < 2.5f) {
        _846 = (((_770 * (_714 + -1.0f)) + 1.0f) * _451);
        _847 = (((_770 * (_715 + -1.0f)) + 1.0f) * _452);
        _848 = (((_770 * (_716 + -1.0f)) + 1.0f) * _453);
      } else {
        float _812 = _770 * (_714 + -0.5f);
        float _813 = _770 * (_715 + -0.5f);
        float _814 = _770 * (_716 + -0.5f);
        _846 = select((_451 < 0.5f), ((_451 * 2.0f) * (_812 + 0.5f)), (1.0f - (((1.0f - _451) * 2.0f) * (0.5f - _812))));
        _847 = select((_452 < 0.5f), ((_452 * 2.0f) * (_813 + 0.5f)), (1.0f - (((1.0f - _452) * 2.0f) * (0.5f - _813))));
        _848 = select((_453 < 0.5f), ((_453 * 2.0f) * (_814 + 0.5f)), (1.0f - (((1.0f - _453) * 2.0f) * (0.5f - _814))));
      }
    }
  }
  SV_Target.x = _846;
  SV_Target.y = _847;
  SV_Target.z = _848;
  SV_Target.w = _374;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
