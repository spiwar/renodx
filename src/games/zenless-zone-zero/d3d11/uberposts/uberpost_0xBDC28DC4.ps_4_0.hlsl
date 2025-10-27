// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 26 04:00:14 2025

#include "../../tonemap.hlsl"

// Trigger charged shot - VR
Texture2D<float4> t8 : register(t8);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1) {
  float4 cb1[27];
}

cbuffer cb0 : register(b0) {
  float4 cb0[197];
}

// 3Dmigoto declarations
#define cmp -

void main(
    float4 v0: SV_POSITION0,
    float4 v1: TEXCOORD0,
    float4 v2: TEXCOORD1,
    out float4 o0: SV_Target0) {
  float4 r0, r1, r2, r3, r4, r5, r6, r7;
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
  } else {
    r0.xy = v1.xy;
    r2.xyzw = float4(0, 0, 0, 0);
    r0.zw = float2(0, 0);
  }
  r1.x = frac(cb0[14].x);
  r1.yz = v1.xy * float2(5, 5) + r1.xx;
  r3.xyzw = t4.Sample(s3_s, r1.yz).xyzw;
  r1.y = -0.5 + r3.x;
  r1.y = r1.y + r1.y;
  r1.z = cmp(abs(r1.y) >= cb1[15].z);
  r1.z = r1.z ? 1.000000 : 0;
  r1.y = r1.y * r1.z;
  r1.y = cb1[15].y * r1.y;
  r1.y = 0.00999999978 * r1.y;
  sincos(cb1[14].w, r3.x, r4.x);
  r1.yzw = cb1[14].xyz * float3(0.100000001, 0.100000001, 0.100000001) + r1.yyy;
  r4.y = r3.x;
  r3.xyz = r4.yyy * r1.yzw;
  r4.zw = float2(88, 1234) * r1.xx;
  r4.zw = frac(r4.zw);
  r1.x = v1.y + r4.z;
  r5.yw = r1.xx * cb1[15].xx + r3.xy;
  r3.y = r1.x * cb1[15].x + r3.z;
  r5.xz = float2(0.5, 0.5);
  r6.xyzw = t4.Sample(s3_s, r5.xy).xyzw;
  r5.xyzw = t4.Sample(s3_s, r5.zw).xyzw;
  r3.xw = float2(0.5, 0);
  r7.xyzw = t4.Sample(s3_s, r3.xy).yzxw;
  r1.x = r4.w * r4.w;
  r1.x = r4.w * r1.x;
  r3.x = max(cb1[16].y, cb1[16].x);
  r3.x = -cb1[16].x + r3.x;
  r1.x = r1.x * r3.x + cb1[16].x;
  r7.x = r6.x;
  r7.y = r5.x;
  r5.xyz = cmp(r1.xxx >= r7.xyz);
  r5.xyz = r5.xyz ? float3(1, 1, 1) : 0;
  r5.xyz = cb1[16].zzz * r5.xyz;
  r3.xy = cmp(float2(0.5, 0.5) < cb1[19].zw);
  if (r3.x != 0) {
    r4.zw = v1.xy * cb1[17].xy + cb1[17].zw;
    r6.xyzw = t5.Sample(s4_s, r4.zw).xyzw;
    r5.xyz = r6.xxx * r5.xyz;
  }
  if (r3.y != 0) {
    r3.xy = v1.xy * cb1[18].xy + cb1[18].zw;
    r4.zw = cb1[19].xy * cb0[14].xx;
    r4.zw = frac(r4.zw);
    r3.xy = r4.zw + r3.xy;
    r6.xyzw = t5.Sample(s4_s, r3.xy).xyzw;
    r5.xyz = r6.yyy * r5.xyz;
  }
  r3.xy = v1.xy * float2(2, 2) + float2(-1, -1);
  r4.zw = float2(-0.5, -0.5) + cb1[24].xy;
  r3.xy = -r4.zw + r3.xy;
  r1.x = dot(r3.xy, r3.xy);
  r3.xy = r3.xy * r1.xx;
  r3.xy = cb1[12].zz * r3.xy;
  r6.xy = float2(-0.333333343, -0.333333343) * r3.xy;
  r6.z = 9.99999975e-005;
  r1.x = dot(r6.xyz, r6.xyz);
  r1.x = rsqrt(r1.x);
  r3.xy = r6.xy * r1.xx;
  r1.x = dot(r6.xy, r6.xy);
  r1.x = sqrt(r1.x);
  r4.z = 0.942809045 * cb1[12].z;
  r1.x = r1.x / r4.z;
  r1.x = log2(r1.x);
  r1.x = cb1[24].z * r1.x;
  r1.x = exp2(r1.x);
  r3.xy = r3.xy * r1.xx;
  r6.xy = r3.xy * r4.zz;
  r2.xy = v1.xy + r2.xy;
  r1.xy = r1.yy * r4.xy + r2.xy;
  r7.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xy = v1.xy + r2.zw;
  r1.xy = r1.zz * r4.xy + r1.xy;
  r1.xy = r3.xy * r4.zz + r1.xy;
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r0.zw = v1.xy + r0.zw;
  r0.zw = r1.ww * r4.xy + r0.zw;
  r0.zw = r6.xy * float2(2, 2) + r0.zw;
  r1.xyzw = t0.Sample(s0_s, r0.zw).xyzw;
  r4.xyzw = t0.Sample(s0_s, r0.xy).xyzw;
  r0.zw = cb1[23].xy * v1.xy;
  r0.zw = cb0[196].xy * r0.zw;
  r6.xyzw = t8.Sample(s1_s, r0.zw).xyzw;
  r2.xzw = float3(12, 12, 12) * r6.xyz;
  r0.z = 25 * cb0[14].x;
  r0.z = frac(r0.z);
  r0.w = 1 + -v1.y;
  r0.z = r0.z + -r0.w;
  r0.w = 0.400000006 + -r0.z;
  r0.z = saturate(0.0500000007 + r0.z);
  r1.w = cmp(r0.w >= 0.400000006);
  r1.w = r1.w ? 1.000000 : 0;
  r0.z = r0.z * 10 + -r0.w;
  r0.z = r1.w * r0.z + r0.w;
  r0.z = max(0, r0.z);
  r0.z = r0.z * cb1[23].w + 1;
  r2.xzw = r2.xzw * r0.zzz;
  r0.z = 1 + -cb1[23].z;
  r2.xzw = r2.xzw * r0.zzz + cb1[23].zzz;
  r1.x = r7.x;
  r1.y = r2.y;
  r1.xyz = r1.zxy * r2.wxz + r5.zxy;
  r0.z = cmp(cb1[21].z < 0.5);
  r2.xy = cmp(float2(0, 0) < cb1[21].xy);
  r0.w = (int)r2.y | (int)r2.x;
  r0.z = r0.z ? r0.w : 0;
  if (r0.z != 0) {
    r0.z = cb0[137].y * r0.y;
    r0.z = cb1[25].x * r0.z;
    r0.w = r0.z + r0.z;
    r0.w = cmp(r0.w >= -r0.w);
    r2.xz = r0.ww ? float2(2, 0.5) : float2(-2, -0.5);
    r0.z = r2.z * r0.z;
    r0.z = frac(r0.z);
    r0.w = r2.x * r0.z;
    r1.w = cmp(1 < r0.w);
    r0.z = -r2.x * r0.z + 2;
    r0.z = r1.w ? r0.z : r0.w;
    r0.z = r0.z * 2 + -1;
    r3.x = cb1[25].z * r0.z + r0.x;
    r0.z = cb0[137].x * cb0[137].w;
    r0.w = abs(cb1[26].y) + r3.x;
    r1.w = cb1[26].y * r0.y;
    r0.w = r0.w * r0.z + -r1.w;
    r0.z = dot(cb1[26].xx, r0.zz);
    r0.z = r0.w / r0.z;
    r0.z = frac(r0.z);
    r0.z = cmp(0.5 >= r0.z);
    r0.z = r0.z ? 0.999989986 : -1;
    r3.y = cb1[26].z * r0.z + r0.y;
    r5.xyzw = t6.Sample(s5_s, r3.xy).xyzw;
    r2.xzw = log2(abs(r5.xyz));
    r2.xzw = float3(0.333333343, 0.333333343, 0.333333343) * r2.xzw;
    r2.xzw = exp2(r2.xzw);
    r2.xzw = r2.xzw * float3(1.49380159, 1.49380159, 1.49380159) + -r5.xyz;
    r4.xyz = cmp(r5.xyz >= float3(0.300000012, 0.300000012, 0.300000012));
    r4.xyz = r4.xyz ? float3(1, 1, 1) : 0;
    r2.xzw = float3(-0.699999988, -0.699999988, -0.699999988) + r2.xzw;
    r2.xzw = r4.xyz * r2.xzw + r5.xyz;
    r2.xzw = cb1[21].xxx * r2.xzw;
    r0.z = dot(r1.yzx, float3(0.298999995, 0.587000012, 0.114));
    r0.w = cmp(0.5 < cb1[22].x);
    r4.xyz = r0.zzz * r2.xzw + -r2.xzw;
    r4.xyz = r4.www * r4.xyz + r2.xzw;
    r4.xyz = r0.www ? r4.xyz : r2.xzw;
    if (r2.y != 0) {
      r0.zw = r0.xy * cb1[20].xy + cb1[20].zw;
      r5.xyzw = t7.Sample(s0_s, r0.zw).xyzw;
      r5.xyz = cb1[21].yyy * r5.xyz;
      r4.xyz = r5.xyz * r2.xzw + r4.xyz;
    }
    r1.xyz = r4.zxy + r1.xyz;
    r0.z = r4.x + r4.y;
    r0.z = r0.z + r4.z;
    o0.w = saturate(r0.z * 0.333299994 + r4.w);
  } else {
    o0.w = r4.w;
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
    r1.xyz = r1.xyz * r0.zxy;
  }

  float3 untonemapped = r1.yzx;

  r0.xyz = applyUserToneMap(untonemapped, cb1[0], t2, s0_s);
  /*
  r1.xyz = saturate(r1.xyz);
  r0.xyz = float3(12.9200001,12.9200001,12.9200001) * r1.xyz;
  r2.xyz = log2(r1.xyz);
  r2.xyz = float3(0.416666657,0.416666657,0.416666657) * r2.xyz;
  r2.xyz = exp2(r2.xyz);
  r2.xyz = r2.xyz * float3(1.05499995,1.05499995,1.05499995) + float3(-0.0549999997,-0.0549999997,-0.0549999997);
  r1.xyz = cmp(float3(0.00313080009,0.00313080009,0.00313080009) >= r1.xyz);
  r0.xyz = r1.xyz ? r0.xyz : r2.xyz;
  r0.yzw = cb1[0].zzz * r0.xyz;
  r0.y = floor(r0.y);
  r1.xy = float2(0.5,0.5) * cb1[0].xy;
  r1.yz = r0.zw * cb1[0].xy + r1.xy;
  r1.x = r0.y * cb1[0].y + r1.y;
  r2.xyzw = t2.SampleLevel(s0_s, r1.xz, 0).xyzw;
  r3.z = cb1[0].y;
  r0.zw = r1.xz + r3.zw;
  r1.xyzw = t2.SampleLevel(s0_s, r0.zw, 0).xyzw;
  r0.x = r0.x * cb1[0].z + -r0.y;
  r0.yzw = r1.xyz + -r2.xyz;
  r0.xyz = r0.xxx * r0.yzw + r2.xyz;
  r1.xyz = float3(0.0773993805,0.0773993805,0.0773993805) * r0.xyz;
  r2.xyz = float3(0.0549999997,0.0549999997,0.0549999997) + r0.xyz;
  r2.xyz = float3(0.947867334,0.947867334,0.947867334) * r2.xyz;
  r2.xyz = log2(abs(r2.xyz));
  r2.xyz = float3(2.4000001,2.4000001,2.4000001) * r2.xyz;
  r2.xyz = exp2(r2.xyz);
  r0.xyz = cmp(float3(0.0404499993,0.0404499993,0.0404499993) >= r0.xyz);
  r0.xyz = r0.xyz ? r1.xyz : r2.xyz;
  */
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
