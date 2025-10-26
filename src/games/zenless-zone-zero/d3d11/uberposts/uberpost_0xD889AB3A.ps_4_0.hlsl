#include "../../shared.h"

// used on character ults (Miyabi)
// ---- Created with 3Dmigoto v1.4.1 on Fri Jun  6 22:53:57 2025
Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1) {
  float4 cb1[27];
}

cbuffer cb0 : register(b0) {
  float4 cb0[138];
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

  r0.x = cmp(0 < cb1[11].w);
  if (r0.x != 0) {
    r0.xyzw = t3.Sample(s2_s, v1.xy).xyzw;
    r1.xy = float2(0.100000001, 0.100000001) * r0.xy;
    r0.xy = r0.xy * float2(0.100000001, 0.100000001) + v1.xy;
    r0.zw = r1.xy * r0.zz;
    r0.zw = cb1[11].ww * r0.zw;
    r2.xyzw = r0.zwzw * cb1[11].xxyy + r1.xyxy;
    r0.zw = r0.zw * cb1[11].zz + r1.xy;
    r1.xyzw = v1.xyxy + r2.xyzw;
    r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
    r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
    r0.zw = v1.xy + r0.zw;
    r3.xyzw = t0.Sample(s0_s, r0.zw).xyzw;
    r3.x = r2.x;
    r3.y = r1.y;
  } else {
    r0.xy = v1.xy;
    r3.xyzw = t0.Sample(s0_s, v1.xy).xyzw;
  }
  r1.xyzw = t0.Sample(s0_s, r0.xy).xyzw;
  r0.z = cmp(cb1[21].z < 0.5);
  r1.xy = cmp(float2(0, 0) < cb1[21].xy);
  r0.w = (int)r1.y | (int)r1.x;
  r0.z = r0.z ? r0.w : 0;
  if (r0.z != 0) {
    r0.z = cb0[137].y * r0.y;
    r0.z = cb1[25].x * r0.z;
    r0.w = r0.z + r0.z;
    r0.w = cmp(r0.w >= -r0.w);
    r1.xz = r0.ww ? float2(2, 0.5) : float2(-2, -0.5);
    r0.z = r1.z * r0.z;
    r0.z = frac(r0.z);
    r0.w = r1.x * r0.z;
    r1.z = cmp(1 < r0.w);
    r0.z = -r1.x * r0.z + 2;
    r0.z = r1.z ? r0.z : r0.w;
    r0.z = r0.z * 2 + -1;
    r2.x = cb1[25].z * r0.z + r0.x;
    r0.z = cb0[137].x * cb0[137].w;
    r0.w = abs(cb1[26].y) + r2.x;
    r1.x = cb1[26].y * r0.y;
    r0.w = r0.w * r0.z + -r1.x;
    r0.z = dot(cb1[26].xx, r0.zz);
    r0.z = r0.w / r0.z;
    r0.z = frac(r0.z);
    r0.z = cmp(0.5 >= r0.z);
    r0.z = r0.z ? 0.999989986 : -1;
    r2.y = cb1[26].z * r0.z + r0.y;
    r2.xyzw = t4.Sample(s3_s, r2.xy).xyzw;
    r4.xyz = log2(abs(r2.xyz));
    r4.xyz = float3(0.333333343, 0.333333343, 0.333333343) * r4.xyz;
    r4.xyz = exp2(r4.xyz);
    r4.xyz = r4.xyz * float3(1.49380159, 1.49380159, 1.49380159) + -r2.xyz;
    r5.xyz = cmp(r2.xyz >= float3(0.300000012, 0.300000012, 0.300000012));
    r5.xyz = r5.xyz ? float3(1, 1, 1) : 0;
    r4.xyz = float3(-0.699999988, -0.699999988, -0.699999988) + r4.xyz;
    r2.xyz = r5.xyz * r4.xyz + r2.xyz;
    r2.xyz = cb1[21].xxx * r2.xyz;
    r0.z = dot(r3.xyz, float3(0.298999995, 0.587000012, 0.114));
    r0.w = cmp(0.5 < cb1[22].x);
    r4.xyz = r0.zzz * r2.xyz + -r2.xyz;
    r4.xyz = r1.www * r4.xyz + r2.xyz;
    r4.xyz = r0.www ? r4.xyz : r2.xyz;
    if (r1.y != 0) {
      r0.zw = r0.xy * cb1[20].xy + cb1[20].zw;
      r5.xyzw = t5.Sample(s0_s, r0.zw).xyzw;
      r1.xyz = cb1[21].yyy * r5.xyz;
      r4.xyz = r1.xyz * r2.xyz + r4.xyz;
    }
    r3.xyz = r4.xyz + r3.xyz;
    r0.z = r4.x + r4.y;
    r0.z = r0.z + r4.z;
    o0.w = saturate(r0.z * 0.333299994 + r1.w);
  } else {
    o0.w = r1.w;
  }
  r0.z = cmp(0 < cb1[7].z);
  if (r0.z != 0) {
    r0.xy = -cb1[7].xy + r0.xy;
    r0.yz = cb1[7].zz * abs(r0.xy);
    r0.x = cb1[6].w * r0.y;
    r0.x = dot(r0.xz, r0.xz);
    r0.x = 1 + -r0.x;
    r0.x = max(0, r0.x);
    r0.x = log2(r0.x);
    r0.x = cb1[7].w * r0.x;
    r0.x = exp2(r0.x);
    r0.yzw = float3(1, 1, 1) + -cb1[6].xyz;
    r0.xyz = r0.xxx * r0.yzw + cb1[6].xyz;
    r3.xyz = r3.xyz * r0.xyz;
  }

  float3 untonemapped = (r3.xyz);
  
  /*
  // Sample as 2D - ARRI C3 1000 LUT (internal)
  r0.xyz = r3.zxy * float3(5.55555582, 5.55555582, 5.55555582) + float3(0.0479959995, 0.0479959995, 0.0479959995);
  r0.xyz = log2(r0.xyz);
  r0.xyz = saturate(r0.xyz * float3(0.0734997839, 0.0734997839, 0.0734997839) + float3(0.386036009, 0.386036009, 0.386036009));
  r0.yzw = cb1[0].zzz * r0.xyz;
  r0.y = floor(r0.y);
  r1.xy = float2(0.5, 0.5) * cb1[0].xy;
  r1.yz = r0.zw * cb1[0].xy + r1.xy;
  r1.x = r0.y * cb1[0].y + r1.y;
  r2.xyzw = t2.SampleLevel(s0_s, r1.xz, 0).xyzw;
  r3.x = cb1[0].y;
  r3.y = 0;
  r0.zw = r3.xy + r1.xz;
  r1.xyzw = t2.SampleLevel(s0_s, r0.zw, 0).xyzw;
  r0.x = r0.x * cb1[0].z + -r0.y;
  r0.yzw = r1.xyz + -r2.xyz;
  r0.xyz = r0.xxx * r0.yzw + r2.xyz;*/
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s0_s,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR);

  r0.xyz = renodx::lut::Sample(t2, lut_config, untonemapped);

  r0.w = cmp(0 < cb1[13].x);
  if (r0.w != 0) {
    r1.xy = v1.xy * cb1[8].xy + cb1[8].zw;
    r1.xyzw = t1.Sample(s1_s, r1.xy).xyzw;
    r0.w = -0.5 + r1.w;
    r0.w = r0.w + r0.w;
    r1.x = dot(r0.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
    r1.x = sqrt(r1.x);
    r1.x = cb1[13].y * -r1.x + 1;
    r1.yzw = r0.xyz * r0.www;
    r1.yzw = cb1[13].xxx * r1.yzw;
    r0.xyz = r1.yzw * r1.xxx + r0.xyz;
  }
  // o0.xyz = saturate(r0.xyz);
  o0.xyz = renodx::draw::RenderIntermediatePass(r0.xyz);
  return;
}
