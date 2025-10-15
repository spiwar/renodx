#include "../../tonemap.hlsl"

// Modified LutBuilderLdr shader with CustomToneCurve support, used as a secondary lut on characters and other things.

Texture2D<float4> _LogLutTex : register(t0);

Texture2D<float4> _UserLut : register(t1);

Texture2D<float4> _CurveMaster : register(t2);

Texture2D<float4> _CurveRed : register(t3);

Texture2D<float4> _CurveGreen : register(t4);

Texture2D<float4> _CurveBlue : register(t5);

Texture2D<float4> _CurveHueVsHue : register(t6);

Texture2D<float4> _CurveHueVsSat : register(t7);

Texture2D<float4> _CurveSatVsSat : register(t8);

Texture2D<float4> _CurveLumVsSat : register(t9);

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
  float4 _UserLut_Params : packoffset(c165.x);
  float _LerpAlpha : packoffset(c166.x);
  float4 _LogLutTex_Params : packoffset(c167.x);
  float4 _Lut_Params : packoffset(c168.x);
  float4 _ColorBalance : packoffset(c169.x);
  float4 _ColorFilter : packoffset(c170.x);
  float4 _ChannelMixerRed : packoffset(c171.x);
  float4 _ChannelMixerGreen : packoffset(c172.x);
  float4 _ChannelMixerBlue : packoffset(c173.x);
  float4 _HueSatCon : packoffset(c174.x);
  float4 _Lift : packoffset(c175.x);
  float4 _Gamma : packoffset(c176.x);
  float4 _Gain : packoffset(c177.x);
  float4 _Shadows : packoffset(c178.x);
  float4 _Midtones : packoffset(c179.x);
  float4 _Highlights : packoffset(c180.x);
  float4 _ShaHiLimits : packoffset(c181.x);
  float4 _SplitShadows : packoffset(c182.x);
  float4 _SplitHighlights : packoffset(c183.x);
  float3 _CustomToneCurve : packoffset(c184.x);
  float4 _ToeSegmentA : packoffset(c185.x);
  float2 _ToeSegmentB : packoffset(c186.x);
  float4 _MidSegmentA : packoffset(c187.x);
  float2 _MidSegmentB : packoffset(c188.x);
  float4 _ShoSegmentA : packoffset(c189.x);
  float2 _ShoSegmentB : packoffset(c190.x);
  float _Desaturate : packoffset(c190.z);
};

SamplerState s_linear_clamp_sampler : register(s0);

SamplerState sampler_LogLutTex : register(s1);

SamplerState sampler_UserLut : register(s2);

float4 main(
    noperspective float4 SV_Position: SV_Position,
    linear float2 TEXCOORD: TEXCOORD,
    linear float4 TEXCOORD_1: TEXCOORD1) : SV_Target {
  float4 SV_Target;

  // https://github.com/Unity-Technologies/Graphics/blob/v7.7.1/com.unity.render-pipelines.universal/Shaders/PostProcessing/LutBuilderHdr.shader

  float _22 = TEXCOORD.x - _Lut_Params.y;
  float _25 = frac(_22 * _Lut_Params.x);
  float _40 = exp2(((_25 * _Lut_Params.w) + -0.3860360085964203f) * 13.60548210144043f) + -0.047995999455451965f;
  float _43 = (exp2((((TEXCOORD.y - _Lut_Params.z) * _Lut_Params.w) + -0.3860360085964203f) * 13.60548210144043f) + -0.047995999455451965f) * 0.17999999225139618f;
  float _44 = (exp2((((_22 - (_25 / _Lut_Params.x)) * _Lut_Params.w) + -0.3860360085964203f) * 13.60548210144043f) + -0.047995999455451965f) * 0.17999999225139618f;

  float _58 = _ColorBalance.x * mad(0.008926319889724255f, _44, mad(0.5499410033226013f, _43, (_40 * 0.07027290016412735f)));
  float _59 = _ColorBalance.y * mad(0.0013577500358223915f, _44, mad(0.9631720185279846f, _43, (_40 * 0.012751488015055656f)));
  float _60 = _ColorBalance.z * mad(0.9362450242042542f, _44, mad(0.1280210018157959f, _43, (_40 * 0.004159475676715374f)));

  float _126 = exp2(log2(abs(max(0.0f, (((exp2(((_HueSatCon.z * ((log2((mad(-0.024891000241041183f, _60, mad(-1.628790020942688f, _59, (_58 * 2.8584699630737305f))) * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + -0.027552396059036255f)) + 0.027552396059036255f) * 13.60548210144043f) + -0.047995999455451965f) * 0.17999999225139618f) * _ColorFilter.x)))) * 0.4545454680919647f);
  float _127 = exp2(log2(abs(max(0.0f, (((exp2(((_HueSatCon.z * ((log2((mad(0.00032428099075332284f, _60, mad(1.1582000255584717f, _59, (_58 * -0.21018199622631073f))) * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + -0.027552396059036255f)) + 0.027552396059036255f) * 13.60548210144043f) + -0.047995999455451965f) * 0.17999999225139618f) * _ColorFilter.y)))) * 0.4545454680919647f);
  float _128 = exp2(log2(abs(max(0.0f, (((exp2(((((log2((mad(1.0686700344085693f, _60, mad(-0.11816900223493576f, _59, (_58 * -0.041811998933553696f))) * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + -0.027552396059036255f) * _HueSatCon.z) + 0.027552396059036255f) * 13.60548210144043f) + -0.047995999455451965f) * 0.17999999225139618f) * _ColorFilter.z)))) * 0.4545454680919647f);

  float _134 = saturate(dot(float3(saturate(_126), saturate(_127), saturate(_128)), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f)) + _SplitShadows.w);
  float _135 = 1.0f - _134;
  float _142 = (_SplitShadows.x + -0.5f) * _135;
  float _143 = (_SplitShadows.y + -0.5f) * _135;
  float _144 = (_SplitShadows.z + -0.5f) * _135;
  float _145 = _142 + 0.5f;
  float _146 = _143 + 0.5f;
  float _147 = _144 + 0.5f;
  float _155 = (_SplitHighlights.x + -0.5f) * _134;
  float _156 = (_SplitHighlights.y + -0.5f) * _134;
  float _157 = (_SplitHighlights.z + -0.5f) * _134;
  float _158 = _155 + 0.5f;
  float _159 = _156 + 0.5f;
  float _160 = _157 + 0.5f;
  float _161 = _145 * 2.0f;
  float _162 = _146 * 2.0f;
  float _163 = _147 * 2.0f;
  float _197 = select((_145 < 0.5f), 0.0f, 1.0f);
  float _198 = select((_146 < 0.5f), 0.0f, 1.0f);
  float _199 = select((_147 < 0.5f), 0.0f, 1.0f);
  float _212 = ((_126 * (1.0f - _197)) * (lerp(_161, 1.0f, _126))) + ((((_161 + -1.0f) * sqrt(_126)) + ((_126 * 2.0f) * (0.5f - _142))) * _197);
  float _213 = ((_127 * (1.0f - _198)) * (lerp(_162, 1.0f, _127))) + ((((_162 + -1.0f) * sqrt(_127)) + ((_127 * 2.0f) * (0.5f - _143))) * _198);
  float _214 = ((_128 * (1.0f - _199)) * (lerp(_163, 1.0f, _128))) + ((((_163 + -1.0f) * sqrt(_128)) + ((_128 * 2.0f) * (0.5f - _144))) * _199);
  float _215 = _158 * 2.0f;
  float _216 = _159 * 2.0f;
  float _217 = _160 * 2.0f;
  float _251 = select((_158 < 0.5f), 0.0f, 1.0f);
  float _252 = select((_159 < 0.5f), 0.0f, 1.0f);
  float _253 = select((_160 < 0.5f), 0.0f, 1.0f);
  float _278 = exp2(log2(abs((((1.0f - _251) * _212) * (_215 + (_212 * (1.0f - _215)))) + (((((0.5f - _155) * 2.0f) * _212) + ((_215 + -1.0f) * sqrt(_212))) * _251))) * 2.200000047683716f);
  float _279 = exp2(log2(abs((((1.0f - _252) * _213) * (_216 + (_213 * (1.0f - _216)))) + (((((0.5f - _156) * 2.0f) * _213) + ((_216 + -1.0f) * sqrt(_213))) * _252))) * 2.200000047683716f);
  float _280 = exp2(log2(abs((((1.0f - _253) * _214) * (_217 + (_214 * (1.0f - _217)))) + (((((0.5f - _157) * 2.0f) * _214) + (sqrt(_214) * (_217 + -1.0f))) * _253))) * 2.200000047683716f);
  float _285 = dot(float3(_278, _279, _280), float3(_ChannelMixerRed.x, _ChannelMixerRed.y, _ChannelMixerRed.z));
  float _290 = dot(float3(_278, _279, _280), float3(_ChannelMixerGreen.x, _ChannelMixerGreen.y, _ChannelMixerGreen.z));
  float _295 = dot(float3(_278, _279, _280), float3(_ChannelMixerBlue.x, _ChannelMixerBlue.y, _ChannelMixerBlue.z));
  float _296 = dot(float3(_285, _290, _295), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f));
  float _303 = saturate((_296 - _ShaHiLimits.x) / (_ShaHiLimits.y - _ShaHiLimits.x));
  float _307 = (_303 * _303) * (3.0f - (_303 * 2.0f));
  float _308 = 1.0f - _307;
  float _314 = saturate((_296 - _ShaHiLimits.z) / (_ShaHiLimits.w - _ShaHiLimits.z));
  float _318 = (_314 * _314) * (3.0f - (_314 * 2.0f));
  float _319 = _307 - _318;
  float _361 = ((_285 * _Gain.x) * (((_319 * _Midtones.x) + (_Shadows.x * _308)) + (_Highlights.x * _318))) + _Lift.x;
  float _362 = ((_290 * _Gain.y) * (((_319 * _Midtones.y) + (_Shadows.y * _308)) + (_Highlights.y * _318))) + _Lift.y;
  float _363 = ((_295 * _Gain.z) * (((_319 * _Midtones.z) + (_Shadows.z * _308)) + (_Highlights.z * _318))) + _Lift.z;
  float _398 = float((int)(((int)(uint)((bool)(_361 > 0.0f))) - ((int)(uint)((bool)(_361 < 0.0f))))) * exp2(log2(abs(_361)) * _Gamma.x);
  float _399 = float((int)(((int)(uint)((bool)(_362 > 0.0f))) - ((int)(uint)((bool)(_362 < 0.0f))))) * exp2(log2(abs(_362)) * _Gamma.y);
  float _400 = float((int)(((int)(uint)((bool)(_363 > 0.0f))) - ((int)(uint)((bool)(_363 < 0.0f))))) * exp2(log2(abs(_363)) * _Gamma.z);
  float _402 = select((_399 < _400), 0.0f, 1.0f);
  float _407 = (_402 * (_399 - _400)) + _400;
  float _408 = (_402 * (_400 - _399)) + _399;
  float _410 = 0.6666666865348816f - _402;
  float _412 = select((_398 < _407), 0.0f, 1.0f);
  float _419 = (_412 * (_398 - _407)) + _407;
  float _420 = (_412 * (_407 - _398)) + _398;
  float _422 = _419 - min(_420, _408);
  float _429 = abs((_410 + ((_420 - _408) / ((_422 * 6.0f) + 9.999999747378752e-05f))) + (_412 * ((_402 + -1.0f) - _410)));
  float _431 = _422 / (_419 + 9.999999747378752e-05f);
  float4 _432 = _CurveHueVsSat.Sample(s_linear_clamp_sampler, float2(_429, 0.0f));
  float4 _435 = _CurveSatVsSat.Sample(s_linear_clamp_sampler, float2(_431, 0.0f));
  float4 _439 = _CurveLumVsSat.Sample(s_linear_clamp_sampler, float2(dot(float3(_398, _399, _400), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f)), 0.0f));
  float _447 = _HueSatCon.x + _429;
  float4 _448 = _CurveHueVsHue.Sample(s_linear_clamp_sampler, float2(_447, 0.0f));
  float _452 = (_447 + -0.5f) + saturate(_448.x);
  float _458 = select((_452 < 0.0f), (_452 + 1.0f), select((_452 > 1.0f), (_452 + -1.0f), _452));
  float _489 = (((saturate(abs((frac(_458 + 1.0f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _431) + 1.0f) * _419;
  float _490 = (((saturate(abs((frac(_458 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _431) + 1.0f) * _419;
  float _491 = (((saturate(abs((frac(_458 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _431) + 1.0f) * _419;

  // Global saturation
  float _492 = dot(float3(_489, _490, _491), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f));
  float _495 = _HueSatCon.y * (((saturate(_432.x) * 8.0f) * saturate(_435.x)) * saturate(_439.x));
  float _505 = max(0.0f, ((_495 * (_489 - _492)) + _492));
  float _506 = max(0.0f, ((_495 * (_490 - _492)) + _492));
  float _507 = max(0.0f, ((_495 * (_491 - _492)) + _492));

  float _530 = _LogLutTex_Params.z * saturate((log2((_507 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f);
  float _531 = floor(_530);
  float _537 = ((_LogLutTex_Params.z * saturate((log2((_506 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f)) + 0.5f) * _LogLutTex_Params.y;
  float _539 = (((_LogLutTex_Params.z * saturate((log2((_505 * 5.555555820465088f) + 0.047995999455451965f) * 0.07349978387355804f) + 0.3860360085964203f)) + 0.5f) * _LogLutTex_Params.x) + (_531 * _LogLutTex_Params.y);
  float _540 = _530 - _531;
  float4 _542 = _LogLutTex.SampleLevel(sampler_LogLutTex, float2((_539 + _LogLutTex_Params.y), _537), 0.0f);
  float4 _546 = _LogLutTex.SampleLevel(sampler_LogLutTex, float2(_539, _537), 0.0f);
  float _581 = (_LogLutTex_Params.w * (((exp2(((_546.x + -0.3860360085964203f) + ((_542.x - _546.x) * _540)) * 13.60548210144043f) + -0.047995999455451965f) * 0.17999999225139618f) - _505)) + _505;
  float _582 = (_LogLutTex_Params.w * (((exp2(((_546.y + -0.3860360085964203f) + ((_542.y - _546.y) * _540)) * 13.60548210144043f) + -0.047995999455451965f) * 0.17999999225139618f) - _506)) + _506;
  float _583 = ((((exp2(((_546.z + -0.3860360085964203f) + ((_542.z - _546.z) * _540)) * 13.60548210144043f) + -0.047995999455451965f) * 0.17999999225139618f) - _507) * _LogLutTex_Params.w) + _507;

  // YRGB curves
  float _587 = 1.0f / (max(max(_581, _582), _583) + 1.0f);
  float4 _594 = _CurveMaster.Sample(s_linear_clamp_sampler, float2(((_581 * _587) + 0.00390625f), 0.0f));
  float4 _597 = _CurveMaster.Sample(s_linear_clamp_sampler, float2(((_582 * _587) + 0.00390625f), 0.0f));
  float4 _600 = _CurveMaster.Sample(s_linear_clamp_sampler, float2(((_583 * _587) + 0.00390625f), 0.0f));
  float4 _606 = _CurveRed.Sample(s_linear_clamp_sampler, float2((saturate(_594.x) + 0.00390625f), 0.0f));
  float _608 = saturate(_606.x);
  float4 _609 = _CurveGreen.Sample(s_linear_clamp_sampler, float2((saturate(_597.x) + 0.00390625f), 0.0f));
  float _611 = saturate(_609.x);
  float4 _612 = _CurveBlue.Sample(s_linear_clamp_sampler, float2((saturate(_600.x) + 0.00390625f), 0.0f));
  float _614 = saturate(_612.x);

  // colorLinear = FastTonemapInvert(colorLinear);
  // originally contained a custom tonecurve by mihoyo
  float _618 = 1.0f / (1.0f - max(max(_608, _611), _614));
  float _650 = (_618 * _608) * _CustomToneCurve.x;
  float _651 = (_618 * _611) * _CustomToneCurve.x;
  float _652 = (_618 * _614) * _CustomToneCurve.x;
  float _658;
  float _659;
  float _660;
  float _661;
  float _662;
  float _663;
  float _681;
  float _682;
  float _683;
  float _684;
  float _685;
  float _686;
  float _704;
  float _705;
  float _706;
  float _707;
  float _708;
  float _709;
  float _825;
  float _826;
  float _827;
  if (!(_650 < _CustomToneCurve.y)) {
    if (!(_650 < _CustomToneCurve.z)) {
      _658 = _ShoSegmentA.x;
      _659 = _ShoSegmentA.y;
      _660 = _ShoSegmentA.z;
      _661 = _ShoSegmentA.w;
      _662 = _ShoSegmentB.x;
      _663 = _ShoSegmentB.y;
    } else {
      _658 = _MidSegmentA.x;
      _659 = _MidSegmentA.y;
      _660 = _MidSegmentA.z;
      _661 = _MidSegmentA.w;
      _662 = _MidSegmentB.x;
      _663 = _MidSegmentB.y;
    }
  } else {
    _658 = _ToeSegmentA.x;
    _659 = _ToeSegmentA.y;
    _660 = _ToeSegmentA.z;
    _661 = _ToeSegmentA.w;
    _662 = _ToeSegmentB.x;
    _663 = _ToeSegmentB.y;
  }
  float _665 = _660 * (_650 - _658);
  float _675 = (select((_665 > 0.0f), exp2((((_663 * 0.6931471824645996f) * log2(_665)) + _662) * 1.4426950216293335f), 0.0f) * _661) + _659;
  if (!(_651 < _CustomToneCurve.y)) {
    if (!(_651 < _CustomToneCurve.z)) {
      _681 = _ShoSegmentA.x;
      _682 = _ShoSegmentA.y;
      _683 = _ShoSegmentA.z;
      _684 = _ShoSegmentA.w;
      _685 = _ShoSegmentB.x;
      _686 = _ShoSegmentB.y;
    } else {
      _681 = _MidSegmentA.x;
      _682 = _MidSegmentA.y;
      _683 = _MidSegmentA.z;
      _684 = _MidSegmentA.w;
      _685 = _MidSegmentB.x;
      _686 = _MidSegmentB.y;
    }
  } else {
    _681 = _ToeSegmentA.x;
    _682 = _ToeSegmentA.y;
    _683 = _ToeSegmentA.z;
    _684 = _ToeSegmentA.w;
    _685 = _ToeSegmentB.x;
    _686 = _ToeSegmentB.y;
  }
  float _688 = _683 * (_651 - _681);
  float _698 = (select((_688 > 0.0f), exp2((((_686 * 0.6931471824645996f) * log2(_688)) + _685) * 1.4426950216293335f), 0.0f) * _684) + _682;
  if (!(_652 < _CustomToneCurve.y)) {
    if (!(_652 < _CustomToneCurve.z)) {
      _704 = _ShoSegmentA.x;
      _705 = _ShoSegmentA.y;
      _706 = _ShoSegmentA.z;
      _707 = _ShoSegmentA.w;
      _708 = _ShoSegmentB.x;
      _709 = _ShoSegmentB.y;
    } else {
      _704 = _MidSegmentA.x;
      _705 = _MidSegmentA.y;
      _706 = _MidSegmentA.z;
      _707 = _MidSegmentA.w;
      _708 = _MidSegmentB.x;
      _709 = _MidSegmentB.y;
    }
  } else {
    _704 = _ToeSegmentA.x;
    _705 = _ToeSegmentA.y;
    _706 = _ToeSegmentA.z;
    _707 = _ToeSegmentA.w;
    _708 = _ToeSegmentB.x;
    _709 = _ToeSegmentB.y;
  }
  float _711 = _706 * (_652 - _704);
  float _721 = (select((_711 > 0.0f), exp2((((_709 * 0.6931471824645996f) * log2(_711)) + _708) * 1.4426950216293335f), 0.0f) * _707) + _705;
  
  float3 untonemapped = float3(_675, _698, _721);

  // Game branches with a custom SDR LUT

  /*if (injectedData.toneMapType != 0) {
    SV_Target.xyz = applyUserToneMap(untonemapped, _UserLut_Params, _UserLut, sampler_UserLut);
    SV_Target.w = 1.0f;
    return SV_Target;
  }*/

  if (_UserLut_Params.w > 0.0f) {
    float _726 = saturate(_675);
    float _727 = saturate(_698);
    float _728 = saturate(_721);
    float _753 = select((_726 <= 0.0031308000907301903f), (_726 * 12.920000076293945f), ((exp2(log2(abs(_726)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
    float _754 = select((_727 <= 0.0031308000907301903f), (_727 * 12.920000076293945f), ((exp2(log2(abs(_727)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
    float _755 = select((_728 <= 0.0031308000907301903f), (_728 * 12.920000076293945f), ((exp2(log2(abs(_728)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
    float _759 = _755 * _UserLut_Params.z;
    float _760 = floor(_759);
    float _766 = ((_754 * _UserLut_Params.z) + 0.5f) * _UserLut_Params.y;
    float _768 = (((_UserLut_Params.z * _753) + 0.5f) * _UserLut_Params.x) + (_760 * _UserLut_Params.y);
    float _769 = _759 - _760;
    float4 _771 = _UserLut.SampleLevel(sampler_UserLut, float2((_768 + _UserLut_Params.y), _766), 0.0f);
    float4 _775 = _UserLut.SampleLevel(sampler_UserLut, float2(_768, _766), 0.0f);
    float _794 = (((_775.x - _753) + ((_771.x - _775.x) * _769)) * _UserLut_Params.w) + _753;
    float _795 = (((_775.y - _754) + ((_771.y - _775.y) * _769)) * _UserLut_Params.w) + _754;
    float _796 = (((_775.z - _755) + ((_771.z - _775.z) * _769)) * _UserLut_Params.w) + _755;
    _825 = select((_794 <= 0.040449999272823334f), (_794 * 0.07739938050508499f), exp2(log2(abs((_794 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
    _826 = select((_795 <= 0.040449999272823334f), (_795 * 0.07739938050508499f), exp2(log2(abs((_795 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
    _827 = select((_796 <= 0.040449999272823334f), (_796 * 0.07739938050508499f), exp2(log2(abs((_796 + 0.054999999701976776f) * 0.9478673338890076f)) * 2.4000000953674316f));
  } else {
    _825 = _675;
    _826 = _698;
    _827 = _721;
  }
  float _831 = ((_826 + _825) + _827) * 0.3333333432674408f;
  SV_Target.x = saturate(lerp(_831, _825, _Desaturate));
  SV_Target.y = saturate(lerp(_831, _826, _Desaturate));
  SV_Target.z = saturate(lerp(_831, _827, _Desaturate));
  SV_Target.w = 1.0f;
  return SV_Target;
}
