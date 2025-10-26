#include "../../shared.h"

// Bloom shader in character menu 

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
  float4 _29 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max((TEXCOORD.x - (_NapGaussScaler.x * 4.095284938812256f)), TEXCOORD_1.x), TEXCOORD_1.z), min(max((TEXCOORD.y - (_NapGaussScaler.y * 4.095284938812256f)), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _38 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max((TEXCOORD.x - (_NapGaussScaler.x * 2.222628116607666f)), TEXCOORD_1.x), TEXCOORD_1.z), min(max((TEXCOORD.y - (_NapGaussScaler.y * 2.222628116607666f)), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _70 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max((TEXCOORD.x - (_NapGaussScaler.x * 0.4378030002117157f)), TEXCOORD_1.x), TEXCOORD_1.z), min(max((TEXCOORD.y - (_NapGaussScaler.y * 0.4378030002117157f)), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _83 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max(((_NapGaussScaler.x * 1.3207670450210571f) + TEXCOORD.x), TEXCOORD_1.x), TEXCOORD_1.z), min(max(((_NapGaussScaler.y * 1.3207670450210571f) + TEXCOORD.y), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _115 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max(((_NapGaussScaler.x * 3.1479740142822266f) + TEXCOORD.x), TEXCOORD_1.x), TEXCOORD_1.z), min(max(((_NapGaussScaler.y * 3.1479740142822266f) + TEXCOORD.y), TEXCOORD_1.y), TEXCOORD_1.w)));
  float4 _128 = _InputTex.Sample(s_linear_clamp_sampler, float2(min(max(((_NapGaussScaler.x * 5.0f) + TEXCOORD.x), TEXCOORD_1.x), TEXCOORD_1.z), min(max(((_NapGaussScaler.y * 5.0f) + TEXCOORD.y), TEXCOORD_1.y), TEXCOORD_1.w)));
  SV_Target.x = ((((((_38.x * 0.1334843933582306f) + (_29.x * 0.0057046618312597275f)) + (_70.x * 0.5018919706344604f)) + (_83.x * 0.32349690794944763f)) + (_115.x * 0.03487847000360489f)) + (_128.x * 0.0005435675266198814f));
  SV_Target.y = ((((((_38.y * 0.1334843933582306f) + (_29.y * 0.0057046618312597275f)) + (_70.y * 0.5018919706344604f)) + (_83.y * 0.32349690794944763f)) + (_115.y * 0.03487847000360489f)) + (_128.y * 0.0005435675266198814f));
  SV_Target.z = ((((((_38.z * 0.1334843933582306f) + (_29.z * 0.0057046618312597275f)) + (_70.z * 0.5018919706344604f)) + (_83.z * 0.32349690794944763f)) + (_115.z * 0.03487847000360489f)) + (_128.z * 0.0005435675266198814f));
  SV_Target.w = ((((((_38.w * 0.1334843933582306f) + (_29.w * 0.0057046618312597275f)) + (_70.w * 0.5018919706344604f)) + (_83.w * 0.32349690794944763f)) + (_115.w * 0.03487847000360489f)) + (_128.w * 0.0005435675266198814f));

  // Lerp between clamped and unclamped bloom based on slider
  SV_Target.xyz = lerp(saturate(SV_Target.xyz), SV_Target.xyz, injectedData.fxBloomIntensity);

  return SV_Target;
}
