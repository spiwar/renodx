cbuffer _GlobalsUBO : register(b0, space0)
{
    float4 _Globals_m0[166] : packoffset(c0);
};

cbuffer VREffectsCBufferUBO : register(b1, space0)
{
    float4 VREffectsCBuffer_m0[43] : packoffset(c0);
};

Texture2D<float4> _CameraDepthTexture : register(t0, space0);
Texture2D<float4> _VR_SourceImage : register(t1, space0);
Texture2D<float4> _VRTextureSheetTex : register(t2, space0);
SamplerState s_point_clamp_sampler : register(s0, space0);
SamplerState s_linear_repeat_sampler : register(s1, space0);

float4 main(
    noperspective float4 SV_Position: SV_Position,
    linear float2 TEXCOORD: TEXCOORD,
    linear float4 TEXCOORD_1: TEXCOORD1
) : SV_Target {
  float4 SV_Target;
  float _58 = fmod((_Globals_m0[137u].y * TEXCOORD.y) * VREffectsCBuffer_m0[4u].x, 2.0f);
  float _64 = (_58 > 1.0f) ? (2.0f - _58) : _58;
  float _70 = (((_64 * 2.0f) + (-1.0f)) * VREffectsCBuffer_m0[4u].z) + TEXCOORD.x;
  float _73 = _Globals_m0[137u].w * _Globals_m0[137u].x;
  bool _91 = (frac((((_70 + abs(VREffectsCBuffer_m0[5u].y)) * _73) - (VREffectsCBuffer_m0[5u].y * TEXCOORD.y)) / ((_73 * 2.0f) * VREffectsCBuffer_m0[5u].x)) * 2.0f) <= 1.0f;
  float _95 = ((_91 ? 0.999989986419677734375f : (-1.0f)) * VREffectsCBuffer_m0[5u].z) + TEXCOORD.y;
  float _101 = _91 ? ((_95 < 1.0f) ? 0.0f : 1.0f) : ((_95 > 0.0f) ? 0.0f : 1.0f);
  float4 _104 = _VR_SourceImage.Sample(s_linear_repeat_sampler, float2(_70, _95));
  float _106 = _104.x;
  float _107 = _104.y;
  float _108 = _104.z;
  // TODO : Fix this shader properly lol.
  SV_Target = float4(_104.xyz, 0.0f);
  return SV_Target;
  float _115 = _70 - _Globals_m0[139u].z;
  float _116 = _95 - _Globals_m0[139u].w;
  float4 _118 = _CameraDepthTexture.SampleLevel(s_point_clamp_sampler, float2(_115, _116), 0.0f);
  float _120 = _118.x;
  float _151 = (_115 * 2.0f) + (-1.0f);
  float _153 = (-0.0f) - ((_116 * 2.0f) + (-1.0f));
  float _170 = mad(_Globals_m0[135u].w, _120, mad(_Globals_m0[134u].w, _153, _Globals_m0[133u].w * _151)) + _Globals_m0[136u].w;
  float _180 = ((mad(_Globals_m0[135u].x, _120, mad(_Globals_m0[134u].x, _153, _Globals_m0[133u].x * _151)) + _Globals_m0[136u].x) / _170) - _Globals_m0[30u].x;
  float _181 = ((mad(_Globals_m0[135u].y, _120, mad(_Globals_m0[134u].y, _153, _Globals_m0[133u].y * _151)) + _Globals_m0[136u].y) / _170) - _Globals_m0[30u].y;
  float _182 = ((mad(_Globals_m0[135u].z, _120, mad(_Globals_m0[134u].z, _153, _Globals_m0[133u].z * _151)) + _Globals_m0[136u].z) / _170) - _Globals_m0[30u].z;
  float _212 = (VREffectsCBuffer_m0[31u].w > 0.5f) ? ((sqrt(((_180 * _180) + (_181 * _181)) + (_182 * _182)) > 2000.0f) ? 0.0f : max(0.0f, dot(float2(_180, _182), float2(VREffectsCBuffer_m0[31u].xy)))) : (1.0f / ((_Globals_m0[61u].z * _120) + _Globals_m0[61u].w));
  float _219 = clamp((_212 - VREffectsCBuffer_m0[1u].z) * VREffectsCBuffer_m0[1u].w, 0.0f, 1.0f);
  float _245 = ((VREffectsCBuffer_m0[3u].w - VREffectsCBuffer_m0[2u].w) * _219) + VREffectsCBuffer_m0[2u].w;
  float _247 = (_107 < _108) ? 0.0f : 1.0f;
  float _252 = (_247 * (_107 - _108)) + _108;
  float _253 = (_247 * (_108 - _107)) + _107;
  float _255 = 0.666666686534881591796875f - _247;
  float _258 = (_106 < _252) ? 0.0f : 1.0f;
  float _265 = (_258 * (_106 - _252)) + _252;
  float _267 = (_258 * (_252 - _106)) + _106;
  float _269 = _265 - min(_267, _253);
  float _285 = VREffectsCBuffer_m0[0u].x + abs(((_258 * ((_247 + (-1.0f)) - _255)) + _255) + ((_267 - _253) / ((_269 * 6.0f) + 9.9999997473787516355514526367188e-05f)));
  float _290 = clamp((VREffectsCBuffer_m0[0u].y + (_269 / (_265 + 9.9999997473787516355514526367188e-05f))) * (1.0f - _245), 0.0f, 1.0f);
  float _291 = clamp(VREffectsCBuffer_m0[0u].z + _265, 0.0f, 1.0f);
  float _335 = ((((((clamp(abs((frac(_285 + 1.0f) * 6.0f) + (-3.0f)) + (-1.0f), 0.0f, 1.0f) + (-1.0f)) * _290) + 1.0f) * _291) - VREffectsCBuffer_m0[1u].y) * VREffectsCBuffer_m0[1u].x) + VREffectsCBuffer_m0[1u].y;
  float _336 = ((((((clamp(abs((frac(_285 + 0.666666686534881591796875f) * 6.0f) + (-3.0f)) + (-1.0f), 0.0f, 1.0f) + (-1.0f)) * _290) + 1.0f) * _291) - VREffectsCBuffer_m0[1u].y) * VREffectsCBuffer_m0[1u].x) + VREffectsCBuffer_m0[1u].y;
  float _337 = ((((((clamp(abs((frac(_285 + 0.3333333432674407958984375f) * 6.0f) + (-3.0f)) + (-1.0f), 0.0f, 1.0f) + (-1.0f)) * _290) + 1.0f) * _291) - VREffectsCBuffer_m0[1u].y) * VREffectsCBuffer_m0[1u].x) + VREffectsCBuffer_m0[1u].y;
  float _347 = (((_335 * (((VREffectsCBuffer_m0[3u].x - VREffectsCBuffer_m0[2u].x) * _219) + VREffectsCBuffer_m0[2u].x)) - _335) * _245) + _335;
  float _348 = (((_336 * (((VREffectsCBuffer_m0[3u].y - VREffectsCBuffer_m0[2u].y) * _219) + VREffectsCBuffer_m0[2u].y)) - _336) * _245) + _336;
  float _349 = (((_337 * (((VREffectsCBuffer_m0[3u].z - VREffectsCBuffer_m0[2u].z) * _219) + VREffectsCBuffer_m0[2u].z)) - _337) * _245) + _337;
  float _361 = VREffectsCBuffer_m0[6u].w * _101;
  float _374;
  float _379;
  float _384;
  if (VREffectsCBuffer_m0[8u].x < 0.5f)
    {
    _374 = ((VREffectsCBuffer_m0[6u].x - _347) * _361) + _347;
    _379 = ((VREffectsCBuffer_m0[6u].y - _348) * _361) + _348;
    _384 = ((VREffectsCBuffer_m0[6u].z - _349) * _361) + _349;
  }
    else
    {
    float frontier_phi_3_2_ladder;
    float frontier_phi_3_2_ladder_1;
    float frontier_phi_3_2_ladder_2;
    if (VREffectsCBuffer_m0[8u].x < 1.5f)
        {
      frontier_phi_3_2_ladder = _347 + (_361 * VREffectsCBuffer_m0[6u].x);
      frontier_phi_3_2_ladder_1 = _348 + (_361 * VREffectsCBuffer_m0[6u].y);
      frontier_phi_3_2_ladder_2 = _349 + (_361 * VREffectsCBuffer_m0[6u].z);
    }
        else
        {
      float frontier_phi_3_2_ladder_5_ladder;
      float frontier_phi_3_2_ladder_5_ladder_1;
      float frontier_phi_3_2_ladder_5_ladder_2;
      if (VREffectsCBuffer_m0[8u].x < 2.5f)
            {
        float _442 = (_347 > 1.0f) ? _347 : clamp((exp2(log2(abs(_347)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _443 = (_348 > 1.0f) ? _348 : clamp((exp2(log2(abs(_348)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _444 = (_349 > 1.0f) ? _349 : clamp((exp2(log2(abs(_349)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _476 = (((VREffectsCBuffer_m0[6u].x > 1.0f) ? VREffectsCBuffer_m0[6u].x : clamp((exp2(log2(abs(VREffectsCBuffer_m0[6u].x)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _361;
        float _477 = (((VREffectsCBuffer_m0[6u].y > 1.0f) ? VREffectsCBuffer_m0[6u].y : clamp((exp2(log2(abs(VREffectsCBuffer_m0[6u].y)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _361;
        float _478 = (((VREffectsCBuffer_m0[6u].z > 1.0f) ? VREffectsCBuffer_m0[6u].z : clamp((exp2(log2(abs(VREffectsCBuffer_m0[6u].z)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _361;
        float _482 = (_476 + 0.5f) * 2.0f;
        float _483 = (_477 + 0.5f) * 2.0f;
        float _484 = (_478 + 0.5f) * 2.0f;
        float _492 = (((1.0f - _482) * _442) + _482) * _442;
        float _494 = (((1.0f - _483) * _443) + _483) * _443;
        float _496 = (((1.0f - _484) * _444) + _484) * _444;
        float _530 = (((((_482 + (-1.0f)) * sqrt(_442)) + ((_442 * 2.0f) * (0.5f - _476))) - _492) * ((_442 < 0.5f) ? 0.0f : 1.0f)) + _492;
        float _531 = (((((_483 + (-1.0f)) * sqrt(_443)) + ((_443 * 2.0f) * (0.5f - _477))) - _494) * ((_443 < 0.5f) ? 0.0f : 1.0f)) + _494;
        float _532 = (((((_484 + (-1.0f)) * sqrt(_444)) + ((_444 * 2.0f) * (0.5f - _478))) - _496) * ((_444 < 0.5f) ? 0.0f : 1.0f)) + _496;
        frontier_phi_3_2_ladder_5_ladder = ((((_530 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _530) + 0.01252287812530994415283203125f) * _530;
        frontier_phi_3_2_ladder_5_ladder_1 = ((((_531 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _531) + 0.01252287812530994415283203125f) * _531;
        frontier_phi_3_2_ladder_5_ladder_2 = ((((_532 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _532) + 0.01252287812530994415283203125f) * _532;
      }
            else
            {
        float frontier_phi_3_2_ladder_5_ladder_9_ladder;
        float frontier_phi_3_2_ladder_5_ladder_9_ladder_1;
        float frontier_phi_3_2_ladder_5_ladder_9_ladder_2;
        if (VREffectsCBuffer_m0[8u].x < 3.5f)
                {
          float _766 = (_347 > 1.0f) ? _347 : clamp((exp2(log2(abs(_347)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _767 = (_348 > 1.0f) ? _348 : clamp((exp2(log2(abs(_348)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _768 = (_349 > 1.0f) ? _349 : clamp((exp2(log2(abs(_349)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _799 = (((VREffectsCBuffer_m0[6u].x > 1.0f) ? VREffectsCBuffer_m0[6u].x : clamp((exp2(log2(abs(VREffectsCBuffer_m0[6u].x)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _361;
          float _800 = (((VREffectsCBuffer_m0[6u].y > 1.0f) ? VREffectsCBuffer_m0[6u].y : clamp((exp2(log2(abs(VREffectsCBuffer_m0[6u].y)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _361;
          float _801 = (((VREffectsCBuffer_m0[6u].z > 1.0f) ? VREffectsCBuffer_m0[6u].z : clamp((exp2(log2(abs(VREffectsCBuffer_m0[6u].z)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _361;
          float _808 = (_766 * 2.0f) * (_799 + 0.5f);
          float _809 = (_767 * 2.0f) * (_800 + 0.5f);
          float _810 = (_768 * 2.0f) * (_801 + 0.5f);
          float _838 = (((1.0f - (((1.0f - _766) * 2.0f) * (0.5f - _799))) - _808) * ((_766 < 0.5f) ? 0.0f : 1.0f)) + _808;
          float _839 = (((1.0f - (((1.0f - _767) * 2.0f) * (0.5f - _800))) - _809) * ((_767 < 0.5f) ? 0.0f : 1.0f)) + _809;
          float _840 = (((1.0f - (((1.0f - _768) * 2.0f) * (0.5f - _801))) - _810) * ((_768 < 0.5f) ? 0.0f : 1.0f)) + _810;
          frontier_phi_3_2_ladder_5_ladder_9_ladder = ((((_838 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _838) + 0.01252287812530994415283203125f) * _838;
          frontier_phi_3_2_ladder_5_ladder_9_ladder_1 = ((((_839 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _839) + 0.01252287812530994415283203125f) * _839;
          frontier_phi_3_2_ladder_5_ladder_9_ladder_2 = ((((_840 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _840) + 0.01252287812530994415283203125f) * _840;
        }
                else
                {
          frontier_phi_3_2_ladder_5_ladder_9_ladder = _347 * ((_361 * (VREffectsCBuffer_m0[6u].x + (-1.0f))) + 1.0f);
          frontier_phi_3_2_ladder_5_ladder_9_ladder_1 = _348 * ((_361 * (VREffectsCBuffer_m0[6u].y + (-1.0f))) + 1.0f);
          frontier_phi_3_2_ladder_5_ladder_9_ladder_2 = _349 * ((_361 * (VREffectsCBuffer_m0[6u].z + (-1.0f))) + 1.0f);
        }
        frontier_phi_3_2_ladder_5_ladder = frontier_phi_3_2_ladder_5_ladder_9_ladder;
        frontier_phi_3_2_ladder_5_ladder_1 = frontier_phi_3_2_ladder_5_ladder_9_ladder_1;
        frontier_phi_3_2_ladder_5_ladder_2 = frontier_phi_3_2_ladder_5_ladder_9_ladder_2;
      }
      frontier_phi_3_2_ladder = frontier_phi_3_2_ladder_5_ladder;
      frontier_phi_3_2_ladder_1 = frontier_phi_3_2_ladder_5_ladder_1;
      frontier_phi_3_2_ladder_2 = frontier_phi_3_2_ladder_5_ladder_2;
    }
    _374 = frontier_phi_3_2_ladder;
    _379 = frontier_phi_3_2_ladder_1;
    _384 = frontier_phi_3_2_ladder_2;
  }
  float _398 = VREffectsCBuffer_m0[7u].w * (1.0f - _101);
  float _550;
  float _555;
  float _560;
  if (VREffectsCBuffer_m0[8u].y < 0.5f)
    {
    _550 = (_398 * (VREffectsCBuffer_m0[7u].x - _374)) + _374;
    _555 = (_398 * (VREffectsCBuffer_m0[7u].y - _379)) + _379;
    _560 = (_398 * (VREffectsCBuffer_m0[7u].z - _384)) + _384;
  }
    else
    {
    float frontier_phi_10_7_ladder;
    float frontier_phi_10_7_ladder_1;
    float frontier_phi_10_7_ladder_2;
    if (VREffectsCBuffer_m0[8u].y < 1.5f)
        {
      frontier_phi_10_7_ladder = (_398 * VREffectsCBuffer_m0[7u].x) + _374;
      frontier_phi_10_7_ladder_1 = (_398 * VREffectsCBuffer_m0[7u].y) + _379;
      frontier_phi_10_7_ladder_2 = (_398 * VREffectsCBuffer_m0[7u].z) + _384;
    }
        else
        {
      float frontier_phi_10_7_ladder_12_ladder;
      float frontier_phi_10_7_ladder_12_ladder_1;
      float frontier_phi_10_7_ladder_12_ladder_2;
      if (VREffectsCBuffer_m0[8u].y < 2.5f)
            {
        float _896 = (_374 > 1.0f) ? _374 : clamp((exp2(log2(abs(_374)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _897 = (_379 > 1.0f) ? _379 : clamp((exp2(log2(abs(_379)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _898 = (_384 > 1.0f) ? _384 : clamp((exp2(log2(abs(_384)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _929 = (((VREffectsCBuffer_m0[7u].x > 1.0f) ? VREffectsCBuffer_m0[7u].x : clamp((exp2(log2(abs(VREffectsCBuffer_m0[7u].x)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _398;
        float _930 = (((VREffectsCBuffer_m0[7u].y > 1.0f) ? VREffectsCBuffer_m0[7u].y : clamp((exp2(log2(abs(VREffectsCBuffer_m0[7u].y)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _398;
        float _931 = (((VREffectsCBuffer_m0[7u].z > 1.0f) ? VREffectsCBuffer_m0[7u].z : clamp((exp2(log2(abs(VREffectsCBuffer_m0[7u].z)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _398;
        float _935 = (_929 + 0.5f) * 2.0f;
        float _936 = (_930 + 0.5f) * 2.0f;
        float _937 = (_931 + 0.5f) * 2.0f;
        float _945 = (((1.0f - _935) * _896) + _935) * _896;
        float _947 = (((1.0f - _936) * _897) + _936) * _897;
        float _949 = (((1.0f - _937) * _898) + _937) * _898;
        float _983 = (((((_935 + (-1.0f)) * sqrt(_896)) + ((_896 * 2.0f) * (0.5f - _929))) - _945) * ((_896 < 0.5f) ? 0.0f : 1.0f)) + _945;
        float _984 = (((((_936 + (-1.0f)) * sqrt(_897)) + ((_897 * 2.0f) * (0.5f - _930))) - _947) * ((_897 < 0.5f) ? 0.0f : 1.0f)) + _947;
        float _985 = (((((_937 + (-1.0f)) * sqrt(_898)) + ((_898 * 2.0f) * (0.5f - _931))) - _949) * ((_898 < 0.5f) ? 0.0f : 1.0f)) + _949;
        frontier_phi_10_7_ladder_12_ladder = ((((_983 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _983) + 0.01252287812530994415283203125f) * _983;
        frontier_phi_10_7_ladder_12_ladder_1 = ((((_984 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _984) + 0.01252287812530994415283203125f) * _984;
        frontier_phi_10_7_ladder_12_ladder_2 = ((((_985 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _985) + 0.01252287812530994415283203125f) * _985;
      }
            else
            {
        float frontier_phi_10_7_ladder_12_ladder_18_ladder;
        float frontier_phi_10_7_ladder_12_ladder_18_ladder_1;
        float frontier_phi_10_7_ladder_12_ladder_18_ladder_2;
        if (VREffectsCBuffer_m0[8u].y < 3.5f)
                {
          float _1044 = (_374 > 1.0f) ? _374 : clamp((exp2(log2(abs(_374)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1045 = (_379 > 1.0f) ? _379 : clamp((exp2(log2(abs(_379)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1046 = (_384 > 1.0f) ? _384 : clamp((exp2(log2(abs(_384)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1077 = (((VREffectsCBuffer_m0[7u].x > 1.0f) ? VREffectsCBuffer_m0[7u].x : clamp((exp2(log2(abs(VREffectsCBuffer_m0[7u].x)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _398;
          float _1078 = (((VREffectsCBuffer_m0[7u].y > 1.0f) ? VREffectsCBuffer_m0[7u].y : clamp((exp2(log2(abs(VREffectsCBuffer_m0[7u].y)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _398;
          float _1079 = (((VREffectsCBuffer_m0[7u].z > 1.0f) ? VREffectsCBuffer_m0[7u].z : clamp((exp2(log2(abs(VREffectsCBuffer_m0[7u].z)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _398;
          float _1086 = (_1044 * 2.0f) * (_1077 + 0.5f);
          float _1087 = (_1045 * 2.0f) * (_1078 + 0.5f);
          float _1088 = (_1046 * 2.0f) * (_1079 + 0.5f);
          float _1116 = (((1.0f - (((1.0f - _1044) * 2.0f) * (0.5f - _1077))) - _1086) * ((_1044 < 0.5f) ? 0.0f : 1.0f)) + _1086;
          float _1117 = (((1.0f - (((1.0f - _1045) * 2.0f) * (0.5f - _1078))) - _1087) * ((_1045 < 0.5f) ? 0.0f : 1.0f)) + _1087;
          float _1118 = (((1.0f - (((1.0f - _1046) * 2.0f) * (0.5f - _1079))) - _1088) * ((_1046 < 0.5f) ? 0.0f : 1.0f)) + _1088;
          frontier_phi_10_7_ladder_12_ladder_18_ladder = ((((_1116 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1116) + 0.01252287812530994415283203125f) * _1116;
          frontier_phi_10_7_ladder_12_ladder_18_ladder_1 = ((((_1117 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1117) + 0.01252287812530994415283203125f) * _1117;
          frontier_phi_10_7_ladder_12_ladder_18_ladder_2 = ((((_1118 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1118) + 0.01252287812530994415283203125f) * _1118;
        }
                else
                {
          frontier_phi_10_7_ladder_12_ladder_18_ladder = ((_398 * (VREffectsCBuffer_m0[7u].x + (-1.0f))) + 1.0f) * _374;
          frontier_phi_10_7_ladder_12_ladder_18_ladder_1 = ((_398 * (VREffectsCBuffer_m0[7u].y + (-1.0f))) + 1.0f) * _379;
          frontier_phi_10_7_ladder_12_ladder_18_ladder_2 = ((_398 * (VREffectsCBuffer_m0[7u].z + (-1.0f))) + 1.0f) * _384;
        }
        frontier_phi_10_7_ladder_12_ladder = frontier_phi_10_7_ladder_12_ladder_18_ladder;
        frontier_phi_10_7_ladder_12_ladder_1 = frontier_phi_10_7_ladder_12_ladder_18_ladder_1;
        frontier_phi_10_7_ladder_12_ladder_2 = frontier_phi_10_7_ladder_12_ladder_18_ladder_2;
      }
      frontier_phi_10_7_ladder = frontier_phi_10_7_ladder_12_ladder;
      frontier_phi_10_7_ladder_1 = frontier_phi_10_7_ladder_12_ladder_1;
      frontier_phi_10_7_ladder_2 = frontier_phi_10_7_ladder_12_ladder_2;
    }
    _550 = frontier_phi_10_7_ladder;
    _555 = frontier_phi_10_7_ladder_1;
    _560 = frontier_phi_10_7_ladder_2;
  }
  float _598 = _212 - VREffectsCBuffer_m0[9u].x;
  float _599 = _212 - VREffectsCBuffer_m0[9u].y;
  float _600 = _212 - VREffectsCBuffer_m0[9u].z;
  float _601 = _212 - VREffectsCBuffer_m0[9u].w;
  float _637 = VREffectsCBuffer_m0[15u].w * clamp(_598 / (VREffectsCBuffer_m0[10u].x - VREffectsCBuffer_m0[9u].x), 0.0f, 1.0f);
  float _653 = ((VREffectsCBuffer_m0[15u].x - VREffectsCBuffer_m0[14u].x) * _637) + VREffectsCBuffer_m0[14u].x;
  float _654 = ((VREffectsCBuffer_m0[15u].y - VREffectsCBuffer_m0[14u].y) * _637) + VREffectsCBuffer_m0[14u].y;
  float _655 = ((VREffectsCBuffer_m0[15u].z - VREffectsCBuffer_m0[14u].z) * _637) + VREffectsCBuffer_m0[14u].z;
  float _657 = VREffectsCBuffer_m0[14u].w * min(clamp(_598 * VREffectsCBuffer_m0[11u].x, 0.0f, 1.0f), clamp((VREffectsCBuffer_m0[10u].x - _212) * VREffectsCBuffer_m0[12u].x, 0.0f, 1.0f));
  float _662 = VREffectsCBuffer_m0[17u].w * clamp(_599 / (VREffectsCBuffer_m0[10u].y - VREffectsCBuffer_m0[9u].y), 0.0f, 1.0f);
  float _678 = ((VREffectsCBuffer_m0[17u].x - VREffectsCBuffer_m0[16u].x) * _662) + VREffectsCBuffer_m0[16u].x;
  float _679 = ((VREffectsCBuffer_m0[17u].y - VREffectsCBuffer_m0[16u].y) * _662) + VREffectsCBuffer_m0[16u].y;
  float _680 = ((VREffectsCBuffer_m0[17u].z - VREffectsCBuffer_m0[16u].z) * _662) + VREffectsCBuffer_m0[16u].z;
  float _682 = VREffectsCBuffer_m0[16u].w * min(clamp(_599 * VREffectsCBuffer_m0[11u].y, 0.0f, 1.0f), clamp((VREffectsCBuffer_m0[10u].y - _212) * VREffectsCBuffer_m0[12u].y, 0.0f, 1.0f));
  float _687 = VREffectsCBuffer_m0[19u].w * clamp(_600 / (VREffectsCBuffer_m0[10u].z - VREffectsCBuffer_m0[9u].z), 0.0f, 1.0f);
  float _703 = ((VREffectsCBuffer_m0[19u].x - VREffectsCBuffer_m0[18u].x) * _687) + VREffectsCBuffer_m0[18u].x;
  float _704 = ((VREffectsCBuffer_m0[19u].y - VREffectsCBuffer_m0[18u].y) * _687) + VREffectsCBuffer_m0[18u].y;
  float _705 = ((VREffectsCBuffer_m0[19u].z - VREffectsCBuffer_m0[18u].z) * _687) + VREffectsCBuffer_m0[18u].z;
  float _707 = VREffectsCBuffer_m0[18u].w * min(clamp(_600 * VREffectsCBuffer_m0[11u].z, 0.0f, 1.0f), clamp((VREffectsCBuffer_m0[10u].z - _212) * VREffectsCBuffer_m0[12u].z, 0.0f, 1.0f));
  float _712 = VREffectsCBuffer_m0[21u].w * clamp(_601 / (VREffectsCBuffer_m0[10u].w - VREffectsCBuffer_m0[9u].w), 0.0f, 1.0f);
  float _728 = ((VREffectsCBuffer_m0[21u].x - VREffectsCBuffer_m0[20u].x) * _712) + VREffectsCBuffer_m0[20u].x;
  float _729 = ((VREffectsCBuffer_m0[21u].y - VREffectsCBuffer_m0[20u].y) * _712) + VREffectsCBuffer_m0[20u].y;
  float _730 = ((VREffectsCBuffer_m0[21u].z - VREffectsCBuffer_m0[20u].z) * _712) + VREffectsCBuffer_m0[20u].z;
  float _732 = VREffectsCBuffer_m0[20u].w * min(clamp(_601 * VREffectsCBuffer_m0[11u].w, 0.0f, 1.0f), clamp((VREffectsCBuffer_m0[10u].w - _212) * VREffectsCBuffer_m0[12u].w, 0.0f, 1.0f));
  float _999;
  float _1004;
  float _1009;
  if (VREffectsCBuffer_m0[13u].x < 0.5f)
    {
    _999 = ((_653 - _550) * _657) + _550;
    _1004 = ((_654 - _555) * _657) + _555;
    _1009 = ((_655 - _560) * _657) + _560;
  }
    else
    {
    float frontier_phi_19_16_ladder;
    float frontier_phi_19_16_ladder_1;
    float frontier_phi_19_16_ladder_2;
    if (VREffectsCBuffer_m0[13u].x < 1.5f)
        {
      frontier_phi_19_16_ladder = (_653 * _657) + _550;
      frontier_phi_19_16_ladder_1 = (_654 * _657) + _555;
      frontier_phi_19_16_ladder_2 = (_655 * _657) + _560;
    }
        else
        {
      float frontier_phi_19_16_ladder_21_ladder;
      float frontier_phi_19_16_ladder_21_ladder_1;
      float frontier_phi_19_16_ladder_21_ladder_2;
      if (VREffectsCBuffer_m0[13u].x < 2.5f)
            {
        float _1174 = (_550 > 1.0f) ? _550 : clamp((exp2(log2(abs(_550)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _1175 = (_555 > 1.0f) ? _555 : clamp((exp2(log2(abs(_555)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _1176 = (_560 > 1.0f) ? _560 : clamp((exp2(log2(abs(_560)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _1207 = (((_653 > 1.0f) ? _653 : clamp((exp2(log2(abs(_653)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _657;
        float _1208 = (((_654 > 1.0f) ? _654 : clamp((exp2(log2(abs(_654)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _657;
        float _1209 = (((_655 > 1.0f) ? _655 : clamp((exp2(log2(abs(_655)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _657;
        float _1213 = (_1207 + 0.5f) * 2.0f;
        float _1214 = (_1208 + 0.5f) * 2.0f;
        float _1215 = (_1209 + 0.5f) * 2.0f;
        float _1223 = (((1.0f - _1213) * _1174) + _1213) * _1174;
        float _1225 = (((1.0f - _1214) * _1175) + _1214) * _1175;
        float _1227 = (((1.0f - _1215) * _1176) + _1215) * _1176;
        float _1261 = (((((_1213 + (-1.0f)) * sqrt(_1174)) + ((_1174 * 2.0f) * (0.5f - _1207))) - _1223) * ((_1174 < 0.5f) ? 0.0f : 1.0f)) + _1223;
        float _1262 = (((((_1214 + (-1.0f)) * sqrt(_1175)) + ((_1175 * 2.0f) * (0.5f - _1208))) - _1225) * ((_1175 < 0.5f) ? 0.0f : 1.0f)) + _1225;
        float _1263 = (((((_1215 + (-1.0f)) * sqrt(_1176)) + ((_1176 * 2.0f) * (0.5f - _1209))) - _1227) * ((_1176 < 0.5f) ? 0.0f : 1.0f)) + _1227;
        frontier_phi_19_16_ladder_21_ladder = ((((_1261 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1261) + 0.01252287812530994415283203125f) * _1261;
        frontier_phi_19_16_ladder_21_ladder_1 = ((((_1262 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1262) + 0.01252287812530994415283203125f) * _1262;
        frontier_phi_19_16_ladder_21_ladder_2 = ((((_1263 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1263) + 0.01252287812530994415283203125f) * _1263;
      }
            else
            {
        float frontier_phi_19_16_ladder_21_ladder_27_ladder;
        float frontier_phi_19_16_ladder_21_ladder_27_ladder_1;
        float frontier_phi_19_16_ladder_21_ladder_27_ladder_2;
        if (VREffectsCBuffer_m0[13u].x < 3.5f)
                {
          float _1322 = (_550 > 1.0f) ? _550 : clamp((exp2(log2(abs(_550)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1323 = (_555 > 1.0f) ? _555 : clamp((exp2(log2(abs(_555)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1324 = (_560 > 1.0f) ? _560 : clamp((exp2(log2(abs(_560)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1355 = (((_653 > 1.0f) ? _653 : clamp((exp2(log2(abs(_653)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _657;
          float _1356 = (((_654 > 1.0f) ? _654 : clamp((exp2(log2(abs(_654)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _657;
          float _1357 = (((_655 > 1.0f) ? _655 : clamp((exp2(log2(abs(_655)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _657;
          float _1364 = (_1322 * 2.0f) * (_1355 + 0.5f);
          float _1365 = (_1323 * 2.0f) * (_1356 + 0.5f);
          float _1366 = (_1324 * 2.0f) * (_1357 + 0.5f);
          float _1394 = (((1.0f - (((1.0f - _1322) * 2.0f) * (0.5f - _1355))) - _1364) * ((_1322 < 0.5f) ? 0.0f : 1.0f)) + _1364;
          float _1395 = (((1.0f - (((1.0f - _1323) * 2.0f) * (0.5f - _1356))) - _1365) * ((_1323 < 0.5f) ? 0.0f : 1.0f)) + _1365;
          float _1396 = (((1.0f - (((1.0f - _1324) * 2.0f) * (0.5f - _1357))) - _1366) * ((_1324 < 0.5f) ? 0.0f : 1.0f)) + _1366;
          frontier_phi_19_16_ladder_21_ladder_27_ladder = ((((_1394 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1394) + 0.01252287812530994415283203125f) * _1394;
          frontier_phi_19_16_ladder_21_ladder_27_ladder_1 = ((((_1395 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1395) + 0.01252287812530994415283203125f) * _1395;
          frontier_phi_19_16_ladder_21_ladder_27_ladder_2 = ((((_1396 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1396) + 0.01252287812530994415283203125f) * _1396;
        }
                else
                {
          frontier_phi_19_16_ladder_21_ladder_27_ladder = (((_653 + (-1.0f)) * _657) + 1.0f) * _550;
          frontier_phi_19_16_ladder_21_ladder_27_ladder_1 = (((_654 + (-1.0f)) * _657) + 1.0f) * _555;
          frontier_phi_19_16_ladder_21_ladder_27_ladder_2 = (((_655 + (-1.0f)) * _657) + 1.0f) * _560;
        }
        frontier_phi_19_16_ladder_21_ladder = frontier_phi_19_16_ladder_21_ladder_27_ladder;
        frontier_phi_19_16_ladder_21_ladder_1 = frontier_phi_19_16_ladder_21_ladder_27_ladder_1;
        frontier_phi_19_16_ladder_21_ladder_2 = frontier_phi_19_16_ladder_21_ladder_27_ladder_2;
      }
      frontier_phi_19_16_ladder = frontier_phi_19_16_ladder_21_ladder;
      frontier_phi_19_16_ladder_1 = frontier_phi_19_16_ladder_21_ladder_1;
      frontier_phi_19_16_ladder_2 = frontier_phi_19_16_ladder_21_ladder_2;
    }
    _999 = frontier_phi_19_16_ladder;
    _1004 = frontier_phi_19_16_ladder_1;
    _1009 = frontier_phi_19_16_ladder_2;
  }
  float _1277;
  float _1282;
  float _1287;
  if (VREffectsCBuffer_m0[13u].y < 0.5f)
    {
    _1277 = ((_678 - _999) * _682) + _999;
    _1282 = ((_679 - _1004) * _682) + _1004;
    _1287 = ((_680 - _1009) * _682) + _1009;
  }
    else
    {
    float frontier_phi_28_25_ladder;
    float frontier_phi_28_25_ladder_1;
    float frontier_phi_28_25_ladder_2;
    if (VREffectsCBuffer_m0[13u].y < 1.5f)
        {
      frontier_phi_28_25_ladder = _999 + (_678 * _682);
      frontier_phi_28_25_ladder_1 = _1004 + (_679 * _682);
      frontier_phi_28_25_ladder_2 = _1009 + (_680 * _682);
    }
        else
        {
      float frontier_phi_28_25_ladder_30_ladder;
      float frontier_phi_28_25_ladder_30_ladder_1;
      float frontier_phi_28_25_ladder_30_ladder_2;
      if (VREffectsCBuffer_m0[13u].y < 2.5f)
            {
        float _1452 = (_999 > 1.0f) ? _999 : clamp((exp2(log2(abs(_999)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _1453 = (_1004 > 1.0f) ? _1004 : clamp((exp2(log2(abs(_1004)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _1454 = (_1009 > 1.0f) ? _1009 : clamp((exp2(log2(abs(_1009)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _1485 = (((_678 > 1.0f) ? _678 : clamp((exp2(log2(abs(_678)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _682;
        float _1486 = (((_679 > 1.0f) ? _679 : clamp((exp2(log2(abs(_679)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _682;
        float _1487 = (((_680 > 1.0f) ? _680 : clamp((exp2(log2(abs(_680)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _682;
        float _1491 = (_1485 + 0.5f) * 2.0f;
        float _1492 = (_1486 + 0.5f) * 2.0f;
        float _1493 = (_1487 + 0.5f) * 2.0f;
        float _1501 = (((1.0f - _1491) * _1452) + _1491) * _1452;
        float _1503 = (((1.0f - _1492) * _1453) + _1492) * _1453;
        float _1505 = (((1.0f - _1493) * _1454) + _1493) * _1454;
        float _1539 = (((((_1491 + (-1.0f)) * sqrt(_1452)) + ((_1452 * 2.0f) * (0.5f - _1485))) - _1501) * ((_1452 < 0.5f) ? 0.0f : 1.0f)) + _1501;
        float _1540 = (((((_1492 + (-1.0f)) * sqrt(_1453)) + ((_1453 * 2.0f) * (0.5f - _1486))) - _1503) * ((_1453 < 0.5f) ? 0.0f : 1.0f)) + _1503;
        float _1541 = (((((_1493 + (-1.0f)) * sqrt(_1454)) + ((_1454 * 2.0f) * (0.5f - _1487))) - _1505) * ((_1454 < 0.5f) ? 0.0f : 1.0f)) + _1505;
        frontier_phi_28_25_ladder_30_ladder = ((((_1539 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1539) + 0.01252287812530994415283203125f) * _1539;
        frontier_phi_28_25_ladder_30_ladder_1 = ((((_1540 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1540) + 0.01252287812530994415283203125f) * _1540;
        frontier_phi_28_25_ladder_30_ladder_2 = ((((_1541 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1541) + 0.01252287812530994415283203125f) * _1541;
      }
            else
            {
        float frontier_phi_28_25_ladder_30_ladder_36_ladder;
        float frontier_phi_28_25_ladder_30_ladder_36_ladder_1;
        float frontier_phi_28_25_ladder_30_ladder_36_ladder_2;
        if (VREffectsCBuffer_m0[13u].y < 3.5f)
                {
          float _1600 = (_999 > 1.0f) ? _999 : clamp((exp2(log2(abs(_999)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1601 = (_1004 > 1.0f) ? _1004 : clamp((exp2(log2(abs(_1004)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1602 = (_1009 > 1.0f) ? _1009 : clamp((exp2(log2(abs(_1009)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1633 = (((_678 > 1.0f) ? _678 : clamp((exp2(log2(abs(_678)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _682;
          float _1634 = (((_679 > 1.0f) ? _679 : clamp((exp2(log2(abs(_679)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _682;
          float _1635 = (((_680 > 1.0f) ? _680 : clamp((exp2(log2(abs(_680)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _682;
          float _1642 = (_1600 * 2.0f) * (_1633 + 0.5f);
          float _1643 = (_1601 * 2.0f) * (_1634 + 0.5f);
          float _1644 = (_1602 * 2.0f) * (_1635 + 0.5f);
          float _1672 = (((1.0f - (((1.0f - _1600) * 2.0f) * (0.5f - _1633))) - _1642) * ((_1600 < 0.5f) ? 0.0f : 1.0f)) + _1642;
          float _1673 = (((1.0f - (((1.0f - _1601) * 2.0f) * (0.5f - _1634))) - _1643) * ((_1601 < 0.5f) ? 0.0f : 1.0f)) + _1643;
          float _1674 = (((1.0f - (((1.0f - _1602) * 2.0f) * (0.5f - _1635))) - _1644) * ((_1602 < 0.5f) ? 0.0f : 1.0f)) + _1644;
          frontier_phi_28_25_ladder_30_ladder_36_ladder = ((((_1672 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1672) + 0.01252287812530994415283203125f) * _1672;
          frontier_phi_28_25_ladder_30_ladder_36_ladder_1 = ((((_1673 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1673) + 0.01252287812530994415283203125f) * _1673;
          frontier_phi_28_25_ladder_30_ladder_36_ladder_2 = ((((_1674 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1674) + 0.01252287812530994415283203125f) * _1674;
        }
                else
                {
          frontier_phi_28_25_ladder_30_ladder_36_ladder = _999 * (((_678 + (-1.0f)) * _682) + 1.0f);
          frontier_phi_28_25_ladder_30_ladder_36_ladder_1 = _1004 * (((_679 + (-1.0f)) * _682) + 1.0f);
          frontier_phi_28_25_ladder_30_ladder_36_ladder_2 = _1009 * (((_680 + (-1.0f)) * _682) + 1.0f);
        }
        frontier_phi_28_25_ladder_30_ladder = frontier_phi_28_25_ladder_30_ladder_36_ladder;
        frontier_phi_28_25_ladder_30_ladder_1 = frontier_phi_28_25_ladder_30_ladder_36_ladder_1;
        frontier_phi_28_25_ladder_30_ladder_2 = frontier_phi_28_25_ladder_30_ladder_36_ladder_2;
      }
      frontier_phi_28_25_ladder = frontier_phi_28_25_ladder_30_ladder;
      frontier_phi_28_25_ladder_1 = frontier_phi_28_25_ladder_30_ladder_1;
      frontier_phi_28_25_ladder_2 = frontier_phi_28_25_ladder_30_ladder_2;
    }
    _1277 = frontier_phi_28_25_ladder;
    _1282 = frontier_phi_28_25_ladder_1;
    _1287 = frontier_phi_28_25_ladder_2;
  }
  float _1555;
  float _1560;
  float _1565;
  if (VREffectsCBuffer_m0[13u].z < 0.5f)
    {
    _1555 = ((_703 - _1277) * _707) + _1277;
    _1560 = ((_704 - _1282) * _707) + _1282;
    _1565 = ((_705 - _1287) * _707) + _1287;
  }
    else
    {
    float frontier_phi_37_34_ladder;
    float frontier_phi_37_34_ladder_1;
    float frontier_phi_37_34_ladder_2;
    if (VREffectsCBuffer_m0[13u].z < 1.5f)
        {
      frontier_phi_37_34_ladder = _1277 + (_703 * _707);
      frontier_phi_37_34_ladder_1 = _1282 + (_704 * _707);
      frontier_phi_37_34_ladder_2 = _1287 + (_705 * _707);
    }
        else
        {
      float frontier_phi_37_34_ladder_39_ladder;
      float frontier_phi_37_34_ladder_39_ladder_1;
      float frontier_phi_37_34_ladder_39_ladder_2;
      if (VREffectsCBuffer_m0[13u].z < 2.5f)
            {
        float _1730 = (_1277 > 1.0f) ? _1277 : clamp((exp2(log2(abs(_1277)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _1731 = (_1282 > 1.0f) ? _1282 : clamp((exp2(log2(abs(_1282)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _1732 = (_1287 > 1.0f) ? _1287 : clamp((exp2(log2(abs(_1287)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _1763 = (((_703 > 1.0f) ? _703 : clamp((exp2(log2(abs(_703)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _707;
        float _1764 = (((_704 > 1.0f) ? _704 : clamp((exp2(log2(abs(_704)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _707;
        float _1765 = (((_705 > 1.0f) ? _705 : clamp((exp2(log2(abs(_705)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _707;
        float _1769 = (_1763 + 0.5f) * 2.0f;
        float _1770 = (_1764 + 0.5f) * 2.0f;
        float _1771 = (_1765 + 0.5f) * 2.0f;
        float _1779 = (((1.0f - _1769) * _1730) + _1769) * _1730;
        float _1781 = (((1.0f - _1770) * _1731) + _1770) * _1731;
        float _1783 = (((1.0f - _1771) * _1732) + _1771) * _1732;
        float _1817 = (((((_1769 + (-1.0f)) * sqrt(_1730)) + ((_1730 * 2.0f) * (0.5f - _1763))) - _1779) * ((_1730 < 0.5f) ? 0.0f : 1.0f)) + _1779;
        float _1818 = (((((_1770 + (-1.0f)) * sqrt(_1731)) + ((_1731 * 2.0f) * (0.5f - _1764))) - _1781) * ((_1731 < 0.5f) ? 0.0f : 1.0f)) + _1781;
        float _1819 = (((((_1771 + (-1.0f)) * sqrt(_1732)) + ((_1732 * 2.0f) * (0.5f - _1765))) - _1783) * ((_1732 < 0.5f) ? 0.0f : 1.0f)) + _1783;
        frontier_phi_37_34_ladder_39_ladder = ((((_1817 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1817) + 0.01252287812530994415283203125f) * _1817;
        frontier_phi_37_34_ladder_39_ladder_1 = ((((_1818 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1818) + 0.01252287812530994415283203125f) * _1818;
        frontier_phi_37_34_ladder_39_ladder_2 = ((((_1819 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _1819) + 0.01252287812530994415283203125f) * _1819;
      }
            else
            {
        float frontier_phi_37_34_ladder_39_ladder_45_ladder;
        float frontier_phi_37_34_ladder_39_ladder_45_ladder_1;
        float frontier_phi_37_34_ladder_39_ladder_45_ladder_2;
        if (VREffectsCBuffer_m0[13u].z < 3.5f)
                {
          float _1970 = (_1277 > 1.0f) ? _1277 : clamp((exp2(log2(abs(_1277)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1971 = (_1282 > 1.0f) ? _1282 : clamp((exp2(log2(abs(_1282)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _1972 = (_1287 > 1.0f) ? _1287 : clamp((exp2(log2(abs(_1287)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _2003 = (((_703 > 1.0f) ? _703 : clamp((exp2(log2(abs(_703)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _707;
          float _2004 = (((_704 > 1.0f) ? _704 : clamp((exp2(log2(abs(_704)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _707;
          float _2005 = (((_705 > 1.0f) ? _705 : clamp((exp2(log2(abs(_705)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _707;
          float _2012 = (_1970 * 2.0f) * (_2003 + 0.5f);
          float _2013 = (_1971 * 2.0f) * (_2004 + 0.5f);
          float _2014 = (_1972 * 2.0f) * (_2005 + 0.5f);
          float _2042 = (((1.0f - (((1.0f - _1970) * 2.0f) * (0.5f - _2003))) - _2012) * ((_1970 < 0.5f) ? 0.0f : 1.0f)) + _2012;
          float _2043 = (((1.0f - (((1.0f - _1971) * 2.0f) * (0.5f - _2004))) - _2013) * ((_1971 < 0.5f) ? 0.0f : 1.0f)) + _2013;
          float _2044 = (((1.0f - (((1.0f - _1972) * 2.0f) * (0.5f - _2005))) - _2014) * ((_1972 < 0.5f) ? 0.0f : 1.0f)) + _2014;
          frontier_phi_37_34_ladder_39_ladder_45_ladder = ((((_2042 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _2042) + 0.01252287812530994415283203125f) * _2042;
          frontier_phi_37_34_ladder_39_ladder_45_ladder_1 = ((((_2043 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _2043) + 0.01252287812530994415283203125f) * _2043;
          frontier_phi_37_34_ladder_39_ladder_45_ladder_2 = ((((_2044 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _2044) + 0.01252287812530994415283203125f) * _2044;
        }
                else
                {
          frontier_phi_37_34_ladder_39_ladder_45_ladder = _1277 * (((_703 + (-1.0f)) * _707) + 1.0f);
          frontier_phi_37_34_ladder_39_ladder_45_ladder_1 = _1282 * (((_704 + (-1.0f)) * _707) + 1.0f);
          frontier_phi_37_34_ladder_39_ladder_45_ladder_2 = _1287 * (((_705 + (-1.0f)) * _707) + 1.0f);
        }
        frontier_phi_37_34_ladder_39_ladder = frontier_phi_37_34_ladder_39_ladder_45_ladder;
        frontier_phi_37_34_ladder_39_ladder_1 = frontier_phi_37_34_ladder_39_ladder_45_ladder_1;
        frontier_phi_37_34_ladder_39_ladder_2 = frontier_phi_37_34_ladder_39_ladder_45_ladder_2;
      }
      frontier_phi_37_34_ladder = frontier_phi_37_34_ladder_39_ladder;
      frontier_phi_37_34_ladder_1 = frontier_phi_37_34_ladder_39_ladder_1;
      frontier_phi_37_34_ladder_2 = frontier_phi_37_34_ladder_39_ladder_2;
    }
    _1555 = frontier_phi_37_34_ladder;
    _1560 = frontier_phi_37_34_ladder_1;
    _1565 = frontier_phi_37_34_ladder_2;
  }
  float _1833;
  float _1838;
  float _1843;
  if (VREffectsCBuffer_m0[13u].w < 0.5f)
    {
    _1833 = ((_728 - _1555) * _732) + _1555;
    _1838 = ((_729 - _1560) * _732) + _1560;
    _1843 = ((_730 - _1565) * _732) + _1565;
  }
    else
    {
    float frontier_phi_46_43_ladder;
    float frontier_phi_46_43_ladder_1;
    float frontier_phi_46_43_ladder_2;
    if (VREffectsCBuffer_m0[13u].w < 1.5f)
        {
      frontier_phi_46_43_ladder = _1555 + (_728 * _732);
      frontier_phi_46_43_ladder_1 = _1560 + (_729 * _732);
      frontier_phi_46_43_ladder_2 = _1565 + (_730 * _732);
    }
        else
        {
      float frontier_phi_46_43_ladder_48_ladder;
      float frontier_phi_46_43_ladder_48_ladder_1;
      float frontier_phi_46_43_ladder_48_ladder_2;
      if (VREffectsCBuffer_m0[13u].w < 2.5f)
            {
        float _2145 = (_1555 > 1.0f) ? _1555 : clamp((exp2(log2(abs(_1555)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _2146 = (_1560 > 1.0f) ? _1560 : clamp((exp2(log2(abs(_1560)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _2147 = (_1565 > 1.0f) ? _1565 : clamp((exp2(log2(abs(_1565)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
        float _2178 = (((_728 > 1.0f) ? _728 : clamp((exp2(log2(abs(_728)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _732;
        float _2179 = (((_729 > 1.0f) ? _729 : clamp((exp2(log2(abs(_729)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _732;
        float _2180 = (((_730 > 1.0f) ? _730 : clamp((exp2(log2(abs(_730)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _732;
        float _2184 = (_2178 + 0.5f) * 2.0f;
        float _2185 = (_2179 + 0.5f) * 2.0f;
        float _2186 = (_2180 + 0.5f) * 2.0f;
        float _2194 = (((1.0f - _2184) * _2145) + _2184) * _2145;
        float _2196 = (((1.0f - _2185) * _2146) + _2185) * _2146;
        float _2198 = (((1.0f - _2186) * _2147) + _2186) * _2147;
        float _2232 = (((((_2184 + (-1.0f)) * sqrt(_2145)) + ((_2145 * 2.0f) * (0.5f - _2178))) - _2194) * ((_2145 < 0.5f) ? 0.0f : 1.0f)) + _2194;
        float _2233 = (((((_2185 + (-1.0f)) * sqrt(_2146)) + ((_2146 * 2.0f) * (0.5f - _2179))) - _2196) * ((_2146 < 0.5f) ? 0.0f : 1.0f)) + _2196;
        float _2234 = (((((_2186 + (-1.0f)) * sqrt(_2147)) + ((_2147 * 2.0f) * (0.5f - _2180))) - _2198) * ((_2147 < 0.5f) ? 0.0f : 1.0f)) + _2198;
        frontier_phi_46_43_ladder_48_ladder = ((((_2232 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _2232) + 0.01252287812530994415283203125f) * _2232;
        frontier_phi_46_43_ladder_48_ladder_1 = ((((_2233 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _2233) + 0.01252287812530994415283203125f) * _2233;
        frontier_phi_46_43_ladder_48_ladder_2 = ((((_2234 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _2234) + 0.01252287812530994415283203125f) * _2234;
      }
            else
            {
        float frontier_phi_46_43_ladder_48_ladder_54_ladder;
        float frontier_phi_46_43_ladder_48_ladder_54_ladder_1;
        float frontier_phi_46_43_ladder_48_ladder_54_ladder_2;
        if (VREffectsCBuffer_m0[13u].w < 3.5f)
                {
          float _2272 = (_1555 > 1.0f) ? _1555 : clamp((exp2(log2(abs(_1555)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _2273 = (_1560 > 1.0f) ? _1560 : clamp((exp2(log2(abs(_1560)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _2274 = (_1565 > 1.0f) ? _1565 : clamp((exp2(log2(abs(_1565)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f);
          float _2305 = (((_728 > 1.0f) ? _728 : clamp((exp2(log2(abs(_728)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _732;
          float _2306 = (((_729 > 1.0f) ? _729 : clamp((exp2(log2(abs(_729)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _732;
          float _2307 = (((_730 > 1.0f) ? _730 : clamp((exp2(log2(abs(_730)) * 0.4166666567325592041015625f) * 1.05499994754791259765625f) + (-0.054999999701976776123046875f), 0.0f, 1.0f)) + (-0.5f)) * _732;
          float _2314 = (_2272 * 2.0f) * (_2305 + 0.5f);
          float _2315 = (_2273 * 2.0f) * (_2306 + 0.5f);
          float _2316 = (_2274 * 2.0f) * (_2307 + 0.5f);
          float _2344 = (((1.0f - (((1.0f - _2272) * 2.0f) * (0.5f - _2305))) - _2314) * ((_2272 < 0.5f) ? 0.0f : 1.0f)) + _2314;
          float _2345 = (((1.0f - (((1.0f - _2273) * 2.0f) * (0.5f - _2306))) - _2315) * ((_2273 < 0.5f) ? 0.0f : 1.0f)) + _2315;
          float _2346 = (((1.0f - (((1.0f - _2274) * 2.0f) * (0.5f - _2307))) - _2316) * ((_2274 < 0.5f) ? 0.0f : 1.0f)) + _2316;
          frontier_phi_46_43_ladder_48_ladder_54_ladder = ((((_2344 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _2344) + 0.01252287812530994415283203125f) * _2344;
          frontier_phi_46_43_ladder_48_ladder_54_ladder_1 = ((((_2345 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _2345) + 0.01252287812530994415283203125f) * _2345;
          frontier_phi_46_43_ladder_48_ladder_54_ladder_2 = ((((_2346 * 0.305306017398834228515625f) + 0.6821711063385009765625f) * _2346) + 0.01252287812530994415283203125f) * _2346;
        }
                else
                {
          frontier_phi_46_43_ladder_48_ladder_54_ladder = _1555 * (((_728 + (-1.0f)) * _732) + 1.0f);
          frontier_phi_46_43_ladder_48_ladder_54_ladder_1 = _1560 * (((_729 + (-1.0f)) * _732) + 1.0f);
          frontier_phi_46_43_ladder_48_ladder_54_ladder_2 = _1565 * (((_730 + (-1.0f)) * _732) + 1.0f);
        }
        frontier_phi_46_43_ladder_48_ladder = frontier_phi_46_43_ladder_48_ladder_54_ladder;
        frontier_phi_46_43_ladder_48_ladder_1 = frontier_phi_46_43_ladder_48_ladder_54_ladder_1;
        frontier_phi_46_43_ladder_48_ladder_2 = frontier_phi_46_43_ladder_48_ladder_54_ladder_2;
      }
      frontier_phi_46_43_ladder = frontier_phi_46_43_ladder_48_ladder;
      frontier_phi_46_43_ladder_1 = frontier_phi_46_43_ladder_48_ladder_1;
      frontier_phi_46_43_ladder_2 = frontier_phi_46_43_ladder_48_ladder_2;
    }
    _1833 = frontier_phi_46_43_ladder;
    _1838 = frontier_phi_46_43_ladder_1;
    _1843 = frontier_phi_46_43_ladder_2;
  }
  float4 _1857 = _VR_SourceImage.Sample(s_linear_repeat_sampler, float2(VREffectsCBuffer_m0[22u].x + _70, (VREffectsCBuffer_m0[22u].y * _73) + _95));
  float _1859 = _1857.x;
  float4 _1876 = _VR_SourceImage.Sample(s_linear_repeat_sampler, float2(VREffectsCBuffer_m0[22u].z + _70, (VREffectsCBuffer_m0[22u].w * _73) + _95));
  float _1878 = _1876.y;
  float4 _1896 = _VR_SourceImage.Sample(s_linear_repeat_sampler, float2(VREffectsCBuffer_m0[23u].x + _70, (VREffectsCBuffer_m0[23u].y * _73) + _95));
  float _1898 = _1896.z;
  float _1932 = ((((-0.0f) - VREffectsCBuffer_m0[4u].y) - VREffectsCBuffer_m0[4u].y) * _64) + VREffectsCBuffer_m0[4u].y;
  float _1933 = ((((((VREffectsCBuffer_m0[24u].x * _1859) - _1833) + (VREffectsCBuffer_m0[25u].x * _1878)) + (VREffectsCBuffer_m0[26u].x * _1898)) * VREffectsCBuffer_m0[23u].z) + _1833) + _1932;
  float _1934 = ((((((VREffectsCBuffer_m0[24u].y * _1859) - _1838) + (VREffectsCBuffer_m0[25u].y * _1878)) + (VREffectsCBuffer_m0[26u].y * _1898)) * VREffectsCBuffer_m0[23u].z) + _1838) + _1932;
  float _1935 = ((((((VREffectsCBuffer_m0[24u].z * _1859) - _1843) + (VREffectsCBuffer_m0[25u].z * _1878)) + (VREffectsCBuffer_m0[26u].z * _1898)) * VREffectsCBuffer_m0[23u].z) + _1843) + _1932;
  float _2113;
  float _2114;
  float _2115;
  if (VREffectsCBuffer_m0[29u].w > 0.5f)
    {
    uint _2067 = uint(int(VREffectsCBuffer_m0[29u].x));
    uint _2075 = uint(int(VREffectsCBuffer_m0[29u].z));
    float4 _2087 = _VRTextureSheetTex.Sample(s_linear_repeat_sampler, float2((float(int(uint(int(_2075) - int(_2067) * (int(_2075) / int(_2067))))) * (1.0f / float(int(_2067)))) + (_70 / VREffectsCBuffer_m0[29u].x), (float(int(uint(int(_2075) / int(_2067)))) * (1.0f / float(int(uint(int(VREffectsCBuffer_m0[29u].y)))))) + (_95 / VREffectsCBuffer_m0[29u].y)));
    float _2102 = VREffectsCBuffer_m0[30u].w * _2087.w;
    float _2103 = 1.0f - _2102;
    _2113 = (_2103 * _1933) + ((VREffectsCBuffer_m0[30u].x * _2087.x) * _2102);
    _2114 = (_2103 * _1934) + ((VREffectsCBuffer_m0[30u].y * _2087.y) * _2102);
    _2115 = (_2103 * _1935) + ((VREffectsCBuffer_m0[30u].z * _2087.z) * _2102);
  }
    else
    {
    _2113 = _1933;
    _2114 = _1934;
    _2115 = _1935;
  }
  SV_Target.x = _2113;
  SV_Target.y = _2114;
  SV_Target.z = _2115;
  SV_Target.w = _1932 + _104.w;
  return SV_Target;
}