#include "../../tonemap.hlsl"

// used for character portraits
// ---- Created with 3Dmigoto v1.4.1 on Fri Jun  6 22:06:29 2025
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
    r0.xyzw = t2.Sample(s2_s, v1.xy).xyzw;
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
    r2.xyzw = t3.Sample(s3_s, r2.xy).xyzw;
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
      r5.xyzw = t4.Sample(s0_s, r0.zw).xyzw;
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

  r3.xyz = renodx::draw::ToneMapPass(untonemapped);

  r0.x = cmp(0 < cb1[13].x);
  if (r0.x != 0) {
    r0.xy = v1.xy * cb1[8].xy + cb1[8].zw;
    r0.xyzw = t1.Sample(s1_s, r0.xy).xyzw;
    r0.x = -0.5 + r0.w;
    r0.x = r0.x + r0.x;
    r0.y = dot(r3.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
    r0.y = sqrt(r0.y);
    r0.y = cb1[13].y * -r0.y + 1;
    r0.xzw = r3.xyz * r0.xxx;
    r0.xzw = cb1[13].xxx * r0.xzw;
    r3.xyz = r0.xzw * r0.yyy + r3.xyz;
  }
  // o0.xyz = saturate(r3.xyz);
  o0.xyz = renodx::draw::RenderIntermediatePass(r3.xyz);
  return;
}
