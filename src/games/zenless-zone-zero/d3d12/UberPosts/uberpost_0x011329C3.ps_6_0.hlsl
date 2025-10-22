#include "../../tonemap.hlsl"

Texture2D<float4> _CameraDepthTexture : register(t0);

Texture2D<float4> _BlitTex : register(t1);

Texture2D<float4> _Grain_Texture : register(t2);

Texture2D<float4> _InternalLut : register(t3);

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
  float _28[3];
  float _29[3];
  float _30[4];
  float _31[4];
  float _32[4];
  float _33[4];
  float _34[4];
  float4 _42 = _CameraDepthTexture.Load(int3((uint)(uint(_ScreenSize.x * TEXCOORD.x)), (uint)(uint(_ScreenSize.y * TEXCOORD.y)), 0));
  float _66 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _68 = -0.0f - ((TEXCOORD.y * 2.0f) + -1.0f);
  float _84 = mad((_InvViewProjMatrix[2].w), _42.x, mad((_InvViewProjMatrix[1].w), _68, ((_InvViewProjMatrix[0].w) * _66))) + (_InvViewProjMatrix[3].w);
  float _85 = (mad((_InvViewProjMatrix[2].x), _42.x, mad((_InvViewProjMatrix[1].x), _68, ((_InvViewProjMatrix[0].x) * _66))) + (_InvViewProjMatrix[3].x)) / _84;
  float _86 = (mad((_InvViewProjMatrix[2].y), _42.x, mad((_InvViewProjMatrix[1].y), _68, ((_InvViewProjMatrix[0].y) * _66))) + (_InvViewProjMatrix[3].y)) / _84;
  float _87 = (mad((_InvViewProjMatrix[2].z), _42.x, mad((_InvViewProjMatrix[1].z), _68, ((_InvViewProjMatrix[0].z) * _66))) + (_InvViewProjMatrix[3].z)) / _84;
  float _88 = ddy_coarse(_85);
  float _89 = ddy_coarse(_86);
  float _90 = ddy_coarse(_87);
  float _91 = ddx_coarse(_85);
  float _92 = ddx_coarse(_86);
  float _93 = ddx_coarse(_87);
  float _96 = (_92 * _90) - (_93 * _89);
  float _99 = (_93 * _88) - (_91 * _90);
  float _102 = (_91 * _89) - (_92 * _88);
  float _104 = rsqrt(dot(float3(_96, _99, _102), float3(_96, _99, _102)));
  float _119 = saturate((_SceneWeatherSandstormParams01.z * (1.0f / ((_ZBufferParams.z * _42.x) + _ZBufferParams.w))) - _SceneWeatherSandstormParams01.y);
  float _133 = _SceneWeatherSandstormParams01.w * _86;
  float _139 = max(abs(_96 * _104), 9.999999747378752e-06f);
  float _140 = max(abs(_99 * _104), 9.999999747378752e-06f);
  float _141 = max(abs(_104 * _102), 9.999999747378752e-06f);
  float _143 = rsqrt(dot(float3(_139, _140, _141), float3(_139, _140, _141)));
  float _148 = _143 * ((_140 + _139) + _141);
  float _156 = _SceneWeatherSandstormParams02.x * (_GlobalTimeParamsA[1].x);
  float _157 = _SceneWeatherSandstormParams02.y * (_GlobalTimeParamsA[1].x);
  float _162 = (_133 * _SceneWeatherSandstormParams02.z) + _156;
  float _163 = ((_SceneWeatherSandstormParams01.w * _87) * _SceneWeatherSandstormParams02.w) + _157;
  float _164 = dot(float2(_162, _163), float2(0.3660254180431366f, 0.3660254180431366f));
  float _167 = floor(_162 + _164);
  float _168 = floor(_163 + _164);
  float _171 = dot(float2(_167, _168), float2(0.21132487058639526f, 0.21132487058639526f));
  float _172 = (_162 - _167) + _171;
  float _173 = (_163 - _168) + _171;
  bool _174 = (_172 > _173);
  float _175 = select(_174, 1.0f, 0.0f);
  float _176 = select(_174, 0.0f, 1.0f);
  float _179 = _172 + -0.5773502588272095f;
  float _180 = _173 + -0.5773502588272095f;
  float _181 = (_172 + 0.21132487058639526f) - _175;
  float _182 = (_173 + 0.21132487058639526f) - _176;
  float _189 = _167 - (floor(_167 * 0.0034602077212184668f) * 289.0f);
  float _190 = _168 - (floor(_168 * 0.0034602077212184668f) * 289.0f);
  float _191 = _190 + _176;
  float _192 = _190 + 1.0f;
  float _199 = ((_190 * 34.0f) + 1.0f) * _190;
  float _200 = ((_191 * 34.0f) + 1.0f) * _191;
  float _201 = ((_192 * 34.0f) + 1.0f) * _192;
  float _212 = (_199 - (floor(_199 * 0.0034602077212184668f) * 289.0f)) + _189;
  float _215 = ((_175 + _189) - (floor(_200 * 0.0034602077212184668f) * 289.0f)) + _200;
  float _218 = ((_189 + 1.0f) - (floor(_201 * 0.0034602077212184668f) * 289.0f)) + _201;
  float _225 = ((_212 * 34.0f) + 1.0f) * _212;
  float _226 = ((_215 * 34.0f) + 1.0f) * _215;
  float _227 = ((_218 * 34.0f) + 1.0f) * _218;
  float _246 = max((0.5f - dot(float2(_172, _173), float2(_172, _173))), 0.0f);
  float _247 = max((0.5f - dot(float2(_181, _182), float2(_181, _182))), 0.0f);
  float _248 = max((0.5f - dot(float2(_179, _180), float2(_179, _180))), 0.0f);
  float _249 = _246 * _246;
  float _250 = _247 * _247;
  float _251 = _248 * _248;
  float _261 = frac((_225 - (floor(_225 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _262 = frac((_226 - (floor(_226 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _263 = frac((_227 - (floor(_227 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _264 = _261 + -1.0f;
  float _265 = _262 + -1.0f;
  float _266 = _263 + -1.0f;
  float _270 = abs(_264) + -0.5f;
  float _271 = abs(_265) + -0.5f;
  float _272 = abs(_266) + -0.5f;
  float _279 = _264 - floor(_261 + -0.5f);
  float _280 = _265 - floor(_262 + -0.5f);
  float _281 = _266 - floor(_263 + -0.5f);
  float _315 = ((_SceneWeatherSandstormParams01.w * _85) * _SceneWeatherSandstormParams04.x) + _156;
  float _316 = (_133 * _SceneWeatherSandstormParams04.y) + _157;
  float _317 = dot(float2(_315, _316), float2(0.3660254180431366f, 0.3660254180431366f));
  float _320 = floor(_315 + _317);
  float _321 = floor(_316 + _317);
  float _324 = dot(float2(_320, _321), float2(0.21132487058639526f, 0.21132487058639526f));
  float _325 = (_315 - _320) + _324;
  float _326 = (_316 - _321) + _324;
  bool _327 = (_325 > _326);
  float _328 = select(_327, 1.0f, 0.0f);
  float _329 = select(_327, 0.0f, 1.0f);
  float _332 = _325 + -0.5773502588272095f;
  float _333 = _326 + -0.5773502588272095f;
  float _334 = (_325 + 0.21132487058639526f) - _328;
  float _335 = (_326 + 0.21132487058639526f) - _329;
  float _342 = _320 - (floor(_320 * 0.0034602077212184668f) * 289.0f);
  float _343 = _321 - (floor(_321 * 0.0034602077212184668f) * 289.0f);
  float _344 = _343 + _329;
  float _345 = _343 + 1.0f;
  float _352 = ((_343 * 34.0f) + 1.0f) * _343;
  float _353 = ((_344 * 34.0f) + 1.0f) * _344;
  float _354 = ((_345 * 34.0f) + 1.0f) * _345;
  float _365 = (_352 - (floor(_352 * 0.0034602077212184668f) * 289.0f)) + _342;
  float _368 = ((_328 + _342) - (floor(_353 * 0.0034602077212184668f) * 289.0f)) + _353;
  float _371 = ((_342 + 1.0f) - (floor(_354 * 0.0034602077212184668f) * 289.0f)) + _354;
  float _378 = ((_365 * 34.0f) + 1.0f) * _365;
  float _379 = ((_368 * 34.0f) + 1.0f) * _368;
  float _380 = ((_371 * 34.0f) + 1.0f) * _371;
  float _399 = max((0.5f - dot(float2(_325, _326), float2(_325, _326))), 0.0f);
  float _400 = max((0.5f - dot(float2(_334, _335), float2(_334, _335))), 0.0f);
  float _401 = max((0.5f - dot(float2(_332, _333), float2(_332, _333))), 0.0f);
  float _402 = _399 * _399;
  float _403 = _400 * _400;
  float _404 = _401 * _401;
  float _414 = frac((_378 - (floor(_378 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _415 = frac((_379 - (floor(_379 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _416 = frac((_380 - (floor(_380 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _417 = _414 + -1.0f;
  float _418 = _415 + -1.0f;
  float _419 = _416 + -1.0f;
  float _423 = abs(_417) + -0.5f;
  float _424 = abs(_418) + -0.5f;
  float _425 = abs(_419) + -0.5f;
  float _432 = _417 - floor(_414 + -0.5f);
  float _433 = _418 - floor(_415 + -0.5f);
  float _434 = _419 - floor(_416 + -0.5f);
  float _471 = ((((_119 * _119) * 130.0f) * exp2(log2(1.0f - saturate(abs(_86 - _SceneWeatherSandstormParams03.y) / _SceneWeatherSandstormParams03.x)) * _SceneWeatherSandstormParams03.z)) * _SceneWeatherSandstormParams01.x) * ((dot(float3(((_402 * _402) * (1.7928428649902344f - (((_432 * _432) + (_423 * _423)) * 0.8537347316741943f))), ((_403 * _403) * (1.7928428649902344f - (((_433 * _433) + (_424 * _424)) * 0.8537347316741943f))), ((_404 * _404) * (1.7928428649902344f - (((_434 * _434) + (_425 * _425)) * 0.8537347316741943f)))), float3(((_432 * _325) + (_423 * _326)), ((_433 * _334) + (_424 * _335)), ((_434 * _332) + (_425 * _333)))) * ((_143 * _141) / _148)) + (dot(float3(((_249 * _249) * (1.7928428649902344f - (((_279 * _279) + (_270 * _270)) * 0.8537347316741943f))), ((_250 * _250) * (1.7928428649902344f - (((_280 * _280) + (_271 * _271)) * 0.8537347316741943f))), ((_251 * _251) * (1.7928428649902344f - (((_281 * _281) + (_272 * _272)) * 0.8537347316741943f)))), float3(((_279 * _172) + (_270 * _173)), ((_280 * _181) + (_271 * _182)), ((_281 * _179) + (_272 * _180)))) * ((_143 * _139) / _148)));
  float4 _481 = _CameraDepthTexture.Load(int3((uint)(uint((_471 + TEXCOORD.x) * _ScreenSize.x)), (uint)(uint((_471 + TEXCOORD.y) * _ScreenSize.y)), 0));
  float _489 = saturate((_SceneWeatherSandstormParams01.z * (1.0f / ((_481.x * _ZBufferParams.z) + _ZBufferParams.w))) - _SceneWeatherSandstormParams01.y) * _471;
  float _490 = _489 + TEXCOORD.x;
  float _491 = _489 + TEXCOORD.y;
  float _499 = select((UberPostScreenEffectsBasePacked16.w > 0.5f), (_GlobalTimeParamsA[1].x), (_GlobalTimeParamsB[0].y));
  float _500 = _490 * 2.0f;
  float _501 = _491 * 2.0f;
  float _502 = _500 + -1.0f;
  float _503 = _501 + -1.0f;
  float _513 = _ScaledScreenParams.z + -1.0f;
  float _515 = (_513 * _ScaledScreenParams.y) + -1.0f;
  float _517 = (_515 * UberPostScreenEffectsBasePacked1.x) + 1.0f;
  float _518 = _517 * _503;
  float _519 = _502 * _502;
  float _530 = select((UberPostScreenEffectsBasePacked0.z < 0.5f), min((1.0f - abs(_502)), (_517 * (1.0f - abs(_503)))), (1.0f - (sqrt((_518 * _518) + _519) * 0.7070000171661377f)));
  float _540 = saturate((_530 - UberPostScreenEffectsBasePacked0.w) / (((1.0f - UberPostScreenEffectsBasePacked1.y) * UberPostScreenEffectsBasePacked0.w) - UberPostScreenEffectsBasePacked0.w));
  float _546 = select((UberPostScreenEffectsBasePacked1.y > 9.999999747378752e-05f), ((_540 * _540) * (3.0f - (_540 * 2.0f))), select((UberPostScreenEffectsBasePacked0.w < _530), 0.0f, 1.0f));
  float _552 = select((UberPostScreenEffectsBasePacked1.w > 0.5f), (1.0f - _546), _546) * UberPostScreenEffectsBasePacked1.z;
  float _555 = select((UberPostScreenEffectsBasePacked0.w > 9.999999747378752e-05f), _552, 0.0f) * _552;
  float _622;
  float _623;
  float _657;
  float _658;
  float _659;
  float _660;
  float _661;
  float _662;
  float _663;
  float _664;
  float _847;
  float _848;
  float _849;
  float _859;
  float _860;
  float _861;
  float _862;
  float _901;
  float _902;
  float _903;
  float _990;
  float _991;
  float _992;
  float _1310;
  float _1392;
  float _1393;
  float _1394;
  if (UberPostScreenEffectsBasePacked14.z > 0.5f) {
    float _563 = ((_515 * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _503;
    float _565 = atan(_563 / _502);
    bool _568 = (_502 < 0.0f);
    bool _569 = (_502 == 0.0f);
    bool _570 = (_563 >= 0.0f);
    bool _571 = (_563 < 0.0f);
    bool _595 = (UberPostScreenEffectsBasePacked14.w > 0.5f);
    float4 _609 = _ScrFxScrDistTex.Sample(sampler_ScrFxScrDistTex, float2(((UberPostScreenEffectsBasePacked15.z + (UberPostScreenEffectsBasePacked16.y * _499)) + (select(_595, select((_569 && _570), 2.0f, select((_569 && _571), -2.0f, (select((_568 && _571), (_565 + -3.1415927410125732f), select((_568 && _570), (_565 + 3.1415927410125732f), _565)) * 1.2732394933700562f))), _490) * UberPostScreenEffectsBasePacked15.x)), ((UberPostScreenEffectsBasePacked15.w + (UberPostScreenEffectsBasePacked16.z * _499)) + (select(_595, (sqrt((_563 * _563) + _519) * 0.6366197466850281f), (((_ScaledScreenParams.y * (_491 + -0.5f)) * _513) + 0.5f)) * UberPostScreenEffectsBasePacked15.y))));
    float _618 = (_555 * 0.10000000149011612f) * UberPostScreenEffectsBasePacked16.x;
    _622 = (_618 * ((_609.x * 2.0f) + -1.0f));
    _623 = (_618 * ((_609.y * 2.0f) + -1.0f));
  } else {
    _622 = 0.0f;
    _623 = 0.0f;
  }
  if (_DistortionRgbShift.w > 0.0f) {
    float4 _628 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(_490, _491));
    float _634 = (_628.x * 0.10000000149011612f) + _622;
    float _635 = (_628.y * 0.10000000149011612f) + _623;
    float _638 = _DistortionRgbShift.w * _628.z;
    float _639 = _638 * _634;
    float _640 = _638 * _635;
    _657 = (_634 + TEXCOORD.x);
    _658 = (_635 + TEXCOORD.y);
    _659 = ((_639 * _DistortionRgbShift.x) + _634);
    _660 = ((_640 * _DistortionRgbShift.x) + _635);
    _661 = ((_639 * _DistortionRgbShift.y) + _634);
    _662 = ((_640 * _DistortionRgbShift.y) + _635);
    _663 = ((_639 * _DistortionRgbShift.z) + _634);
    _664 = ((_640 * _DistortionRgbShift.z) + _635);
  } else {
    _657 = TEXCOORD.x;
    _658 = TEXCOORD.y;
    _659 = 0.0f;
    _660 = 0.0f;
    _661 = 0.0f;
    _662 = 0.0f;
    _663 = 0.0f;
    _664 = 0.0f;
  }
  float _669 = (_500 - _ChromaCenter.x) + -0.5f;
  float _671 = (_501 - _ChromaCenter.y) + -0.5f;
  float _675 = dot(float2(_669, _671), float2(_669, _671)) * -0.3333333432674408f;
  float _677 = (_675 * _669) * UberPostBasePacked0.z;
  float _679 = (_675 * _671) * UberPostBasePacked0.z;
  float _681 = rsqrt(dot(float3(_677, _679, 9.999999747378752e-05f), float3(_677, _679, 9.999999747378752e-05f)));
  float _688 = UberPostBasePacked0.z * 0.9428090453147888f;
  float _693 = exp2(log2(sqrt((_677 * _677) + (_679 * _679)) / _688) * _ChromaCenter.z);
  float _695 = ((_677 * _681) * _688) * _693;
  float _697 = ((_679 * _681) * _688) * _693;
  float4 _700 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_659 + _490), (_660 + _491)));
  float4 _706 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_661 + _490) + _695), ((_662 + _491) + _697)));
  float4 _714 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_663 + _490) + (_695 * 2.0f)), ((_664 + _491) + (_697 * 2.0f))));
  float4 _716 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_657, _658));
  bool _724 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _724))) {
    float _734 = fmod(((_ScreenSize.y * _658) * _VREffectsScanlineParams.x), 2.0f);
    float _742 = (((select((_734 > 1.0f), (2.0f - _734), _734) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _657;
    float _745 = _ScreenSize.w * _ScreenSize.x;
    float4 _764 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_742, ((select(((frac((((_742 + abs(_VREffectsSliceParams.y)) * _745) - (_VREffectsSliceParams.y * _658)) / ((_745 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _658)));
    float _801 = ((((-0.699999988079071f - _764.x) + (exp2(log2(abs(_764.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_764.x < 0.30000001192092896f), 0.0f, 1.0f)) + _764.x) * UberPostBasePacked3.x;
    float _802 = ((((-0.699999988079071f - _764.y) + (exp2(log2(abs(_764.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_764.y < 0.30000001192092896f), 0.0f, 1.0f)) + _764.y) * UberPostBasePacked3.x;
    float _803 = ((((-0.699999988079071f - _764.z) + (exp2(log2(abs(_764.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_764.z < 0.30000001192092896f), 0.0f, 1.0f)) + _764.z) * UberPostBasePacked3.x;
    float _804 = dot(float3(_700.x, _706.y, _714.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _807 = (UberPostBasePacked4.x > 0.5f);
    float _820 = select(_807, ((((_801 * _804) - _801) * _716.w) + _801), _801);
    float _821 = select(_807, ((((_802 * _804) - _802) * _716.w) + _802), _802);
    float _822 = select(_807, ((((_803 * _804) - _803) * _716.w) + _803), _803);
    do {
      if (_724) {
        float4 _833 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _657) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _658) + _DirtTexTillingOffset.w)));
        _847 = (((_833.x * _801) * UberPostBasePacked3.y) + _820);
        _848 = (((_833.y * _802) * UberPostBasePacked3.y) + _821);
        _849 = (((_833.z * _803) * UberPostBasePacked3.y) + _822);
      } else {
        _847 = _820;
        _848 = _821;
        _849 = _822;
      }
      _859 = (_847 + _700.x);
      _860 = (_848 + _706.y);
      _861 = (_849 + _714.z);
      _862 = saturate((((_848 + _847) + _849) * 0.33329999446868896f) + _716.w);
    } while (false);
  } else {
    _859 = _700.x;
    _860 = _706.y;
    _861 = _714.z;
    _862 = _716.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _879 = abs(_658 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _881 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_657 - _Vignette_Params2.x);
    float _887 = exp2(log2(saturate(1.0f - dot(float2(_881, _879), float2(_881, _879)))) * _Vignette_Params2.w);
    _901 = (((_887 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _859);
    _902 = (((_887 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _860);
    _903 = (((_887 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _861);
  } else {
    _901 = _859;
    _902 = _860;
    _903 = _861;
  }
  float3 untonemapped = (float3(_901, _902, _903));
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _952 = tonemapped.x;
  float _953 = tonemapped.y;
  float _954 = tonemapped.z;
  /*
  float _926 = saturate((log2((_903 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _927 = floor(_926);
  float _933 = ((saturate((log2((_902 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _935 = (_927 * _Lut_Params.y) + (((saturate((log2((_901 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _936 = _926 - _927;
  float4 _938 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_935 + _Lut_Params.y), _933), 0.0f);
  float4 _942 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_935, _933), 0.0f);
  float _952 = ((_938.x - _942.x) * _936) + _942.x;
  float _953 = ((_938.y - _942.y) * _936) + _942.y;
  float _954 = ((_938.z - _942.z) * _936) + _942.z;*/
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _969 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * _490) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * _491) + _Grain_TilingParams.w)));
    float _972 = (_969.w + -0.5f) * 2.0f;
    float _976 = 1.0f - (sqrt(dot(float3(_952, _953, _954), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _990 = ((((UberPostBasePacked1.x * _952) * _972) * _976) + _952);
    _991 = ((((UberPostBasePacked1.x * _953) * _972) * _976) + _953);
    _992 = ((((UberPostBasePacked1.x * _954) * _972) * _976) + _954);
  } else {
    _990 = _952;
    _991 = _953;
    _992 = _954;
  }
  float _1003 = (((((_ScaledScreenParams.z + -1.0f) * _ScaledScreenParams.y) + -1.0f) * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _503;
  float _1005 = atan(_1003 / _502);
  bool _1008 = (_502 < 0.0f);
  bool _1009 = (_502 == 0.0f);
  bool _1010 = (_1003 >= 0.0f);
  bool _1011 = (_1003 < 0.0f);
  _28[0] = (((_ScreenSize.x * (_490 + -0.5f)) * _ScreenSize.w) + 0.5f);
  _29[0] = _491;
  _28[1] = select((_1009 && _1010), 2.0f, select((_1009 && _1011), -2.0f, (select((_1008 && _1011), (_1005 + -3.1415927410125732f), select((_1008 && _1010), (_1005 + 3.1415927410125732f), _1005)) * 1.2732394933700562f)));
  _29[1] = (sqrt((_1003 * _1003) + (_502 * _502)) * 0.5f);
  _28[2] = _490;
  _29[2] = _491;
  int _1068 = min(max(int(round(UberPostScreenEffectsBasePacked6.z)), 0), 2);
  int _1091 = min(max(int(round(UberPostScreenEffectsBasePacked11.w)), 0), 2);
  float4 _1114 = _ScrFxDistortionTex.Sample(sampler_ScrFxDistortionTex, float2(((((_ScrFxDistortionRandomUV.x + _622) + (UberPostScreenEffectsBasePacked11.x * _499)) + UberPostScreenEffectsBasePacked12.z) + (UberPostScreenEffectsBasePacked12.x * (_28[_1091]))), ((((_ScrFxDistortionRandomUV.y + _623) + (UberPostScreenEffectsBasePacked11.y * _499)) + UberPostScreenEffectsBasePacked12.w) + (UberPostScreenEffectsBasePacked12.y * (_29[_1091])))));
  _34[0] = _1114.x;
  _34[1] = _1114.y;
  _34[2] = _1114.z;
  _34[3] = _1114.w;
  float _1127 = ((_34[min((uint)(uint(UberPostScreenEffectsBasePacked13.x)), 3)]) + -0.49803921580314636f) * 2.0f;
  float _1135 = select((UberPostScreenEffectsBasePacked3.x < 9.999999747378752e-06f), max(1.0f, (_ScreenSize.y * 0.0009259259095415473f)), 1.0f);
  int _1139 = min(max(int(round(UberPostScreenEffectsBasePacked3.x)), 0), 2);
  float _1154 = UberPostScreenEffectsBasePacked13.y * _1127;
  int _1168 = min(max(int(round(UberPostScreenEffectsBasePacked8.w)), 0), 2);
  float _1182 = UberPostScreenEffectsBasePacked13.z * _1127;
  float4 _1196 = _ScrFxDissolveTex.Sample(sampler_ScrFxDissolveTex, float2((((((_ScrFxDissolveRandomUV.x + _622) + (UberPostScreenEffectsBasePacked10.z * _499)) + UberPostScreenEffectsBasePacked9.z) + (UberPostScreenEffectsBasePacked9.x * (_28[_1168]))) + _1182), (((((_ScrFxDissolveRandomUV.y + _623) + (UberPostScreenEffectsBasePacked10.w * _499)) + UberPostScreenEffectsBasePacked9.w) + (UberPostScreenEffectsBasePacked9.y * (_29[_1168]))) + _1182)));
  _33[0] = _1196.x;
  _33[1] = _1196.y;
  _33[2] = _1196.z;
  _33[3] = _1196.w;
  float _1207 = _33[min((uint)(uint(UberPostScreenEffectsBasePacked10.y)), 3)];
  float4 _1208 = _ScrFxMainTex.Sample(sampler_ScrFxMainTex, float2((((((UberPostScreenEffectsBasePacked6.x * _499) + _622) + UberPostScreenEffectsBasePacked2.z) + (((_28[_1139]) * _1135) * UberPostScreenEffectsBasePacked2.x)) + _1154), (((((UberPostScreenEffectsBasePacked6.y * _499) + _623) + UberPostScreenEffectsBasePacked2.w) + (((_29[_1139]) * _1135) * UberPostScreenEffectsBasePacked2.y)) + _1154)));
  float _1216 = select((UberPostScreenEffectsBasePacked11.z > 0.5f), _1207, 1.0f);
  _32[0] = _1208.x;
  _32[1] = _1208.y;
  _32[2] = _1208.z;
  _32[3] = _1208.w;
  bool _1227 = (UberPostScreenEffectsBasePacked3.y > 3.5f);
  float _1230 = saturate(UberPostScreenEffectsBasePacked3.w * _1216);
  float _1239 = UberPostScreenEffectsBasePacked5.x - UberPostScreenEffectsBasePacked4.x;
  float _1240 = UberPostScreenEffectsBasePacked5.y - UberPostScreenEffectsBasePacked4.y;
  float _1241 = UberPostScreenEffectsBasePacked5.z - UberPostScreenEffectsBasePacked4.z;
  float _1253 = saturate((_1216 * (_32[min((uint)(uint(UberPostScreenEffectsBasePacked3.y)), 3)])) * UberPostScreenEffectsBasePacked3.w);
  float _1260 = select(_1227, (((_1239 * _1230) + UberPostScreenEffectsBasePacked4.x) * _1208.x), ((_1239 * _1253) + UberPostScreenEffectsBasePacked4.x));
  float _1261 = select(_1227, (((_1240 * _1230) + UberPostScreenEffectsBasePacked4.y) * _1208.y), ((_1240 * _1253) + UberPostScreenEffectsBasePacked4.y));
  float _1262 = select(_1227, (((_1241 * _1230) + UberPostScreenEffectsBasePacked4.z) * _1208.z), ((_1241 * _1253) + UberPostScreenEffectsBasePacked4.z));
  _31[0] = _1208.x;
  _31[1] = _1208.y;
  _31[2] = _1208.z;
  _31[3] = _1208.w;
  float _1271 = _31[min((uint)(uint(UberPostScreenEffectsBasePacked3.z)), 3)];
  float _1272 = _1271 * _1207;
  float4 _1288 = _ScrFxMaskTex.Sample(sampler_ScrFxMaskTex, float2(((((UberPostScreenEffectsBasePacked8.x * _499) + _622) + UberPostScreenEffectsBasePacked7.z) + (UberPostScreenEffectsBasePacked7.x * (_28[_1068]))), ((((UberPostScreenEffectsBasePacked8.y * _499) + _623) + UberPostScreenEffectsBasePacked7.w) + (UberPostScreenEffectsBasePacked7.y * (_29[_1068])))));
  _30[0] = _1288.x;
  _30[1] = _1288.y;
  _30[2] = _1288.z;
  _30[3] = _1288.w;
  if (UberPostScreenEffectsBasePacked8.z < 0.5f) {
    _1310 = (lerp(UberPostScreenEffectsBasePacked4.w, UberPostScreenEffectsBasePacked5.w, _1271));
  } else {
    _1310 = select((UberPostScreenEffectsBasePacked13.w > 0.5f), saturate((_1272 - UberPostScreenEffectsBasePacked10.x) * UberPostScreenEffectsBasePacked14.x), select((_1272 < UberPostScreenEffectsBasePacked10.x), 0.0f, 1.0f));
  }
  float _1312 = ((_30[min((uint)(uint(UberPostScreenEffectsBasePacked6.w)), 3)]) * _1310) * _555;
  float _1316 = select((_1312 < UberPostScreenEffectsBasePacked14.y), 0.0f, 1.0f) * _1312;
  if (UberPostScreenEffectsBasePacked0.x < 0.5f) {
    _1392 = ((_1316 * (_1260 - _990)) + _990);
    _1393 = ((_1316 * (_1261 - _991)) + _991);
    _1394 = ((_1316 * (_1262 - _992)) + _992);
  } else {
    if (UberPostScreenEffectsBasePacked0.x < 1.5f) {
      _1392 = ((_1316 * _1260) + _990);
      _1393 = ((_1316 * _1261) + _991);
      _1394 = ((_1316 * _1262) + _992);
    } else {
      if (UberPostScreenEffectsBasePacked0.x < 2.5f) {
        _1392 = (((_1316 * (_1260 + -1.0f)) + 1.0f) * _990);
        _1393 = (((_1316 * (_1261 + -1.0f)) + 1.0f) * _991);
        _1394 = (((_1316 * (_1262 + -1.0f)) + 1.0f) * _992);
      } else {
        float _1358 = _1316 * (_1260 + -0.5f);
        float _1359 = _1316 * (_1261 + -0.5f);
        float _1360 = _1316 * (_1262 + -0.5f);
        _1392 = select((_990 < 0.5f), ((_990 * 2.0f) * (_1358 + 0.5f)), (1.0f - (((1.0f - _990) * 2.0f) * (0.5f - _1358))));
        _1393 = select((_991 < 0.5f), ((_991 * 2.0f) * (_1359 + 0.5f)), (1.0f - (((1.0f - _991) * 2.0f) * (0.5f - _1359))));
        _1394 = select((_992 < 0.5f), ((_992 * 2.0f) * (_1360 + 0.5f)), (1.0f - (((1.0f - _992) * 2.0f) * (0.5f - _1360))));
      }
    }
  }
  SV_Target.x = _1392;
  SV_Target.y = _1393;
  SV_Target.z = _1394;
  SV_Target.w = _862;
  SV_Target = renodx::draw::RenderIntermediatePass(SV_Target);
  return SV_Target;
}
