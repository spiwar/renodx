#include "../../shared.h"

Texture2D<float4> _SceneUserLut : register(t0);

Texture2D<float4> _InputTex : register(t1);

Texture2D<float4> _Bloom_Texture : register(t2);

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
  float4 _SceneUserLut_Params : packoffset(c165.x);
  float _SceneLutContribution : packoffset(c166.x);
  float4 _ExposureParams : packoffset(c167.x);
  float4 _Levels : packoffset(c168.x);
  float4 _BloomParams : packoffset(c169.x);
  float4 _BloomBicubicParams : packoffset(c170.x);
  float4 _BloomThreshold : packoffset(c171.x);
  float4 _InputTexture_TexelSize : packoffset(c172.x);
};

SamplerState s_linear_clamp_sampler : register(s0);

SamplerState s_point_clamp_sampler : register(s1);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float4 _9 = _Bloom_Texture.Sample(s_linear_clamp_sampler, float2(TEXCOORD.x, TEXCOORD.y));
  float4 _13 = _InputTex.Sample(s_point_clamp_sampler, float2(TEXCOORD.x, TEXCOORD.y));
  float _18 = _13.x + _9.x;
  float _19 = _13.y + _9.y;
  float _20 = _13.z + _9.z;
  float _136;
  float _137;
  float _138;
  if (_SceneLutContribution > 0.5f) {
    float _29 = _ExposureParams.y * _SceneUserLut_Params.w;

    float3 input = float3(_18, _19, _20);
    input = input.xyz * _29;

    renodx::lut::Config lut_config = renodx::lut::config::Create(
        s_linear_clamp_sampler,
        1.f,
        0.f,
        renodx::lut::config::type::ARRI_C1000_NO_CUT,
        renodx::lut::config::type::LINEAR);

    float3 sampled = renodx::lut::Sample(_SceneUserLut, lut_config, input);

    float3 upgraded = renodx::tonemap::UpgradeToneMap(input, saturate(input), sampled, 1.f);
    float _80 = upgraded.x;
    float _81 = upgraded.y;
    float _82 = upgraded.z;

    /*float _54 = _SceneUserLut_Params.z * saturate((log2(((_20 * 5.555555820465088f) * _29) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f);
    float _55 = floor(_54);
    float _61 = ((_SceneUserLut_Params.z * saturate((log2(((_19 * 5.555555820465088f) * _29) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f)) + 0.5f) * _SceneUserLut_Params.y;
    float _63 = (((_SceneUserLut_Params.z * saturate((log2(((_18 * 5.555555820465088f) * _29) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f)) + 0.5f) * _SceneUserLut_Params.x) + (_55 * _SceneUserLut_Params.y);
    float _64 = _54 - _55;
    float4 _66 = _SceneUserLut.SampleLevel(s_linear_clamp_sampler, float2((_63 + _SceneUserLut_Params.y), _61), 0.0f);
    float4 _70 = _SceneUserLut.SampleLevel(s_linear_clamp_sampler, float2(_63, _61), 0.0f);
    float _80 = ((_66.x - _70.x) * _64) + _70.x;
    float _81 = ((_66.y - _70.y) * _64) + _70.y;
    float _82 = ((_66.z - _70.z) * _64) + _70.z;*/

    /*float _97 = (((1.0f - saturate(_80)) - _80) * (_FXCC_LutToneParams[2].z)) + _80;
    float _98 = (((1.0f - saturate(_81)) - _81) * (_FXCC_LutToneParams[2].z)) + _81;
    float _99 = (((1.0f - saturate(_82)) - _82) * (_FXCC_LutToneParams[2].z)) + _82;*/
    float _97 = (((1.0f - (_80)) - _80) * (_FXCC_LutToneParams[2].z)) + _80;
    float _98 = (((1.0f - (_81)) - _81) * (_FXCC_LutToneParams[2].z)) + _81;
    float _99 = (((1.0f - (_82)) - _82) * (_FXCC_LutToneParams[2].z)) + _82;
    float _108 = saturate((saturate(dot(float3(_97, _98, _99), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) - (_FXCC_LutToneParams[0].z)) * (_FXCC_LutToneParams[1].z));
    _136 = (((_FXCC_LutToneParams[3].z) * (((_FXCC_LutToneParams[0].x) - _97) + (((_FXCC_LutToneParams[0].y) - (_FXCC_LutToneParams[0].x)) * _108))) + _97);
    _137 = (((((_FXCC_LutToneParams[1].x) - _98) + (((_FXCC_LutToneParams[1].y) - (_FXCC_LutToneParams[1].x)) * _108)) * (_FXCC_LutToneParams[3].z)) + _98);
    _138 = (((((_FXCC_LutToneParams[2].x) - _99) + (((_FXCC_LutToneParams[2].y) - (_FXCC_LutToneParams[2].x)) * _108)) * (_FXCC_LutToneParams[3].z)) + _99);
  } else {
    _136 = _18;
    _137 = _19;
    _138 = _20;
  }
  SV_Target.x = _136;
  SV_Target.y = _137;
  SV_Target.z = _138;
  SV_Target.w = saturate(_13.w + (((_9.x + _9.y) + _9.z) * 0.33329999446868896f));
  return SV_Target;
}
