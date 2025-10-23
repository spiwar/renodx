#include "../../tonemap.hlsl"

// HDD Mission Select Menu

Texture2D<float4> _BlitTex : register(t0);

Texture2D<float4> _Grain_Texture : register(t1);

Texture2D<float4> _CameraDistortionTextureOverlay : register(t2);

Texture2D<float4> _NapBloomTex : register(t3);

Texture2D<float4> _DirtTex : register(t4);

Texture2D<float4> _ScrFxMainTex : register(t5);

Texture2D<float4> _ScrFxMaskTex : register(t6);

Texture2D<float4> _ScrFxDissolveTex : register(t7);

Texture2D<float4> _ScrFxDistortionTex : register(t8);

Texture2D<float4> _ScrFxScrDistTex : register(t9);

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
  noperspective float4 SV_Position : SV_Position,
  linear float2 TEXCOORD : TEXCOORD,
  linear float4 TEXCOORD_1 : TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float _26[3];
  float _27[3];
  float _28[4];
  float _29[4];
  float _30[4];
  float _31[4];
  float _32[4];
  float _72;
  float _79;
  float _80;
  float _211;
  float _212;
  float _246;
  float _247;
  float _248;
  float _249;
  float _250;
  float _251;
  float _252;
  float _253;
  float _296;
  float _303;
  float _304;
  float _345;
  float _352;
  float _353;
  float _394;
  float _401;
  float _402;
  float _411;
  float _412;
  float _413;
  float _545;
  float _546;
  float _547;
  float _557;
  float _558;
  float _559;
  float _560;
  float _599;
  float _600;
  float _601;
  float _637;
  float _638;
  float _639;
  float _950;
  float _1032;
  float _1033;
  float _1034;
  if (!(_Distortion_Params2.w == 0.0f)) {
    float _40 = _Distortion_Params2.z * (TEXCOORD.x + -0.5f);
    float _41 = _Distortion_Params2.z * (TEXCOORD.y + -0.5f);
    float _51 = (_40 - _Distortion_Params1.x) * _Distortion_Params1.z;
    float _52 = (_41 - _Distortion_Params1.y) * _Distortion_Params1.w;
    float _56 = sqrt((_51 * _51) + (_52 * _52));
    float _60 = _Distortion_Params2.y * _56;
    do {
      [branch]
      if (_Distortion_Params2.w > 0.0f) {
        _72 = ((1.0f / _60) * tan(_Distortion_Params2.x * _56));
      } else {
        _72 = ((_Distortion_Params2.x * (1.0f / _56)) * atan(_60));
      }
      float _73 = _72 + -1.0f;
      _79 = ((_40 + 0.5f) + (_73 * _51));
      _80 = ((_41 + 0.5f) + (_73 * _52));
    } while (false);
  } else {
    _79 = TEXCOORD.x;
    _80 = TEXCOORD.y;
  }
  float _88 = select((UberPostScreenEffectsBasePacked16.w > 0.5f), (_GlobalTimeParamsA[1].x), (_GlobalTimeParamsB[0].y));
  float _91 = (TEXCOORD.x * 2.0f) + -1.0f;
  float _92 = (TEXCOORD.y * 2.0f) + -1.0f;
  float _102 = _ScaledScreenParams.z + -1.0f;
  float _104 = (_102 * _ScaledScreenParams.y) + -1.0f;
  float _106 = (_104 * UberPostScreenEffectsBasePacked1.x) + 1.0f;
  float _107 = _106 * _92;
  float _108 = _91 * _91;
  float _119 = select((UberPostScreenEffectsBasePacked0.z < 0.5f), min((1.0f - abs(_91)), (_106 * (1.0f - abs(_92)))), (1.0f - (sqrt((_107 * _107) + _108) * 0.7070000171661377f)));
  float _129 = saturate((_119 - UberPostScreenEffectsBasePacked0.w) / (((1.0f - UberPostScreenEffectsBasePacked1.y) * UberPostScreenEffectsBasePacked0.w) - UberPostScreenEffectsBasePacked0.w));
  float _135 = select((UberPostScreenEffectsBasePacked1.y > 9.999999747378752e-05f), ((_129 * _129) * (3.0f - (_129 * 2.0f))), select((UberPostScreenEffectsBasePacked0.w < _119), 0.0f, 1.0f));
  float _141 = select((UberPostScreenEffectsBasePacked1.w > 0.5f), (1.0f - _135), _135) * UberPostScreenEffectsBasePacked1.z;
  float _144 = select((UberPostScreenEffectsBasePacked0.w > 9.999999747378752e-05f), _141, 0.0f) * _141;
  if (UberPostScreenEffectsBasePacked14.z > 0.5f) {
    float _152 = ((_104 * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _92;
    float _154 = atan(_152 / _91);
    bool _157 = (_91 < 0.0f);
    bool _158 = (_91 == 0.0f);
    bool _159 = (_152 >= 0.0f);
    bool _160 = (_152 < 0.0f);
    bool _184 = (UberPostScreenEffectsBasePacked14.w > 0.5f);
    float4 _198 = _ScrFxScrDistTex.Sample(sampler_ScrFxScrDistTex, float2(((UberPostScreenEffectsBasePacked15.z + (UberPostScreenEffectsBasePacked16.y * _88)) + (select(_184, select((_158 && _159), 2.0f, select((_158 && _160), -2.0f, (select((_157 && _160), (_154 + -3.1415927410125732f), select((_157 && _159), (_154 + 3.1415927410125732f), _154)) * 1.2732394933700562f))), TEXCOORD.x) * UberPostScreenEffectsBasePacked15.x)), ((UberPostScreenEffectsBasePacked15.w + (UberPostScreenEffectsBasePacked16.z * _88)) + (select(_184, (sqrt((_152 * _152) + _108) * 0.6366197466850281f), (((_ScaledScreenParams.y * (TEXCOORD.y + -0.5f)) * _102) + 0.5f)) * UberPostScreenEffectsBasePacked15.y))));
    float _207 = (_144 * 0.10000000149011612f) * UberPostScreenEffectsBasePacked16.x;
    _211 = (_207 * ((_198.x * 2.0f) + -1.0f));
    _212 = (_207 * ((_198.y * 2.0f) + -1.0f));
  } else {
    _211 = 0.0f;
    _212 = 0.0f;
  }
  bool _215 = (_DistortionRgbShift.w > 0.0f);
  if (_215) {
    float4 _217 = _CameraDistortionTextureOverlay.Sample(sampler_CameraDistortionTextureOverlay, float2(TEXCOORD.x, TEXCOORD.y));
    float _223 = (_217.x * 0.10000000149011612f) + _211;
    float _224 = (_217.y * 0.10000000149011612f) + _212;
    float _227 = _DistortionRgbShift.w * _217.z;
    float _228 = _227 * _223;
    float _229 = _227 * _224;
    _246 = (_223 + _79);
    _247 = (_224 + _80);
    _248 = ((_228 * _DistortionRgbShift.x) + _223);
    _249 = ((_229 * _DistortionRgbShift.x) + _224);
    _250 = ((_228 * _DistortionRgbShift.y) + _223);
    _251 = ((_229 * _DistortionRgbShift.y) + _224);
    _252 = ((_228 * _DistortionRgbShift.z) + _223);
    _253 = ((_229 * _DistortionRgbShift.z) + _224);
  } else {
    _246 = _79;
    _247 = _80;
    _248 = 0.0f;
    _249 = 0.0f;
    _250 = 0.0f;
    _251 = 0.0f;
    _252 = 0.0f;
    _253 = 0.0f;
  }
  if (_215) {
    float _255 = _248 + TEXCOORD.x;
    float _256 = _249 + TEXCOORD.y;
    bool _259 = !(_Distortion_Params2.w == 0.0f);
    do {
      if (_259) {
        float _264 = _Distortion_Params2.z * (_255 + -0.5f);
        float _265 = _Distortion_Params2.z * (_256 + -0.5f);
        float _275 = (_264 - _Distortion_Params1.x) * _Distortion_Params1.z;
        float _276 = (_265 - _Distortion_Params1.y) * _Distortion_Params1.w;
        float _280 = sqrt((_275 * _275) + (_276 * _276));
        float _284 = _Distortion_Params2.y * _280;
        do {
          [branch]
          if (_Distortion_Params2.w > 0.0f) {
            _296 = ((1.0f / _284) * tan(_Distortion_Params2.x * _280));
          } else {
            _296 = ((_Distortion_Params2.x * (1.0f / _280)) * atan(_284));
          }
          float _297 = _296 + -1.0f;
          _303 = ((_264 + 0.5f) + (_297 * _275));
          _304 = ((_265 + 0.5f) + (_297 * _276));
        } while (false);
      } else {
        _303 = _255;
        _304 = _256;
      }
      float4 _305 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_303, _304));
      float _307 = _250 + TEXCOORD.x;
      float _308 = _251 + TEXCOORD.y;
      do {
        if (_259) {
          float _313 = _Distortion_Params2.z * (_307 + -0.5f);
          float _314 = _Distortion_Params2.z * (_308 + -0.5f);
          float _324 = (_313 - _Distortion_Params1.x) * _Distortion_Params1.z;
          float _325 = (_314 - _Distortion_Params1.y) * _Distortion_Params1.w;
          float _329 = sqrt((_324 * _324) + (_325 * _325));
          float _333 = _Distortion_Params2.y * _329;
          do {
            [branch]
            if (_Distortion_Params2.w > 0.0f) {
              _345 = ((1.0f / _333) * tan(_Distortion_Params2.x * _329));
            } else {
              _345 = ((_Distortion_Params2.x * (1.0f / _329)) * atan(_333));
            }
            float _346 = _345 + -1.0f;
            _352 = ((_313 + 0.5f) + (_346 * _324));
            _353 = ((_314 + 0.5f) + (_346 * _325));
          } while (false);
        } else {
          _352 = _307;
          _353 = _308;
        }
        float4 _354 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_352, _353));
        float _356 = _252 + TEXCOORD.x;
        float _357 = _253 + TEXCOORD.y;
        do {
          if (_259) {
            float _362 = _Distortion_Params2.z * (_356 + -0.5f);
            float _363 = _Distortion_Params2.z * (_357 + -0.5f);
            float _373 = (_362 - _Distortion_Params1.x) * _Distortion_Params1.z;
            float _374 = (_363 - _Distortion_Params1.y) * _Distortion_Params1.w;
            float _378 = sqrt((_373 * _373) + (_374 * _374));
            float _382 = _Distortion_Params2.y * _378;
            do {
              [branch]
              if (_Distortion_Params2.w > 0.0f) {
                _394 = ((1.0f / _382) * tan(_Distortion_Params2.x * _378));
              } else {
                _394 = ((_Distortion_Params2.x * (1.0f / _378)) * atan(_382));
              }
              float _395 = _394 + -1.0f;
              _401 = ((_362 + 0.5f) + (_395 * _373));
              _402 = ((_363 + 0.5f) + (_395 * _374));
            } while (false);
          } else {
            _401 = _356;
            _402 = _357;
          }
          float4 _403 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_401, _402));
          _411 = _305.x;
          _412 = _354.y;
          _413 = _403.z;
        } while (false);
      } while (false);
    } while (false);
  } else {
    float4 _406 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_246, _247));
    _411 = _406.x;
    _412 = _406.y;
    _413 = _406.z;
  }
  float4 _414 = _BlitTex.Sample(s_linear_clamp_sampler, float2(_246, _247));
  bool _422 = (UberPostBasePacked3.y > 0.0f);
  if ((bool)(UberPostBasePacked3.z < 0.5f) && ((bool)((bool)(UberPostBasePacked3.x > 0.0f) || _422))) {
    float _432 = fmod(((_ScreenSize.y * _247) * _VREffectsScanlineParams.x), 2.0f);
    float _440 = (((select((_432 > 1.0f), (2.0f - _432), _432) * 2.0f) + -1.0f) * _VREffectsScanlineParams.z) + _246;
    float _443 = _ScreenSize.w * _ScreenSize.x;
    float4 _462 = _NapBloomTex.Sample(sampler_NapBloomTex, float2(_440, ((select(((frac((((_440 + abs(_VREffectsSliceParams.y)) * _443) - (_VREffectsSliceParams.y * _247)) / ((_443 * 2.0f) * _VREffectsSliceParams.x)) * 2.0f) <= 1.0f), 0.9999899864196777f, -1.0f) * _VREffectsSliceParams.z) + _247)));
    float _499 = ((((-0.699999988079071f - _462.x) + (exp2(log2(abs(_462.x)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_462.x < 0.30000001192092896f), 0.0f, 1.0f)) + _462.x) * UberPostBasePacked3.x;
    float _500 = ((((-0.699999988079071f - _462.y) + (exp2(log2(abs(_462.y)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_462.y < 0.30000001192092896f), 0.0f, 1.0f)) + _462.y) * UberPostBasePacked3.x;
    float _501 = ((((-0.699999988079071f - _462.z) + (exp2(log2(abs(_462.z)) * 0.3333333432674408f) * 1.4938015937805176f)) * select((_462.z < 0.30000001192092896f), 0.0f, 1.0f)) + _462.z) * UberPostBasePacked3.x;
    float _502 = dot(float3(_411, _412, _413), float3(0.29899999499320984f, 0.5870000123977661f, 0.11400000005960464f));
    bool _505 = (UberPostBasePacked4.x > 0.5f);
    float _518 = select(_505, ((((_499 * _502) - _499) * _414.w) + _499), _499);
    float _519 = select(_505, ((((_500 * _502) - _500) * _414.w) + _500), _500);
    float _520 = select(_505, ((((_501 * _502) - _501) * _414.w) + _501), _501);
    do {
      if (_422) {
        float4 _531 = _DirtTex.Sample(s_linear_clamp_sampler, float2(((_DirtTexTillingOffset.x * _246) + _DirtTexTillingOffset.z), ((_DirtTexTillingOffset.y * _247) + _DirtTexTillingOffset.w)));
        _545 = (((_531.x * _499) * UberPostBasePacked3.y) + _518);
        _546 = (((_531.y * _500) * UberPostBasePacked3.y) + _519);
        _547 = (((_531.z * _501) * UberPostBasePacked3.y) + _520);
      } else {
        _545 = _518;
        _546 = _519;
        _547 = _520;
      }
      _557 = (_545 + _411);
      _558 = (_546 + _412);
      _559 = (_547 + _413);
      _560 = saturate((((_546 + _545) + _547) * 0.33329999446868896f) + _414.w);
    } while (false);
  } else {
    _557 = _411;
    _558 = _412;
    _559 = _413;
    _560 = _414.w;
  }
  [branch]
  if (_Vignette_Params2.z > 0.0f) {
    float _577 = abs(_247 - _Vignette_Params2.y) * _Vignette_Params2.z;
    float _579 = (_Vignette_Params2.z * _Vignette_Params1.w) * abs(_246 - _Vignette_Params2.x);
    float _585 = exp2(log2(saturate(1.0f - dot(float2(_579, _577), float2(_579, _577)))) * _Vignette_Params2.w);
    _599 = (((_585 * (1.0f - _Vignette_Params1.x)) + _Vignette_Params1.x) * _557);
    _600 = (((_585 * (1.0f - _Vignette_Params1.y)) + _Vignette_Params1.y) * _558);
    _601 = (((_585 * (1.0f - _Vignette_Params1.z)) + _Vignette_Params1.z) * _559);
  } else {
    _599 = _557;
    _600 = _558;
    _601 = _559;
  }
  float3 untonemapped = (float3(_599, _600, _601));

  float3 tonemapped = renodx::draw::ToneMapPass(untonemapped);

  _599 = tonemapped.x;
  _600 = tonemapped.y;
  _601 = tonemapped.z;
  if (UberPostBasePacked1.x > 0.0f) {
    float4 _616 = _Grain_Texture.Sample(s_linear_repeat_sampler, float2(((_Grain_TilingParams.x * TEXCOORD.x) + _Grain_TilingParams.z), ((_Grain_TilingParams.y * TEXCOORD.y) + _Grain_TilingParams.w)));
    float _619 = (_616.w + -0.5f) * 2.0f;
    float _623 = 1.0f - (sqrt(dot(float3(_599, _600, _601), float3(0.2126729041337967f, 0.7151522040367126f, 0.07217500358819962f))) * UberPostBasePacked1.y);
    _637 = ((((UberPostBasePacked1.x * _599) * _619) * _623) + _599);
    _638 = ((((UberPostBasePacked1.x * _600) * _619) * _623) + _600);
    _639 = ((((UberPostBasePacked1.x * _601) * _619) * _623) + _601);
  } else {
    _637 = _599;
    _638 = _600;
    _639 = _601;
  }
  float _643 = ((_104 * UberPostScreenEffectsBasePacked0.y) + 1.0f) * _92;
  float _645 = atan(_643 / _91);
  bool _648 = (_91 < 0.0f);
  bool _649 = (_91 == 0.0f);
  bool _650 = (_643 >= 0.0f);
  bool _651 = (_643 < 0.0f);
  _26[0] = (((_ScreenSize.x * (TEXCOORD.x + -0.5f)) * _ScreenSize.w) + 0.5f);
  _27[0] = TEXCOORD.y;
  _26[1] = select((_649 && _650), 2.0f, select((_649 && _651), -2.0f, (select((_648 && _651), (_645 + -3.1415927410125732f), select((_648 && _650), (_645 + 3.1415927410125732f), _645)) * 1.2732394933700562f)));
  _27[1] = (sqrt((_643 * _643) + (_91 * _91)) * 0.5f);
  _26[2] = TEXCOORD.x;
  _27[2] = TEXCOORD.y;
  int _708 = min(max(int(round(UberPostScreenEffectsBasePacked6.z)), 0), 2);
  int _731 = min(max(int(round(UberPostScreenEffectsBasePacked11.w)), 0), 2);
  float4 _754 = _ScrFxDistortionTex.Sample(sampler_ScrFxDistortionTex, float2(((((_ScrFxDistortionRandomUV.x + _211) + (UberPostScreenEffectsBasePacked11.x * _88)) + UberPostScreenEffectsBasePacked12.z) + (UberPostScreenEffectsBasePacked12.x * (_26[_731]))), ((((_ScrFxDistortionRandomUV.y + _212) + (UberPostScreenEffectsBasePacked11.y * _88)) + UberPostScreenEffectsBasePacked12.w) + (UberPostScreenEffectsBasePacked12.y * (_27[_731])))));
  _32[0] = _754.x;
  _32[1] = _754.y;
  _32[2] = _754.z;
  _32[3] = _754.w;
  float _767 = ((_32[min((uint)(uint(UberPostScreenEffectsBasePacked13.x)), 3)]) + -0.49803921580314636f) * 2.0f;
  float _775 = select((UberPostScreenEffectsBasePacked3.x < 9.999999747378752e-06f), max(1.0f, (_ScreenSize.y * 0.0009259259095415473f)), 1.0f);
  int _779 = min(max(int(round(UberPostScreenEffectsBasePacked3.x)), 0), 2);
  float _794 = UberPostScreenEffectsBasePacked13.y * _767;
  int _808 = min(max(int(round(UberPostScreenEffectsBasePacked8.w)), 0), 2);
  float _822 = UberPostScreenEffectsBasePacked13.z * _767;
  float4 _836 = _ScrFxDissolveTex.Sample(sampler_ScrFxDissolveTex, float2((((((_ScrFxDissolveRandomUV.x + _211) + (UberPostScreenEffectsBasePacked10.z * _88)) + UberPostScreenEffectsBasePacked9.z) + (UberPostScreenEffectsBasePacked9.x * (_26[_808]))) + _822), (((((_ScrFxDissolveRandomUV.y + _212) + (UberPostScreenEffectsBasePacked10.w * _88)) + UberPostScreenEffectsBasePacked9.w) + (UberPostScreenEffectsBasePacked9.y * (_27[_808]))) + _822)));
  _31[0] = _836.x;
  _31[1] = _836.y;
  _31[2] = _836.z;
  _31[3] = _836.w;
  float _847 = _31[min((uint)(uint(UberPostScreenEffectsBasePacked10.y)), 3)];
  float4 _848 = _ScrFxMainTex.Sample(sampler_ScrFxMainTex, float2((((((UberPostScreenEffectsBasePacked6.x * _88) + _211) + UberPostScreenEffectsBasePacked2.z) + (((_26[_779]) * _775) * UberPostScreenEffectsBasePacked2.x)) + _794), (((((UberPostScreenEffectsBasePacked6.y * _88) + _212) + UberPostScreenEffectsBasePacked2.w) + (((_27[_779]) * _775) * UberPostScreenEffectsBasePacked2.y)) + _794)));
  float _856 = select((UberPostScreenEffectsBasePacked11.z > 0.5f), _847, 1.0f);
  _30[0] = _848.x;
  _30[1] = _848.y;
  _30[2] = _848.z;
  _30[3] = _848.w;
  bool _867 = (UberPostScreenEffectsBasePacked3.y > 3.5f);
  float _870 = saturate(UberPostScreenEffectsBasePacked3.w * _856);
  float _879 = UberPostScreenEffectsBasePacked5.x - UberPostScreenEffectsBasePacked4.x;
  float _880 = UberPostScreenEffectsBasePacked5.y - UberPostScreenEffectsBasePacked4.y;
  float _881 = UberPostScreenEffectsBasePacked5.z - UberPostScreenEffectsBasePacked4.z;
  float _893 = saturate((_856 * (_30[min((uint)(uint(UberPostScreenEffectsBasePacked3.y)), 3)])) * UberPostScreenEffectsBasePacked3.w);
  float _900 = select(_867, (((_879 * _870) + UberPostScreenEffectsBasePacked4.x) * _848.x), ((_879 * _893) + UberPostScreenEffectsBasePacked4.x));
  float _901 = select(_867, (((_880 * _870) + UberPostScreenEffectsBasePacked4.y) * _848.y), ((_880 * _893) + UberPostScreenEffectsBasePacked4.y));
  float _902 = select(_867, (((_881 * _870) + UberPostScreenEffectsBasePacked4.z) * _848.z), ((_881 * _893) + UberPostScreenEffectsBasePacked4.z));
  _29[0] = _848.x;
  _29[1] = _848.y;
  _29[2] = _848.z;
  _29[3] = _848.w;
  float _911 = _29[min((uint)(uint(UberPostScreenEffectsBasePacked3.z)), 3)];
  float _912 = _911 * _847;
  float4 _928 = _ScrFxMaskTex.Sample(sampler_ScrFxMaskTex, float2(((((UberPostScreenEffectsBasePacked8.x * _88) + _211) + UberPostScreenEffectsBasePacked7.z) + (UberPostScreenEffectsBasePacked7.x * (_26[_708]))), ((((UberPostScreenEffectsBasePacked8.y * _88) + _212) + UberPostScreenEffectsBasePacked7.w) + (UberPostScreenEffectsBasePacked7.y * (_27[_708])))));
  _28[0] = _928.x;
  _28[1] = _928.y;
  _28[2] = _928.z;
  _28[3] = _928.w;
  if (UberPostScreenEffectsBasePacked8.z < 0.5f) {
    _950 = (lerp(UberPostScreenEffectsBasePacked4.w, UberPostScreenEffectsBasePacked5.w, _911));
  } else {
    _950 = select((UberPostScreenEffectsBasePacked13.w > 0.5f), saturate((_912 - UberPostScreenEffectsBasePacked10.x) * UberPostScreenEffectsBasePacked14.x), select((_912 < UberPostScreenEffectsBasePacked10.x), 0.0f, 1.0f));
  }
  float _952 = ((_28[min((uint)(uint(UberPostScreenEffectsBasePacked6.w)), 3)]) * _950) * _144;
  float _956 = select((_952 < UberPostScreenEffectsBasePacked14.y), 0.0f, 1.0f) * _952;
  if (UberPostScreenEffectsBasePacked0.x < 0.5f) {
    _1032 = ((_956 * (_900 - _637)) + _637);
    _1033 = ((_956 * (_901 - _638)) + _638);
    _1034 = ((_956 * (_902 - _639)) + _639);
  } else {
    if (UberPostScreenEffectsBasePacked0.x < 1.5f) {
      _1032 = ((_956 * _900) + _637);
      _1033 = ((_956 * _901) + _638);
      _1034 = ((_956 * _902) + _639);
    } else {
      if (UberPostScreenEffectsBasePacked0.x < 2.5f) {
        _1032 = (((_956 * (_900 + -1.0f)) + 1.0f) * _637);
        _1033 = (((_956 * (_901 + -1.0f)) + 1.0f) * _638);
        _1034 = (((_956 * (_902 + -1.0f)) + 1.0f) * _639);
      } else {
        float _998 = _956 * (_900 + -0.5f);
        float _999 = _956 * (_901 + -0.5f);
        float _1000 = _956 * (_902 + -0.5f);
        _1032 = select((_637 < 0.5f), ((_637 * 2.0f) * (_998 + 0.5f)), (1.0f - (((1.0f - _637) * 2.0f) * (0.5f - _998))));
        _1033 = select((_638 < 0.5f), ((_638 * 2.0f) * (_999 + 0.5f)), (1.0f - (((1.0f - _638) * 2.0f) * (0.5f - _999))));
        _1034 = select((_639 < 0.5f), ((_639 * 2.0f) * (_1000 + 0.5f)), (1.0f - (((1.0f - _639) * 2.0f) * (0.5f - _1000))));
      }
    }
  }
  SV_Target.x = _1032;
  SV_Target.y = _1033;
  SV_Target.z = _1034;
  SV_Target.w = _560;
  SV_Target.xyz = renodx::draw::RenderIntermediatePass(SV_Target.xyz);
  return SV_Target;
}
