#include "../../tonemap.hlsl"

// Gambling screen
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
  float _44 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _45 = (TEXCOORD.y * 2.0f) + -1.0f;
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
  float _226;
  float _227;
  float _228;
  float _360;
  float _361;
  float _362;
  float _372;
  float _373;
  float _374;
  float _375;
  float _414;
  float _415;
  float _416;
  float _503;
  float _504;
  float _505;
  float _816;
  float _898;
  float _899;
  float _900;
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
  bool _168 = (_DistortionRgbShift.w > 0.0f);
  if (_168) {
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
  if (_168) {
    float4 _210 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_201 + TEXCOORD.x), (_202 + TEXCOORD.y)));
    float4 _214 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_203 + TEXCOORD.x), (_204 + TEXCOORD.y)));
    float4 _218 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_205 + TEXCOORD.x), (_206 + TEXCOORD.y)));
    _226 = _210.x;
    _227 = _214.y;
    _228 = _218.z;
  } else {
    float4 _221 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_199, _200));
    _226 = _221.x;
    _227 = _221.y;
    _228 = _221.z;
  }
  float4 _229 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_199, _200));
  bool _237 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _237))) {
    float _247 = fmod(((_ScreenSize.y * _200) * _VREffectsScanlineParams.x), 2.0f);
    float _255 = (((select((_247 > 1.0f), (2.0f - _247), _247) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _199;
    float _258 = _ScreenSize.w * _ScreenSize.x;
    float4 _277 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_255, ((select(((frac((((_255 + abs(_VREffectsSliceParams.y)) * _258) - (_VREffectsSliceParams.y * _200)) / ((_258 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _200)));
    float _314 = ((((-0.699999988079071f - _277.x) + (exp2(log2(abs(_277.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_277.x < 0.30000001192092896f), 0.0f, 1.0f)) + _277.x) * UberPostBasePacked3.x;
    float _315 = ((((-0.699999988079071f - _277.y) + (exp2(log2(abs(_277.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_277.y < 0.30000001192092896f), 0.0f, 1.0f)) + _277.y) * UberPostBasePacked3.x;
    float _316 = ((((-0.699999988079071f - _277.z) + (exp2(log2(abs(_277.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_277.z < 0.30000001192092896f), 0.0f, 1.0f)) + _277.z) * UberPostBasePacked3.x;
    float _317 = dot(float3(_226, _227, _228), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _320 = (UberPostBasePacked4.x > 0.5f);
    float _333 = select(_320, ((((_314 * _317) - _314) * _229.w) + _314), _314);
    float _334 = select(_320, ((((_315 * _317) - _315) * _229.w) + _315), _315);
    float _335 = select(_320, ((((_316 * _317) - _316) * _229.w) + _316), _316);
    do {
      if (_237) {
        float4 _346 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _199) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _200) + _DirtTexTillingOffset.w)));
        _360 = (((_346.x * _314) * UberPostBasePacked3.y) + _333);
        _361 = (((_346.y * _315) * UberPostBasePacked3.y) + _334);
        _362 = (((_346.z * _316) * UberPostBasePacked3.y) + _335);
      } else {
        _360 = _333;
        _361 = _334;
        _362 = _335;
      }
      _372 = (_360 + _226);
      _373 = (_361 + _227);
      _374 = (_362 + _228);
      _375 = saturate((((_361 + _360) + _362) * 0.33329999446868896f) + _229.w);
    } while (false);
  } else {
    _372 = _226;
    _373 = _227;
    _374 = _228;
    _375 = _229.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _392 = abs(_200 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _394 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_199 - _Vignette_Params2.x);
    float _400 = exp2(log2(saturate(1.0f - dot(float2(_394, _392), float2(_394, _392)))) * _Vignette_Params2.w);
    _414 = (((_400 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _372);
    _415 = (((_400 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _373);
    _416 = (((_400 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _374);
  } else {
    _414 = _372;
    _415 = _373;
    _416 = _374;
  }
  float3 untonemapped = (float3(_414, _415, _416));
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _465 = tonemapped.x;
  float _466 = tonemapped.y;
  float _467 = tonemapped.z;
  /*
  float _439 = saturate((log2((_416 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _440 = floor(_439);
  float _446 = ((saturate((log2((_415 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _448 = (_440 * _Lut_Params.y) + (((saturate((log2((_414 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _449 = _439 - _440;
  float4 _451 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_448 + _Lut_Params.y), _446), 0.0f);
  float4 _455 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_448, _446), 0.0f);
  float _465 = ((_451.x - _455.x) * _449) + _455.x;
  float _466 = ((_451.y - _455.y) * _449) + _455.y;
  float _467 = ((_451.z - _455.z) * _449) + _455.z;*/
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _482 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _485 = (_482.w + -0.5f) * 2.0f;
    float _489 = 1.0f - (sqrt(dot(float3(_465, _466, _467), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _503 = ((((UberPostBasePacked1.x * _465) * _485) * _489) + _465);
    _504 = ((((UberPostBasePacked1.x * _466) * _485) * _489) + _466);
    _505 = ((((UberPostBasePacked1.x * _467) * _485) * _489) + _467);
  } else {
    _503 = _465;
    _504 = _466;
    _505 = _467;
  }
  float _509 = ((_57 * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _45;
  float _511 = atan(_509 / _44);
  bool _514 = (_44 < 0.0f);
  bool _515 = (_44 == 0.0f);
  bool _516 = (_509 >= 0.0f);
  bool _517 = (_509 < 0.0f);
  _27[0] = (((_ScreenSize.x * (TEXCOORD.x + -0.5f)) * _ScreenSize.w) + 0.5f);
  _28[0] = TEXCOORD.y;
  _27[1] = select((_515 && _516), 2.0f, select((_515 && _517), -2.0f, (select((_514 && _517), (_511 + -3.1415927410125732f), select((_514 && _516), (_511 + 3.1415927410125732f), _511)) * 1.2732394933700562f)));
  _28[1] = (sqrt((_509 * _509) + (_44 * _44)) * 0.5f);
  _27[2] = TEXCOORD.x;
  _28[2] = TEXCOORD.y;
  int _574 = min(max(int(round(UberPostScreenEffectsBasePacked6.z)), 0), 2);
  int _597 = min(max(int(round(UberPostScreenEffectsBasePacked11.w)), 0), 2);
  float4 _620 = _ScrFxDistortionTex.Sample(sampler_ScrFxDistortionTex, float2(((((_ScrFxDistortionRandomUV.x + _164) + (UberPostScreenEffectsBasePacked11.x * _41)) + UberPostScreenEffectsBasePacked12.z) + (UberPostScreenEffectsBasePacked12.x * (_27[_597]))), ((((_ScrFxDistortionRandomUV.y + _165) + (UberPostScreenEffectsBasePacked11.y * _41)) + UberPostScreenEffectsBasePacked12.w) + (UberPostScreenEffectsBasePacked12.y * (_28[_597])))));
  _33[0] = _620.x;
  _33[1] = _620.y;
  _33[2] = _620.z;
  _33[3] = _620.w;
  float _633 = ((_33[min((uint)(uint(UberPostScreenEffectsBasePacked13.x)), 3)]) + -0.49803921580314636f) * 2.0f;
  float _641 = select((UberPostScreenEffectsBasePacked3.x < 9.999999747378752e-06f), max(1.0f, (_ScreenSize.y * 0.0009259259095415473f)), 1.0f);
  int _645 = min(max(int(round(UberPostScreenEffectsBasePacked3.x)), 0), 2);
  float _660 = UberPostScreenEffectsBasePacked13.y * _633;
  int _674 = min(max(int(round(UberPostScreenEffectsBasePacked8.w)), 0), 2);
  float _688 = UberPostScreenEffectsBasePacked13.z * _633;
  float4 _702 = _ScrFxDissolveTex.Sample(sampler_ScrFxDissolveTex, float2((((((_ScrFxDissolveRandomUV.x + _164) + (UberPostScreenEffectsBasePacked10.z * _41)) + UberPostScreenEffectsBasePacked9.z) + (UberPostScreenEffectsBasePacked9.x * (_27[_674]))) + _688), (((((_ScrFxDissolveRandomUV.y + _165) + (UberPostScreenEffectsBasePacked10.w * _41)) + UberPostScreenEffectsBasePacked9.w) + (UberPostScreenEffectsBasePacked9.y * (_28[_674]))) + _688)));
  _32[0] = _702.x;
  _32[1] = _702.y;
  _32[2] = _702.z;
  _32[3] = _702.w;
  float _713 = _32[min((uint)(uint(UberPostScreenEffectsBasePacked10.y)), 3)];
  float4 _714 = _ScrFxMainTex.Sample(sampler_ScrFxMainTex, float2((((((UberPostScreenEffectsBasePacked6.x * _41) + _164) + UberPostScreenEffectsBasePacked2.z) + (((_27[_645]) * _641) * UberPostScreenEffectsBasePacked2.x)) + _660), (((((UberPostScreenEffectsBasePacked6.y * _41) + _165) + UberPostScreenEffectsBasePacked2.w) + (((_28[_645]) * _641) * UberPostScreenEffectsBasePacked2.y)) + _660)));
  float _722 = select((UberPostScreenEffectsBasePacked11.z > 0.5f), _713, 1.0f);
  _31[0] = _714.x;
  _31[1] = _714.y;
  _31[2] = _714.z;
  _31[3] = _714.w;
  bool _733 = (UberPostScreenEffectsBasePacked3.y > 3.5f);
  float _736 = saturate(UberPostScreenEffectsBasePacked3.w * _722);
  float _745 = UberPostScreenEffectsBasePacked5.x - UberPostScreenEffectsBasePacked4.x;
  float _746 = UberPostScreenEffectsBasePacked5.y - UberPostScreenEffectsBasePacked4.y;
  float _747 = UberPostScreenEffectsBasePacked5.z - UberPostScreenEffectsBasePacked4.z;
  float _759 = saturate((_722 * (_31[min((uint)(uint(UberPostScreenEffectsBasePacked3.y)), 3)])) * UberPostScreenEffectsBasePacked3.w);
  float _766 = select(_733, (((_745 * _736) + UberPostScreenEffectsBasePacked4.x) * _714.x), ((_745 * _759) + UberPostScreenEffectsBasePacked4.x));
  float _767 = select(_733, (((_746 * _736) + UberPostScreenEffectsBasePacked4.y) * _714.y), ((_746 * _759) + UberPostScreenEffectsBasePacked4.y));
  float _768 = select(_733, (((_747 * _736) + UberPostScreenEffectsBasePacked4.z) * _714.z), ((_747 * _759) + UberPostScreenEffectsBasePacked4.z));
  _30[0] = _714.x;
  _30[1] = _714.y;
  _30[2] = _714.z;
  _30[3] = _714.w;
  float _777 = _30[min((uint)(uint(UberPostScreenEffectsBasePacked3.z)), 3)];
  float _778 = _777 * _713;
  float4 _794 = _ScrFxMaskTex.Sample(sampler_ScrFxMaskTex, float2(((((UberPostScreenEffectsBasePacked8.x * _41) + _164) + UberPostScreenEffectsBasePacked7.z) + (UberPostScreenEffectsBasePacked7.x * (_27[_574]))), ((((UberPostScreenEffectsBasePacked8.y * _41) + _165) + UberPostScreenEffectsBasePacked7.w) + (UberPostScreenEffectsBasePacked7.y * (_28[_574])))));
  _29[0] = _794.x;
  _29[1] = _794.y;
  _29[2] = _794.z;
  _29[3] = _794.w;
  if (UberPostScreenEffectsBasePacked8.z < 0.5f) {
    _816 = (lerp(UberPostScreenEffectsBasePacked4.w, UberPostScreenEffectsBasePacked5.w, _777));
  } else {
    _816 = select((UberPostScreenEffectsBasePacked13.w > 0.5f), saturate((_778 - UberPostScreenEffectsBasePacked10.x) * UberPostScreenEffectsBasePacked14.x), select((_778 < UberPostScreenEffectsBasePacked10.x), 0.0f, 1.0f));
  }
  float _818 = ((_29[min((uint)(uint(UberPostScreenEffectsBasePacked6.w)), 3)]) * _816) * _97;
  float _822 = select((_818 < UberPostScreenEffectsBasePacked14.y), 0.0f, 1.0f) * _818;
  if (UberPostScreenEffectsBasePacked0.x < 0.5f) {
    _898 = ((_822 * (_766 - _503)) + _503);
    _899 = ((_822 * (_767 - _504)) + _504);
    _900 = ((_822 * (_768 - _505)) + _505);
  } else {
    if (UberPostScreenEffectsBasePacked0.x < 1.5f) {
      _898 = ((_822 * _766) + _503);
      _899 = ((_822 * _767) + _504);
      _900 = ((_822 * _768) + _505);
    } else {
      if (UberPostScreenEffectsBasePacked0.x < 2.5f) {
        _898 = (((_822 * (_766 + -1.0f)) + 1.0f) * _503);
        _899 = (((_822 * (_767 + -1.0f)) + 1.0f) * _504);
        _900 = (((_822 * (_768 + -1.0f)) + 1.0f) * _505);
      } else {
        float _864 = _822 * (_766 + -0.5f);
        float _865 = _822 * (_767 + -0.5f);
        float _866 = _822 * (_768 + -0.5f);
        _898 = select((_503 < 0.5f), ((_503 * 2.0f) * (_864 + 0.5f)), (1.0f - (((1.0f - _503) * 2.0f) * (0.5f - _864))));
        _899 = select((_504 < 0.5f), ((_504 * 2.0f) * (_865 + 0.5f)), (1.0f - (((1.0f - _504) * 2.0f) * (0.5f - _865))));
        _900 = select((_505 < 0.5f), ((_505 * 2.0f) * (_866 + 0.5f)), (1.0f - (((1.0f - _505) * 2.0f) * (0.5f - _866))));
      }
    }
  }
  SV_Target.x = _898;
  SV_Target.y = _899;
  SV_Target.z = _900;
  SV_Target.w = _375;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
