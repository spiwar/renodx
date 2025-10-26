#include "../../shared.h"

// Bloom shader in game world

Texture2D<float4> _InputTex : register(t0);

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
  float4 _UVTransformTarget : packoffset(c165.x);
  float4 _UVTransformSource : packoffset(c166.x);
  float2 _NapGaussScaler : packoffset(c167.x);
};

SamplerState s_linear_clamp_sampler : register(s0);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float4 _21 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max((TEXCOORD.x - (_NapGaussScaler.x * 6.138407230377197f)), TEXCOORD_1.x), TEXCOORD_1.z), min(max((TEXCOORD.y - (_NapGaussScaler.y * 6.138407230377197f)), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _41 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max((TEXCOORD.x - (_NapGaussScaler.x * 4.2199530601501465f)), TEXCOORD_1.x), TEXCOORD_1.z), min(max((TEXCOORD.y - (_NapGaussScaler.y * 4.2199530601501465f)), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _65 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max((TEXCOORD.x - (_NapGaussScaler.x * 2.331080913543701f)), TEXCOORD_1.x), TEXCOORD_1.z), min(max((TEXCOORD.y - (_NapGaussScaler.y * 2.331080913543701f)), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _89 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max((TEXCOORD.x - (_NapGaussScaler.x * 0.46489280462265015f)), TEXCOORD_1.x), TEXCOORD_1.z), min(max((TEXCOORD.y - (_NapGaussScaler.y * 0.46489280462265015f)), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _113 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max(((_NapGaussScaler.x * 1.3960429430007935f) + TEXCOORD.x), TEXCOORD_1.x), TEXCOORD_1.z), min(max(((_NapGaussScaler.y * 1.3960429430007935f) + TEXCOORD.y), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _137 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max(((_NapGaussScaler.x * 3.2719759941101074f) + TEXCOORD.x), TEXCOORD_1.x), TEXCOORD_1.z), min(max(((_NapGaussScaler.y * 3.2719759941101074f) + TEXCOORD.y), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _161 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max(((_NapGaussScaler.x * 5.175481796264648f) + TEXCOORD.x), TEXCOORD_1.x), TEXCOORD_1.z), min(max(((_NapGaussScaler.y * 5.175481796264648f) + TEXCOORD.y), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _185 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max(((_NapGaussScaler.x * 7.0f) + TEXCOORD.x), TEXCOORD_1.x), TEXCOORD_1.z), min(max(((_NapGaussScaler.y * 7.0f) + TEXCOORD.y), TEXCOORD_1.y), TEXCOORD_1.w)));
  SV_Target.x = ((((((((_41.x * 0.028576409444212914f) + (_21.x * 0.0015526290517300367f)) + (_65.x * 0.18022289872169495f)) + (_89.x * 0.3954527974128723f)) + (_113.x * 0.30439770221710205f)) + (_137.x * 0.08195929229259491f)) + (_161.x * 0.007623195182532072f)) + (_185.x * 0.00021489530627150089f));
  SV_Target.y = ((((((((_41.y * 0.028576409444212914f) + (_21.y * 0.0015526290517300367f)) + (_65.y * 0.18022289872169495f)) + (_89.y * 0.3954527974128723f)) + (_113.y * 0.30439770221710205f)) + (_137.y * 0.08195929229259491f)) + (_161.y * 0.007623195182532072f)) + (_185.y * 0.00021489530627150089f));
  SV_Target.z = ((((((((_41.z * 0.028576409444212914f) + (_21.z * 0.0015526290517300367f)) + (_65.z * 0.18022289872169495f)) + (_89.z * 0.3954527974128723f)) + (_113.z * 0.30439770221710205f)) + (_137.z * 0.08195929229259491f)) + (_161.z * 0.007623195182532072f)) + (_185.z * 0.00021489530627150089f));
  SV_Target.w = ((((((((_41.w * 0.028576409444212914f) + (_21.w * 0.0015526290517300367f)) + (_65.w * 0.18022289872169495f)) + (_89.w * 0.3954527974128723f)) + (_113.w * 0.30439770221710205f)) + (_137.w * 0.08195929229259491f)) + (_161.w * 0.007623195182532072f)) + (_185.w * 0.00021489530627150089f));
  
  // Lerp between clamped and unclamped bloom based on slider
  SV_Target.xyz = lerp(saturate(SV_Target.xyz), SV_Target.xyz, injectedData.fxBloomIntensity);
  
  return SV_Target;
}
