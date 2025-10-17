#include "../shared.h"

// Used on Agent Archives
// ---- Created with 3Dmigoto v1.4.1 on Sat Jun  7 04:43:47 2025
Texture2D<float4> t9 : register(t9);

Texture2D<float4> t8 : register(t8);

Texture2D<float4> t7 : register(t7);

Texture2D<float4> t6 : register(t6);

Texture2D<float4> t5 : register(t5);

Texture2D<float4> t4 : register(t4);

Texture2D<float4> t3 : register(t3);

Texture2D<float4> t2 : register(t2);

Texture2D<float4> t1 : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s8_s : register(s8);

SamplerState s7_s : register(s7);

SamplerState s6_s : register(s6);

SamplerState s5_s : register(s5);

SamplerState s4_s : register(s4);

SamplerState s3_s : register(s3);

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb3 : register(b3) {
  float4 cb3[1];
}

cbuffer cb2 : register(b2) {
  float4 cb2[17];
}

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
  const float4 icb[] = { { 1.000000, 0, 0, 0 },
                         { 0, 1.000000, 0, 0 },
                         { 0, 0, 1.000000, 0 },
                         { 0, 0, 0, 1.000000 } };
  float4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(cb1[5].w != 0.000000);
  if (r0.x != 0) {
    r0.yz = float2(-0.5, -0.5) + v1.xy;
    r1.xy = r0.yz * cb1[5].zz + float2(0.5, 0.5);
    r0.yz = r0.yz * cb1[5].zz + -cb1[4].xy;
    r0.yz = cb1[4].zw * r0.yz;
    r0.w = dot(r0.yz, r0.yz);
    r0.w = sqrt(r0.w);
    r1.z = cmp(0 < cb1[5].w);
    if (r1.z != 0) {
      r1.zw = cb1[5].xy * r0.ww;
      sincos(r1.z, r2.x, r3.x);
      r1.z = r2.x / r3.x;
      r1.w = 1 / r1.w;
      r1.z = r1.z * r1.w + -1;
      r1.zw = r0.yz * r1.zz + r1.xy;
    } else {
      r2.x = 1 / r0.w;
      r2.x = cb1[5].x * r2.x;
      r0.w = cb1[5].y * r0.w;
      r2.y = min(1, abs(r0.w));
      r2.z = max(1, abs(r0.w));
      r2.z = 1 / r2.z;
      r2.y = r2.y * r2.z;
      r2.z = r2.y * r2.y;
      r2.w = r2.z * 0.0208350997 + -0.0851330012;
      r2.w = r2.z * r2.w + 0.180141002;
      r2.w = r2.z * r2.w + -0.330299497;
      r2.z = r2.z * r2.w + 0.999866009;
      r2.w = r2.y * r2.z;
      r3.x = cmp(1 < abs(r0.w));
      r2.w = r2.w * -2 + 1.57079637;
      r2.w = r3.x ? r2.w : 0;
      r2.y = r2.y * r2.z + r2.w;
      r0.w = min(1, r0.w);
      r0.w = cmp(r0.w < -r0.w);
      r0.w = r0.w ? -r2.y : r2.y;
      r0.w = r2.x * r0.w + -1;
      r1.zw = r0.yz * r0.ww + r1.xy;
    }
  } else {
    r1.zw = v1.xy;
  }
  r0.y = cmp(0.5 < cb2[16].w);
  r0.y = r0.y ? cb0[14].x : cb0[17].y;
  r0.zw = v1.xy * float2(2, 2) + float2(-1, -1);
  r1.xy = float2(1, 1) + -abs(r0.zw);
  r2.x = -1 + cb0[5].z;
  r3.x = cb0[5].y * r2.x;
  r2.x = cb0[5].y * r2.x + -1;
  r4.y = cb2[1].x * r2.x + 1;
  r4.xz = float2(1, 1);
  r2.yz = r4.xy * r0.zw;
  r2.y = dot(r2.yz, r2.yz);
  r2.y = sqrt(r2.y);
  r1.y = r4.y * r1.y;
  r1.x = min(r1.x, r1.y);
  r5.xyzw = cmp(cb2[0].zxxx < float4(0.5, 0.5, 1.5, 2.5));
  r1.y = -r2.y * 0.707000017 + 1;
  r1.x = r5.x ? r1.x : r1.y;
  r1.y = cmp(cb2[0].w >= r1.x);
  r1.y = r1.y ? 1.000000 : 0;
  r2.y = 1 + -cb2[1].y;
  r2.y = cb2[0].w * r2.y + -cb2[0].w;
  r1.x = -cb2[0].w + r1.x;
  r2.y = 1 / r2.y;
  r1.x = saturate(r2.y * r1.x);
  r2.y = r1.x * -2 + 3;
  r1.x = r1.x * r1.x;
  r1.x = r2.y * r1.x;
  r2.yz = cmp(float2(9.99999975e-05, 0.5) < cb2[1].yw);
  r1.x = r2.y ? r1.x : r1.y;
  r1.y = 1 + -r1.x;
  r1.x = r2.z ? r1.y : r1.x;
  r1.x = cb2[1].z * r1.x;
  r1.y = cmp(9.99999975e-05 < cb2[0].w);
  r1.y = r1.y ? r1.x : 0;
  r1.x = r1.x * r1.y;
  r1.y = cmp(0.5 < cb2[14].z);
  if (r1.y != 0) {
    r4.y = cb2[0].y * r2.x + 1;
    r4.x = 1;
    r2.yz = r4.xy * r0.zw;
    r1.y = min(abs(r2.z), abs(r2.y));
    r2.w = max(abs(r2.z), abs(r2.y));
    r2.w = 1 / r2.w;
    r1.y = r2.w * r1.y;
    r2.w = r1.y * r1.y;
    r3.w = r2.w * 0.0208350997 + -0.0851330012;
    r3.w = r2.w * r3.w + 0.180141002;
    r3.w = r2.w * r3.w + -0.330299497;
    r2.w = r2.w * r3.w + 0.999866009;
    r3.w = r2.w * r1.y;
    r4.x = cmp(abs(r2.y) < abs(r2.z));
    r3.w = r3.w * -2 + 1.57079637;
    r3.w = r4.x ? r3.w : 0;
    r1.y = r1.y * r2.w + r3.w;
    r2.w = cmp(r2.y < -r2.y);
    r2.w = r2.w ? -3.141593 : 0;
    r1.y = r2.w + r1.y;
    r2.w = min(r2.z, r2.y);
    r3.w = max(r2.z, r2.y);
    r2.w = cmp(r2.w < -r2.w);
    r3.w = cmp(r3.w >= -r3.w);
    r2.w = r2.w ? r3.w : 0;
    r4.x = r2.w ? -r1.y : r1.y;
    r1.y = dot(r2.yz, r2.yz);
    r4.y = sqrt(r1.y);
    r2.yz = float2(1.27323949, 0.636619747) * r4.xy;
    r4.xy = float2(-0.5, -0.5) + v1.xy;
    r3.y = 1;
    r3.yw = r4.xy * r3.yx + float2(0.5, 0.5);
    r1.y = cmp(0.5 < cb2[14].w);
    r2.yz = r1.yy ? r2.yz : r3.yw;
    r2.yz = r2.yz * cb2[15].xy + cb2[15].zw;
    r2.yz = r0.yy * cb2[16].yz + r2.yz;
    r6.xyzw = t9.Sample(s8_s, r2.yz).xyzw;
    r2.yz = r6.xy * float2(2, 2) + float2(-1, -1);
    r2.yz = cb2[16].xx * r2.yz;
    r2.yz = r2.yz * r1.xx;
    r2.yz = float2(0.100000001, 0.100000001) * r2.yz;
  } else {
    r2.yz = float2(0, 0);
  }
  r1.y = cmp(0 < cb1[11].w);
  if (r1.y != 0) {
    r6.xyzw = t2.Sample(s2_s, v1.xy).xyzw;
    r3.yw = r6.xy * float2(0.100000001, 0.100000001) + r2.yz;
    r1.zw = r3.yw + r1.zw;
    r4.xy = r3.yw * r6.zz;
    r4.xy = cb1[11].ww * r4.xy;
    r6.xyzw = r4.xyxy * cb1[11].xxyy + r3.ywyw;
    r3.yw = r4.xy * cb1[11].zz + r3.yw;
  } else {
    r6.xyzw = float4(0, 0, 0, 0);
    r3.yw = float2(0, 0);
  }
  r4.xy = float2(-0.5, -0.5) + cb1[24].xy;
  r4.xy = -r4.xy + r0.zw;
  r1.y = dot(r4.xy, r4.xy);
  r4.xy = r4.xy * r1.yy;
  r4.xy = cb1[12].zz * r4.xy;
  r7.xy = float2(-0.333333343, -0.333333343) * r4.xy;
  r7.z = 9.99999975e-05;
  r1.y = dot(r7.xyz, r7.xyz);
  r1.y = rsqrt(r1.y);
  r4.xy = r7.xy * r1.yy;
  r1.y = dot(r7.xy, r7.xy);
  r1.y = sqrt(r1.y);
  r2.w = 0.942809045 * cb1[12].z;
  r1.y = r1.y / r2.w;
  r1.y = log2(r1.y);
  r1.y = cb1[24].z * r1.y;
  r1.y = exp2(r1.y);
  r4.xy = r4.xy * r1.yy;
  r7.xy = r4.xy * r2.ww;
  r6.xy = v1.xy + r6.xy;
  if (r0.x != 0) {
    r7.zw = float2(-0.5, -0.5) + r6.xy;
    r8.xy = r7.zw * cb1[5].zz + float2(0.5, 0.5);
    r7.zw = r7.zw * cb1[5].zz + -cb1[4].xy;
    r7.zw = cb1[4].zw * r7.zw;
    r1.y = dot(r7.zw, r7.zw);
    r1.y = sqrt(r1.y);
    r5.x = cmp(0 < cb1[5].w);
    if (r5.x != 0) {
      r8.zw = cb1[5].xy * r1.yy;
      sincos(r8.z, r5.x, r9.x);
      r5.x = r5.x / r9.x;
      r8.z = 1 / r8.w;
      r5.x = r5.x * r8.z + -1;
      r6.xy = r7.zw * r5.xx + r8.xy;
    } else {
      r5.x = 1 / r1.y;
      r5.x = cb1[5].x * r5.x;
      r1.y = cb1[5].y * r1.y;
      r8.z = min(1, abs(r1.y));
      r8.w = max(1, abs(r1.y));
      r8.w = 1 / r8.w;
      r8.z = r8.z * r8.w;
      r8.w = r8.z * r8.z;
      r9.x = r8.w * 0.0208350997 + -0.0851330012;
      r9.x = r8.w * r9.x + 0.180141002;
      r9.x = r8.w * r9.x + -0.330299497;
      r8.w = r8.w * r9.x + 0.999866009;
      r9.x = r8.z * r8.w;
      r9.y = cmp(1 < abs(r1.y));
      r9.x = r9.x * -2 + 1.57079637;
      r9.x = r9.y ? r9.x : 0;
      r8.z = r8.z * r8.w + r9.x;
      r1.y = min(1, r1.y);
      r1.y = cmp(r1.y < -r1.y);
      r1.y = r1.y ? -r8.z : r8.z;
      r1.y = r5.x * r1.y + -1;
      r6.xy = r7.zw * r1.yy + r8.xy;
    }
  }
  r8.xyzw = t0.Sample(s0_s, r6.xy).xyzw;
  r6.xy = v1.xy + r6.zw;
  r4.xy = r4.xy * r2.ww + r6.xy;
  if (r0.x != 0) {
    r6.xy = float2(-0.5, -0.5) + r4.xy;
    r6.zw = r6.xy * cb1[5].zz + float2(0.5, 0.5);
    r6.xy = r6.xy * cb1[5].zz + -cb1[4].xy;
    r6.xy = cb1[4].zw * r6.xy;
    r1.y = dot(r6.xy, r6.xy);
    r1.y = sqrt(r1.y);
    r2.w = cmp(0 < cb1[5].w);
    if (r2.w != 0) {
      r7.zw = cb1[5].xy * r1.yy;
      sincos(r7.z, r5.x, r9.x);
      r2.w = r5.x / r9.x;
      r5.x = 1 / r7.w;
      r2.w = r2.w * r5.x + -1;
      r4.xy = r6.xy * r2.ww + r6.zw;
    } else {
      r2.w = 1 / r1.y;
      r2.w = cb1[5].x * r2.w;
      r1.y = cb1[5].y * r1.y;
      r5.x = min(1, abs(r1.y));
      r7.z = max(1, abs(r1.y));
      r7.z = 1 / r7.z;
      r5.x = r7.z * r5.x;
      r7.z = r5.x * r5.x;
      r7.w = r7.z * 0.0208350997 + -0.0851330012;
      r7.w = r7.z * r7.w + 0.180141002;
      r7.w = r7.z * r7.w + -0.330299497;
      r7.z = r7.z * r7.w + 0.999866009;
      r7.w = r7.z * r5.x;
      r8.y = cmp(1 < abs(r1.y));
      r7.w = r7.w * -2 + 1.57079637;
      r7.w = r8.y ? r7.w : 0;
      r5.x = r5.x * r7.z + r7.w;
      r1.y = min(1, r1.y);
      r1.y = cmp(r1.y < -r1.y);
      r1.y = r1.y ? -r5.x : r5.x;
      r1.y = r2.w * r1.y + -1;
      r4.xy = r6.xy * r1.yy + r6.zw;
    }
  }
  r6.xyzw = t0.Sample(s0_s, r4.xy).xyzw;
  r3.yw = v1.xy + r3.yw;
  r3.yw = r7.xy * float2(2, 2) + r3.yw;
  if (r0.x != 0) {
    r4.xy = float2(-0.5, -0.5) + r3.yw;
    r6.xz = r4.xy * cb1[5].zz + float2(0.5, 0.5);
    r4.xy = r4.xy * cb1[5].zz + -cb1[4].xy;
    r4.xy = cb1[4].zw * r4.xy;
    r0.x = dot(r4.xy, r4.xy);
    r0.x = sqrt(r0.x);
    r1.y = cmp(0 < cb1[5].w);
    if (r1.y != 0) {
      r7.xy = cb1[5].xy * r0.xx;
      sincos(r7.x, r5.x, r7.x);
      r1.y = r5.x / r7.x;
      r2.w = 1 / r7.y;
      r1.y = r1.y * r2.w + -1;
      r3.yw = r4.xy * r1.yy + r6.xz;
    } else {
      r1.y = 1 / r0.x;
      r1.y = cb1[5].x * r1.y;
      r0.x = cb1[5].y * r0.x;
      r2.w = min(1, abs(r0.x));
      r5.x = max(1, abs(r0.x));
      r5.x = 1 / r5.x;
      r2.w = r5.x * r2.w;
      r5.x = r2.w * r2.w;
      r6.w = r5.x * 0.0208350997 + -0.0851330012;
      r6.w = r5.x * r6.w + 0.180141002;
      r6.w = r5.x * r6.w + -0.330299497;
      r5.x = r5.x * r6.w + 0.999866009;
      r6.w = r5.x * r2.w;
      r7.x = cmp(1 < abs(r0.x));
      r6.w = r6.w * -2 + 1.57079637;
      r6.w = r7.x ? r6.w : 0;
      r2.w = r2.w * r5.x + r6.w;
      r0.x = min(1, r0.x);
      r0.x = cmp(r0.x < -r0.x);
      r0.x = r0.x ? -r2.w : r2.w;
      r0.x = r1.y * r0.x + -1;
      r3.yw = r4.xy * r0.xx + r6.xz;
    }
  }
  r7.xyzw = t0.Sample(s0_s, r3.yw).xyzw;
  r9.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.x = cmp(cb1[21].z < 0.5);
  r3.yw = cmp(float2(0, 0) < cb1[21].xy);
  r1.y = (int)r3.w | (int)r3.y;
  r0.x = r0.x ? r1.y : 0;
  if (r0.x != 0) {
    r0.x = cb0[137].y * r1.w;
    r0.x = cb1[25].x * r0.x;
    r1.y = r0.x + r0.x;
    r1.y = cmp(r1.y >= -r1.y);
    r4.xy = r1.yy ? float2(2, 0.5) : float2(-2, -0.5);
    r0.x = r4.y * r0.x;
    r0.x = frac(r0.x);
    r1.y = r4.x * r0.x;
    r2.w = cmp(1 < r1.y);
    r0.x = -r4.x * r0.x + 2;
    r0.x = r2.w ? r0.x : r1.y;
    r0.x = r0.x * 2 + -1;
    r4.x = cb1[25].z * r0.x + r1.z;
    r0.x = cb0[137].x * cb0[137].w;
    r1.y = abs(cb1[26].y) + r4.x;
    r2.w = cb1[26].y * r1.w;
    r1.y = r1.y * r0.x + -r2.w;
    r0.x = dot(cb1[26].xx, r0.xx);
    r0.x = r1.y / r0.x;
    r0.x = frac(r0.x);
    r0.x = cmp(0.5 >= r0.x);
    r0.x = r0.x ? 0.999989986 : -1;
    r4.y = cb1[26].z * r0.x + r1.w;
    r10.xyzw = t3.Sample(s3_s, r4.xy).xyzw;
    r6.xzw = log2(abs(r10.xyz));
    r6.xzw = float3(0.333333343, 0.333333343, 0.333333343) * r6.xzw;
    r6.xzw = exp2(r6.xzw);
    r6.xzw = r6.xzw * float3(1.49380159, 1.49380159, 1.49380159) + -r10.xyz;
    r8.yzw = cmp(r10.xyz >= float3(0.300000012, 0.300000012, 0.300000012));
    r8.yzw = r8.yzw ? float3(1, 1, 1) : 0;
    r6.xzw = float3(-0.699999988, -0.699999988, -0.699999988) + r6.xzw;
    r6.xzw = r8.yzw * r6.xzw + r10.xyz;
    r6.xzw = cb1[21].xxx * r6.xzw;
    r7.x = r8.x;
    r7.y = r6.y;
    r0.x = dot(r7.xyz, float3(0.298999995, 0.587000012, 0.114));
    r1.y = cmp(0.5 < cb1[22].x);
    r8.yzw = r0.xxx * r6.xzw + -r6.xzw;
    r8.yzw = r9.www * r8.yzw + r6.xzw;
    r8.yzw = r1.yyy ? r8.yzw : r6.xzw;
    if (r3.w != 0) {
      r3.yw = r1.zw * cb1[20].xy + cb1[20].zw;
      r10.xyzw = t4.Sample(s0_s, r3.yw).xyzw;
      r9.xyz = cb1[21].yyy * r10.xyz;
      r8.yzw = r9.xyz * r6.xzw + r8.yzw;
    }
    r7.xyz = r8.yzw + r7.xyz;
    r0.x = r8.y + r8.z;
    r0.x = r0.x + r8.w;
    o0.w = saturate(r0.x * 0.333299994 + r9.w);
  } else {
    r7.x = r8.x;
    r7.y = r6.y;
    o0.w = r9.w;
  }
  r0.x = cmp(0 < cb1[7].z);
  if (r0.x != 0) {
    r1.yz = -cb1[7].xy + r1.zw;
    r6.yz = cb1[7].zz * abs(r1.yz);
    r6.x = cb1[6].w * r6.y;
    r0.x = dot(r6.xz, r6.xz);
    r0.x = 1 + -r0.x;
    r0.x = max(0, r0.x);
    r0.x = log2(r0.x);
    r0.x = cb1[7].w * r0.x;
    r0.x = exp2(r0.x);
    r1.yzw = float3(1, 1, 1) + -cb1[6].xyz;
    r1.yzw = r0.xxx * r1.yzw + cb1[6].xyz;
    r7.xyz = r7.xyz * r1.yzw;
  }
  float3 untonemapped = renodx::color::srgb::Decode(r7.xyz);

  r7.xyz = renodx::draw::ToneMapPass(untonemapped);

  r0.x = cmp(0 < cb1[13].x);
  if (r0.x != 0) {
    r1.yz = v1.xy * cb1[8].xy + cb1[8].zw;
    r6.xyzw = t1.Sample(s1_s, r1.yz).xyzw;
    r0.x = -0.5 + r6.w;
    r0.x = r0.x + r0.x;
    r1.y = dot(r7.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
    r1.y = sqrt(r1.y);
    r1.y = cb1[13].y * -r1.y + 1;
    r6.xyz = r7.xyz * r0.xxx;
    r6.xyz = cb1[13].xxx * r6.xyz;
    r7.xyz = r6.xyz * r1.yyy + r7.xyz;
  }

  r4.w = cb2[0].y * r2.x + 1;
  r0.xz = r4.zw * r0.zw;
  r0.w = min(abs(r0.z), abs(r0.x));
  r1.y = max(abs(r0.z), abs(r0.x));
  r1.y = 1 / r1.y;
  r0.w = r1.y * r0.w;
  r1.y = r0.w * r0.w;
  r1.z = r1.y * 0.0208350997 + -0.0851330012;
  r1.z = r1.y * r1.z + 0.180141002;
  r1.z = r1.y * r1.z + -0.330299497;
  r1.y = r1.y * r1.z + 0.999866009;
  r1.z = r1.y * r0.w;
  r1.w = cmp(abs(r0.x) < abs(r0.z));
  r1.z = r1.z * -2 + 1.57079637;
  r1.z = r1.w ? r1.z : 0;
  r0.w = r0.w * r1.y + r1.z;
  r1.y = cmp(r0.x < -r0.x);
  r1.y = r1.y ? -3.141593 : 0;
  r0.w = r1.y + r0.w;
  r1.y = min(r0.z, r0.x);
  r1.z = max(r0.z, r0.x);
  r1.y = cmp(r1.y < -r1.y);
  r1.z = cmp(r1.z >= -r1.z);
  r1.y = r1.z ? r1.y : 0;
  r0.w = r1.y ? -r0.w : r0.w;
  r0.x = dot(r0.xz, r0.xz);
  r0.x = sqrt(r0.x);
  r4.xy = float2(1.27323949, 0.5) * r0.wx;
  r0.xz = r0.yy * cb2[10].zw + cb3[0].xy;
  r1.yz = r0.yy * cb2[11].xy + cb3[0].zw;
  r2.xw = float2(-0.5, -0.5) + v1.xy;
  r3.z = 1;
  r2.xw = r2.xw * r3.zx + float2(0.5, 0.5);
  r0.w = cmp(0.5 < cb2[6].z);
  r3.xy = r0.ww ? r4.xy : r2.xw;
  r3.xy = r3.xy * cb2[7].xy + cb2[7].zw;
  r3.xy = r0.yy * cb2[8].xy + r3.xy;
  r3.xy = r3.xy + r2.yz;
  r3.zw = cmp(float2(0.5, 0.5) < cb2[11].wz);
  r4.zw = r3.zz ? r4.xy : r2.xw;
  r4.zw = r4.zw * cb2[12].xy + cb2[12].zw;
  r1.yz = r4.zw + r1.yz;
  r1.yz = r1.yz + r2.yz;
  r0.w = (uint)cb2[13].x;
  r6.xyzw = t8.Sample(s7_s, r1.yz).xyzw;
  r0.w = min(3, (uint)r0.w);
  r0.w = dot(r6.xyzw, icb[r0.w + 0].xyzw);
  r0.w = -0.498039216 + r0.w;
  r0.w = r0.w + r0.w;
  r1.yz = cmp(float2(0.5, 3.5) < cb2[3].xy);
  r1.w = 0.00092592591 * cb0[137].y;
  r1.w = max(1, r1.w);
  r1.w = r1.y ? 1 : r1.w;
  r4.zw = r1.yy ? r4.xy : r2.xw;
  r4.zw = cb2[2].xy * r4.zw;
  r1.yw = r4.zw * r1.ww + cb2[2].zw;
  r1.yw = r0.yy * cb2[6].xy + r1.yw;
  r1.yw = r0.ww * cb2[13].yy + r1.yw;
  r1.yw = r1.yw + r2.yz;
  r0.y = cmp(0.5 < cb2[8].w);
  r2.xw = r0.yy ? r4.xy : r2.xw;
  r2.xw = r2.xw * cb2[9].xy + cb2[9].zw;
  r0.xy = r2.xw + r0.xz;
  r0.xy = r0.ww * cb2[13].zz + r0.xy;
  r0.xy = r0.xy + r2.yz;
  r0.z = (uint)cb2[10].y;
  r2.xyzw = t7.Sample(s6_s, r0.xy).xyzw;
  r0.x = min(3, (uint)r0.z);
  r0.x = dot(r2.xyzw, icb[r0.x + 0].xyzw);
  r2.xyzw = t5.Sample(s4_s, r1.yw).xyzw;
  r0.y = r3.w ? r0.x : 1;
  r0.zw = (uint2)cb2[3].yz;
  r0.zw = min(uint2(0, 0), (uint2)r0.zw);
  r0.z = dot(r2.xyzw, icb[r0.z + 0].xyzw);
  r1.y = saturate(cb2[3].w * r0.y);
  r4.xyzw = cb2[5].xyzw + -cb2[4].xyzw;
  r6.xyz = r1.yyy * r4.xyz + cb2[4].xyz;
  r6.xyz = r6.xyz * r2.xyz;
  r0.z = cb2[3].w * r0.z;
  r0.y = saturate(r0.z * r0.y);
  r4.xyz = r0.yyy * r4.xyz + cb2[4].xyz;
  r1.yzw = r1.zzz ? r6.xyz : r4.xyz;
  r0.y = dot(r2.xyzw, icb[r0.w + 0].xyzw);
  r0.z = r0.y * r0.x;
  r0.z = cmp(r0.z >= cb2[10].x);
  r0.z = r0.z ? 1.000000 : 0;
  r0.x = r0.y * r0.x + -cb2[10].x;
  r0.x = saturate(cb2[14].x * r0.x);
  r0.w = cmp(0.5 < cb2[13].w);
  r0.x = r0.w ? r0.x : r0.z;
  r0.z = (uint)cb2[6].w;
  r2.xyzw = t6.Sample(s5_s, r3.xy).xyzw;
  r0.z = min(3, (uint)r0.z);
  r0.z = dot(r2.xyzw, icb[r0.z + 0].xyzw);
  r0.w = cmp(cb2[8].z < 0.5);
  r0.y = r0.y * r4.w + cb2[4].w;
  r0.xy = r0.xy * r0.zz;
  r0.x = r0.w ? r0.y : r0.x;
  r0.x = r0.x * r1.x;
  r0.y = cmp(r0.x >= cb2[14].y);
  r0.y = r0.y ? 1.000000 : 0;
  r0.x = r0.x * r0.y;
  r0.yzw = r1.yzw + -r7.xyz;
  r0.yzw = r0.xxx * r0.yzw + r7.xyz;
  r2.xyz = r1.yzw * r0.xxx + r7.xyz;
  r3.xyz = float3(-1, -1, -1) + r1.yzw;
  r3.xyz = r0.xxx * r3.xyz + float3(1, 1, 1);
  r3.xyz = r7.xyz * r3.xyz;
  r1.xyz = float3(-0.5, -0.5, -0.5) + r1.yzw;
  r1.xyz = r0.xxx * r1.xyz + float3(0.5, 0.5, 0.5);
  r4.xyz = cmp(r7.xyz < float3(0.5, 0.5, 0.5));
  r6.xyz = r7.xyz * r1.xyz;
  r6.xyz = r6.xyz + r6.xyz;
  r7.xyz = float3(1, 1, 1) + -r7.xyz;
  r1.xyz = float3(1, 1, 1) + -r1.xyz;
  r1.xyz = r7.xyz * r1.xyz;
  r1.xyz = -r1.xyz * float3(2, 2, 2) + float3(1, 1, 1);
  r1.xyz = r4.xyz ? r6.xyz : r1.xyz;
  r1.xyz = r5.www ? r3.xyz : r1.xyz;
  r1.xyz = r5.zzz ? r2.xyz : r1.xyz;
  // o0.xyz = saturate(r5.yyy ? r0.yzw : r1.xyz);
  o0.xyz = (r5.yyy ? r0.yzw : r1.xyz);
  o0.xyz = renodx::draw::RenderIntermediatePass(o0.xyz);
  return;
}
