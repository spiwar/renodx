#include "../../tonemap.hlsl"

Texture2D<float4> _CameraDepthTexture : register(t0);

Texture2D<float4> _VR_SourceImage : register(t1);

Texture2D<float4> _VRTextureSheetTex : register(t2);

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
};

cbuffer VREffectsCBuffer : register(b1) {
  float4 _HSVParams : packoffset(c000.x);
  float4 _ContrastParams : packoffset(c001.x);
  float4 _ColorTintNear : packoffset(c002.x);
  float4 _ColorTintFar : packoffset(c003.x);
  float4 _ScanlineParams : packoffset(c004.x);
  float4 _SliceParams : packoffset(c005.x);
  float4 _SliceColorA : packoffset(c006.x);
  float4 _SliceColorB : packoffset(c007.x);
  float4 _SliceBlendModes : packoffset(c008.x);
  float4 _ScanStart : packoffset(c009.x);
  float4 _ScanEnd : packoffset(c010.x);
  float4 _ScanStartInvSoftness : packoffset(c011.x);
  float4 _ScanEndInvSoftness : packoffset(c012.x);
  float4 _ScanBlendModes : packoffset(c013.x);
  float4 _ScanColor0 : packoffset(c014.x);
  float4 _ScanColor0End : packoffset(c015.x);
  float4 _ScanColor1 : packoffset(c016.x);
  float4 _ScanColor1End : packoffset(c017.x);
  float4 _ScanColor2 : packoffset(c018.x);
  float4 _ScanColor2End : packoffset(c019.x);
  float4 _ScanColor3 : packoffset(c020.x);
  float4 _ScanColor3End : packoffset(c021.x);
  float4 _RGBSeparateParams0 : packoffset(c022.x);
  float4 _RGBSeparateParams1 : packoffset(c023.x);
  float4 _ColorR : packoffset(c024.x);
  float4 _ColorG : packoffset(c025.x);
  float4 _ColorB : packoffset(c026.x);
  float4 _GridParams : packoffset(c027.x);
  float4 _GridColor : packoffset(c028.x);
  float4 _TextureSheetParams : packoffset(c029.x);
  float4 _TextureSheetColor : packoffset(c030.x);
  float4 _CustomScanParams : packoffset(c031.x);
  float4 _LocalInvViewProjMatrix[4] : packoffset(c032.x);
  float4 _Distortion_Params1 : packoffset(c036.x);
  float4 _Distortion_Params2 : packoffset(c037.x);
  float4 _DistortionRgbShift : packoffset(c038.x);
  float4 _ScanMaskTexChannel : packoffset(c039.x);
  float4 _ScanMaskTexTilingOffset : packoffset(c040.x);
  float4 _ScanMaskIntensities : packoffset(c041.x);
  float4 _ScanMaskUVSpeedAndYFade : packoffset(c042.x);
};

SamplerState s_point_clamp_sampler : register(s0);

SamplerState s_linear_repeat_sampler : register(s1);

float4 main(
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float _16 = fmod(((_ScreenSize.y * TEXCOORD.y) * _ScanlineParams.x), 2.0f);
  float _19 = select((_16 > 1.0f), (2.0f - _16), _16);
  float _24 = (((_19 * 2.0f) + -1.0f) * _ScanlineParams.z) + TEXCOORD.x;
  float _27 = _ScreenSize.w * _ScreenSize.x;
  bool _42 = ((frac((((_24 + abs(_SliceParams.y)) * _27) - (_SliceParams.y * TEXCOORD.y)) / ((_27 * 2.0f) * _SliceParams.x)) * 2.0f) <= 1.0f);
  float _45 = (select(_42, 0.9999899864196777f, -1.0f) * _SliceParams.z) + TEXCOORD.y;
  float _50 = select(_42, select((_45 < 1.0f), 0.0f, 1.0f), select((_45 > 0.0f), 0.0f, 1.0f));
  //float4 _VR_SourceImage0 = _VR_SourceImage.Sample(s_linear_repeat_sampler, float2(_24, _45));
  float4 _VR_SourceImage0 = renodx::draw::InvertIntermediatePass(_VR_SourceImage.Sample(s_linear_repeat_sampler, float2(_24, _45)));
  float4 untonemapped = _VR_SourceImage0;
  _VR_SourceImage0.xyz = renodx::tonemap::renodrt::NeutralSDR(_VR_SourceImage0.xyz);
  float _59 = _24 - _TaaJitterStrength.z;
  float _60 = _45 - _TaaJitterStrength.w;
  float4 _61 = _CameraDepthTexture.SampleLevel(s_point_clamp_sampler, float2(_59, _60), 0.0f);
  float _85 = (_59 * 2.0f) + -1.0f;
  float _87 = -0.0f - ((_60 * 2.0f) + -1.0f);
  float _103 = mad((_InvViewProjMatrix[2].w), _61.x, mad((_InvViewProjMatrix[1].w), _87, ((_InvViewProjMatrix[0].w) * _85))) + (_InvViewProjMatrix[3].w);
  float _111 = ((mad((_InvViewProjMatrix[2].x), _61.x, mad((_InvViewProjMatrix[1].x), _87, ((_InvViewProjMatrix[0].x) * _85))) + (_InvViewProjMatrix[3].x)) / _103) - _WorldSpaceCameraPos.x;
  float _112 = ((mad((_InvViewProjMatrix[2].y), _61.x, mad((_InvViewProjMatrix[1].y), _87, ((_InvViewProjMatrix[0].y) * _85))) + (_InvViewProjMatrix[3].y)) / _103) - _WorldSpaceCameraPos.y;
  float _113 = ((mad((_InvViewProjMatrix[2].z), _61.x, mad((_InvViewProjMatrix[1].z), _87, ((_InvViewProjMatrix[0].z) * _85))) + (_InvViewProjMatrix[3].z)) / _103) - _WorldSpaceCameraPos.z;
  float _135 = select((_CustomScanParams.w > 0.5f), select((sqrt(((_111 * _111) + (_112 * _112)) + (_113 * _113)) > 2000.0f), 0.0f, max(0.0f, dot(float2(_111, _113), float2(_CustomScanParams.x, _CustomScanParams.y)))), (1.0f / ((_ZBufferParams.z * _61.x) + _ZBufferParams.w)));
  float _141 = saturate((_135 - _ContrastParams.z) * _ContrastParams.w);
  float _163 = ((_ColorTintFar.w - _ColorTintNear.w) * _141) + _ColorTintNear.w;
  float _165 = select((_VR_SourceImage0.y < _VR_SourceImage0.z), 0.0f, 1.0f);
  float _170 = (_165 * (_VR_SourceImage0.y - _VR_SourceImage0.z)) + _VR_SourceImage0.z;
  float _171 = (_165 * (_VR_SourceImage0.z - _VR_SourceImage0.y)) + _VR_SourceImage0.y;
  float _173 = 0.6666666865348816f - _165;
  float _175 = select((_VR_SourceImage0.x < _170), 0.0f, 1.0f);
  float _182 = (_175 * (_VR_SourceImage0.x - _170)) + _170;
  float _184 = (_175 * (_170 - _VR_SourceImage0.x)) + _VR_SourceImage0.x;
  float _186 = _182 - min(_184, _171);
  float _199 = _HSVParams.x + abs(((_175 * ((_165 + -1.0f) - _173)) + _173) + ((_184 - _171) / ((_186 * 6.0f) + 9.999999747378752e-05f)));
  float _204 = saturate((_HSVParams.y + (_186 / (_182 + 9.999999747378752e-05f))) * (1.0f - _163));
  float _205 = saturate(_HSVParams.z + _182);
  float _247 = ((((((saturate(abs((frac(_199 + 1.0f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _204) + 1.0f) * _205) - _ContrastParams.y) * _ContrastParams.x) + _ContrastParams.y;
  float _248 = ((((((saturate(abs((frac(_199 + 0.6666666865348816f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _204) + 1.0f) * _205) - _ContrastParams.y) * _ContrastParams.x) + _ContrastParams.y;
  float _249 = ((((((saturate(abs((frac(_199 + 0.3333333432674408f) * 6.0f) + -3.0f) + -1.0f) + -1.0f) * _204) + 1.0f) * _205) - _ContrastParams.y) * _ContrastParams.x) + _ContrastParams.y;
  float _ColorTintedX = (((_247 * (lerp(_ColorTintNear.x, _ColorTintFar.x, _141))) - _247) * _163) + _247;
  float _ColorTintedY = (((_248 * (lerp(_ColorTintNear.y, _ColorTintFar.y, _141))) - _248) * _163) + _248;
  float _ColorTintedZ = (((_249 * (lerp(_ColorTintNear.z, _ColorTintFar.z, _141))) - _249) * _163) + _249;
  float _269 = _SliceColorA.w * _50;
  float _553;
  float _554;
  float _555;
  float _847;
  float _848;
  float _849;
  float _1279;
  float _1280;
  float _1281;
  float _1566;
  float _1567;
  float _1568;
  float _1853;
  float _1854;
  float _1855;
  float _2140;
  float _2141;
  float _2142;
  float _2264;
  float _2265;
  float _2266;
  [branch]
  if (_SliceBlendModes.x < 0.5f) {
    _553 = (lerp(_ColorTintedX, _SliceColorA.x, _269));
    _554 = (lerp(_ColorTintedY, _SliceColorA.y, _269));
    _555 = (lerp(_ColorTintedZ, _SliceColorA.z, _269));
  } else {
    if (_SliceBlendModes.x < 1.5f) {
      _553 = (_ColorTintedX + (_269 * _SliceColorA.x));
      _554 = (_ColorTintedY + (_269 * _SliceColorA.y));
      _555 = (_ColorTintedZ + (_269 * _SliceColorA.z));
    } else {
      if (_SliceBlendModes.x < 2.5f) {
        float _317 = select((_ColorTintedX > 1.0f), _ColorTintedX, saturate((exp2(log2(abs(_ColorTintedX)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _318 = select((_ColorTintedY > 1.0f), _ColorTintedY, saturate((exp2(log2(abs(_ColorTintedY)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _319 = select((_ColorTintedZ > 1.0f), _ColorTintedZ, saturate((exp2(log2(abs(_ColorTintedZ)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _350 = (select((_SliceColorA.x > 1.0f), _SliceColorA.x, saturate((exp2(log2(abs(_SliceColorA.x)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _269;
        float _351 = (select((_SliceColorA.y > 1.0f), _SliceColorA.y, saturate((exp2(log2(abs(_SliceColorA.y)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _269;
        float _352 = (select((_SliceColorA.z > 1.0f), _SliceColorA.z, saturate((exp2(log2(abs(_SliceColorA.z)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _269;
        float _356 = (_350 + 0.5f) * 2.0f;
        float _357 = (_351 + 0.5f) * 2.0f;
        float _358 = (_352 + 0.5f) * 2.0f;
        float _366 = (lerp(_356, 1.0f, _317)) * _317;
        float _368 = (lerp(_357, 1.0f, _318)) * _318;
        float _370 = (lerp(_358, 1.0f, _319)) * _319;
        float _404 = (((((_356 + -1.0f) * sqrt(_317)) + ((_317 * 2.0f) * (0.5f - _350))) - _366) * select((_317 < 0.5f), 0.0f, 1.0f)) + _366;
        float _405 = (((((_357 + -1.0f) * sqrt(_318)) + ((_318 * 2.0f) * (0.5f - _351))) - _368) * select((_318 < 0.5f), 0.0f, 1.0f)) + _368;
        float _406 = (((((_358 + -1.0f) * sqrt(_319)) + ((_319 * 2.0f) * (0.5f - _352))) - _370) * select((_319 < 0.5f), 0.0f, 1.0f)) + _370;
        _553 = (((((_404 * 0.30530601739883423f) + 0.682171106338501f) * _404) + 0.012522878125309944f) * _404);
        _554 = (((((_405 * 0.30530601739883423f) + 0.682171106338501f) * _405) + 0.012522878125309944f) * _405);
        _555 = (((((_406 * 0.30530601739883423f) + 0.682171106338501f) * _406) + 0.012522878125309944f) * _406);
      } else {
        if (_SliceBlendModes.x < 3.5f) {
          float _449 = select((_ColorTintedX > 1.0f), _ColorTintedX, saturate((exp2(log2(abs(_ColorTintedX)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _450 = select((_ColorTintedY > 1.0f), _ColorTintedY, saturate((exp2(log2(abs(_ColorTintedY)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _451 = select((_ColorTintedZ > 1.0f), _ColorTintedZ, saturate((exp2(log2(abs(_ColorTintedZ)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _482 = (select((_SliceColorA.x > 1.0f), _SliceColorA.x, saturate((exp2(log2(abs(_SliceColorA.x)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _269;
          float _483 = (select((_SliceColorA.y > 1.0f), _SliceColorA.y, saturate((exp2(log2(abs(_SliceColorA.y)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _269;
          float _484 = (select((_SliceColorA.z > 1.0f), _SliceColorA.z, saturate((exp2(log2(abs(_SliceColorA.z)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _269;
          float _491 = (_449 * 2.0f) * (_482 + 0.5f);
          float _492 = (_450 * 2.0f) * (_483 + 0.5f);
          float _493 = (_451 * 2.0f) * (_484 + 0.5f);
          float _521 = (((1.0f - (((1.0f - _449) * 2.0f) * (0.5f - _482))) - _491) * select((_449 < 0.5f), 0.0f, 1.0f)) + _491;
          float _522 = (((1.0f - (((1.0f - _450) * 2.0f) * (0.5f - _483))) - _492) * select((_450 < 0.5f), 0.0f, 1.0f)) + _492;
          float _523 = (((1.0f - (((1.0f - _451) * 2.0f) * (0.5f - _484))) - _493) * select((_451 < 0.5f), 0.0f, 1.0f)) + _493;
          _553 = (((((_521 * 0.30530601739883423f) + 0.682171106338501f) * _521) + 0.012522878125309944f) * _521);
          _554 = (((((_522 * 0.30530601739883423f) + 0.682171106338501f) * _522) + 0.012522878125309944f) * _522);
          _555 = (((((_523 * 0.30530601739883423f) + 0.682171106338501f) * _523) + 0.012522878125309944f) * _523);
        } else {
          _553 = (_ColorTintedX * ((_269 * (_SliceColorA.x + -1.0f)) + 1.0f));
          _554 = (_ColorTintedY * ((_269 * (_SliceColorA.y + -1.0f)) + 1.0f));
          _555 = (_ColorTintedZ * ((_269 * (_SliceColorA.z + -1.0f)) + 1.0f));
        }
      }
    }
  }
  float _563 = _SliceColorB.w * (1.0f - _50);
  [branch]
  if (_SliceBlendModes.y < 0.5f) {
    _847 = ((_563 * (_SliceColorB.x - _553)) + _553);
    _848 = ((_563 * (_SliceColorB.y - _554)) + _554);
    _849 = ((_563 * (_SliceColorB.z - _555)) + _555);
  } else {
    if (_SliceBlendModes.y < 1.5f) {
      _847 = ((_563 * _SliceColorB.x) + _553);
      _848 = ((_563 * _SliceColorB.y) + _554);
      _849 = ((_563 * _SliceColorB.z) + _555);
    } else {
      if (_SliceBlendModes.y < 2.5f) {
        float _611 = select((_553 > 1.0f), _553, saturate((exp2(log2(abs(_553)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _612 = select((_554 > 1.0f), _554, saturate((exp2(log2(abs(_554)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _613 = select((_555 > 1.0f), _555, saturate((exp2(log2(abs(_555)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _644 = (select((_SliceColorB.x > 1.0f), _SliceColorB.x, saturate((exp2(log2(abs(_SliceColorB.x)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _563;
        float _645 = (select((_SliceColorB.y > 1.0f), _SliceColorB.y, saturate((exp2(log2(abs(_SliceColorB.y)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _563;
        float _646 = (select((_SliceColorB.z > 1.0f), _SliceColorB.z, saturate((exp2(log2(abs(_SliceColorB.z)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _563;
        float _650 = (_644 + 0.5f) * 2.0f;
        float _651 = (_645 + 0.5f) * 2.0f;
        float _652 = (_646 + 0.5f) * 2.0f;
        float _660 = (lerp(_650, 1.0f, _611)) * _611;
        float _662 = (lerp(_651, 1.0f, _612)) * _612;
        float _664 = (lerp(_652, 1.0f, _613)) * _613;
        float _698 = (((((_650 + -1.0f) * sqrt(_611)) + ((_611 * 2.0f) * (0.5f - _644))) - _660) * select((_611 < 0.5f), 0.0f, 1.0f)) + _660;
        float _699 = (((((_651 + -1.0f) * sqrt(_612)) + ((_612 * 2.0f) * (0.5f - _645))) - _662) * select((_612 < 0.5f), 0.0f, 1.0f)) + _662;
        float _700 = (((((_652 + -1.0f) * sqrt(_613)) + ((_613 * 2.0f) * (0.5f - _646))) - _664) * select((_613 < 0.5f), 0.0f, 1.0f)) + _664;
        _847 = (((((_698 * 0.30530601739883423f) + 0.682171106338501f) * _698) + 0.012522878125309944f) * _698);
        _848 = (((((_699 * 0.30530601739883423f) + 0.682171106338501f) * _699) + 0.012522878125309944f) * _699);
        _849 = (((((_700 * 0.30530601739883423f) + 0.682171106338501f) * _700) + 0.012522878125309944f) * _700);
      } else {
        if (_SliceBlendModes.y < 3.5f) {
          float _743 = select((_553 > 1.0f), _553, saturate((exp2(log2(abs(_553)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _744 = select((_554 > 1.0f), _554, saturate((exp2(log2(abs(_554)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _745 = select((_555 > 1.0f), _555, saturate((exp2(log2(abs(_555)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _776 = (select((_SliceColorB.x > 1.0f), _SliceColorB.x, saturate((exp2(log2(abs(_SliceColorB.x)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _563;
          float _777 = (select((_SliceColorB.y > 1.0f), _SliceColorB.y, saturate((exp2(log2(abs(_SliceColorB.y)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _563;
          float _778 = (select((_SliceColorB.z > 1.0f), _SliceColorB.z, saturate((exp2(log2(abs(_SliceColorB.z)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _563;
          float _785 = (_743 * 2.0f) * (_776 + 0.5f);
          float _786 = (_744 * 2.0f) * (_777 + 0.5f);
          float _787 = (_745 * 2.0f) * (_778 + 0.5f);
          float _815 = (((1.0f - (((1.0f - _743) * 2.0f) * (0.5f - _776))) - _785) * select((_743 < 0.5f), 0.0f, 1.0f)) + _785;
          float _816 = (((1.0f - (((1.0f - _744) * 2.0f) * (0.5f - _777))) - _786) * select((_744 < 0.5f), 0.0f, 1.0f)) + _786;
          float _817 = (((1.0f - (((1.0f - _745) * 2.0f) * (0.5f - _778))) - _787) * select((_745 < 0.5f), 0.0f, 1.0f)) + _787;
          _847 = (((((_815 * 0.30530601739883423f) + 0.682171106338501f) * _815) + 0.012522878125309944f) * _815);
          _848 = (((((_816 * 0.30530601739883423f) + 0.682171106338501f) * _816) + 0.012522878125309944f) * _816);
          _849 = (((((_817 * 0.30530601739883423f) + 0.682171106338501f) * _817) + 0.012522878125309944f) * _817);
        } else {
          _847 = (((_563 * (_SliceColorB.x + -1.0f)) + 1.0f) * _553);
          _848 = (((_563 * (_SliceColorB.y + -1.0f)) + 1.0f) * _554);
          _849 = (((_563 * (_SliceColorB.z + -1.0f)) + 1.0f) * _555);
        }
      }
    }
  }
  float _877 = _135 - _ScanStart.x;
  float _878 = _135 - _ScanStart.y;
  float _879 = _135 - _ScanStart.z;
  float _880 = _135 - _ScanStart.w;
  float _912 = _ScanColor0End.w * saturate(_877 / (_ScanEnd.x - _ScanStart.x));
  float _926 = ((_ScanColor0End.x - _ScanColor0.x) * _912) + _ScanColor0.x;
  float _927 = ((_ScanColor0End.y - _ScanColor0.y) * _912) + _ScanColor0.y;
  float _928 = ((_ScanColor0End.z - _ScanColor0.z) * _912) + _ScanColor0.z;
  float _930 = _ScanColor0.w * min(saturate(_877 * _ScanStartInvSoftness.x), saturate((_ScanEnd.x - _135) * _ScanEndInvSoftness.x));
  float _933 = _ScanColor1End.w * saturate(_878 / (_ScanEnd.y - _ScanStart.y));
  float _947 = ((_ScanColor1End.x - _ScanColor1.x) * _933) + _ScanColor1.x;
  float _948 = ((_ScanColor1End.y - _ScanColor1.y) * _933) + _ScanColor1.y;
  float _949 = ((_ScanColor1End.z - _ScanColor1.z) * _933) + _ScanColor1.z;
  float _951 = _ScanColor1.w * min(saturate(_878 * _ScanStartInvSoftness.y), saturate((_ScanEnd.y - _135) * _ScanEndInvSoftness.y));
  float _954 = _ScanColor2End.w * saturate(_879 / (_ScanEnd.z - _ScanStart.z));
  float _968 = ((_ScanColor2End.x - _ScanColor2.x) * _954) + _ScanColor2.x;
  float _969 = ((_ScanColor2End.y - _ScanColor2.y) * _954) + _ScanColor2.y;
  float _970 = ((_ScanColor2End.z - _ScanColor2.z) * _954) + _ScanColor2.z;
  float _972 = _ScanColor2.w * min(saturate(_879 * _ScanStartInvSoftness.z), saturate((_ScanEnd.z - _135) * _ScanEndInvSoftness.z));
  float _975 = _ScanColor3End.w * saturate(_880 / (_ScanEnd.w - _ScanStart.w));
  float _989 = ((_ScanColor3End.x - _ScanColor3.x) * _975) + _ScanColor3.x;
  float _990 = ((_ScanColor3End.y - _ScanColor3.y) * _975) + _ScanColor3.y;
  float _991 = ((_ScanColor3End.z - _ScanColor3.z) * _975) + _ScanColor3.z;
  float _993 = _ScanColor3.w * min(saturate(_880 * _ScanStartInvSoftness.w), saturate((_ScanEnd.w - _135) * _ScanEndInvSoftness.w));
  [branch]
  if (_ScanBlendModes.x < 0.5f) {
    _1279 = (lerp(_847, _926, _930));
    _1280 = (lerp(_848, _927, _930));
    _1281 = (lerp(_849, _928, _930));
  } else {
    if (_ScanBlendModes.x < 1.5f) {
      _1279 = ((_926 * _930) + _847);
      _1280 = ((_927 * _930) + _848);
      _1281 = ((_928 * _930) + _849);
    } else {
      if (_ScanBlendModes.x < 2.5f) {
        float _1043 = select((_847 > 1.0f), _847, saturate((exp2(log2(abs(_847)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1044 = select((_848 > 1.0f), _848, saturate((exp2(log2(abs(_848)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1045 = select((_849 > 1.0f), _849, saturate((exp2(log2(abs(_849)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1076 = (select((_926 > 1.0f), _926, saturate((exp2(log2(abs(_926)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _930;
        float _1077 = (select((_927 > 1.0f), _927, saturate((exp2(log2(abs(_927)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _930;
        float _1078 = (select((_928 > 1.0f), _928, saturate((exp2(log2(abs(_928)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _930;
        float _1082 = (_1076 + 0.5f) * 2.0f;
        float _1083 = (_1077 + 0.5f) * 2.0f;
        float _1084 = (_1078 + 0.5f) * 2.0f;
        float _1092 = (lerp(_1082, 1.0f, _1043)) * _1043;
        float _1094 = (lerp(_1083, 1.0f, _1044)) * _1044;
        float _1096 = (lerp(_1084, 1.0f, _1045)) * _1045;
        float _1130 = (((((_1082 + -1.0f) * sqrt(_1043)) + ((_1043 * 2.0f) * (0.5f - _1076))) - _1092) * select((_1043 < 0.5f), 0.0f, 1.0f)) + _1092;
        float _1131 = (((((_1083 + -1.0f) * sqrt(_1044)) + ((_1044 * 2.0f) * (0.5f - _1077))) - _1094) * select((_1044 < 0.5f), 0.0f, 1.0f)) + _1094;
        float _1132 = (((((_1084 + -1.0f) * sqrt(_1045)) + ((_1045 * 2.0f) * (0.5f - _1078))) - _1096) * select((_1045 < 0.5f), 0.0f, 1.0f)) + _1096;
        _1279 = (((((_1130 * 0.30530601739883423f) + 0.682171106338501f) * _1130) + 0.012522878125309944f) * _1130);
        _1280 = (((((_1131 * 0.30530601739883423f) + 0.682171106338501f) * _1131) + 0.012522878125309944f) * _1131);
        _1281 = (((((_1132 * 0.30530601739883423f) + 0.682171106338501f) * _1132) + 0.012522878125309944f) * _1132);
      } else {
        if (_ScanBlendModes.x < 3.5f) {
          float _1175 = select((_847 > 1.0f), _847, saturate((exp2(log2(abs(_847)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _1176 = select((_848 > 1.0f), _848, saturate((exp2(log2(abs(_848)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _1177 = select((_849 > 1.0f), _849, saturate((exp2(log2(abs(_849)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _1208 = (select((_926 > 1.0f), _926, saturate((exp2(log2(abs(_926)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _930;
          float _1209 = (select((_927 > 1.0f), _927, saturate((exp2(log2(abs(_927)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _930;
          float _1210 = (select((_928 > 1.0f), _928, saturate((exp2(log2(abs(_928)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _930;
          float _1217 = (_1175 * 2.0f) * (_1208 + 0.5f);
          float _1218 = (_1176 * 2.0f) * (_1209 + 0.5f);
          float _1219 = (_1177 * 2.0f) * (_1210 + 0.5f);
          float _1247 = (((1.0f - (((1.0f - _1175) * 2.0f) * (0.5f - _1208))) - _1217) * select((_1175 < 0.5f), 0.0f, 1.0f)) + _1217;
          float _1248 = (((1.0f - (((1.0f - _1176) * 2.0f) * (0.5f - _1209))) - _1218) * select((_1176 < 0.5f), 0.0f, 1.0f)) + _1218;
          float _1249 = (((1.0f - (((1.0f - _1177) * 2.0f) * (0.5f - _1210))) - _1219) * select((_1177 < 0.5f), 0.0f, 1.0f)) + _1219;
          _1279 = (((((_1247 * 0.30530601739883423f) + 0.682171106338501f) * _1247) + 0.012522878125309944f) * _1247);
          _1280 = (((((_1248 * 0.30530601739883423f) + 0.682171106338501f) * _1248) + 0.012522878125309944f) * _1248);
          _1281 = (((((_1249 * 0.30530601739883423f) + 0.682171106338501f) * _1249) + 0.012522878125309944f) * _1249);
        } else {
          _1279 = ((((_926 + -1.0f) * _930) + 1.0f) * _847);
          _1280 = ((((_927 + -1.0f) * _930) + 1.0f) * _848);
          _1281 = ((((_928 + -1.0f) * _930) + 1.0f) * _849);
        }
      }
    }
  }
  [branch]
  if (_ScanBlendModes.y < 0.5f) {
    _1566 = (lerp(_1279, _947, _951));
    _1567 = (lerp(_1280, _948, _951));
    _1568 = (lerp(_1281, _949, _951));
  } else {
    if (_ScanBlendModes.y < 1.5f) {
      _1566 = (_1279 + (_947 * _951));
      _1567 = (_1280 + (_948 * _951));
      _1568 = (_1281 + (_949 * _951));
    } else {
      if (_ScanBlendModes.y < 2.5f) {
        float _1330 = select((_1279 > 1.0f), _1279, saturate((exp2(log2(abs(_1279)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1331 = select((_1280 > 1.0f), _1280, saturate((exp2(log2(abs(_1280)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1332 = select((_1281 > 1.0f), _1281, saturate((exp2(log2(abs(_1281)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1363 = (select((_947 > 1.0f), _947, saturate((exp2(log2(abs(_947)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _951;
        float _1364 = (select((_948 > 1.0f), _948, saturate((exp2(log2(abs(_948)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _951;
        float _1365 = (select((_949 > 1.0f), _949, saturate((exp2(log2(abs(_949)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _951;
        float _1369 = (_1363 + 0.5f) * 2.0f;
        float _1370 = (_1364 + 0.5f) * 2.0f;
        float _1371 = (_1365 + 0.5f) * 2.0f;
        float _1379 = (lerp(_1369, 1.0f, _1330)) * _1330;
        float _1381 = (lerp(_1370, 1.0f, _1331)) * _1331;
        float _1383 = (lerp(_1371, 1.0f, _1332)) * _1332;
        float _1417 = (((((_1369 + -1.0f) * sqrt(_1330)) + ((_1330 * 2.0f) * (0.5f - _1363))) - _1379) * select((_1330 < 0.5f), 0.0f, 1.0f)) + _1379;
        float _1418 = (((((_1370 + -1.0f) * sqrt(_1331)) + ((_1331 * 2.0f) * (0.5f - _1364))) - _1381) * select((_1331 < 0.5f), 0.0f, 1.0f)) + _1381;
        float _1419 = (((((_1371 + -1.0f) * sqrt(_1332)) + ((_1332 * 2.0f) * (0.5f - _1365))) - _1383) * select((_1332 < 0.5f), 0.0f, 1.0f)) + _1383;
        _1566 = (((((_1417 * 0.30530601739883423f) + 0.682171106338501f) * _1417) + 0.012522878125309944f) * _1417);
        _1567 = (((((_1418 * 0.30530601739883423f) + 0.682171106338501f) * _1418) + 0.012522878125309944f) * _1418);
        _1568 = (((((_1419 * 0.30530601739883423f) + 0.682171106338501f) * _1419) + 0.012522878125309944f) * _1419);
      } else {
        if (_ScanBlendModes.y < 3.5f) {
          float _1462 = select((_1279 > 1.0f), _1279, saturate((exp2(log2(abs(_1279)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _1463 = select((_1280 > 1.0f), _1280, saturate((exp2(log2(abs(_1280)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _1464 = select((_1281 > 1.0f), _1281, saturate((exp2(log2(abs(_1281)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _1495 = (select((_947 > 1.0f), _947, saturate((exp2(log2(abs(_947)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _951;
          float _1496 = (select((_948 > 1.0f), _948, saturate((exp2(log2(abs(_948)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _951;
          float _1497 = (select((_949 > 1.0f), _949, saturate((exp2(log2(abs(_949)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _951;
          float _1504 = (_1462 * 2.0f) * (_1495 + 0.5f);
          float _1505 = (_1463 * 2.0f) * (_1496 + 0.5f);
          float _1506 = (_1464 * 2.0f) * (_1497 + 0.5f);
          float _1534 = (((1.0f - (((1.0f - _1462) * 2.0f) * (0.5f - _1495))) - _1504) * select((_1462 < 0.5f), 0.0f, 1.0f)) + _1504;
          float _1535 = (((1.0f - (((1.0f - _1463) * 2.0f) * (0.5f - _1496))) - _1505) * select((_1463 < 0.5f), 0.0f, 1.0f)) + _1505;
          float _1536 = (((1.0f - (((1.0f - _1464) * 2.0f) * (0.5f - _1497))) - _1506) * select((_1464 < 0.5f), 0.0f, 1.0f)) + _1506;
          _1566 = (((((_1534 * 0.30530601739883423f) + 0.682171106338501f) * _1534) + 0.012522878125309944f) * _1534);
          _1567 = (((((_1535 * 0.30530601739883423f) + 0.682171106338501f) * _1535) + 0.012522878125309944f) * _1535);
          _1568 = (((((_1536 * 0.30530601739883423f) + 0.682171106338501f) * _1536) + 0.012522878125309944f) * _1536);
        } else {
          _1566 = (_1279 * (((_947 + -1.0f) * _951) + 1.0f));
          _1567 = (_1280 * (((_948 + -1.0f) * _951) + 1.0f));
          _1568 = (_1281 * (((_949 + -1.0f) * _951) + 1.0f));
        }
      }
    }
  }
  [branch]
  if (_ScanBlendModes.z < 0.5f) {
    _1853 = (lerp(_1566, _968, _972));
    _1854 = (lerp(_1567, _969, _972));
    _1855 = (lerp(_1568, _970, _972));
  } else {
    if (_ScanBlendModes.z < 1.5f) {
      _1853 = (_1566 + (_968 * _972));
      _1854 = (_1567 + (_969 * _972));
      _1855 = (_1568 + (_970 * _972));
    } else {
      if (_ScanBlendModes.z < 2.5f) {
        float _1617 = select((_1566 > 1.0f), _1566, saturate((exp2(log2(abs(_1566)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1618 = select((_1567 > 1.0f), _1567, saturate((exp2(log2(abs(_1567)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1619 = select((_1568 > 1.0f), _1568, saturate((exp2(log2(abs(_1568)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1650 = (select((_968 > 1.0f), _968, saturate((exp2(log2(abs(_968)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _972;
        float _1651 = (select((_969 > 1.0f), _969, saturate((exp2(log2(abs(_969)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _972;
        float _1652 = (select((_970 > 1.0f), _970, saturate((exp2(log2(abs(_970)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _972;
        float _1656 = (_1650 + 0.5f) * 2.0f;
        float _1657 = (_1651 + 0.5f) * 2.0f;
        float _1658 = (_1652 + 0.5f) * 2.0f;
        float _1666 = (lerp(_1656, 1.0f, _1617)) * _1617;
        float _1668 = (lerp(_1657, 1.0f, _1618)) * _1618;
        float _1670 = (lerp(_1658, 1.0f, _1619)) * _1619;
        float _1704 = (((((_1656 + -1.0f) * sqrt(_1617)) + ((_1617 * 2.0f) * (0.5f - _1650))) - _1666) * select((_1617 < 0.5f), 0.0f, 1.0f)) + _1666;
        float _1705 = (((((_1657 + -1.0f) * sqrt(_1618)) + ((_1618 * 2.0f) * (0.5f - _1651))) - _1668) * select((_1618 < 0.5f), 0.0f, 1.0f)) + _1668;
        float _1706 = (((((_1658 + -1.0f) * sqrt(_1619)) + ((_1619 * 2.0f) * (0.5f - _1652))) - _1670) * select((_1619 < 0.5f), 0.0f, 1.0f)) + _1670;
        _1853 = (((((_1704 * 0.30530601739883423f) + 0.682171106338501f) * _1704) + 0.012522878125309944f) * _1704);
        _1854 = (((((_1705 * 0.30530601739883423f) + 0.682171106338501f) * _1705) + 0.012522878125309944f) * _1705);
        _1855 = (((((_1706 * 0.30530601739883423f) + 0.682171106338501f) * _1706) + 0.012522878125309944f) * _1706);
      } else {
        if (_ScanBlendModes.z < 3.5f) {
          float _1749 = select((_1566 > 1.0f), _1566, saturate((exp2(log2(abs(_1566)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _1750 = select((_1567 > 1.0f), _1567, saturate((exp2(log2(abs(_1567)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _1751 = select((_1568 > 1.0f), _1568, saturate((exp2(log2(abs(_1568)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _1782 = (select((_968 > 1.0f), _968, saturate((exp2(log2(abs(_968)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _972;
          float _1783 = (select((_969 > 1.0f), _969, saturate((exp2(log2(abs(_969)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _972;
          float _1784 = (select((_970 > 1.0f), _970, saturate((exp2(log2(abs(_970)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _972;
          float _1791 = (_1749 * 2.0f) * (_1782 + 0.5f);
          float _1792 = (_1750 * 2.0f) * (_1783 + 0.5f);
          float _1793 = (_1751 * 2.0f) * (_1784 + 0.5f);
          float _1821 = (((1.0f - (((1.0f - _1749) * 2.0f) * (0.5f - _1782))) - _1791) * select((_1749 < 0.5f), 0.0f, 1.0f)) + _1791;
          float _1822 = (((1.0f - (((1.0f - _1750) * 2.0f) * (0.5f - _1783))) - _1792) * select((_1750 < 0.5f), 0.0f, 1.0f)) + _1792;
          float _1823 = (((1.0f - (((1.0f - _1751) * 2.0f) * (0.5f - _1784))) - _1793) * select((_1751 < 0.5f), 0.0f, 1.0f)) + _1793;
          _1853 = (((((_1821 * 0.30530601739883423f) + 0.682171106338501f) * _1821) + 0.012522878125309944f) * _1821);
          _1854 = (((((_1822 * 0.30530601739883423f) + 0.682171106338501f) * _1822) + 0.012522878125309944f) * _1822);
          _1855 = (((((_1823 * 0.30530601739883423f) + 0.682171106338501f) * _1823) + 0.012522878125309944f) * _1823);
        } else {
          _1853 = (_1566 * (((_968 + -1.0f) * _972) + 1.0f));
          _1854 = (_1567 * (((_969 + -1.0f) * _972) + 1.0f));
          _1855 = (_1568 * (((_970 + -1.0f) * _972) + 1.0f));
        }
      }
    }
  }
  [branch]
  if (_ScanBlendModes.w < 0.5f) {
    _2140 = (lerp(_1853, _989, _993));
    _2141 = (lerp(_1854, _990, _993));
    _2142 = (lerp(_1855, _991, _993));
  } else {
    if (_ScanBlendModes.w < 1.5f) {
      _2140 = (_1853 + (_989 * _993));
      _2141 = (_1854 + (_990 * _993));
      _2142 = (_1855 + (_991 * _993));
    } else {
      if (_ScanBlendModes.w < 2.5f) {
        float _1904 = select((_1853 > 1.0f), _1853, saturate((exp2(log2(abs(_1853)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1905 = select((_1854 > 1.0f), _1854, saturate((exp2(log2(abs(_1854)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1906 = select((_1855 > 1.0f), _1855, saturate((exp2(log2(abs(_1855)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
        float _1937 = (select((_989 > 1.0f), _989, saturate((exp2(log2(abs(_989)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _993;
        float _1938 = (select((_990 > 1.0f), _990, saturate((exp2(log2(abs(_990)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _993;
        float _1939 = (select((_991 > 1.0f), _991, saturate((exp2(log2(abs(_991)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _993;
        float _1943 = (_1937 + 0.5f) * 2.0f;
        float _1944 = (_1938 + 0.5f) * 2.0f;
        float _1945 = (_1939 + 0.5f) * 2.0f;
        float _1953 = (lerp(_1943, 1.0f, _1904)) * _1904;
        float _1955 = (lerp(_1944, 1.0f, _1905)) * _1905;
        float _1957 = (lerp(_1945, 1.0f, _1906)) * _1906;
        float _1991 = (((((_1943 + -1.0f) * sqrt(_1904)) + ((_1904 * 2.0f) * (0.5f - _1937))) - _1953) * select((_1904 < 0.5f), 0.0f, 1.0f)) + _1953;
        float _1992 = (((((_1944 + -1.0f) * sqrt(_1905)) + ((_1905 * 2.0f) * (0.5f - _1938))) - _1955) * select((_1905 < 0.5f), 0.0f, 1.0f)) + _1955;
        float _1993 = (((((_1945 + -1.0f) * sqrt(_1906)) + ((_1906 * 2.0f) * (0.5f - _1939))) - _1957) * select((_1906 < 0.5f), 0.0f, 1.0f)) + _1957;
        _2140 = (((((_1991 * 0.30530601739883423f) + 0.682171106338501f) * _1991) + 0.012522878125309944f) * _1991);
        _2141 = (((((_1992 * 0.30530601739883423f) + 0.682171106338501f) * _1992) + 0.012522878125309944f) * _1992);
        _2142 = (((((_1993 * 0.30530601739883423f) + 0.682171106338501f) * _1993) + 0.012522878125309944f) * _1993);
      } else {
        if (_ScanBlendModes.w < 3.5f) {
          float _2036 = select((_1853 > 1.0f), _1853, saturate((exp2(log2(abs(_1853)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _2037 = select((_1854 > 1.0f), _1854, saturate((exp2(log2(abs(_1854)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _2038 = select((_1855 > 1.0f), _1855, saturate((exp2(log2(abs(_1855)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f));
          float _2069 = (select((_989 > 1.0f), _989, saturate((exp2(log2(abs(_989)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _993;
          float _2070 = (select((_990 > 1.0f), _990, saturate((exp2(log2(abs(_990)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _993;
          float _2071 = (select((_991 > 1.0f), _991, saturate((exp2(log2(abs(_991)) * 0.4166666567325592f) * 1.0549999475479126f) + -0.054999999701976776f)) + -0.5f) * _993;
          float _2078 = (_2036 * 2.0f) * (_2069 + 0.5f);
          float _2079 = (_2037 * 2.0f) * (_2070 + 0.5f);
          float _2080 = (_2038 * 2.0f) * (_2071 + 0.5f);
          float _2108 = (((1.0f - (((1.0f - _2036) * 2.0f) * (0.5f - _2069))) - _2078) * select((_2036 < 0.5f), 0.0f, 1.0f)) + _2078;
          float _2109 = (((1.0f - (((1.0f - _2037) * 2.0f) * (0.5f - _2070))) - _2079) * select((_2037 < 0.5f), 0.0f, 1.0f)) + _2079;
          float _2110 = (((1.0f - (((1.0f - _2038) * 2.0f) * (0.5f - _2071))) - _2080) * select((_2038 < 0.5f), 0.0f, 1.0f)) + _2080;
          _2140 = (((((_2108 * 0.30530601739883423f) + 0.682171106338501f) * _2108) + 0.012522878125309944f) * _2108);
          _2141 = (((((_2109 * 0.30530601739883423f) + 0.682171106338501f) * _2109) + 0.012522878125309944f) * _2109);
          _2142 = (((((_2110 * 0.30530601739883423f) + 0.682171106338501f) * _2110) + 0.012522878125309944f) * _2110);
        } else {
          _2140 = (_1853 * (((_989 + -1.0f) * _993) + 1.0f));
          _2141 = (_1854 * (((_990 + -1.0f) * _993) + 1.0f));
          _2142 = (_1855 * (((_991 + -1.0f) * _993) + 1.0f));
        }
      }
    }
  }
  float4 _2149 = _VR_SourceImage.Sample(s_linear_repeat_sampler, float2((_RGBSeparateParams0.x + _24), ((_RGBSeparateParams0.y * _27) + _45)));
  float4 _2164 = _VR_SourceImage.Sample(s_linear_repeat_sampler, float2((_RGBSeparateParams0.z + _24), ((_RGBSeparateParams0.w * _27) + _45)));
  float4 _2179 = _VR_SourceImage.Sample(s_linear_repeat_sampler, float2((_RGBSeparateParams1.x + _24), ((_RGBSeparateParams1.y * _27) + _45)));
  _2149.xyz = renodx::tonemap::renodrt::NeutralSDR(renodx::draw::InvertIntermediatePass(_2149.xyz));
  _2164.xyz = renodx::tonemap::renodrt::NeutralSDR(renodx::draw::InvertIntermediatePass(_2164.xyz));
  _2179.xyz = renodx::tonemap::renodrt::NeutralSDR(renodx::draw::InvertIntermediatePass(_2179.xyz));
  float _2210 = (((-0.0f - _ScanlineParams.y) - _ScanlineParams.y) * _19) + _ScanlineParams.y;
  float _2211 = ((((((_ColorR.x * _2149.x) - _2140) + (_ColorG.x * _2164.y)) + (_ColorB.x * _2179.z)) * _RGBSeparateParams1.z) + _2140) + _2210;
  float _2212 = ((((((_ColorR.y * _2149.x) - _2141) + (_ColorG.y * _2164.y)) + (_ColorB.y * _2179.z)) * _RGBSeparateParams1.z) + _2141) + _2210;
  float _2213 = ((((((_ColorR.z * _2149.x) - _2142) + (_ColorG.z * _2164.y)) + (_ColorB.z * _2179.z)) * _RGBSeparateParams1.z) + _2142) + _2210;
  if (_TextureSheetParams.w > 0.5f) {
    int _2220 = int(_TextureSheetParams.x);
    int _2228 = int(_TextureSheetParams.z);
    float4 _2239 = _VRTextureSheetTex.Sample(s_linear_repeat_sampler, float2(((float((int)(_2228 % _2220)) * (1.0f / float((int)(_2220)))) + (_24 / _TextureSheetParams.x)), ((float((int)(_2228 / _2220)) * (1.0f / float((int)(int(_TextureSheetParams.y))))) + (_45 / _TextureSheetParams.y))));
    float _2252 = _TextureSheetColor.w * _2239.w;
    float _2253 = 1.0f - _2252;
    _2264 = ((_2253 * _2211) + ((_TextureSheetColor.x * _2239.x) * _2252));
    _2265 = ((_2253 * _2212) + ((_TextureSheetColor.y * _2239.y) * _2252));
    _2266 = ((_2253 * _2213) + ((_TextureSheetColor.z * _2239.z) * _2252));
  } else {
    _2264 = _2211;
    _2265 = _2212;
    _2266 = _2213;
  }
  SV_Target.x = _2264;
  SV_Target.y = _2265;
  SV_Target.z = _2266;
  SV_Target.w = (_2210 + _VR_SourceImage0.w);
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(renodx::tonemap::UpgradeToneMap(untonemapped.xyz, _VR_SourceImage0.xyz, SV_Target.xyz));
  return SV_Target;
}