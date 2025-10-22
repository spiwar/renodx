#include "../../tonemap.hlsl"
// Uberpost - Letterboxed cutscenes

Texture2D<float4> _CameraDepthTexture : register(t0);

Texture2D<float4> _BlitTex : register(t1);

Texture2D<float4> _Grain_Texture : register(t2);

Texture2D<float4> _InternalLut : register(t3);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t4);

Texture2D<float4> _NoiseTexture : register(t5);

Texture2D<float4> _GlitchTex : register(t6);

Texture2D<float4> _NapBloomTex : register(t7);

Texture2D<float4> _DirtTex : register(t8);

Texture2D<float4> _OldCRTPattern : register(t9);

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
  float4 _32 = _CameraDepthTexture.Load(int3((uint)(uint(_ScreenSize.x * TEXCOORD.x)), (uint)(uint(_ScreenSize.y * TEXCOORD.y)), 0));
  float _56 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _58 = -0.0f - ((TEXCOORD.y * 2.0f) + -1.0f);
  float _74 = mad((_InvViewProjMatrix[2].w), _32.x, mad((_InvViewProjMatrix[1].w), _58, ((_InvViewProjMatrix[0].w) * _56))) + (_InvViewProjMatrix[3].w);
  float _75 = (mad((_InvViewProjMatrix[2].x), _32.x, mad((_InvViewProjMatrix[1].x), _58, ((_InvViewProjMatrix[0].x) * _56))) + (_InvViewProjMatrix[3].x)) / _74;
  float _76 = (mad((_InvViewProjMatrix[2].y), _32.x, mad((_InvViewProjMatrix[1].y), _58, ((_InvViewProjMatrix[0].y) * _56))) + (_InvViewProjMatrix[3].y)) / _74;
  float _77 = (mad((_InvViewProjMatrix[2].z), _32.x, mad((_InvViewProjMatrix[1].z), _58, ((_InvViewProjMatrix[0].z) * _56))) + (_InvViewProjMatrix[3].z)) / _74;
  float _78 = ddy_coarse(_75);
  float _79 = ddy_coarse(_76);
  float _80 = ddy_coarse(_77);
  float _81 = ddx_coarse(_75);
  float _82 = ddx_coarse(_76);
  float _83 = ddx_coarse(_77);
  float _86 = (_82 * _80) - (_83 * _79);
  float _89 = (_83 * _78) - (_81 * _80);
  float _92 = (_81 * _79) - (_82 * _78);
  float _94 = rsqrt(dot(float3(_86, _89, _92), float3(_86, _89, _92)));
  float _109 = saturate((_SceneWeatherSandstormParams01.z * (1.0f / ((_ZBufferParams.z * _32.x) + _ZBufferParams.w))) - _SceneWeatherSandstormParams01.y);
  float _123 = _SceneWeatherSandstormParams01.w * _76;
  float _129 = max(abs(_86 * _94), 9.999999747378752e-06f);
  float _130 = max(abs(_89 * _94), 9.999999747378752e-06f);
  float _131 = max(abs(_94 * _92), 9.999999747378752e-06f);
  float _133 = rsqrt(dot(float3(_129, _130, _131), float3(_129, _130, _131)));
  float _138 = _133 * ((_130 + _129) + _131);
  float _146 = _SceneWeatherSandstormParams02.x * (_GlobalTimeParamsA[1].x);
  float _147 = _SceneWeatherSandstormParams02.y * (_GlobalTimeParamsA[1].x);
  float _152 = (_123 * _SceneWeatherSandstormParams02.z) + _146;
  float _153 = ((_SceneWeatherSandstormParams01.w * _77) * _SceneWeatherSandstormParams02.w) + _147;
  float _154 = dot(float2(_152, _153), float2(0.3660254180431366f, 0.3660254180431366f));
  float _157 = floor(_152 + _154);
  float _158 = floor(_153 + _154);
  float _161 = dot(float2(_157, _158), float2(0.21132487058639526f, 0.21132487058639526f));
  float _162 = (_152 - _157) + _161;
  float _163 = (_153 - _158) + _161;
  bool _164 = (_162 > _163);
  float _165 = select(_164, 1.0f, 0.0f);
  float _166 = select(_164, 0.0f, 1.0f);
  float _169 = _162 + -0.5773502588272095f;
  float _170 = _163 + -0.5773502588272095f;
  float _171 = (_162 + 0.21132487058639526f) - _165;
  float _172 = (_163 + 0.21132487058639526f) - _166;
  float _179 = _157 - (floor(_157 * 0.0034602077212184668f) * 289.0f);
  float _180 = _158 - (floor(_158 * 0.0034602077212184668f) * 289.0f);
  float _181 = _180 + _166;
  float _182 = _180 + 1.0f;
  float _189 = ((_180 * 34.0f) + 1.0f) * _180;
  float _190 = ((_181 * 34.0f) + 1.0f) * _181;
  float _191 = ((_182 * 34.0f) + 1.0f) * _182;
  float _202 = (_189 - (floor(_189 * 0.0034602077212184668f) * 289.0f)) + _179;
  float _205 = ((_165 + _179) - (floor(_190 * 0.0034602077212184668f) * 289.0f)) + _190;
  float _208 = ((_179 + 1.0f) - (floor(_191 * 0.0034602077212184668f) * 289.0f)) + _191;
  float _215 = ((_202 * 34.0f) + 1.0f) * _202;
  float _216 = ((_205 * 34.0f) + 1.0f) * _205;
  float _217 = ((_208 * 34.0f) + 1.0f) * _208;
  float _236 = max((0.5f - dot(float2(_162, _163), float2(_162, _163))), 0.0f);
  float _237 = max((0.5f - dot(float2(_171, _172), float2(_171, _172))), 0.0f);
  float _238 = max((0.5f - dot(float2(_169, _170), float2(_169, _170))), 0.0f);
  float _239 = _236 * _236;
  float _240 = _237 * _237;
  float _241 = _238 * _238;
  float _251 = frac((_215 - (floor(_215 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _252 = frac((_216 - (floor(_216 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _253 = frac((_217 - (floor(_217 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _254 = _251 + -1.0f;
  float _255 = _252 + -1.0f;
  float _256 = _253 + -1.0f;
  float _260 = abs(_254) + -0.5f;
  float _261 = abs(_255) + -0.5f;
  float _262 = abs(_256) + -0.5f;
  float _269 = _254 - floor(_251 + -0.5f);
  float _270 = _255 - floor(_252 + -0.5f);
  float _271 = _256 - floor(_253 + -0.5f);
  float _305 = ((_SceneWeatherSandstormParams01.w * _75) * _SceneWeatherSandstormParams04.x) + _146;
  float _306 = (_123 * _SceneWeatherSandstormParams04.y) + _147;
  float _307 = dot(float2(_305, _306), float2(0.3660254180431366f, 0.3660254180431366f));
  float _310 = floor(_305 + _307);
  float _311 = floor(_306 + _307);
  float _314 = dot(float2(_310, _311), float2(0.21132487058639526f, 0.21132487058639526f));
  float _315 = (_305 - _310) + _314;
  float _316 = (_306 - _311) + _314;
  bool _317 = (_315 > _316);
  float _318 = select(_317, 1.0f, 0.0f);
  float _319 = select(_317, 0.0f, 1.0f);
  float _322 = _315 + -0.5773502588272095f;
  float _323 = _316 + -0.5773502588272095f;
  float _324 = (_315 + 0.21132487058639526f) - _318;
  float _325 = (_316 + 0.21132487058639526f) - _319;
  float _332 = _310 - (floor(_310 * 0.0034602077212184668f) * 289.0f);
  float _333 = _311 - (floor(_311 * 0.0034602077212184668f) * 289.0f);
  float _334 = _333 + _319;
  float _335 = _333 + 1.0f;
  float _342 = ((_333 * 34.0f) + 1.0f) * _333;
  float _343 = ((_334 * 34.0f) + 1.0f) * _334;
  float _344 = ((_335 * 34.0f) + 1.0f) * _335;
  float _355 = (_342 - (floor(_342 * 0.0034602077212184668f) * 289.0f)) + _332;
  float _358 = ((_318 + _332) - (floor(_343 * 0.0034602077212184668f) * 289.0f)) + _343;
  float _361 = ((_332 + 1.0f) - (floor(_344 * 0.0034602077212184668f) * 289.0f)) + _344;
  float _368 = ((_355 * 34.0f) + 1.0f) * _355;
  float _369 = ((_358 * 34.0f) + 1.0f) * _358;
  float _370 = ((_361 * 34.0f) + 1.0f) * _361;
  float _389 = max((0.5f - dot(float2(_315, _316), float2(_315, _316))), 0.0f);
  float _390 = max((0.5f - dot(float2(_324, _325), float2(_324, _325))), 0.0f);
  float _391 = max((0.5f - dot(float2(_322, _323), float2(_322, _323))), 0.0f);
  float _392 = _389 * _389;
  float _393 = _390 * _390;
  float _394 = _391 * _391;
  float _404 = frac((_368 - (floor(_368 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _405 = frac((_369 - (floor(_369 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _406 = frac((_370 - (floor(_370 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _407 = _404 + -1.0f;
  float _408 = _405 + -1.0f;
  float _409 = _406 + -1.0f;
  float _413 = abs(_407) + -0.5f;
  float _414 = abs(_408) + -0.5f;
  float _415 = abs(_409) + -0.5f;
  float _422 = _407 - floor(_404 + -0.5f);
  float _423 = _408 - floor(_405 + -0.5f);
  float _424 = _409 - floor(_406 + -0.5f);
  float _461 = ((((_109 * _109) * 130.0f) * exp2(log2(1.0f - saturate(abs(_76 - _SceneWeatherSandstormParams03.y) / _SceneWeatherSandstormParams03.x)) * _SceneWeatherSandstormParams03.z)) * _SceneWeatherSandstormParams01.x) * ((dot(float3(((_392 * _392) * (1.7928428649902344f - (((_422 * _422) + (_413 * _413)) * 0.8537347316741943f))), ((_393 * _393) * (1.7928428649902344f - (((_423 * _423) + (_414 * _414)) * 0.8537347316741943f))), ((_394 * _394) * (1.7928428649902344f - (((_424 * _424) + (_415 * _415)) * 0.8537347316741943f)))), float3(((_422 * _315) + (_413 * _316)), ((_423 * _324) + (_414 * _325)), ((_424 * _322) + (_415 * _323)))) * ((_133 * _131) / _138)) + (dot(float3(((_239 * _239) * (1.7928428649902344f - (((_269 * _269) + (_260 * _260)) * 0.8537347316741943f))), ((_240 * _240) * (1.7928428649902344f - (((_270 * _270) + (_261 * _261)) * 0.8537347316741943f))), ((_241 * _241) * (1.7928428649902344f - (((_271 * _271) + (_262 * _262)) * 0.8537347316741943f)))), float3(((_269 * _162) + (_260 * _163)), ((_270 * _171) + (_261 * _172)), ((_271 * _169) + (_262 * _170)))) * ((_133 * _129) / _138)));
  float4 _471 = _CameraDepthTexture.Load(int3((uint)(uint((_461 + TEXCOORD.x) * _ScreenSize.x)), (uint)(uint((_461 + TEXCOORD.y) * _ScreenSize.y)), 0));
  float _479 = saturate((_SceneWeatherSandstormParams01.z * (1.0f / ((_471.x * _ZBufferParams.z) + _ZBufferParams.w))) - _SceneWeatherSandstormParams01.y) * _461;
  float _480 = _479 + TEXCOORD.x;
  float _481 = _479 + TEXCOORD.y;
  float _514;
  float _515;
  float _516;
  float _517;
  float _518;
  float _519;
  float _520;
  float _521;
  float _615;
  float _616;
  float _617;
  float _646;
  float _647;
  float _648;
  float _893;
  float _894;
  float _895;
  float _905;
  float _906;
  float _907;
  float _908;
  float _947;
  float _948;
  float _949;
  float _1036;
  float _1037;
  float _1038;
  if (_DistortionRgbShift.w > 0.0f) {
    float4 _486 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(_480, _481));
    float _490 = _486.x * 0.10000000149011612f;
    float _491 = _486.y * 0.10000000149011612f;
    float _496 = (_490 * _486.z) * _DistortionRgbShift.w;
    float _497 = (_491 * _486.z) * _DistortionRgbShift.w;
    _514 = (_490 + TEXCOORD.x);
    _515 = (_491 + TEXCOORD.y);
    _516 = ((_496 * _DistortionRgbShift.x) + _490);
    _517 = ((_497 * _DistortionRgbShift.x) + _491);
    _518 = ((_496 * _DistortionRgbShift.y) + _490);
    _519 = ((_497 * _DistortionRgbShift.y) + _491);
    _520 = ((_DistortionRgbShift.z * _496) + _490);
    _521 = ((_DistortionRgbShift.z * _497) + _491);
  } else {
    _514 = TEXCOORD.x;
    _515 = TEXCOORD.y;
    _516 = 0.0f;
    _517 = 0.0f;
    _518 = 0.0f;
    _519 = 0.0f;
    _520 = 0.0f;
    _521 = 0.0f;
  }
  float _524 = frac(_GlobalTimeParamsA[1].x);
  float4 _529 = _NoiseTexture.Sample(sampler_NoiseTexture, float2((_524 + (_480 * 5.0f)), (_524 + (_481 * 5.0f))));
  float _531 = _529.x + -0.5f;
  float _541 = ((_531 * 0.019999999552965164f) * _NoiseParams.y) * select((abs(_531 * 2.0f) < _NoiseParams.z), 0.0f, 1.0f);
  float _544 = cos(_RgbShiftParams.w);
  float _545 = sin(_RgbShiftParams.w);
  float _552 = (_RgbShiftParams.x * 0.10000000149011612f) + _541;
  float _553 = (_RgbShiftParams.y * 0.10000000149011612f) + _541;
  float _554 = (_RgbShiftParams.z * 0.10000000149011612f) + _541;
  float _556 = _552 * _545;
  float _558 = _553 * _545;
  float _560 = _554 * _545;
  float _568 = _NoiseParams.x * (frac(frac(_GlobalTimeParamsA[1].x) * 88.0f) + _481);
  float4 _572 = _NoiseTexture.Sample(sampler_NoiseTexture, float2(0.5f, (_568 + _556)));
  float4 _574 = _NoiseTexture.Sample(sampler_NoiseTexture, float2(0.5f, (_568 + _558)));
  float4 _576 = _NoiseTexture.Sample(sampler_NoiseTexture, float2(0.5f, (_568 + _560)));
  float _579 = frac(_524 * 1234.0f);
  float _586 = (((_579 * _579) * (select((_LineParams.y < _LineParams.x), _LineParams.x, _LineParams.y) - _LineParams.x)) * _579) + _LineParams.x;
  float _593 = select((_586 < _572.x), 0.0f, 1.0f) * _LineParams.z;
  float _594 = select((_586 < _574.x), 0.0f, 1.0f) * _LineParams.z;
  float _595 = select((_586 < _576.x), 0.0f, 1.0f) * _LineParams.z;
  [branch]
  if (UberPostBasePacked2.z > 0.5f) {
    float4 _609 = _GlitchTex.Sample(sampler_GlitchTex, float2(((_GlitchMask_ST.x * _480) + _GlitchMask_ST.z), ((_GlitchMask_ST.y * _481) + _GlitchMask_ST.w)));
    _615 = (_609.x * _593);
    _616 = (_609.x * _594);
    _617 = (_609.x * _595);
  } else {
    _615 = _593;
    _616 = _594;
    _617 = _595;
  }
  [branch]
  if (UberPostBasePacked2.w > 0.5f) {
    float4 _640 = _GlitchTex.Sample(sampler_GlitchTex, float2((((_RandomOpacity_ST.x * _480) + _RandomOpacity_ST.z) + frac(UberPostBasePacked2.x * (_GlobalTimeParamsA[1].x))), (((_RandomOpacity_ST.y * _481) + _RandomOpacity_ST.w) + frac(UberPostBasePacked2.y * (_GlobalTimeParamsA[1].x)))));
    _646 = (_640.y * _615);
    _647 = (_640.y * _616);
    _648 = (_640.y * _617);
  } else {
    _646 = _615;
    _647 = _616;
    _648 = _617;
  }
  float _655 = ((_480 * 2.0f) - _ChromaCenter.x) + -0.5f;
  float _657 = ((_481 * 2.0f) - _ChromaCenter.y) + -0.5f;
  float _661 = dot(float2(_655, _657), float2(_655, _657)) * -0.3333333432674408f;
  float _663 = (_661 * _655) * UberPostBasePacked0.z;
  float _665 = (_661 * _657) * UberPostBasePacked0.z;
  float _667 = rsqrt(dot(float3(_663, _665, 9.999999747378752e-05f), float3(_663, _665, 9.999999747378752e-05f)));
  float _674 = UberPostBasePacked0.z * 0.9428090453147888f;
  float _679 = exp2(log2(sqrt((_663 * _663) + (_665 * _665)) / _674) * _ChromaCenter.z);
  float _681 = ((_663 * _667) * _674) * _679;
  float _683 = ((_665 * _667) * _674) * _679;
  float4 _688 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_516 + _480) + (_552 * _544)), ((_517 + _481) + _556)));
  float4 _696 = _BlitTex.Sample(s_linear_clamp_sampler, float2((((_518 + _480) + (_553 * _544)) + _681), (((_519 + _481) + _558) + _683)));
  float4 _706 = _BlitTex.Sample(s_linear_clamp_sampler, float2((((_520 + _480) + (_554 * _544)) + (_681 * 2.0f)), (((_521 + _481) + _560) + (_683 * 2.0f))));
  float4 _708 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_514, _515));
  float4 _720 = _OldCRTPattern.Sample(s_linear_repeat_sampler, float2(((UberPostOldCRTPacked.x * _480) * _OldCRTPattern_TexelSize.x), ((UberPostOldCRTPacked.y * _481) * _OldCRTPattern_TexelSize.y)));
  float _732 = frac((_GlobalTimeParamsA[1].x) * 25.0f) - (1.0f - _481);
  float _733 = 0.4000000059604645f - _732;
  float _746 = (UberPostOldCRTPacked.w * max(((select((_733 < 0.4000000059604645f), 0.0f, 1.0f) * ((saturate(_732 + 0.05000000074505806f) * 10.0f) - _733)) + _733), 0.0f)) + 1.0f;
  float _751 = 1.0f - UberPostOldCRTPacked.z;
  float _761 = (((((_720.x * 12.0f) * _746) * _751) + UberPostOldCRTPacked.z) * _688.x) + _646;
  float _762 = (((((_720.y * 12.0f) * _746) * _751) + UberPostOldCRTPacked.z) * _696.y) + _647;
  float _763 = (((((_720.z * 12.0f) * _746) * _751) + UberPostOldCRTPacked.z) * _706.z) + _648;
  bool _770 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _770))) {
    float _780 = fmod(((_ScreenSize.y * _515) * _VREffectsScanlineParams.x), 2.0f);
    float _788 = (((select((_780 > 1.0f), (2.0f - _780), _780) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _514;
    float _791 = _ScreenSize.w * _ScreenSize.x;
    float4 _810 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_788, ((select(((frac((((_788 + abs(_VREffectsSliceParams.y)) * _791) - (_VREffectsSliceParams.y * _515)) / ((_791 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _515)));
    float _847 = ((((-0.699999988079071f - _810.x) + (exp2(log2(abs(_810.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_810.x < 0.30000001192092896f), 0.0f, 1.0f)) + _810.x) * UberPostBasePacked3.x;
    float _848 = ((((-0.699999988079071f - _810.y) + (exp2(log2(abs(_810.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_810.y < 0.30000001192092896f), 0.0f, 1.0f)) + _810.y) * UberPostBasePacked3.x;
    float _849 = ((((-0.699999988079071f - _810.z) + (exp2(log2(abs(_810.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_810.z < 0.30000001192092896f), 0.0f, 1.0f)) + _810.z) * UberPostBasePacked3.x;
    float _850 = dot(float3(_761, _762, _763), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _853 = (UberPostBasePacked4.x > 0.5f);
    float _866 = select(_853, ((((_847 * _850) - _847) * _708.w) + _847), _847);
    float _867 = select(_853, ((((_848 * _850) - _848) * _708.w) + _848), _848);
    float _868 = select(_853, ((((_849 * _850) - _849) * _708.w) + _849), _849);
    do {
      if (_770) {
        float4 _879 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _514) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _515) + _DirtTexTillingOffset.w)));
        _893 = (((_879.x * _847) * UberPostBasePacked3.y) + _866);
        _894 = (((_879.y * _848) * UberPostBasePacked3.y) + _867);
        _895 = (((_879.z * _849) * UberPostBasePacked3.y) + _868);
      } else {
        _893 = _866;
        _894 = _867;
        _895 = _868;
      }
      _905 = (_893 + _761);
      _906 = (_894 + _762);
      _907 = (_895 + _763);
      _908 = saturate((((_894 + _893) + _895) * 0.33329999446868896f) + _708.w);
    } while (false);
  } else {
    _905 = _761;
    _906 = _762;
    _907 = _763;
    _908 = _708.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _925 = abs(_515 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _927 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_514 - _Vignette_Params2.x);
    float _933 = exp2(log2(saturate(1.0f - dot(float2(_927, _925), float2(_927, _925)))) * _Vignette_Params2.w);
    _947 = (((_933 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _905);
    _948 = (((_933 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _906);
    _949 = (((_933 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _907);
  } else {
    _947 = _905;
    _948 = _906;
    _949 = _907;
  }
  float3 untonemapped = (float3(_947, _948, _949));
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _998 = tonemapped.x;
  float _999 = tonemapped.y;
  float _1000 = tonemapped.z;
  /*
  float _972 = saturate((log2((_949 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _973 = floor(_972);
  float _979 = ((saturate((log2((_948 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _981 = (_973 * _Lut_Params.y) + (((saturate((log2((_947 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _982 = _972 - _973;
  float4 _984 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_981 + _Lut_Params.y), _979), 0.0f);
  float4 _988 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_981, _979), 0.0f);
  float _998 = ((_984.x - _988.x) * _982) + _988.x;
  float _999 = ((_984.y - _988.y) * _982) + _988.y;
  float _1000 = ((_984.z - _988.z) * _982) + _988.z;*/
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _1015 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * _480) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * _481) + _Grain_TilingParams.w)));
    float _1018 = (_1015.w + -0.5f) * 2.0f;
    float _1022 = 1.0f - (sqrt(dot(float3(_998, _999, _1000), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _1036 = ((((UberPostBasePacked1.x * _998) * _1018) * _1022) + _998);
    _1037 = ((((UberPostBasePacked1.x * _999) * _1018) * _1022) + _999);
    _1038 = ((((UberPostBasePacked1.x * _1000) * _1018) * _1022) + _1000);
  } else {
    _1036 = _998;
    _1037 = _999;
    _1038 = _1000;
  }
  SV_Target.x = _1036;
  SV_Target.y = _1037;
  SV_Target.z = _1038;
  SV_Target.w = _908;
  SV_Target = renodx::draw::RenderIntermediatePass(SV_Target);
  return SV_Target;
}
