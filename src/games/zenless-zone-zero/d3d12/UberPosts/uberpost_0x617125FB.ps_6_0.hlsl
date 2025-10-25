#include "../../tonemap.hlsl"

// More gambling uberposts (flash effect)
Texture2D<float4> _BlitTex : register(t0);

Texture2D<float4> _Grain_Texture : register(t1);

Texture2D<float4> _InternalLut : register(t2);

Texture2D<float4> _FXMaskForScene : register(t3);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t4);

Texture2D<float4> _NapBloomTex : register(t5);

Texture2D<float4> _DirtTex : register(t6);

Texture2D<float4> _ScrFxMainTex : register(t7);

Texture2D<float4> _ScrFxMaskTex : register(t8);

Texture2D<float4> _ScrFxDissolveTex : register(t9);

Texture2D<float4> _ScrFxDistortionTex : register(t10);

Texture2D<float4> _ScrFxScrDistTex : register(t11);

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

cbuffer UberPostFXColorCorrectionCBuffer : register(b4) {
  float4 UberPostColorCorrectionPacked0 : packoffset(c000.x);
  float4 UberPostColorCorrectionPacked1 : packoffset(c001.x);
  float4 UberPostColorCorrectionPacked2 : packoffset(c002.x);
  float4 UberPostColorCorrectionPacked3 : packoffset(c003.x);
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
  float _29[3];
  float _30[3];
  float _31[4];
  float _32[4];
  float _33[4];
  float _34[4];
  float _35[4];
  float _43 = select((UberPostScreenEffectsBasePacked16.w > 0.5f), (_GlobalTimeParamsA[1].x), (_GlobalTimeParamsB[0].y));
  float _46 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _47 = (TEXCOORD.y * 2.0f) + -1.0f;
  float _57 = _ScaledScreenParams.z + -1.0f;
  float _59 = (_57 * _ScaledScreenParams.y) + -1.0f;
  float _61 = (_59 * UberPostScreenEffectsBasePacked1.x) + 1.0f;
  float _62 = _61 * _47;
  float _63 = _46 * _46;
  float _74 = select((UberPostScreenEffectsBasePacked0.z < 0.5f), min((1.0f - abs(_46)), (_61 * (1.0f - abs(_47)))), (1.0f - (sqrt((_62 * _62) + _63) * 0.7070000171661377f)));
  float _84 = saturate((_74 - UberPostScreenEffectsBasePacked0.w) / (((1.0f - UberPostScreenEffectsBasePacked1.y) * UberPostScreenEffectsBasePacked0.w) - UberPostScreenEffectsBasePacked0.w));
  float _90 = select((UberPostScreenEffectsBasePacked1.y > 9.999999747378752e-05f), ((_84 * _84) * (3.0f - (_84 * 2.0f))), select((UberPostScreenEffectsBasePacked0.w < _74), 0.0f, 1.0f));
  float _96 = select((UberPostScreenEffectsBasePacked1.w > 0.5f), (1.0f - _90), _90) * UberPostScreenEffectsBasePacked1.z;
  float _99 = select((UberPostScreenEffectsBasePacked0.w > 9.999999747378752e-05f), _96, 0.0f) * _96;
  float _166;
  float _167;
  float _201;
  float _202;
  float _203;
  float _204;
  float _205;
  float _206;
  float _207;
  float _208;
  float _228;
  float _229;
  float _230;
  float _362;
  float _363;
  float _364;
  float _374;
  float _375;
  float _376;
  float _377;
  float _416;
  float _417;
  float _418;
  float _505;
  float _506;
  float _507;
  float _818;
  float _900;
  float _901;
  float _902;
  float _1042;
  float _1043;
  float _1044;
  if (UberPostScreenEffectsBasePacked14.z > 0.5f) {
    float _107 = ((_59 * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _47;
    float _109 = atan(_107 / _46);
    bool _112 = (_46 < 0.0f);
    bool _113 = (_46 == 0.0f);
    bool _114 = (_107 >= 0.0f);
    bool _115 = (_107 < 0.0f);
    bool _139 = (UberPostScreenEffectsBasePacked14.w > 0.5f);
    float4 _153 = _ScrFxScrDistTex.Sample(sampler_ScrFxScrDistTex, float2(((UberPostScreenEffectsBasePacked15.z + (UberPostScreenEffectsBasePacked16.y * _43)) + (select(_139, select((_113 && _114), 2.0f, select((_113 && _115), -2.0f, (select((_112 && _115), (_109 + -3.1415927410125732f), select((_112 && _114), (_109 + 3.1415927410125732f), _109)) * 1.2732394933700562f))), TEXCOORD.x) * UberPostScreenEffectsBasePacked15.x)), ((UberPostScreenEffectsBasePacked15.w + (UberPostScreenEffectsBasePacked16.z * _43)) + (select(_139, (sqrt((_107 * _107) + _63) * 0.6366197466850281f), (((_ScaledScreenParams.y * (TEXCOORD.y + -0.5f)) * _57) + 0.5f)) * UberPostScreenEffectsBasePacked15.y))));
    float _162 = (_99 * 0.10000000149011612f) * UberPostScreenEffectsBasePacked16.x;
    _166 = (_162 * ((_153.x * 2.0f) + -1.0f));
    _167 = (_162 * ((_153.y * 2.0f) + -1.0f));
  } else {
    _166 = 0.0f;
    _167 = 0.0f;
  }
  bool _170 = (_DistortionRgbShift.w > 0.0f);
  if (_170) {
    float4 _172 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _178 = (_172.x * 0.10000000149011612f) + _166;
    float _179 = (_172.y * 0.10000000149011612f) + _167;
    float _182 = _DistortionRgbShift.w * _172.z;
    float _183 = _182 * _178;
    float _184 = _182 * _179;
    _201 = (_178 + TEXCOORD.x);
    _202 = (_179 + TEXCOORD.y);
    _203 = ((_183 * _DistortionRgbShift.x) + _178);
    _204 = ((_184 * _DistortionRgbShift.x) + _179);
    _205 = ((_183 * _DistortionRgbShift.y) + _178);
    _206 = ((_184 * _DistortionRgbShift.y) + _179);
    _207 = ((_183 * _DistortionRgbShift.z) + _178);
    _208 = ((_184 * _DistortionRgbShift.z) + _179);
  } else {
    _201 = TEXCOORD.x;
    _202 = TEXCOORD.y;
    _203 = 0.0f;
    _204 = 0.0f;
    _205 = 0.0f;
    _206 = 0.0f;
    _207 = 0.0f;
    _208 = 0.0f;
  }
  if (_170) {
    float4 _212 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_203 + TEXCOORD.x), (_204 + TEXCOORD.y)));
    float4 _216 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_205 + TEXCOORD.x), (_206 + TEXCOORD.y)));
    float4 _220 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_207 + TEXCOORD.x), (_208 + TEXCOORD.y)));
    _228 = _212.x;
    _229 = _216.y;
    _230 = _220.z;
  } else {
    float4 _223 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_201, _202));
    _228 = _223.x;
    _229 = _223.y;
    _230 = _223.z;
  }
  float4 _231 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_201, _202));
  bool _239 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _239))) {
    float _249 = fmod(((_ScreenSize.y * _202) * _VREffectsScanlineParams.x), 2.0f);
    float _257 = (((select((_249 > 1.0f), (2.0f - _249), _249) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _201;
    float _260 = _ScreenSize.w * _ScreenSize.x;
    float4 _279 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_257, ((select(((frac((((_257 + abs(_VREffectsSliceParams.y)) * _260) - (_VREffectsSliceParams.y * _202)) / ((_260 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _202)));
    float _316 = ((((-0.699999988079071f - _279.x) + (exp2(log2(abs(_279.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_279.x < 0.30000001192092896f), 0.0f, 1.0f)) + _279.x) * UberPostBasePacked3.x;
    float _317 = ((((-0.699999988079071f - _279.y) + (exp2(log2(abs(_279.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_279.y < 0.30000001192092896f), 0.0f, 1.0f)) + _279.y) * UberPostBasePacked3.x;
    float _318 = ((((-0.699999988079071f - _279.z) + (exp2(log2(abs(_279.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_279.z < 0.30000001192092896f), 0.0f, 1.0f)) + _279.z) * UberPostBasePacked3.x;
    float _319 = dot(float3(_228, _229, _230), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _322 = (UberPostBasePacked4.x > 0.5f);
    float _335 = select(_322, ((((_316 * _319) - _316) * _231.w) + _316), _316);
    float _336 = select(_322, ((((_317 * _319) - _317) * _231.w) + _317), _317);
    float _337 = select(_322, ((((_318 * _319) - _318) * _231.w) + _318), _318);
    do {
      if (_239) {
        float4 _348 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _201) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _202) + _DirtTexTillingOffset.w)));
        _362 = (((_348.x * _316) * UberPostBasePacked3.y) + _335);
        _363 = (((_348.y * _317) * UberPostBasePacked3.y) + _336);
        _364 = (((_348.z * _318) * UberPostBasePacked3.y) + _337);
      } else {
        _362 = _335;
        _363 = _336;
        _364 = _337;
      }
      _374 = (_362 + _228);
      _375 = (_363 + _229);
      _376 = (_364 + _230);
      _377 = saturate((((_363 + _362) + _364) * 0.33329999446868896f) + _231.w);
    } while (false);
  } else {
    _374 = _228;
    _375 = _229;
    _376 = _230;
    _377 = _231.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _394 = abs(_202 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _396 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_201 - _Vignette_Params2.x);
    float _402 = exp2(log2(saturate(1.0f - dot(float2(_396, _394), float2(_396, _394)))) * _Vignette_Params2.w);
    _416 = (((_402 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _374);
    _417 = (((_402 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _375);
    _418 = (((_402 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _376);
  } else {
    _416 = _374;
    _417 = _375;
    _418 = _376;
  }
  float3 untonemapped = (float3(_416, _417, _418));
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _467 = tonemapped.x;
  float _468 = tonemapped.y;
  float _469 = tonemapped.z;
  /*
  float _441 = saturate((log2((_418 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _442 = floor(_441);
  float _448 = ((saturate((log2((_417 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _450 = (_442 * _Lut_Params.y) + (((saturate((log2((_416 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _451 = _441 - _442;
  float4 _453 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_450 + _Lut_Params.y), _448), 0.0f);
  float4 _457 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_450, _448), 0.0f);
  float _467 = ((_453.x - _457.x) * _451) + _457.x;
  float _468 = ((_453.y - _457.y) * _451) + _457.y;
  float _469 = ((_453.z - _457.z) * _451) + _457.z;*/
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _484 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _487 = (_484.w + -0.5f) * 2.0f;
    float _491 = 1.0f - (sqrt(dot(float3(_467, _468, _469), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _505 = ((((UberPostBasePacked1.x * _467) * _487) * _491) + _467);
    _506 = ((((UberPostBasePacked1.x * _468) * _487) * _491) + _468);
    _507 = ((((UberPostBasePacked1.x * _469) * _487) * _491) + _469);
  } else {
    _505 = _467;
    _506 = _468;
    _507 = _469;
  }
  float _511 = ((_59 * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _47;
  float _513 = atan(_511 / _46);
  bool _516 = (_46 < 0.0f);
  bool _517 = (_46 == 0.0f);
  bool _518 = (_511 >= 0.0f);
  bool _519 = (_511 < 0.0f);
  _29[0] = (((_ScreenSize.x * (TEXCOORD.x + -0.5f)) * _ScreenSize.w) + 0.5f);
  _30[0] = TEXCOORD.y;
  _29[1] = select((_517 && _518), 2.0f, select((_517 && _519), -2.0f, (select((_516 && _519), (_513 + -3.1415927410125732f), select((_516 && _518), (_513 + 3.1415927410125732f), _513)) * 1.2732394933700562f)));
  _30[1] = (sqrt((_511 * _511) + (_46 * _46)) * 0.5f);
  _29[2] = TEXCOORD.x;
  _30[2] = TEXCOORD.y;
  int _576 = min(max(int(round(UberPostScreenEffectsBasePacked6.z)), 0), 2);
  int _599 = min(max(int(round(UberPostScreenEffectsBasePacked11.w)), 0), 2);
  float4 _622 = _ScrFxDistortionTex.Sample(sampler_ScrFxDistortionTex, float2(((((_ScrFxDistortionRandomUV.x + _166) + (UberPostScreenEffectsBasePacked11.x * _43)) + UberPostScreenEffectsBasePacked12.z) + (UberPostScreenEffectsBasePacked12.x * (_29[_599]))), ((((_ScrFxDistortionRandomUV.y + _167) + (UberPostScreenEffectsBasePacked11.y * _43)) + UberPostScreenEffectsBasePacked12.w) + (UberPostScreenEffectsBasePacked12.y * (_30[_599])))));
  _35[0] = _622.x;
  _35[1] = _622.y;
  _35[2] = _622.z;
  _35[3] = _622.w;
  float _635 = ((_35[min((uint)(uint(UberPostScreenEffectsBasePacked13.x)), 3)]) + -0.49803921580314636f) * 2.0f;
  float _643 = select((UberPostScreenEffectsBasePacked3.x < 9.999999747378752e-06f), max(1.0f, (_ScreenSize.y * 0.0009259259095415473f)), 1.0f);
  int _647 = min(max(int(round(UberPostScreenEffectsBasePacked3.x)), 0), 2);
  float _662 = UberPostScreenEffectsBasePacked13.y * _635;
  int _676 = min(max(int(round(UberPostScreenEffectsBasePacked8.w)), 0), 2);
  float _690 = UberPostScreenEffectsBasePacked13.z * _635;
  float4 _704 = _ScrFxDissolveTex.Sample(sampler_ScrFxDissolveTex, float2((((((_ScrFxDissolveRandomUV.x + _166) + (UberPostScreenEffectsBasePacked10.z * _43)) + UberPostScreenEffectsBasePacked9.z) + (UberPostScreenEffectsBasePacked9.x * (_29[_676]))) + _690), (((((_ScrFxDissolveRandomUV.y + _167) + (UberPostScreenEffectsBasePacked10.w * _43)) + UberPostScreenEffectsBasePacked9.w) + (UberPostScreenEffectsBasePacked9.y * (_30[_676]))) + _690)));
  _34[0] = _704.x;
  _34[1] = _704.y;
  _34[2] = _704.z;
  _34[3] = _704.w;
  float _715 = _34[min((uint)(uint(UberPostScreenEffectsBasePacked10.y)), 3)];
  float4 _716 = _ScrFxMainTex.Sample(sampler_ScrFxMainTex, float2((((((UberPostScreenEffectsBasePacked6.x * _43) + _166) + UberPostScreenEffectsBasePacked2.z) + (((_29[_647]) * _643) * UberPostScreenEffectsBasePacked2.x)) + _662), (((((UberPostScreenEffectsBasePacked6.y * _43) + _167) + UberPostScreenEffectsBasePacked2.w) + (((_30[_647]) * _643) * UberPostScreenEffectsBasePacked2.y)) + _662)));
  float _724 = select((UberPostScreenEffectsBasePacked11.z > 0.5f), _715, 1.0f);
  _33[0] = _716.x;
  _33[1] = _716.y;
  _33[2] = _716.z;
  _33[3] = _716.w;
  bool _735 = (UberPostScreenEffectsBasePacked3.y > 3.5f);
  float _738 = saturate(UberPostScreenEffectsBasePacked3.w * _724);
  float _747 = UberPostScreenEffectsBasePacked5.x - UberPostScreenEffectsBasePacked4.x;
  float _748 = UberPostScreenEffectsBasePacked5.y - UberPostScreenEffectsBasePacked4.y;
  float _749 = UberPostScreenEffectsBasePacked5.z - UberPostScreenEffectsBasePacked4.z;
  float _761 = saturate((_724 * (_33[min((uint)(uint(UberPostScreenEffectsBasePacked3.y)), 3)])) * UberPostScreenEffectsBasePacked3.w);
  float _768 = select(_735, (((_747 * _738) + UberPostScreenEffectsBasePacked4.x) * _716.x), ((_747 * _761) + UberPostScreenEffectsBasePacked4.x));
  float _769 = select(_735, (((_748 * _738) + UberPostScreenEffectsBasePacked4.y) * _716.y), ((_748 * _761) + UberPostScreenEffectsBasePacked4.y));
  float _770 = select(_735, (((_749 * _738) + UberPostScreenEffectsBasePacked4.z) * _716.z), ((_749 * _761) + UberPostScreenEffectsBasePacked4.z));
  _32[0] = _716.x;
  _32[1] = _716.y;
  _32[2] = _716.z;
  _32[3] = _716.w;
  float _779 = _32[min((uint)(uint(UberPostScreenEffectsBasePacked3.z)), 3)];
  float _780 = _779 * _715;
  float4 _796 = _ScrFxMaskTex.Sample(sampler_ScrFxMaskTex, float2(((((UberPostScreenEffectsBasePacked8.x * _43) + _166) + UberPostScreenEffectsBasePacked7.z) + (UberPostScreenEffectsBasePacked7.x * (_29[_576]))), ((((UberPostScreenEffectsBasePacked8.y * _43) + _167) + UberPostScreenEffectsBasePacked7.w) + (UberPostScreenEffectsBasePacked7.y * (_30[_576])))));
  _31[0] = _796.x;
  _31[1] = _796.y;
  _31[2] = _796.z;
  _31[3] = _796.w;
  if (UberPostScreenEffectsBasePacked8.z < 0.5f) {
    _818 = (lerp(UberPostScreenEffectsBasePacked4.w, UberPostScreenEffectsBasePacked5.w, _779));
  } else {
    _818 = select((UberPostScreenEffectsBasePacked13.w > 0.5f), saturate((_780 - UberPostScreenEffectsBasePacked10.x) * UberPostScreenEffectsBasePacked14.x), select((_780 < UberPostScreenEffectsBasePacked10.x), 0.0f, 1.0f));
  }
  float _820 = ((_31[min((uint)(uint(UberPostScreenEffectsBasePacked6.w)), 3)]) * _818) * _99;
  float _824 = select((_820 < UberPostScreenEffectsBasePacked14.y), 0.0f, 1.0f) * _820;
  if (UberPostScreenEffectsBasePacked0.x < 0.5f) {
    _900 = ((_824 * (_768 - _505)) + _505);
    _901 = ((_824 * (_769 - _506)) + _506);
    _902 = ((_824 * (_770 - _507)) + _507);
  } else {
    if (UberPostScreenEffectsBasePacked0.x < 1.5f) {
      _900 = ((_824 * _768) + _505);
      _901 = ((_824 * _769) + _506);
      _902 = ((_824 * _770) + _507);
    } else {
      if (UberPostScreenEffectsBasePacked0.x < 2.5f) {
        _900 = (((_824 * (_768 + -1.0f)) + 1.0f) * _505);
        _901 = (((_824 * (_769 + -1.0f)) + 1.0f) * _506);
        _902 = (((_824 * (_770 + -1.0f)) + 1.0f) * _507);
      } else {
        float _866 = _824 * (_768 + -0.5f);
        float _867 = _824 * (_769 + -0.5f);
        float _868 = _824 * (_770 + -0.5f);
        _900 = select((_505 < 0.5f), ((_505 * 2.0f) * (_866 + 0.5f)), (1.0f - (((1.0f - _505) * 2.0f) * (0.5f - _866))));
        _901 = select((_506 < 0.5f), ((_506 * 2.0f) * (_867 + 0.5f)), (1.0f - (((1.0f - _506) * 2.0f) * (0.5f - _867))));
        _902 = select((_507 < 0.5f), ((_507 * 2.0f) * (_868 + 0.5f)), (1.0f - (((1.0f - _507) * 2.0f) * (0.5f - _868))));
      }
    }
  }
  float _907 = ((_901 + _900) + _902) * 0.3333333432674408f;
  float _914 = ((_900 - _907) * UberPostColorCorrectionPacked0.w) + _907;
  float _915 = ((_901 - _907) * UberPostColorCorrectionPacked0.w) + _907;
  float _916 = ((_902 - _907) * UberPostColorCorrectionPacked0.w) + _907;
  float _931 = (((1.0f - saturate(_914)) - _914) * UberPostColorCorrectionPacked1.w) + _914;
  float _932 = (((1.0f - saturate(_915)) - _915) * UberPostColorCorrectionPacked1.w) + _915;
  float _933 = (((1.0f - saturate(_916)) - _916) * UberPostColorCorrectionPacked1.w) + _916;
  float _941 = saturate((saturate(dot(float3(_931, _932, _933), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) - UberPostColorCorrectionPacked2.y) * UberPostColorCorrectionPacked2.z);
  float _967 = (((UberPostColorCorrectionPacked0.x - _931) + ((UberPostColorCorrectionPacked1.x - UberPostColorCorrectionPacked0.x) * _941)) * UberPostColorCorrectionPacked2.x) + _931;
  float _968 = (((UberPostColorCorrectionPacked0.y - _932) + ((UberPostColorCorrectionPacked1.y - UberPostColorCorrectionPacked0.y) * _941)) * UberPostColorCorrectionPacked2.x) + _932;
  float _969 = (((UberPostColorCorrectionPacked0.z - _933) + ((UberPostColorCorrectionPacked1.z - UberPostColorCorrectionPacked0.z) * _941)) * UberPostColorCorrectionPacked2.x) + _933;

  // HDR FX Mask Blend
  float3 result = float3(_967, _968, _969);
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
  _1042 = result.x;
  _1043 = result.y;
  _1044 = result.z;

  // Original FX Mask
  /*
  if (UberPostColorCorrectionPacked2.w > 0.5f) {
    float4 _973 = _FXMaskForScene.Sample(s_linear_clamp_sampler, float2(TEXCOORD.x, TEXCOORD.y));
    if (UberPostColorCorrectionPacked3.w < 0.5f) {
      _1042 = min((_973.x + _967), 1.0f);
      _1043 = min((_973.x + _968), 1.0f);
      _1044 = min((_973.x + _969), 1.0f);
    } else {
      float _1010 = select((_967 > 0.5f), 0.0f, 1.0f);
      float _1011 = select((_968 > 0.5f), 0.0f, 1.0f);
      float _1012 = select((_969 > 0.5f), 0.0f, 1.0f);
      float _1031 = 1.0f - _973.x;
      _1042 = (((((1.0f - (((1.0f - _967) * 2.0f) * (1.0f - UberPostColorCorrectionPacked3.x))) * saturate(1.0f - _1010)) + (((_967 * 2.0f) * _1010) * UberPostColorCorrectionPacked3.x)) * _973.x) + (_1031 * _967));
      _1043 = (((((1.0f - (((1.0f - _968) * 2.0f) * (1.0f - UberPostColorCorrectionPacked3.y))) * saturate(1.0f - _1011)) + (((_968 * 2.0f) * _1011) * UberPostColorCorrectionPacked3.y)) * _973.x) + (_1031 * _968));
      _1044 = (((((1.0f - (((1.0f - _969) * 2.0f) * (1.0f - UberPostColorCorrectionPacked3.z))) * saturate(1.0f - _1012)) + (((_969 * 2.0f) * _1012) * UberPostColorCorrectionPacked3.z)) * _973.x) + (_1031 * _969));
    }
  } else {
    _1042 = _967;
    _1043 = _968;
    _1044 = _969;
  }
    */
  SV_Target.x = _1042;
  SV_Target.y = _1043;
  SV_Target.z = _1044;
  SV_Target.w = _377;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
