// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 26 04:00:14 2025

#include "../../tonemap.hlsl"
// HDD Mission select
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

cbuffer cb3 : register(b3)
{
  float4 cb3[1];
}

cbuffer cb2 : register(b2)
{
  float4 cb2[17];
}

cbuffer cb1 : register(b1)
{
  float4 cb1[27];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[138];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  const float4 icb[] = { { 1.000000, 0, 0, 0},
                              { 0, 1.000000, 0, 0},
                              { 0, 0, 1.000000, 0},
                              { 0, 0, 0, 1.000000} };
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8;
  uint4 bitmask, uiDest;
  float4 fDest;

  float4 x0[3];
  float4 x1[3];
  float4 x2[3];
  float4 x3[3];
  r0.x = cmp(cb1[5].w != 0.000000);
  if (r0.x != 0) {
    r0.yz = float2(-0.5,-0.5) + v1.xy;
    r1.xy = r0.yz * cb1[5].zz + float2(0.5,0.5);
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
  r0.zw = v1.xy * float2(2,2) + float2(-1,-1);
  r1.xy = float2(1,1) + -abs(r0.zw);
  r2.x = -1 + cb0[5].z;
  r3.w = cb0[5].y * r2.x;
  r2.x = cb0[5].y * r2.x + -1;
  r4.y = cb2[1].x * r2.x + 1;
  r4.xz = float2(1,1);
  r2.yz = r4.xy * r0.zw;
  r2.y = dot(r2.yz, r2.yz);
  r2.y = sqrt(r2.y);
  r1.y = r4.y * r1.y;
  r1.x = min(r1.x, r1.y);
  r5.xyzw = cmp(cb2[0].zxxx < float4(0.5,0.5,1.5,2.5));
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
  r2.yz = cmp(float2(9.99999975e-005,0.5) < cb2[1].yw);
  r1.x = r2.y ? r1.x : r1.y;
  r1.y = 1 + -r1.x;
  r1.x = r2.z ? r1.y : r1.x;
  r1.x = cb2[1].z * r1.x;
  r1.y = cmp(9.99999975e-005 < cb2[0].w);
  r1.y = r1.y ? r1.x : 0;
  r1.x = r1.x * r1.y;
  r1.y = cmp(0.5 < cb2[14].z);
  if (r1.y != 0) {
    r3.y = cb2[0].y * r2.x + 1;
    r3.xz = float2(1,1);
    r2.yz = r3.xy * r0.zw;
    r1.y = min(abs(r2.z), abs(r2.y));
    r2.w = max(abs(r2.z), abs(r2.y));
    r2.w = 1 / r2.w;
    r1.y = r2.w * r1.y;
    r2.w = r1.y * r1.y;
    r3.x = r2.w * 0.0208350997 + -0.0851330012;
    r3.x = r2.w * r3.x + 0.180141002;
    r3.x = r2.w * r3.x + -0.330299497;
    r2.w = r2.w * r3.x + 0.999866009;
    r3.x = r2.w * r1.y;
    r3.y = cmp(abs(r2.y) < abs(r2.z));
    r3.x = r3.x * -2 + 1.57079637;
    r3.x = r3.y ? r3.x : 0;
    r1.y = r1.y * r2.w + r3.x;
    r2.w = cmp(r2.y < -r2.y);
    r2.w = r2.w ? -3.141593 : 0;
    r1.y = r2.w + r1.y;
    r2.w = min(r2.z, r2.y);
    r3.x = max(r2.z, r2.y);
    r2.w = cmp(r2.w < -r2.w);
    r3.x = cmp(r3.x >= -r3.x);
    r2.w = r2.w ? r3.x : 0;
    r3.x = r2.w ? -r1.y : r1.y;
    r1.y = dot(r2.yz, r2.yz);
    r3.y = sqrt(r1.y);
    r2.yz = float2(1.27323949,0.636619747) * r3.xy;
    r3.xy = float2(-0.5,-0.5) + v1.xy;
    r3.xy = r3.xy * r3.zw + float2(0.5,0.5);
    r1.y = cmp(0.5 < cb2[14].w);
    r2.yz = r1.yy ? r2.yz : r3.xy;
    r2.yz = r2.yz * cb2[15].xy + cb2[15].zw;
    r2.yz = r0.yy * cb2[16].yz + r2.yz;
    r3.xyzw = t9.Sample(s8_s, r2.yz).xyzw;
    r2.yz = r3.xy * float2(2,2) + float2(-1,-1);
    r2.yz = cb2[16].xx * r2.yz;
    r2.yz = r2.yz * r1.xx;
    r2.yz = float2(0.100000001,0.100000001) * r2.yz;
  } else {
    r2.yz = float2(0,0);
  }
  r1.y = cmp(0 < cb1[11].w);
  if (r1.y != 0) {
    r3.xyzw = t2.Sample(s2_s, v1.xy).xyzw;
    r3.xy = r3.xy * float2(0.100000001,0.100000001) + r2.yz;
    r1.zw = r3.xy + r1.zw;
    r3.zw = r3.xy * r3.zz;
    r3.zw = cb1[11].ww * r3.zw;
    r6.xyzw = r3.zwzw * cb1[11].xxyy + r3.xyxy;
    r3.xy = r3.zw * cb1[11].zz + r3.xy;
    r6.xyzw = v1.xyxy + r6.xyzw;
    if (r0.x != 0) {
      r3.zw = float2(-0.5,-0.5) + r6.xy;
      r4.xy = r3.zw * cb1[5].zz + float2(0.5,0.5);
      r3.zw = r3.zw * cb1[5].zz + -cb1[4].xy;
      r3.zw = cb1[4].zw * r3.zw;
      r1.y = dot(r3.zw, r3.zw);
      r1.y = sqrt(r1.y);
      r2.w = cmp(0 < cb1[5].w);
      if (r2.w != 0) {
        r7.xy = cb1[5].xy * r1.yy;
        sincos(r7.x, r5.x, r7.x);
        r2.w = r5.x / r7.x;
        r5.x = 1 / r7.y;
        r2.w = r2.w * r5.x + -1;
        r6.xy = r3.zw * r2.ww + r4.xy;
      } else {
        r2.w = 1 / r1.y;
        r2.w = cb1[5].x * r2.w;
        r1.y = cb1[5].y * r1.y;
        r5.x = min(1, abs(r1.y));
        r7.x = max(1, abs(r1.y));
        r7.x = 1 / r7.x;
        r5.x = r7.x * r5.x;
        r7.x = r5.x * r5.x;
        r7.y = r7.x * 0.0208350997 + -0.0851330012;
        r7.y = r7.x * r7.y + 0.180141002;
        r7.y = r7.x * r7.y + -0.330299497;
        r7.x = r7.x * r7.y + 0.999866009;
        r7.y = r7.x * r5.x;
        r7.z = cmp(1 < abs(r1.y));
        r7.y = r7.y * -2 + 1.57079637;
        r7.y = r7.z ? r7.y : 0;
        r5.x = r5.x * r7.x + r7.y;
        r1.y = min(1, r1.y);
        r1.y = cmp(r1.y < -r1.y);
        r1.y = r1.y ? -r5.x : r5.x;
        r1.y = r2.w * r1.y + -1;
        r6.xy = r3.zw * r1.yy + r4.xy;
      }
    }
    r7.xyzw = t0.Sample(s0_s, r6.xy).xyzw;
    if (r0.x != 0) {
      r3.zw = float2(-0.5,-0.5) + r6.zw;
      r4.xy = r3.zw * cb1[5].zz + float2(0.5,0.5);
      r3.zw = r3.zw * cb1[5].zz + -cb1[4].xy;
      r3.zw = cb1[4].zw * r3.zw;
      r1.y = dot(r3.zw, r3.zw);
      r1.y = sqrt(r1.y);
      r2.w = cmp(0 < cb1[5].w);
      if (r2.w != 0) {
        r6.xy = cb1[5].xy * r1.yy;
        sincos(r6.x, r5.x, r6.x);
        r2.w = r5.x / r6.x;
        r5.x = 1 / r6.y;
        r2.w = r2.w * r5.x + -1;
        r6.zw = r3.zw * r2.ww + r4.xy;
      } else {
        r2.w = 1 / r1.y;
        r2.w = cb1[5].x * r2.w;
        r1.y = cb1[5].y * r1.y;
        r5.x = min(1, abs(r1.y));
        r6.x = max(1, abs(r1.y));
        r6.x = 1 / r6.x;
        r5.x = r6.x * r5.x;
        r6.x = r5.x * r5.x;
        r6.y = r6.x * 0.0208350997 + -0.0851330012;
        r6.y = r6.x * r6.y + 0.180141002;
        r6.y = r6.x * r6.y + -0.330299497;
        r6.x = r6.x * r6.y + 0.999866009;
        r6.y = r6.x * r5.x;
        r7.y = cmp(1 < abs(r1.y));
        r6.y = r6.y * -2 + 1.57079637;
        r6.y = r7.y ? r6.y : 0;
        r5.x = r5.x * r6.x + r6.y;
        r1.y = min(1, r1.y);
        r1.y = cmp(r1.y < -r1.y);
        r1.y = r1.y ? -r5.x : r5.x;
        r1.y = r2.w * r1.y + -1;
        r6.zw = r3.zw * r1.yy + r4.xy;
      }
    }
    r6.xyzw = t0.Sample(s0_s, r6.zw).xyzw;
    r3.xy = v1.xy + r3.xy;
    if (r0.x != 0) {
      r3.zw = float2(-0.5,-0.5) + r3.xy;
      r4.xy = r3.zw * cb1[5].zz + float2(0.5,0.5);
      r3.zw = r3.zw * cb1[5].zz + -cb1[4].xy;
      r3.zw = cb1[4].zw * r3.zw;
      r0.x = dot(r3.zw, r3.zw);
      r0.x = sqrt(r0.x);
      r1.y = cmp(0 < cb1[5].w);
      if (r1.y != 0) {
        r6.xz = cb1[5].xy * r0.xx;
        sincos(r6.x, r5.x, r6.x);
        r1.y = r5.x / r6.x;
        r2.w = 1 / r6.z;
        r1.y = r1.y * r2.w + -1;
        r3.xy = r3.zw * r1.yy + r4.xy;
      } else {
        r1.y = 1 / r0.x;
        r1.y = cb1[5].x * r1.y;
        r0.x = cb1[5].y * r0.x;
        r2.w = min(1, abs(r0.x));
        r5.x = max(1, abs(r0.x));
        r5.x = 1 / r5.x;
        r2.w = r5.x * r2.w;
        r5.x = r2.w * r2.w;
        r6.x = r5.x * 0.0208350997 + -0.0851330012;
        r6.x = r5.x * r6.x + 0.180141002;
        r6.x = r5.x * r6.x + -0.330299497;
        r5.x = r5.x * r6.x + 0.999866009;
        r6.x = r5.x * r2.w;
        r6.z = cmp(1 < abs(r0.x));
        r6.x = r6.x * -2 + 1.57079637;
        r6.x = r6.z ? r6.x : 0;
        r2.w = r2.w * r5.x + r6.x;
        r0.x = min(1, r0.x);
        r0.x = cmp(r0.x < -r0.x);
        r0.x = r0.x ? -r2.w : r2.w;
        r0.x = r1.y * r0.x + -1;
        r3.xy = r3.zw * r0.xx + r4.xy;
      }
    }
    r3.xyzw = t0.Sample(s0_s, r3.xy).xyzw;
    r3.x = r7.x;
    r3.y = r6.y;
  } else {
    r3.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  }
  r6.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.x = cmp(cb1[21].z < 0.5);
  r4.xy = cmp(float2(0,0) < cb1[21].xy);
  r1.y = (int)r4.y | (int)r4.x;
  r0.x = r0.x ? r1.y : 0;
  if (r0.x != 0) {
    r0.x = cb0[137].y * r1.w;
    r0.x = cb1[25].x * r0.x;
    r1.y = r0.x + r0.x;
    r1.y = cmp(r1.y >= -r1.y);
    r6.xy = r1.yy ? float2(2,0.5) : float2(-2,-0.5);
    r0.x = r6.y * r0.x;
    r0.x = frac(r0.x);
    r1.y = r6.x * r0.x;
    r2.w = cmp(1 < r1.y);
    r0.x = -r6.x * r0.x + 2;
    r0.x = r2.w ? r0.x : r1.y;
    r0.x = r0.x * 2 + -1;
    r6.x = cb1[25].z * r0.x + r1.z;
    r0.x = cb0[137].x * cb0[137].w;
    r1.y = abs(cb1[26].y) + r6.x;
    r2.w = cb1[26].y * r1.w;
    r1.y = r1.y * r0.x + -r2.w;
    r0.x = dot(cb1[26].xx, r0.xx);
    r0.x = r1.y / r0.x;
    r0.x = frac(r0.x);
    r0.x = cmp(0.5 >= r0.x);
    r0.x = r0.x ? 0.999989986 : -1;
    r6.y = cb1[26].z * r0.x + r1.w;
    r7.xyzw = t3.Sample(s3_s, r6.xy).xyzw;
    r6.xyz = log2(abs(r7.xyz));
    r6.xyz = float3(0.333333343,0.333333343,0.333333343) * r6.xyz;
    r6.xyz = exp2(r6.xyz);
    r6.xyz = r6.xyz * float3(1.49380159,1.49380159,1.49380159) + -r7.xyz;
    r8.xyz = cmp(r7.xyz >= float3(0.300000012,0.300000012,0.300000012));
    r8.xyz = r8.xyz ? float3(1,1,1) : 0;
    r6.xyz = float3(-0.699999988,-0.699999988,-0.699999988) + r6.xyz;
    r6.xyz = r8.xyz * r6.xyz + r7.xyz;
    r6.xyz = cb1[21].xxx * r6.xyz;
    r0.x = dot(r3.xyz, float3(0.298999995,0.587000012,0.114));
    r1.y = cmp(0.5 < cb1[22].x);
    r7.xyz = r0.xxx * r6.xyz + -r6.xyz;
    r7.xyz = r6.www * r7.xyz + r6.xyz;
    r7.xyz = r1.yyy ? r7.xyz : r6.xyz;
    if (r4.y != 0) {
      r4.xy = r1.zw * cb1[20].xy + cb1[20].zw;
      r8.xyzw = t4.Sample(s0_s, r4.xy).xyzw;
      r8.xyz = cb1[21].yyy * r8.xyz;
      r7.xyz = r8.xyz * r6.xyz + r7.xyz;
    }
    r3.xyz = r7.xyz + r3.xyz;
    r0.x = r7.x + r7.y;
    r0.x = r0.x + r7.z;
    o0.w = saturate(r0.x * 0.333299994 + r6.w);
  } else {
    o0.w = r6.w;
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
    r1.yzw = float3(1,1,1) + -cb1[6].xyz;
    r1.yzw = r0.xxx * r1.yzw + cb1[6].xyz;
    r3.xyz = r3.xyz * r1.yzw;
  }
  float3 untonemapped = (r3.xyz);

  r3.xyz = renodx::draw::ToneMapPass(untonemapped);

  r0.x = cmp(0 < cb1[13].x);
  if (r0.x != 0) {
    r1.yz = v1.xy * cb1[8].xy + cb1[8].zw;
    r6.xyzw = t1.Sample(s1_s, r1.yz).xyzw;
    r0.x = -0.5 + r6.w;
    r0.x = r0.x + r0.x;
    r1.y = dot(r3.xyz, float3(0.212672904,0.715152204,0.0721750036));
    r1.y = sqrt(r1.y);
    r1.y = cb1[13].y * -r1.y + 1;
    r6.xyz = r3.xyz * r0.xxx;
    r6.xyz = cb1[13].xxx * r6.xyz;
    r3.xyz = r6.xyz * r1.yyy + r3.xyz;
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
  r4.xy = float2(1.27323949,0.5) * r0.wx;
  r0.xz = r0.yy * cb2[10].zw + cb3[0].xy;
  r1.yz = r0.yy * cb2[11].xy + cb3[0].zw;
  r2.xw = float2(-0.5,-0.5) + v1.xy;
  r6.x = cb0[137].x * cb0[137].w;
  r6.y = 1;
  r2.xw = r2.xw * r6.xy + float2(0.5,0.5);
  x0[0].xy = r2.xw;
  x0[1].xy = r4.xy;
  x0[2].xy = v1.xy;
  r0.w = round(cb2[6].z);
  r0.w = (int)r0.w;
  r0.w = max(0, (int)r0.w);
  r0.w = min(2, (int)r0.w);
  r4.zw = x0[r0.w+0].xy;
  r4.zw = r4.zw * cb2[7].xy + cb2[7].zw;
  r4.zw = r0.yy * cb2[8].xy + r4.zw;
  r4.zw = r4.zw + r2.yz;
  x1[0].xy = r2.xw;
  x1[1].xy = r4.xy;
  x1[2].xy = v1.xy;
  r0.w = round(cb2[11].w);
  r0.w = (int)r0.w;
  r0.w = max(0, (int)r0.w);
  r0.w = min(2, (int)r0.w);
  r6.xy = x1[r0.w+0].xy;
  r6.xy = r6.xy * cb2[12].xy + cb2[12].zw;
  r1.yz = r6.xy + r1.yz;
  r1.yz = r1.yz + r2.yz;
  r0.w = (uint)cb2[13].x;
  r6.xyzw = t8.Sample(s7_s, r1.yz).xyzw;
  r0.w = min(3, (uint)r0.w);
  r0.w = dot(r6.xyzw, icb[r0.w+0].xyzw);
  r0.w = -0.498039216 + r0.w;
  r0.w = r0.w + r0.w;
  r1.y = cmp(cb2[3].x < 9.99999975e-006);
  r1.z = 0.00092592591 * cb0[137].y;
  r1.z = max(1, r1.z);
  r1.y = r1.y ? r1.z : 1;
  x2[0].xy = r2.xw;
  x2[1].xy = r4.xy;
  x2[2].xy = v1.xy;
  r1.z = round(cb2[3].x);
  r1.z = (int)r1.z;
  r1.z = max(0, (int)r1.z);
  r1.z = min(2, (int)r1.z);
  r1.zw = x2[r1.z+0].xy;
  r1.zw = cb2[2].xy * r1.zw;
  r1.yz = r1.zw * r1.yy + cb2[2].zw;
  r1.yz = r0.yy * cb2[6].xy + r1.yz;
  r1.yz = r0.ww * cb2[13].yy + r1.yz;
  r1.yz = r1.yz + r2.yz;
  x3[0].xy = r2.xw;
  x3[1].xy = r4.xy;
  x3[2].xy = v1.xy;
  r0.y = round(cb2[8].w);
  r0.y = (int)r0.y;
  r0.y = max(0, (int)r0.y);
  r0.y = min(2, (int)r0.y);
  r2.xw = x3[r0.y+0].xy;
  r2.xw = r2.xw * cb2[9].xy + cb2[9].zw;
  r0.xy = r2.xw + r0.xz;
  r0.xy = r0.ww * cb2[13].zz + r0.xy;
  r0.xy = r0.xy + r2.yz;
  r0.z = (uint)cb2[10].y;
  r2.xyzw = t7.Sample(s6_s, r0.xy).xyzw;
  r0.x = min(3, (uint)r0.z);
  r0.x = dot(r2.xyzw, icb[r0.x+0].xyzw);
  r2.xyzw = t5.Sample(s4_s, r1.yz).xyzw;
  r0.y = cmp(0.5 < cb2[11].z);
  r0.y = r0.y ? r0.x : 1;
  r0.zw = (uint2)cb2[3].yz;
  r0.zw = min(uint2(0,0), (uint2)r0.zw);
  r0.z = dot(r2.xyzw, icb[r0.z+0].xyzw);
  r1.y = cmp(3.5 < cb2[3].y);
  r1.z = saturate(cb2[3].w * r0.y);
  r6.xyzw = cb2[5].xyzw + -cb2[4].xyzw;
  r7.xyz = r1.zzz * r6.xyz + cb2[4].xyz;
  r7.xyz = r7.xyz * r2.xyz;
  r0.z = cb2[3].w * r0.z;
  r0.y = saturate(r0.z * r0.y);
  r6.xyz = r0.yyy * r6.xyz + cb2[4].xyz;
  r1.yzw = r1.yyy ? r7.xyz : r6.xyz;
  r0.y = dot(r2.xyzw, icb[r0.w+0].xyzw);
  r0.z = r0.y * r0.x;
  r0.z = cmp(r0.z >= cb2[10].x);
  r0.z = r0.z ? 1.000000 : 0;
  r0.x = r0.y * r0.x + -cb2[10].x;
  r0.x = saturate(cb2[14].x * r0.x);
  r0.w = cmp(0.5 < cb2[13].w);
  r0.x = r0.w ? r0.x : r0.z;
  r0.z = (uint)cb2[6].w;
  r2.xyzw = t6.Sample(s5_s, r4.zw).xyzw;
  r0.z = min(3, (uint)r0.z);
  r0.z = dot(r2.xyzw, icb[r0.z+0].xyzw);
  r0.w = cmp(cb2[8].z < 0.5);
  r0.y = r0.y * r6.w + cb2[4].w;
  r0.xy = r0.xy * r0.zz;
  r0.x = r0.w ? r0.y : r0.x;
  r0.x = r0.x * r1.x;
  r0.y = cmp(r0.x >= cb2[14].y);
  r0.y = r0.y ? 1.000000 : 0;
  r0.x = r0.x * r0.y;
  r0.yzw = r1.yzw + -r3.xyz;
  r0.yzw = r0.xxx * r0.yzw + r3.xyz;
  r2.xyz = r1.yzw * r0.xxx + r3.xyz;
  r4.xyz = float3(-1,-1,-1) + r1.yzw;
  r4.xyz = r0.xxx * r4.xyz + float3(1,1,1);
  r4.xyz = r4.xyz * r3.xyz;
  r1.xyz = float3(-0.5,-0.5,-0.5) + r1.yzw;
  r1.xyz = r0.xxx * r1.xyz + float3(0.5,0.5,0.5);
  r6.xyz = cmp(r3.xyz < float3(0.5,0.5,0.5));
  r7.xyz = r3.xyz * r1.xyz;
  r7.xyz = r7.xyz + r7.xyz;
  r3.xyz = float3(1,1,1) + -r3.xyz;
  r1.xyz = float3(1,1,1) + -r1.xyz;
  r1.xyz = r3.xyz * r1.xyz;
  r1.xyz = -r1.xyz * float3(2,2,2) + float3(1,1,1);
  r1.xyz = r6.xyz ? r7.xyz : r1.xyz;
  r1.xyz = r5.www ? r4.xyz : r1.xyz;
  r1.xyz = r5.zzz ? r2.xyz : r1.xyz;
  // o0.xyz = saturate(r5.yyy ? r0.yzw : r1.xyz);
  o0.xyz = renodx::draw::RenderIntermediatePass(r5.yyy ? r0.yzw : r1.xyz);
  return;
}