#include "../shared.h"

// ---- Created with 3Dmigoto v1.4.1 on Fri Jun  6 06:47:43 2025
Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0) {
  float4 cb0[166];
}

// 3Dmigoto declarations
#define cmp -

void main(
    float4 v0: SV_POSITION0,
    float4 v1: TEXCOORD0,
    float4 v2: TEXCOORD1,
    out float4 o0: SV_Target0) {
  float4 r0, r1, r2, r3, r4, r5;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = t2.Sample(s0_s, v1.xy).xyzw;
  r1.xyzw = t1.Sample(s1_s, v1.xy).xyzw;
  r1.xyz = r1.xyz + r0.xyz;
  r0.w = cmp(0.5 < cb0[164].x);
  if (r0.w != 0) {
    r0.w = cb0[165].y * cb0[163].w;
    // r2.xyz = r1.zxy * r0.www;
    r2.xyz = r1.xyz * r0.www;
    // start of ARRI C3 1000 LUT
    renodx::lut::Config lut_config = renodx::lut::config::Create(
        s0_s,
        1.f,
        0.f,
        renodx::lut::config::type::ARRI_C1000_NO_CUT,
        renodx::lut::config::type::LINEAR);

    float3 sampled = renodx::lut::Sample(t0, lut_config, r2.xyz);

    r2.xyz = renodx::tonemap::UpgradeToneMap(r2.xyz, saturate(r2.xyz), sampled, 1.f);
    /*r2.xyz = r2.xyz * float3(5.55555582, 5.55555582, 5.55555582) + float3(0.0479959995, 0.0479959995, 0.0479959995);
      r2.xyz = log2(r2.xyz);
      r2.xyz = saturate(r2.xyz * float3(0.0734997839, 0.0734997839, 0.0734997839) + float3(0.386036009, 0.386036009, 0.386036009));
      r2.yzw = cb0[163].zzz * r2.xyz;
      r0.w = floor(r2.y);
      r3.xy = float2(0.5, 0.5) * cb0[163].xy;
      r3.yz = r2.zw * cb0[163].xy + r3.xy;
      r3.x = r0.w * cb0[163].y + r3.y;
      r4.xyzw = t0.SampleLevel(s0_s, r3.xz, 0).xyzw;
      r5.x = cb0[163].y;
      r5.y = 0;
      r2.yz = r5.xy + r3.xz;
      r3.xyzw = t0.SampleLevel(s0_s, r2.yz, 0).xyzw;
      r0.w = r2.x * cb0[163].z + -r0.w;
      r2.xyz = r3.xyz + -r4.xyz;
      r2.xyz = r0.www * r2.xyz + r4.xyz;
      // end of ARRI C3 1000 LUT
      r3.xyz = saturate(r2.xyz);;*/
    r3.xyz = r2.xyz;
    r3.xyz = float3(1, 1, 1) + -r3.xyz;
    r3.xyz = r3.xyz + -r2.xyz;
    r2.xyz = cb0[25].zzz * r3.xyz + r2.xyz;
    r0.w = saturate(dot(r2.xyz, float3(0.212672904, 0.715152204, 0.0721750036)));
    r0.w = -cb0[23].z + r0.w;
    r0.w = saturate(cb0[24].z * r0.w);
    r3.x = cb0[23].y + -cb0[23].x;
    r3.y = cb0[24].y + -cb0[24].x;
    r3.z = cb0[25].y + -cb0[25].x;
    r4.x = cb0[23].x;
    r4.y = cb0[24].x;
    r4.z = cb0[25].x;
    r3.xyz = r0.www * r3.xyz + r4.xyz;
    r3.xyz = r3.xyz + -r2.xyz;
    o0.xyz = cb0[26].zzz * r3.xyz + r2.xyz;
  } else {
    o0.xyz = r1.xyz;
  }
  r0.x = r0.x + r0.y;
  r0.x = r0.x + r0.z;
  o0.w = saturate(r0.x * 0.333299994 + r1.w);
  return;
}
