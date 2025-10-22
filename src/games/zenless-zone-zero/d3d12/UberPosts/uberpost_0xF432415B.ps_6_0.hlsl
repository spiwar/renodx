#include "../../tonemap.hlsl"

// Ultimate for nicole and various characters 

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
  bool _17 = (_DistortionRgbShift.w > 0.0f);
  float _47;
  float _48;
  float _49;
  float _50;
  float _51;
  float _52;
  float _53;
  float _54;
  float _74;
  float _75;
  float _76;
  float _208;
  float _209;
  float _210;
  float _220;
  float _221;
  float _222;
  float _223;
  float _262;
  float _263;
  float _264;
  float _351;
  float _352;
  float _353;
  if (_17) {
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
  if (_17) {
    float4 _58 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_49 + TEXCOORD.x), (_50 + TEXCOORD.y)));
    float4 _62 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_51 + TEXCOORD.x), (_52 + TEXCOORD.y)));
    float4 _66 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_53 + TEXCOORD.x), (_54 + TEXCOORD.y)));
    _74 = _58.x;
    _75 = _62.y;
    _76 = _66.z;
  } else {
    float4 _69 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_47, _48));
    _74 = _69.x;
    _75 = _69.y;
    _76 = _69.z;
  }
  float4 _77 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_47, _48));
  bool _85 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _85))) {
    float _95 = fmod(((_ScreenSize.y * _48) * _VREffectsScanlineParams.x), 2.0f);
    float _103 = (((select((_95 > 1.0f), (2.0f - _95), _95) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _47;
    float _106 = _ScreenSize.w * _ScreenSize.x;
    float4 _125 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_103, ((select(((frac((((_103 + abs(_VREffectsSliceParams.y)) * _106) - (_VREffectsSliceParams.y * _48)) / ((_106 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _48)));
    float _162 = ((((-0.699999988079071f - _125.x) + (exp2(log2(abs(_125.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_125.x < 0.30000001192092896f), 0.0f, 1.0f)) + _125.x) * UberPostBasePacked3.x;
    float _163 = ((((-0.699999988079071f - _125.y) + (exp2(log2(abs(_125.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_125.y < 0.30000001192092896f), 0.0f, 1.0f)) + _125.y) * UberPostBasePacked3.x;
    float _164 = ((((-0.699999988079071f - _125.z) + (exp2(log2(abs(_125.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_125.z < 0.30000001192092896f), 0.0f, 1.0f)) + _125.z) * UberPostBasePacked3.x;
    float _165 = dot(float3(_74, _75, _76), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _168 = (UberPostBasePacked4.x > 0.5f);
    float _181 = select(_168, ((((_162 * _165) - _162) * _77.w) + _162), _162);
    float _182 = select(_168, ((((_163 * _165) - _163) * _77.w) + _163), _163);
    float _183 = select(_168, ((((_164 * _165) - _164) * _77.w) + _164), _164);
    do {
      if (_85) {
        float4 _194 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _47) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _48) + _DirtTexTillingOffset.w)));
        _208 = (((_194.x * _162) * UberPostBasePacked3.y) + _181);
        _209 = (((_194.y * _163) * UberPostBasePacked3.y) + _182);
        _210 = (((_194.z * _164) * UberPostBasePacked3.y) + _183);
      } else {
        _208 = _181;
        _209 = _182;
        _210 = _183;
      }
      _220 = (_208 + _74);
      _221 = (_209 + _75);
      _222 = (_210 + _76);
      _223 = saturate((((_209 + _208) + _210) * 0.33329999446868896f) + _77.w);
    } while (false);
  } else {
    _220 = _74;
    _221 = _75;
    _222 = _76;
    _223 = _77.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _240 = abs(_48 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _242 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_47 - _Vignette_Params2.x);
    float _248 = exp2(log2(saturate(1.0f - dot(float2(_242, _240), float2(_242, _240)))) * _Vignette_Params2.w);
    _262 = (((_248 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _220);
    _263 = (((_248 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _221);
    _264 = (((_248 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _222);
  } else {
    _262 = _220;
    _263 = _221;
    _264 = _222;
  }
  float3 untonemapped = (float3(_262, _263, _264));
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _313 = tonemapped.x;
  float _314 = tonemapped.y;
  float _315 = tonemapped.z;
  /*
  float _287 = saturate((log2((_264 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _288 = floor(_287);
  float _294 = ((saturate((log2((_263 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _296 = (_288 * _Lut_Params.y) + (((saturate((log2((_262 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _297 = _287 - _288;
  float4 _299 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_296 + _Lut_Params.y), _294), 0.0f);
  float4 _303 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_296, _294), 0.0f);
  float _313 = ((_299.x - _303.x) * _297) + _303.x;
  float _314 = ((_299.y - _303.y) * _297) + _303.y;
  float _315 = ((_299.z - _303.z) * _297) + _303.z;*/
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _330 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _333 = (_330.w + -0.5f) * 2.0f;
    float _337 = 1.0f - (sqrt(dot(float3(_313, _314, _315), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _351 = ((((UberPostBasePacked1.x * _313) * _333) * _337) + _313);
    _352 = ((((UberPostBasePacked1.x * _314) * _333) * _337) + _314);
    _353 = ((((UberPostBasePacked1.x * _315) * _333) * _337) + _315);
  } else {
    _351 = _313;
    _352 = _314;
    _353 = _315;
  }
  SV_Target.x = _351;
  SV_Target.y = _352;
  SV_Target.z = _353;
  SV_Target.w = _223;
  SV_Target = renodx::draw::RenderIntermediatePass(SV_Target);
  return SV_Target;
}
