#include "../../tonemap.hlsl"

Texture2D<float4> _BlitTex : register(t0);

Texture2D<float4> _Grain_Texture : register(t1);

Texture2D<float4> _InternalLut : register(t2);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t3);

Texture2D<float4> _NapBloomTex : register(t4);

Texture2D<float4> _DirtTex : register(t5);

Texture2D<float4> _ScrFxMainTex : register(t6);

Texture2D<float4> _ScrFxMaskTex : register(t7);

Texture2D<float4> _ScrFxDissolveTex : register(t8);

Texture2D<float4> _ScrFxDistortionTex : register(t9);

Texture2D<float4> _ScrFxScrDistTex : register(t10);

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
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float _27[3];
  float _28[3];
  float _29[4];
  float _30[4];
  float _31[4];
  float _32[4];
  float _33[4];
  float _41 = select((UberPostScreenEffectsBasePacked16.w > 0.5f), (_GlobalTimeParamsA[1].x), (_GlobalTimeParamsB[0].y));
  float _42 = TEXCOORD.x * 2.0f;
  float _43 = TEXCOORD.y * 2.0f;
  float _44 = _42 + -1.0f;
  float _45 = _43 + -1.0f;
  float _55 = _ScaledScreenParams.z + -1.0f;
  float _57 = (_55 * _ScaledScreenParams.y) + -1.0f;
  float _59 = (_57 * UberPostScreenEffectsBasePacked1.x) + 1.0f;
  float _60 = _59 * _45;
  float _61 = _44 * _44;
  float _72 = select((UberPostScreenEffectsBasePacked0.z < 0.5f), min((1.0f - abs(_44)), (_59 * (1.0f - abs(_45)))), (1.0f - (sqrt((_60 * _60) + _61) * 0.7070000171661377f)));
  float _82 = saturate((_72 - UberPostScreenEffectsBasePacked0.w) / (((1.0f - UberPostScreenEffectsBasePacked1.y) * UberPostScreenEffectsBasePacked0.w) - UberPostScreenEffectsBasePacked0.w));
  float _88 = select((UberPostScreenEffectsBasePacked1.y > 9.999999747378752e-05f), ((_82 * _82) * (3.0f - (_82 * 2.0f))), select((UberPostScreenEffectsBasePacked0.w < _72), 0.0f, 1.0f));
  float _94 = select((UberPostScreenEffectsBasePacked1.w > 0.5f), (1.0f - _88), _88) * UberPostScreenEffectsBasePacked1.z;
  float _97 = select((UberPostScreenEffectsBasePacked0.w > 9.999999747378752e-05f), _94, 0.0f) * _94;
  float _164;
  float _165;
  float _199;
  float _200;
  float _201;
  float _202;
  float _203;
  float _204;
  float _205;
  float _206;
  float _389;
  float _390;
  float _391;
  float _401;
  float _402;
  float _403;
  float _404;
  float _443;
  float _444;
  float _445;
  float _571;
  float _572;
  float _573;
  float _891;
  float _973;
  float _974;
  float _975;
  if (UberPostScreenEffectsBasePacked14.z > 0.5f) {
    float _105 = ((_57 * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _45;
    float _107 = atan(_105 / _44);
    bool _110 = (_44 < 0.0f);
    bool _111 = (_44 == 0.0f);
    bool _112 = (_105 >= 0.0f);
    bool _113 = (_105 < 0.0f);
    bool _137 = (UberPostScreenEffectsBasePacked14.w > 0.5f);
    float4 _151 = _ScrFxScrDistTex.Sample(sampler_ScrFxScrDistTex, float2(((UberPostScreenEffectsBasePacked15.z + (UberPostScreenEffectsBasePacked16.y * _41)) + (select(_137, select((_111 && _112), 2.0f, select((_111 && _113), -2.0f, (select((_110 && _113), (_107 + -3.1415927410125732f), select((_110 && _112), (_107 + 3.1415927410125732f), _107)) * 1.2732394933700562f))), TEXCOORD.x) * UberPostScreenEffectsBasePacked15.x)), ((UberPostScreenEffectsBasePacked15.w + (UberPostScreenEffectsBasePacked16.z * _41)) + (select(_137, (sqrt((_105 * _105) + _61) * 0.6366197466850281f), (((_ScaledScreenParams.y * (TEXCOORD.y + -0.5f)) * _55) + 0.5f)) * UberPostScreenEffectsBasePacked15.y))));
    float _160 = (_97 * 0.10000000149011612f) * UberPostScreenEffectsBasePacked16.x;
    _164 = (_160 * ((_151.x * 2.0f) + -1.0f));
    _165 = (_160 * ((_151.y * 2.0f) + -1.0f));
  } else {
    _164 = 0.0f;
    _165 = 0.0f;
  }
  if (_DistortionRgbShift.w > 0.0f) {
    float4 _170 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _176 = (_170.x * 0.10000000149011612f) + _164;
    float _177 = (_170.y * 0.10000000149011612f) + _165;
    float _180 = _DistortionRgbShift.w * _170.z;
    float _181 = _180 * _176;
    float _182 = _180 * _177;
    _199 = (_176 + TEXCOORD.x);
    _200 = (_177 + TEXCOORD.y);
    _201 = ((_181 * _DistortionRgbShift.x) + _176);
    _202 = ((_182 * _DistortionRgbShift.x) + _177);
    _203 = ((_181 * _DistortionRgbShift.y) + _176);
    _204 = ((_182 * _DistortionRgbShift.y) + _177);
    _205 = ((_181 * _DistortionRgbShift.z) + _176);
    _206 = ((_182 * _DistortionRgbShift.z) + _177);
  } else {
    _199 = TEXCOORD.x;
    _200 = TEXCOORD.y;
    _201 = 0.0f;
    _202 = 0.0f;
    _203 = 0.0f;
    _204 = 0.0f;
    _205 = 0.0f;
    _206 = 0.0f;
  }
  float _211 = (_42 - _ChromaCenter.x) + -0.5f;
  float _213 = (_43 - _ChromaCenter.y) + -0.5f;
  float _217 = dot(float2(_211, _213), float2(_211, _213)) * -0.3333333432674408f;
  float _219 = (_217 * _211) * UberPostBasePacked0.z;
  float _221 = (_217 * _213) * UberPostBasePacked0.z;
  float _223 = rsqrt(dot(float3(_219, _221, 9.999999747378752e-05f), float3(_219, _221, 9.999999747378752e-05f)));
  float _230 = UberPostBasePacked0.z * 0.9428090453147888f;
  float _235 = exp2(log2(sqrt((_219 * _219) + (_221 * _221)) / _230) * _ChromaCenter.z);
  float _237 = ((_219 * _223) * _230) * _235;
  float _239 = ((_221 * _223) * _230) * _235;
  float4 _242 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_201 + TEXCOORD.x), (_202 + TEXCOORD.y)));
  float4 _248 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_203 + TEXCOORD.x) + _237), ((_204 + TEXCOORD.y) + _239)));
  float4 _256 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_205 + TEXCOORD.x) + (_237 * 2.0f)), ((_206 + TEXCOORD.y) + (_239 * 2.0f))));
  float4 _258 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_199, _200));
  bool _266 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _266))) {
    float _276 = fmod(((_ScreenSize.y * _200) * _VREffectsScanlineParams.x), 2.0f);
    float _284 = (((select((_276 > 1.0f), (2.0f - _276), _276) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _199;
    float _287 = _ScreenSize.w * _ScreenSize.x;
    float4 _306 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_284, ((select(((frac((((_284 + abs(_VREffectsSliceParams.y)) * _287) - (_VREffectsSliceParams.y * _200)) / ((_287 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _200)));
    float _343 = ((((-0.699999988079071f - _306.x) + (exp2(log2(abs(_306.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_306.x < 0.30000001192092896f), 0.0f, 1.0f)) + _306.x) * UberPostBasePacked3.x;
    float _344 = ((((-0.699999988079071f - _306.y) + (exp2(log2(abs(_306.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_306.y < 0.30000001192092896f), 0.0f, 1.0f)) + _306.y) * UberPostBasePacked3.x;
    float _345 = ((((-0.699999988079071f - _306.z) + (exp2(log2(abs(_306.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_306.z < 0.30000001192092896f), 0.0f, 1.0f)) + _306.z) * UberPostBasePacked3.x;
    float _346 = dot(float3(_242.x, _248.y, _256.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _349 = (UberPostBasePacked4.x > 0.5f);
    float _362 = select(_349, ((((_343 * _346) - _343) * _258.w) + _343), _343);
    float _363 = select(_349, ((((_344 * _346) - _344) * _258.w) + _344), _344);
    float _364 = select(_349, ((((_345 * _346) - _345) * _258.w) + _345), _345);
    do {
      if (_266) {
        float4 _375 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _199) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _200) + _DirtTexTillingOffset.w)));
        _389 = (((_375.x * _343) * UberPostBasePacked3.y) + _362);
        _390 = (((_375.y * _344) * UberPostBasePacked3.y) + _363);
        _391 = (((_375.z * _345) * UberPostBasePacked3.y) + _364);
      } else {
        _389 = _362;
        _390 = _363;
        _391 = _364;
      }
      _401 = (_389 + _242.x);
      _402 = (_390 + _248.y);
      _403 = (_391 + _256.z);
      _404 = saturate((((_390 + _389) + _391) * 0.33329999446868896f) + _258.w);
    } while (false);
  } else {
    _401 = _242.x;
    _402 = _248.y;
    _403 = _256.z;
    _404 = _258.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _421 = abs(_200 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _423 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_199 - _Vignette_Params2.x);
    float _429 = exp2(log2(saturate(1.0f - dot(float2(_423, _421), float2(_423, _421)))) * _Vignette_Params2.w);
    _443 = (((_429 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _401);
    _444 = (((_429 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _402);
    _445 = (((_429 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _403);
  } else {
    _443 = _401;
    _444 = _402;
    _445 = _403;
  }
  float3 untonemapped = (float3(_443, _444, _445));

  float3 tonemapped = applyUserToneMap(untonemapped, _Lut_Params, _InternalLut, s_linear_clamp_sampler);

  float _533 = tonemapped.x;
  float _534 = tonemapped.y;
  float _535 = tonemapped.z;
  /*
  float _450 = saturate(_443);
  float _451 = saturate(_444);
  float _452 = saturate(_445);
  float _480 = select((_452 <= 0.0031308000907301903f), (_452 * 12.920000076293945f), ((exp2(log2(abs(_452)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) * _Lut_Params.z;
  float _481 = floor(_480);
  float _487 = ((select((_451 <= 0.0031308000907301903f), (_451 * 12.920000076293945f), ((exp2(log2(abs(_451)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _489 = (((select((_450 <= 0.0031308000907301903f), (_450 * 12.920000076293945f), ((exp2(log2(abs(_450)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) * _Lut_Params.z) + 0.5f) * _Lut_Params.x) + (_481 * _Lut_Params.y);
  float _490 = _480 - _481;
  float4 _492 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_489 + _Lut_Params.y), _487), 0.0f);
  float4 _496 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_489, _487), 0.0f);
  float _506 = ((_492.x - _496.x) * _490) + _496.x;
  float _507 = ((_492.y - _496.y) * _490) + _496.y;
  float _508 = ((_492.z - _496.z) * _490) + _496.z;
  float _533 = select((_506 <= 0.040449999272823334f), (_506 * 0.07739938050508499f), exp2(log2(abs((_506 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  float _534 = select((_507 <= 0.040449999272823334f), (_507 * 0.07739938050508499f), exp2(log2(abs((_507 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  float _535 = select((_508 <= 0.040449999272823334f), (_508 * 0.07739938050508499f), exp2(log2(abs((_508 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  */
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _550 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _553 = (_550.w + -0.5f) * 2.0f;
    float _557 = 1.0f - (sqrt(dot(float3(_533, _534, _535), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _571 = ((((UberPostBasePacked1.x * _533) * _553) * _557) + _533);
    _572 = ((((UberPostBasePacked1.x * _534) * _553) * _557) + _534);
    _573 = ((((UberPostBasePacked1.x * _535) * _553) * _557) + _535);
  } else {
    _571 = _533;
    _572 = _534;
    _573 = _535;
  }
  float _584 = (((((_ScaledScreenParams.z + -1.0f) * _ScaledScreenParams.y) + -1.0f) * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _45;
  float _586 = atan(_584 / _44);
  bool _589 = (_44 < 0.0f);
  bool _590 = (_44 == 0.0f);
  bool _591 = (_584 >= 0.0f);
  bool _592 = (_584 < 0.0f);
  _27[0] = (((_ScreenSize.x * (TEXCOORD.x + -0.5f)) * _ScreenSize.w) + 0.5f);
  _28[0] = TEXCOORD.y;
  _27[1] = select((_590 && _591), 2.0f, select((_590 && _592), -2.0f, (select((_589 && _592), (_586 + -3.1415927410125732f), select((_589 && _591), (_586 + 3.1415927410125732f), _586)) * 1.2732394933700562f)));
  _28[1] = (sqrt((_584 * _584) + (_44 * _44)) * 0.5f);
  _27[2] = TEXCOORD.x;
  _28[2] = TEXCOORD.y;
  int _649 = min(max(int(round(UberPostScreenEffectsBasePacked6.z)), 0), 2);
  int _672 = min(max(int(round(UberPostScreenEffectsBasePacked11.w)), 0), 2);
  float4 _695 = _ScrFxDistortionTex.Sample(sampler_ScrFxDistortionTex, float2(((((_ScrFxDistortionRandomUV.x + _164) + (UberPostScreenEffectsBasePacked11.x * _41)) + UberPostScreenEffectsBasePacked12.z) + (UberPostScreenEffectsBasePacked12.x * (_27[_672]))), ((((_ScrFxDistortionRandomUV.y + _165) + (UberPostScreenEffectsBasePacked11.y * _41)) + UberPostScreenEffectsBasePacked12.w) + (UberPostScreenEffectsBasePacked12.y * (_28[_672])))));
  _33[0] = _695.x;
  _33[1] = _695.y;
  _33[2] = _695.z;
  _33[3] = _695.w;
  float _708 = ((_33[min((uint)(uint(UberPostScreenEffectsBasePacked13.x)), 3)]) + -0.49803921580314636f) * 2.0f;
  float _716 = select((UberPostScreenEffectsBasePacked3.x < 9.999999747378752e-06f), max(1.0f, (_ScreenSize.y * 0.0009259259095415473f)), 1.0f);
  int _720 = min(max(int(round(UberPostScreenEffectsBasePacked3.x)), 0), 2);
  float _735 = UberPostScreenEffectsBasePacked13.y * _708;
  int _749 = min(max(int(round(UberPostScreenEffectsBasePacked8.w)), 0), 2);
  float _763 = UberPostScreenEffectsBasePacked13.z * _708;
  float4 _777 = _ScrFxDissolveTex.Sample(sampler_ScrFxDissolveTex, float2((((((_ScrFxDissolveRandomUV.x + _164) + (UberPostScreenEffectsBasePacked10.z * _41)) + UberPostScreenEffectsBasePacked9.z) + (UberPostScreenEffectsBasePacked9.x * (_27[_749]))) + _763), (((((_ScrFxDissolveRandomUV.y + _165) + (UberPostScreenEffectsBasePacked10.w * _41)) + UberPostScreenEffectsBasePacked9.w) + (UberPostScreenEffectsBasePacked9.y * (_28[_749]))) + _763)));
  _32[0] = _777.x;
  _32[1] = _777.y;
  _32[2] = _777.z;
  _32[3] = _777.w;
  float _788 = _32[min((uint)(uint(UberPostScreenEffectsBasePacked10.y)), 3)];
  float4 _789 = _ScrFxMainTex.Sample(sampler_ScrFxMainTex, float2((((((UberPostScreenEffectsBasePacked6.x * _41) + _164) + UberPostScreenEffectsBasePacked2.z) + (((_27[_720]) * _716) * UberPostScreenEffectsBasePacked2.x)) + _735), (((((UberPostScreenEffectsBasePacked6.y * _41) + _165) + UberPostScreenEffectsBasePacked2.w) + (((_28[_720]) * _716) * UberPostScreenEffectsBasePacked2.y)) + _735)));
  float _797 = select((UberPostScreenEffectsBasePacked11.z > 0.5f), _788, 1.0f);
  _31[0] = _789.x;
  _31[1] = _789.y;
  _31[2] = _789.z;
  _31[3] = _789.w;
  bool _808 = (UberPostScreenEffectsBasePacked3.y > 3.5f);
  float _811 = saturate(UberPostScreenEffectsBasePacked3.w * _797);
  float _820 = UberPostScreenEffectsBasePacked5.x - UberPostScreenEffectsBasePacked4.x;
  float _821 = UberPostScreenEffectsBasePacked5.y - UberPostScreenEffectsBasePacked4.y;
  float _822 = UberPostScreenEffectsBasePacked5.z - UberPostScreenEffectsBasePacked4.z;
  float _834 = saturate((_797 * (_31[min((uint)(uint(UberPostScreenEffectsBasePacked3.y)), 3)])) * UberPostScreenEffectsBasePacked3.w);
  float _841 = select(_808, (((_820 * _811) + UberPostScreenEffectsBasePacked4.x) * _789.x), ((_820 * _834) + UberPostScreenEffectsBasePacked4.x));
  float _842 = select(_808, (((_821 * _811) + UberPostScreenEffectsBasePacked4.y) * _789.y), ((_821 * _834) + UberPostScreenEffectsBasePacked4.y));
  float _843 = select(_808, (((_822 * _811) + UberPostScreenEffectsBasePacked4.z) * _789.z), ((_822 * _834) + UberPostScreenEffectsBasePacked4.z));
  _30[0] = _789.x;
  _30[1] = _789.y;
  _30[2] = _789.z;
  _30[3] = _789.w;
  float _852 = _30[min((uint)(uint(UberPostScreenEffectsBasePacked3.z)), 3)];
  float _853 = _852 * _788;
  float4 _869 = _ScrFxMaskTex.Sample(sampler_ScrFxMaskTex, float2(((((UberPostScreenEffectsBasePacked8.x * _41) + _164) + UberPostScreenEffectsBasePacked7.z) + (UberPostScreenEffectsBasePacked7.x * (_27[_649]))), ((((UberPostScreenEffectsBasePacked8.y * _41) + _165) + UberPostScreenEffectsBasePacked7.w) + (UberPostScreenEffectsBasePacked7.y * (_28[_649])))));
  _29[0] = _869.x;
  _29[1] = _869.y;
  _29[2] = _869.z;
  _29[3] = _869.w;
  if (UberPostScreenEffectsBasePacked8.z < 0.5f) {
    _891 = (lerp(UberPostScreenEffectsBasePacked4.w, UberPostScreenEffectsBasePacked5.w, _852));
  } else {
    _891 = select((UberPostScreenEffectsBasePacked13.w > 0.5f), saturate((_853 - UberPostScreenEffectsBasePacked10.x) * UberPostScreenEffectsBasePacked14.x), select((_853 < UberPostScreenEffectsBasePacked10.x), 0.0f, 1.0f));
  }
  float _893 = ((_29[min((uint)(uint(UberPostScreenEffectsBasePacked6.w)), 3)]) * _891) * _97;
  float _897 = select((_893 < UberPostScreenEffectsBasePacked14.y), 0.0f, 1.0f) * _893;
  if (UberPostScreenEffectsBasePacked0.x < 0.5f) {
    _973 = ((_897 * (_841 - _571)) + _571);
    _974 = ((_897 * (_842 - _572)) + _572);
    _975 = ((_897 * (_843 - _573)) + _573);
  } else {
    if (UberPostScreenEffectsBasePacked0.x < 1.5f) {
      _973 = ((_897 * _841) + _571);
      _974 = ((_897 * _842) + _572);
      _975 = ((_897 * _843) + _573);
    } else {
      if (UberPostScreenEffectsBasePacked0.x < 2.5f) {
        _973 = (((_897 * (_841 + -1.0f)) + 1.0f) * _571);
        _974 = (((_897 * (_842 + -1.0f)) + 1.0f) * _572);
        _975 = (((_897 * (_843 + -1.0f)) + 1.0f) * _573);
      } else {
        float _939 = _897 * (_841 + -0.5f);
        float _940 = _897 * (_842 + -0.5f);
        float _941 = _897 * (_843 + -0.5f);
        _973 = select((_571 < 0.5f), ((_571 * 2.0f) * (_939 + 0.5f)), (1.0f - (((1.0f - _571) * 2.0f) * (0.5f - _939))));
        _974 = select((_572 < 0.5f), ((_572 * 2.0f) * (_940 + 0.5f)), (1.0f - (((1.0f - _572) * 2.0f) * (0.5f - _940))));
        _975 = select((_573 < 0.5f), ((_573 * 2.0f) * (_941 + 0.5f)), (1.0f - (((1.0f - _573) * 2.0f) * (0.5f - _941))));
      }
    }
  }
  SV_Target.x = _973;
  SV_Target.y = _974;
  SV_Target.z = _975;
  SV_Target.w = _404;
  SV_Target = renodx::draw::RenderIntermediatePass(SV_Target);
  return SV_Target;
}
