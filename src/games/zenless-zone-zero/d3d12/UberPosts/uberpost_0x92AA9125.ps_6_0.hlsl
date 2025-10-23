#include "../../tonemap.hlsl"

// UberPost for Shiyu Defense

Texture2D<float4> _CameraDepthTexture : register(t0);

Texture2D<float4> _BlitTex : register(t1);

Texture2D<float4> _Grain_Texture : register(t2);

Texture2D<float4> _InternalLut : register(t3);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t4);

Texture2D<float4> _NapBloomTex : register(t5);

Texture2D<float4> _DirtTex : register(t6);

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
    noperspective float4 SV_Position: SV_Position,
    linear float2 TEXCOORD: TEXCOORD,
    linear float4 TEXCOORD_1: TEXCOORD1) : SV_Target {
  float4 SV_Target;
  float4 _23 = _CameraDepthTexture.Load(int3((uint)(uint(_ScreenSize.x * TEXCOORD.x)), (uint)(uint(_ScreenSize.y * TEXCOORD.y)), 0));
  float _47 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _49 = -0.0f - ((TEXCOORD.y * 2.0f) + -1.0f);
  float _65 = mad((_InvViewProjMatrix[2].w), _23.x, mad((_InvViewProjMatrix[1].w), _49, ((_InvViewProjMatrix[0].w) * _47))) + (_InvViewProjMatrix[3].w);
  float _66 = (mad((_InvViewProjMatrix[2].x), _23.x, mad((_InvViewProjMatrix[1].x), _49, ((_InvViewProjMatrix[0].x) * _47))) + (_InvViewProjMatrix[3].x)) / _65;
  float _67 = (mad((_InvViewProjMatrix[2].y), _23.x, mad((_InvViewProjMatrix[1].y), _49, ((_InvViewProjMatrix[0].y) * _47))) + (_InvViewProjMatrix[3].y)) / _65;
  float _68 = (mad((_InvViewProjMatrix[2].z), _23.x, mad((_InvViewProjMatrix[1].z), _49, ((_InvViewProjMatrix[0].z) * _47))) + (_InvViewProjMatrix[3].z)) / _65;
  float _69 = ddy_coarse(_66);
  float _70 = ddy_coarse(_67);
  float _71 = ddy_coarse(_68);
  float _72 = ddx_coarse(_66);
  float _73 = ddx_coarse(_67);
  float _74 = ddx_coarse(_68);
  float _77 = (_73 * _71) - (_74 * _70);
  float _80 = (_74 * _69) - (_72 * _71);
  float _83 = (_72 * _70) - (_73 * _69);
  float _85 = rsqrt(dot(float3(_77, _80, _83), float3(_77, _80, _83)));
  float _100 = saturate((_SceneWeatherSandstormParams01.z * (1.0f / ((_ZBufferParams.z * _23.x) + _ZBufferParams.w))) - _SceneWeatherSandstormParams01.y);
  float _114 = _SceneWeatherSandstormParams01.w * _67;
  float _120 = max(abs(_77 * _85), 9.999999747378752e-06f);
  float _121 = max(abs(_80 * _85), 9.999999747378752e-06f);
  float _122 = max(abs(_85 * _83), 9.999999747378752e-06f);
  float _124 = rsqrt(dot(float3(_120, _121, _122), float3(_120, _121, _122)));
  float _129 = _124 * ((_121 + _120) + _122);
  float _137 = _SceneWeatherSandstormParams02.x * (_GlobalTimeParamsA[1].x);
  float _138 = _SceneWeatherSandstormParams02.y * (_GlobalTimeParamsA[1].x);
  float _143 = (_114 * _SceneWeatherSandstormParams02.z) + _137;
  float _144 = ((_SceneWeatherSandstormParams01.w * _68) * _SceneWeatherSandstormParams02.w) + _138;
  float _145 = dot(float2(_143, _144), float2(0.3660254180431366f, 0.3660254180431366f));
  float _148 = floor(_143 + _145);
  float _149 = floor(_144 + _145);
  float _152 = dot(float2(_148, _149), float2(0.21132487058639526f, 0.21132487058639526f));
  float _153 = (_143 - _148) + _152;
  float _154 = (_144 - _149) + _152;
  bool _155 = (_153 > _154);
  float _156 = select(_155, 1.0f, 0.0f);
  float _157 = select(_155, 0.0f, 1.0f);
  float _160 = _153 + -0.5773502588272095f;
  float _161 = _154 + -0.5773502588272095f;
  float _162 = (_153 + 0.21132487058639526f) - _156;
  float _163 = (_154 + 0.21132487058639526f) - _157;
  float _170 = _148 - (floor(_148 * 0.0034602077212184668f) * 289.0f);
  float _171 = _149 - (floor(_149 * 0.0034602077212184668f) * 289.0f);
  float _172 = _171 + _157;
  float _173 = _171 + 1.0f;
  float _180 = ((_171 * 34.0f) + 1.0f) * _171;
  float _181 = ((_172 * 34.0f) + 1.0f) * _172;
  float _182 = ((_173 * 34.0f) + 1.0f) * _173;
  float _193 = (_180 - (floor(_180 * 0.0034602077212184668f) * 289.0f)) + _170;
  float _196 = ((_156 + _170) - (floor(_181 * 0.0034602077212184668f) * 289.0f)) + _181;
  float _199 = ((_170 + 1.0f) - (floor(_182 * 0.0034602077212184668f) * 289.0f)) + _182;
  float _206 = ((_193 * 34.0f) + 1.0f) * _193;
  float _207 = ((_196 * 34.0f) + 1.0f) * _196;
  float _208 = ((_199 * 34.0f) + 1.0f) * _199;
  float _227 = max((0.5f - dot(float2(_153, _154), float2(_153, _154))), 0.0f);
  float _228 = max((0.5f - dot(float2(_162, _163), float2(_162, _163))), 0.0f);
  float _229 = max((0.5f - dot(float2(_160, _161), float2(_160, _161))), 0.0f);
  float _230 = _227 * _227;
  float _231 = _228 * _228;
  float _232 = _229 * _229;
  float _242 = frac((_206 - (floor(_206 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _243 = frac((_207 - (floor(_207 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _244 = frac((_208 - (floor(_208 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _245 = _242 + -1.0f;
  float _246 = _243 + -1.0f;
  float _247 = _244 + -1.0f;
  float _251 = abs(_245) + -0.5f;
  float _252 = abs(_246) + -0.5f;
  float _253 = abs(_247) + -0.5f;
  float _260 = _245 - floor(_242 + -0.5f);
  float _261 = _246 - floor(_243 + -0.5f);
  float _262 = _247 - floor(_244 + -0.5f);
  float _296 = ((_SceneWeatherSandstormParams01.w * _66) * _SceneWeatherSandstormParams04.x) + _137;
  float _297 = (_114 * _SceneWeatherSandstormParams04.y) + _138;
  float _298 = dot(float2(_296, _297), float2(0.3660254180431366f, 0.3660254180431366f));
  float _301 = floor(_296 + _298);
  float _302 = floor(_297 + _298);
  float _305 = dot(float2(_301, _302), float2(0.21132487058639526f, 0.21132487058639526f));
  float _306 = (_296 - _301) + _305;
  float _307 = (_297 - _302) + _305;
  bool _308 = (_306 > _307);
  float _309 = select(_308, 1.0f, 0.0f);
  float _310 = select(_308, 0.0f, 1.0f);
  float _313 = _306 + -0.5773502588272095f;
  float _314 = _307 + -0.5773502588272095f;
  float _315 = (_306 + 0.21132487058639526f) - _309;
  float _316 = (_307 + 0.21132487058639526f) - _310;
  float _323 = _301 - (floor(_301 * 0.0034602077212184668f) * 289.0f);
  float _324 = _302 - (floor(_302 * 0.0034602077212184668f) * 289.0f);
  float _325 = _324 + _310;
  float _326 = _324 + 1.0f;
  float _333 = ((_324 * 34.0f) + 1.0f) * _324;
  float _334 = ((_325 * 34.0f) + 1.0f) * _325;
  float _335 = ((_326 * 34.0f) + 1.0f) * _326;
  float _346 = (_333 - (floor(_333 * 0.0034602077212184668f) * 289.0f)) + _323;
  float _349 = ((_309 + _323) - (floor(_334 * 0.0034602077212184668f) * 289.0f)) + _334;
  float _352 = ((_323 + 1.0f) - (floor(_335 * 0.0034602077212184668f) * 289.0f)) + _335;
  float _359 = ((_346 * 34.0f) + 1.0f) * _346;
  float _360 = ((_349 * 34.0f) + 1.0f) * _349;
  float _361 = ((_352 * 34.0f) + 1.0f) * _352;
  float _380 = max((0.5f - dot(float2(_306, _307), float2(_306, _307))), 0.0f);
  float _381 = max((0.5f - dot(float2(_315, _316), float2(_315, _316))), 0.0f);
  float _382 = max((0.5f - dot(float2(_313, _314), float2(_313, _314))), 0.0f);
  float _383 = _380 * _380;
  float _384 = _381 * _381;
  float _385 = _382 * _382;
  float _395 = frac((_359 - (floor(_359 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _396 = frac((_360 - (floor(_360 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _397 = frac((_361 - (floor(_361 * 0.0034602077212184668f) * 289.0f)) * 0.024390242993831635f) * 2.0f;
  float _398 = _395 + -1.0f;
  float _399 = _396 + -1.0f;
  float _400 = _397 + -1.0f;
  float _404 = abs(_398) + -0.5f;
  float _405 = abs(_399) + -0.5f;
  float _406 = abs(_400) + -0.5f;
  float _413 = _398 - floor(_395 + -0.5f);
  float _414 = _399 - floor(_396 + -0.5f);
  float _415 = _400 - floor(_397 + -0.5f);
  float _452 = ((((_100 * _100) * 130.0f) * exp2(log2(1.0f - saturate(abs(_67 - _SceneWeatherSandstormParams03.y) / _SceneWeatherSandstormParams03.x)) * _SceneWeatherSandstormParams03.z)) * _SceneWeatherSandstormParams01.x) * ((dot(float3(((_383 * _383) * (1.7928428649902344f - (((_413 * _413) + (_404 * _404)) * 0.8537347316741943f))), ((_384 * _384) * (1.7928428649902344f - (((_414 * _414) + (_405 * _405)) * 0.8537347316741943f))), ((_385 * _385) * (1.7928428649902344f - (((_415 * _415) + (_406 * _406)) * 0.8537347316741943f)))), float3(((_413 * _306) + (_404 * _307)), ((_414 * _315) + (_405 * _316)), ((_415 * _313) + (_406 * _314)))) * ((_124 * _122) / _129)) + (dot(float3(((_230 * _230) * (1.7928428649902344f - (((_260 * _260) + (_251 * _251)) * 0.8537347316741943f))), ((_231 * _231) * (1.7928428649902344f - (((_261 * _261) + (_252 * _252)) * 0.8537347316741943f))), ((_232 * _232) * (1.7928428649902344f - (((_262 * _262) + (_253 * _253)) * 0.8537347316741943f)))), float3(((_260 * _153) + (_251 * _154)), ((_261 * _162) + (_252 * _163)), ((_262 * _160) + (_253 * _161)))) * ((_124 * _120) / _129)));
  float4 _462 = _CameraDepthTexture.Load(int3((uint)(uint((_452 + TEXCOORD.x) * _ScreenSize.x)), (uint)(uint((_452 + TEXCOORD.y) * _ScreenSize.y)), 0));
  float _470 = saturate((_SceneWeatherSandstormParams01.z * (1.0f / ((_462.x * _ZBufferParams.z) + _ZBufferParams.w))) - _SceneWeatherSandstormParams01.y) * _452;
  float _471 = _470 + TEXCOORD.x;
  float _472 = _470 + TEXCOORD.y;
  float _505;
  float _506;
  float _507;
  float _508;
  float _509;
  float _510;
  float _511;
  float _512;
  float _697;
  float _698;
  float _699;
  float _709;
  float _710;
  float _711;
  float _712;
  float _751;
  float _752;
  float _753;
  float _840;
  float _841;
  float _842;
  if (_DistortionRgbShift.w > 0.0f) {
    float4 _477 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(_471, _472));
    float _481 = _477.x * 0.10000000149011612f;
    float _482 = _477.y * 0.10000000149011612f;
    float _487 = (_481 * _477.z) * _DistortionRgbShift.w;
    float _488 = (_482 * _477.z) * _DistortionRgbShift.w;
    _505 = (_481 + TEXCOORD.x);
    _506 = (_482 + TEXCOORD.y);
    _507 = ((_487 * _DistortionRgbShift.x) + _481);
    _508 = ((_488 * _DistortionRgbShift.x) + _482);
    _509 = ((_487 * _DistortionRgbShift.y) + _481);
    _510 = ((_488 * _DistortionRgbShift.y) + _482);
    _511 = ((_DistortionRgbShift.z * _487) + _481);
    _512 = ((_DistortionRgbShift.z * _488) + _482);
  } else {
    _505 = TEXCOORD.x;
    _506 = TEXCOORD.y;
    _507 = 0.0f;
    _508 = 0.0f;
    _509 = 0.0f;
    _510 = 0.0f;
    _511 = 0.0f;
    _512 = 0.0f;
  }
  float _519 = ((_471 * 2.0f) - _ChromaCenter.x) + -0.5f;
  float _521 = ((_472 * 2.0f) - _ChromaCenter.y) + -0.5f;
  float _525 = dot(float2(_519, _521), float2(_519, _521)) * -0.3333333432674408f;
  float _527 = (_525 * _519) * UberPostBasePacked0.z;
  float _529 = (_525 * _521) * UberPostBasePacked0.z;
  float _531 = rsqrt(dot(float3(_527, _529, 9.999999747378752e-05f), float3(_527, _529, 9.999999747378752e-05f)));
  float _538 = UberPostBasePacked0.z * 0.9428090453147888f;
  float _543 = exp2(log2(sqrt((_527 * _527) + (_529 * _529)) / _538) * _ChromaCenter.z);
  float _545 = ((_527 * _531) * _538) * _543;
  float _547 = ((_529 * _531) * _538) * _543;
  float4 _550 = _BlitTex.Sample(s_linear_clamp_sampler, float2((_507 + _471), (_508 + _472)));
  float4 _556 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_509 + _471) + _545), ((_510 + _472) + _547)));
  float4 _564 = _BlitTex.Sample(s_linear_clamp_sampler, float2(((_511 + _471) + (_545 * 2.0f)), ((_512 + _472) + (_547 * 2.0f))));
  float4 _566 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_505, _506));
  bool _574 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _574))) {
    float _584 = fmod(((_ScreenSize.y * _506) * _VREffectsScanlineParams.x), 2.0f);
    float _592 = (((select((_584 > 1.0f), (2.0f - _584), _584) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _505;
    float _595 = _ScreenSize.w * _ScreenSize.x;
    float4 _614 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_592, ((select(((frac((((_592 + abs(_VREffectsSliceParams.y)) * _595) - (_VREffectsSliceParams.y * _506)) / ((_595 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _506)));
    float _651 = ((((-0.699999988079071f - _614.x) + (exp2(log2(abs(_614.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_614.x < 0.30000001192092896f), 0.0f, 1.0f)) + _614.x) * UberPostBasePacked3.x;
    float _652 = ((((-0.699999988079071f - _614.y) + (exp2(log2(abs(_614.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_614.y < 0.30000001192092896f), 0.0f, 1.0f)) + _614.y) * UberPostBasePacked3.x;
    float _653 = ((((-0.699999988079071f - _614.z) + (exp2(log2(abs(_614.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_614.z < 0.30000001192092896f), 0.0f, 1.0f)) + _614.z) * UberPostBasePacked3.x;
    float _654 = dot(float3(_550.x, _556.y, _564.z), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _657 = (UberPostBasePacked4.x > 0.5f);
    float _670 = select(_657, ((((_651 * _654) - _651) * _566.w) + _651), _651);
    float _671 = select(_657, ((((_652 * _654) - _652) * _566.w) + _652), _652);
    float _672 = select(_657, ((((_653 * _654) - _653) * _566.w) + _653), _653);
    do {
      if (_574) {
        float4 _683 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _505) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _506) + _DirtTexTillingOffset.w)));
        _697 = (((_683.x * _651) * UberPostBasePacked3.y) + _670);
        _698 = (((_683.y * _652) * UberPostBasePacked3.y) + _671);
        _699 = (((_683.z * _653) * UberPostBasePacked3.y) + _672);
      } else {
        _697 = _670;
        _698 = _671;
        _699 = _672;
      }
      _709 = (_697 + _550.x);
      _710 = (_698 + _556.y);
      _711 = (_699 + _564.z);
      _712 = saturate((((_698 + _697) + _699) * 0.33329999446868896f) + _566.w);
    } while (false);
  } else {
    _709 = _550.x;
    _710 = _556.y;
    _711 = _564.z;
    _712 = _566.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _729 = abs(_506 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _731 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_505 - _Vignette_Params2.x);
    float _737 = exp2(log2(saturate(1.0f - dot(float2(_731, _729), float2(_731, _729)))) * _Vignette_Params2.w);
    _751 = (((_737 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _709);
    _752 = (((_737 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _710);
    _753 = (((_737 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _711);
  } else {
    _751 = _709;
    _752 = _710;
    _753 = _711;
  }

  float3 untonemapped = (float3(_751, _752, _753));
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s_linear_clamp_sampler,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR,
      _Lut_Params.xyz);

  float3 tonemapped = renodx::lut::Sample(_InternalLut, lut_config, untonemapped);
  float _802 = tonemapped.x;
  float _803 = tonemapped.y;
  float _804 = tonemapped.z;

// ARRI C1000 LUT
  /*float _776 = saturate((log2((_753 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z;
  float _777 = floor(_776);
  float _783 = ((saturate((log2((_752 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.y;
  float _785 = (_777 * _Lut_Params.y) + (((saturate((log2((_751 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f) * _Lut_Params.z) + 0.5f) * _Lut_Params.x);
  float _786 = _776 - _777;
  float4 _788 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2((_785 + _Lut_Params.y), _783), 0.0f);
  float4 _792 = _InternalLut.SampleLevel(s_linear_clamp_sampler, float2(_785, _783), 0.0f);
  float _802 = ((_788.x - _792.x) * _786) + _792.x;
  float _803 = ((_788.y - _792.y) * _786) + _792.y;
  float _804 = ((_788.z - _792.z) * _786) + _792.z;*/

  if (UberPostBasePacked1.x > 0.0f) {
    float4 _819 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * _471) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * _472) + _Grain_TilingParams.w)));
    float _822 = (_819.w + -0.5f) * 2.0f;
    float _826 = 1.0f - (sqrt(dot(float3(_802, _803, _804), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _840 = ((((UberPostBasePacked1.x * _802) * _822) * _826) + _802);
    _841 = ((((UberPostBasePacked1.x * _803) * _822) * _826) + _803);
    _842 = ((((UberPostBasePacked1.x * _804) * _822) * _826) + _804);
  } else {
    _840 = _802;
    _841 = _803;
    _842 = _804;
  }
  SV_Target.x = _840;
  SV_Target.y = _841;
  SV_Target.z = _842;
  SV_Target.w = _712;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
