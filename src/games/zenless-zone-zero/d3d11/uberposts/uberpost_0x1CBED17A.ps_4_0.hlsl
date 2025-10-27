// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 26 15:18:37 2025

#include "../../tonemap.hlsl"

// Trigger aftershock - shiyu
Texture2D<float4> t6 : register(t6);

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

cbuffer cb1 : register(b1)
{
  float4 cb1[35];
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
  float4 r0,r1,r2,r3,r4,r5,r6,r7,r8;
  uint4 bitmask, uiDest;
  float4 fDest;

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
  r0.yz = cb0[137].xy * v1.xy;
  r2.xy = (uint2)r0.yz;
  r2.zw = float2(0,0);
  r2.xyzw = t0.Load(r2.xyz).xyzw;
  r0.yz = v1.xy * float2(2,2) + float2(-1,-1);
  r3.xyzw = cb0[134].xyzw * -r0.zzzz;
  r3.xyzw = cb0[133].xyzw * r0.yyyy + r3.xyzw;
  r3.xyzw = cb0[135].xyzw * r2.xxxx + r3.xyzw;
  r3.xyzw = cb0[136].xyzw + r3.xyzw;
  r3.xyzw = r3.yzxy / r3.wwww;
  r0.yzw = ddx(r3.yzw);
  r2.yzw = ddy(r3.wyz);
  r4.xyz = r2.yzw * r0.yzw;
  r0.yzw = r0.wyz * r2.zwy + -r4.xyz;
  r1.x = dot(r0.yzw, r0.yzw);
  r1.x = rsqrt(r1.x);
  r0.yzw = r1.xxx * r0.yzw;
  r1.x = cb0[61].z * r2.x + cb0[61].w;
  r1.x = 1 / r1.x;
  r1.x = saturate(r1.x * cb1[31].z + -cb1[31].y);
  r1.y = -cb1[33].y + r3.w;
  r1.y = saturate(abs(r1.y) / cb1[33].x);
  r1.y = 1 + -r1.y;
  r1.y = log2(r1.y);
  r1.y = cb1[33].z * r1.y;
  r1.y = exp2(r1.y);
  r2.xyzw = cb1[31].wwww * r3.xyzw;
  r0.yzw = max(float3(9.99999975e-006,9.99999975e-006,9.99999975e-006), abs(r0.yzw));
  r3.x = dot(r0.yzw, r0.yzw);
  r3.x = rsqrt(r3.x);
  r3.yzw = r3.xxx * r0.yzw;
  r0.y = r3.y + r3.z;
  r0.y = r0.w * r3.x + r0.y;
  r0.yz = r3.yw / r0.yy;
  r3.xy = cb1[32].xy * cb0[14].xx;
  r2.xy = r2.xy * cb1[32].zw + r3.xy;
  r0.w = dot(r2.xy, float2(0.366025418,0.366025418));
  r3.zw = r2.xy + r0.ww;
  r3.zw = floor(r3.zw);
  r2.xy = -r3.zw + r2.xy;
  r0.w = dot(r3.zw, float2(0.211324871,0.211324871));
  r2.xy = r2.xy + r0.ww;
  r0.w = cmp(r2.y < r2.x);
  r4.xyzw = float4(0.211324871,0.211324871,-0.577350259,-0.577350259) + r2.xyxy;
  r5.xyzw = r0.wwww ? float4(0,1,-1,-0) : float4(1,0,-0,-1);
  r4.xy = r5.zw + r4.xy;
  r6.xy = float2(0.00346020772,0.00346020772) * r3.zw;
  r6.xy = floor(r6.xy);
  r3.zw = -r6.xy * float2(289,289) + r3.zw;
  r6.xz = float2(0,1);
  r6.y = r5.x;
  r6.xyz = r6.xyz + r3.www;
  r7.xyz = r6.xyz * float3(34,34,34) + float3(1,1,1);
  r6.xyz = r7.xyz * r6.xyz;
  r7.xyz = float3(0.00346020772,0.00346020772,0.00346020772) * r6.xyz;
  r7.xyz = floor(r7.xyz);
  r6.xyz = -r7.xyz * float3(289,289,289) + r6.xyz;
  r6.xyz = r6.xyz + r3.zzz;
  r5.xz = float2(0,1);
  r5.xyz = r6.xyz + r5.xyz;
  r6.xyz = r5.xyz * float3(34,34,34) + float3(1,1,1);
  r5.xyz = r6.xyz * r5.xyz;
  r6.xyz = float3(0.00346020772,0.00346020772,0.00346020772) * r5.xyz;
  r6.xyz = floor(r6.xyz);
  r5.xyz = -r6.xyz * float3(289,289,289) + r5.xyz;
  r6.x = dot(r2.xy, r2.xy);
  r6.y = dot(r4.xy, r4.xy);
  r6.z = dot(r4.zw, r4.zw);
  r6.xyz = float3(0.5,0.5,0.5) + -r6.xyz;
  r6.xyz = max(float3(0,0,0), r6.xyz);
  r6.xyz = r6.xyz * r6.xyz;
  r6.xyz = r6.xyz * r6.xyz;
  r5.xyz = float3(0.024390243,0.024390243,0.024390243) * r5.xyz;
  r5.xyz = frac(r5.xyz);
  r7.xyz = r5.xyz * float3(2,2,2) + float3(-1,-1,-1);
  r8.xyz = float3(-0.5,-0.5,-0.5) + abs(r7.xyz);
  r5.xyz = r5.xyz * float3(2,2,2) + float3(-0.5,-0.5,-0.5);
  r5.xyz = floor(r5.xyz);
  r5.xyz = r7.xyz + -r5.xyz;
  r7.xyz = r8.xyz * r8.xyz;
  r7.xyz = r5.xyz * r5.xyz + r7.xyz;
  r7.xyz = -r7.xyz * float3(0.853734732,0.853734732,0.853734732) + float3(1.79284286,1.79284286,1.79284286);
  r6.xyz = r7.xyz * r6.xyz;
  r0.w = r8.x * r2.y;
  r7.x = r5.x * r2.x + r0.w;
  r2.xy = r8.yz * r4.yw;
  r7.yz = r5.yz * r4.xz + r2.xy;
  r0.w = dot(r6.xyz, r7.xyz);
  r0.y = r0.y * r0.w;
  r2.xy = r2.zw * cb1[34].xy + r3.xy;
  r0.w = dot(r2.xy, float2(0.366025418,0.366025418));
  r2.zw = r2.xy + r0.ww;
  r2.zw = floor(r2.zw);
  r2.xy = r2.xy + -r2.zw;
  r0.w = dot(r2.zw, float2(0.211324871,0.211324871));
  r2.xy = r2.xy + r0.ww;
  r0.w = cmp(r2.y < r2.x);
  r3.xyzw = float4(0.211324871,0.211324871,-0.577350259,-0.577350259) + r2.xyxy;
  r4.xyzw = r0.wwww ? float4(0,1,-1,-0) : float4(1,0,-0,-1);
  r3.xy = r4.zw + r3.xy;
  r5.xy = float2(0.00346020772,0.00346020772) * r2.zw;
  r5.xy = floor(r5.xy);
  r2.zw = -r5.xy * float2(289,289) + r2.zw;
  r5.xz = float2(0,1);
  r5.y = r4.x;
  r5.xyz = r5.xyz + r2.www;
  r6.xyz = r5.xyz * float3(34,34,34) + float3(1,1,1);
  r5.xyz = r6.xyz * r5.xyz;
  r6.xyz = float3(0.00346020772,0.00346020772,0.00346020772) * r5.xyz;
  r6.xyz = floor(r6.xyz);
  r5.xyz = -r6.xyz * float3(289,289,289) + r5.xyz;
  r5.xyz = r5.xyz + r2.zzz;
  r4.xz = float2(0,1);
  r4.xyz = r5.xyz + r4.xyz;
  r5.xyz = r4.xyz * float3(34,34,34) + float3(1,1,1);
  r4.xyz = r5.xyz * r4.xyz;
  r5.xyz = float3(0.00346020772,0.00346020772,0.00346020772) * r4.xyz;
  r5.xyz = floor(r5.xyz);
  r4.xyz = -r5.xyz * float3(289,289,289) + r4.xyz;
  r5.x = dot(r2.xy, r2.xy);
  r5.y = dot(r3.xy, r3.xy);
  r5.z = dot(r3.zw, r3.zw);
  r5.xyz = float3(0.5,0.5,0.5) + -r5.xyz;
  r5.xyz = max(float3(0,0,0), r5.xyz);
  r5.xyz = r5.xyz * r5.xyz;
  r5.xyz = r5.xyz * r5.xyz;
  r4.xyz = float3(0.024390243,0.024390243,0.024390243) * r4.xyz;
  r4.xyz = frac(r4.xyz);
  r6.xyz = r4.xyz * float3(2,2,2) + float3(-1,-1,-1);
  r7.xyz = float3(-0.5,-0.5,-0.5) + abs(r6.xyz);
  r4.xyz = r4.xyz * float3(2,2,2) + float3(-0.5,-0.5,-0.5);
  r4.xyz = floor(r4.xyz);
  r4.xyz = r6.xyz + -r4.xyz;
  r6.xyz = r7.xyz * r7.xyz;
  r6.xyz = r4.xyz * r4.xyz + r6.xyz;
  r6.xyz = -r6.xyz * float3(0.853734732,0.853734732,0.853734732) + float3(1.79284286,1.79284286,1.79284286);
  r5.xyz = r6.xyz * r5.xyz;
  r0.w = r7.x * r2.y;
  r2.x = r4.x * r2.x + r0.w;
  r3.yw = r7.yz * r3.yw;
  r2.yz = r4.yz * r3.xz + r3.yw;
  r0.w = dot(r5.xyz, r2.xyz);
  r0.z = r0.z * r0.w;
  r0.z = 130 * r0.z;
  r0.y = r0.y * 130 + r0.z;
  r0.y = cb1[31].x * r0.y;
  r0.y = r0.y * r1.x;
  r0.z = r1.x * r1.y;
  r0.w = r0.y * r0.z;
  r0.yz = r0.yy * r0.zz + v1.xy;
  r0.yz = cb0[137].xy * r0.yz;
  r2.xy = (uint2)r0.yz;
  r2.zw = float2(0,0);
  r2.xyzw = t0.Load(r2.xyz).xyzw;
  r0.y = cb0[61].z * r2.x + cb0[61].w;
  r0.y = 1 / r0.y;
  r0.y = saturate(r0.y * cb1[31].z + -cb1[31].y);
  r0.yz = r0.ww * r0.yy + v1.xy;
  r0.w = cmp(0 < cb1[11].w);
  if (r0.w != 0) {
    r2.xyzw = t4.Sample(s2_s, r0.yz).xyzw;
    r1.xy = float2(0.100000001,0.100000001) * r2.xy;
    r1.zw = r2.xy * float2(0.100000001,0.100000001) + r1.zw;
    r2.xy = r1.xy * r2.zz;
    r2.xy = cb1[11].ww * r2.xy;
    r3.xyzw = r2.xyxy * cb1[11].xxyy + r1.xyxy;
    r1.xy = r2.xy * cb1[11].zz + r1.xy;
  } else {
    r3.xyzw = float4(0,0,0,0);
    r1.xy = float2(0,0);
  }
  r2.xy = r0.yz * float2(2,2) + float2(-1,-1);
  r2.zw = float2(-0.5,-0.5) + cb1[24].xy;
  r2.xy = r2.xy + -r2.zw;
  r0.w = dot(r2.xy, r2.xy);
  r2.xy = r2.xy * r0.ww;
  r2.xy = cb1[12].zz * r2.xy;
  r2.xy = float2(-0.333333343,-0.333333343) * r2.xy;
  r2.z = 9.99999975e-005;
  r0.w = dot(r2.xyz, r2.xyz);
  r0.w = rsqrt(r0.w);
  r2.zw = r2.xy * r0.ww;
  r0.w = dot(r2.xy, r2.xy);
  r0.w = sqrt(r0.w);
  r2.x = 0.942809045 * cb1[12].z;
  r0.w = r0.w / r2.x;
  r0.w = log2(r0.w);
  r0.w = cb1[24].z * r0.w;
  r0.w = exp2(r0.w);
  r2.yz = r2.zw * r0.ww;
  r4.xy = r2.yz * r2.xx;
  r3.xy = r3.xy + r0.yz;
  if (r0.x != 0) {
    r4.zw = float2(-0.5,-0.5) + r3.xy;
    r5.xy = r4.zw * cb1[5].zz + float2(0.5,0.5);
    r4.zw = r4.zw * cb1[5].zz + -cb1[4].xy;
    r4.zw = cb1[4].zw * r4.zw;
    r0.w = dot(r4.zw, r4.zw);
    r0.w = sqrt(r0.w);
    r2.w = cmp(0 < cb1[5].w);
    if (r2.w != 0) {
      r5.zw = cb1[5].xy * r0.ww;
      sincos(r5.z, r6.x, r7.x);
      r2.w = r6.x / r7.x;
      r5.z = 1 / r5.w;
      r2.w = r2.w * r5.z + -1;
      r3.xy = r4.zw * r2.ww + r5.xy;
    } else {
      r2.w = 1 / r0.w;
      r2.w = cb1[5].x * r2.w;
      r0.w = cb1[5].y * r0.w;
      r5.z = min(1, abs(r0.w));
      r5.w = max(1, abs(r0.w));
      r5.w = 1 / r5.w;
      r5.z = r5.z * r5.w;
      r5.w = r5.z * r5.z;
      r6.x = r5.w * 0.0208350997 + -0.0851330012;
      r6.x = r5.w * r6.x + 0.180141002;
      r6.x = r5.w * r6.x + -0.330299497;
      r5.w = r5.w * r6.x + 0.999866009;
      r6.x = r5.z * r5.w;
      r6.y = cmp(1 < abs(r0.w));
      r6.x = r6.x * -2 + 1.57079637;
      r6.x = r6.y ? r6.x : 0;
      r5.z = r5.z * r5.w + r6.x;
      r0.w = min(1, r0.w);
      r0.w = cmp(r0.w < -r0.w);
      r0.w = r0.w ? -r5.z : r5.z;
      r0.w = r2.w * r0.w + -1;
      r3.xy = r4.zw * r0.ww + r5.xy;
    }
  }
  r5.xyzw = t1.Sample(s0_s, r3.xy).xyzw;
  r3.xy = r3.zw + r0.yz;
  r2.xy = r2.yz * r2.xx + r3.xy;
  if (r0.x != 0) {
    r2.zw = float2(-0.5,-0.5) + r2.xy;
    r3.xy = r2.zw * cb1[5].zz + float2(0.5,0.5);
    r2.zw = r2.zw * cb1[5].zz + -cb1[4].xy;
    r2.zw = cb1[4].zw * r2.zw;
    r0.w = dot(r2.zw, r2.zw);
    r0.w = sqrt(r0.w);
    r3.z = cmp(0 < cb1[5].w);
    if (r3.z != 0) {
      r3.zw = cb1[5].xy * r0.ww;
      sincos(r3.z, r6.x, r7.x);
      r3.z = r6.x / r7.x;
      r3.w = 1 / r3.w;
      r3.z = r3.z * r3.w + -1;
      r2.xy = r2.zw * r3.zz + r3.xy;
    } else {
      r3.z = 1 / r0.w;
      r3.z = cb1[5].x * r3.z;
      r0.w = cb1[5].y * r0.w;
      r3.w = min(1, abs(r0.w));
      r4.z = max(1, abs(r0.w));
      r4.z = 1 / r4.z;
      r3.w = r4.z * r3.w;
      r4.z = r3.w * r3.w;
      r4.w = r4.z * 0.0208350997 + -0.0851330012;
      r4.w = r4.z * r4.w + 0.180141002;
      r4.w = r4.z * r4.w + -0.330299497;
      r4.z = r4.z * r4.w + 0.999866009;
      r4.w = r4.z * r3.w;
      r5.y = cmp(1 < abs(r0.w));
      r4.w = r4.w * -2 + 1.57079637;
      r4.w = r5.y ? r4.w : 0;
      r3.w = r3.w * r4.z + r4.w;
      r0.w = min(1, r0.w);
      r0.w = cmp(r0.w < -r0.w);
      r0.w = r0.w ? -r3.w : r3.w;
      r0.w = r3.z * r0.w + -1;
      r2.xy = r2.zw * r0.ww + r3.xy;
    }
  }
  r2.xyzw = t1.Sample(s0_s, r2.xy).xyzw;
  r1.xy = r1.xy + r0.yz;
  r1.xy = r4.xy * float2(2,2) + r1.xy;
  if (r0.x != 0) {
    r0.xw = float2(-0.5,-0.5) + r1.xy;
    r2.xz = r0.xw * cb1[5].zz + float2(0.5,0.5);
    r0.xw = r0.xw * cb1[5].zz + -cb1[4].xy;
    r0.xw = cb1[4].zw * r0.xw;
    r2.w = dot(r0.xw, r0.xw);
    r2.w = sqrt(r2.w);
    r3.x = cmp(0 < cb1[5].w);
    if (r3.x != 0) {
      r3.xy = cb1[5].xy * r2.ww;
      sincos(r3.x, r3.x, r4.x);
      r3.x = r3.x / r4.x;
      r3.y = 1 / r3.y;
      r3.x = r3.x * r3.y + -1;
      r1.xy = r0.xw * r3.xx + r2.xz;
    } else {
      r3.x = 1 / r2.w;
      r3.x = cb1[5].x * r3.x;
      r2.w = cb1[5].y * r2.w;
      r3.y = min(1, abs(r2.w));
      r3.z = max(1, abs(r2.w));
      r3.z = 1 / r3.z;
      r3.y = r3.y * r3.z;
      r3.z = r3.y * r3.y;
      r3.w = r3.z * 0.0208350997 + -0.0851330012;
      r3.w = r3.z * r3.w + 0.180141002;
      r3.w = r3.z * r3.w + -0.330299497;
      r3.z = r3.z * r3.w + 0.999866009;
      r3.w = r3.y * r3.z;
      r4.x = cmp(1 < abs(r2.w));
      r3.w = r3.w * -2 + 1.57079637;
      r3.w = r4.x ? r3.w : 0;
      r3.y = r3.y * r3.z + r3.w;
      r2.w = min(1, r2.w);
      r2.w = cmp(r2.w < -r2.w);
      r2.w = r2.w ? -r3.y : r3.y;
      r2.w = r3.x * r2.w + -1;
      r1.xy = r0.xw * r2.ww + r2.xz;
    }
  }
  r3.xyzw = t1.Sample(s0_s, r1.xy).xyzw;
  r4.xyzw = t1.Sample(s0_s, r1.zw).xyzw;
  r0.x = cmp(cb1[21].z < 0.5);
  r1.xy = cmp(float2(0,0) < cb1[21].xy);
  r0.w = (int)r1.y | (int)r1.x;
  r0.x = r0.x ? r0.w : 0;
  if (r0.x != 0) {
    r0.x = cb0[137].y * r1.w;
    r0.x = cb1[25].x * r0.x;
    r0.w = r0.x + r0.x;
    r0.w = cmp(r0.w >= -r0.w);
    r2.xz = r0.ww ? float2(2,0.5) : float2(-2,-0.5);
    r0.x = r2.z * r0.x;
    r0.x = frac(r0.x);
    r0.w = r2.x * r0.x;
    r1.x = cmp(1 < r0.w);
    r0.x = -r2.x * r0.x + 2;
    r0.x = r1.x ? r0.x : r0.w;
    r0.x = r0.x * 2 + -1;
    r4.x = cb1[25].z * r0.x + r1.z;
    r0.x = cb0[137].x * cb0[137].w;
    r0.w = abs(cb1[26].y) + r4.x;
    r1.x = cb1[26].y * r1.w;
    r0.w = r0.w * r0.x + -r1.x;
    r0.x = dot(cb1[26].xx, r0.xx);
    r0.x = r0.w / r0.x;
    r0.x = frac(r0.x);
    r0.x = cmp(0.5 >= r0.x);
    r0.x = r0.x ? 0.999989986 : -1;
    r4.y = cb1[26].z * r0.x + r1.w;
    r6.xyzw = t5.Sample(s3_s, r4.xy).xyzw;
    r2.xzw = log2(abs(r6.xyz));
    r2.xzw = float3(0.333333343,0.333333343,0.333333343) * r2.xzw;
    r2.xzw = exp2(r2.xzw);
    r2.xzw = r2.xzw * float3(1.49380159,1.49380159,1.49380159) + -r6.xyz;
    r4.xyz = cmp(r6.xyz >= float3(0.300000012,0.300000012,0.300000012));
    r4.xyz = r4.xyz ? float3(1,1,1) : 0;
    r2.xzw = float3(-0.699999988,-0.699999988,-0.699999988) + r2.xzw;
    r2.xzw = r4.xyz * r2.xzw + r6.xyz;
    r2.xzw = cb1[21].xxx * r2.xzw;
    r3.x = r5.x;
    r3.y = r2.y;
    r0.x = dot(r3.xyz, float3(0.298999995,0.587000012,0.114));
    r0.w = cmp(0.5 < cb1[22].x);
    r4.xyz = r0.xxx * r2.xzw + -r2.xzw;
    r4.xyz = r4.www * r4.xyz + r2.xzw;
    r4.xyz = r0.www ? r4.xyz : r2.xzw;
    if (r1.y != 0) {
      r0.xw = r1.zw * cb1[20].xy + cb1[20].zw;
      r6.xyzw = t6.Sample(s0_s, r0.xw).xyzw;
      r5.yzw = cb1[21].yyy * r6.xyz;
      r4.xyz = r5.yzw * r2.xzw + r4.xyz;
    }
    r3.xyz = r4.xyz + r3.xyz;
    r0.x = r4.x + r4.y;
    r0.x = r0.x + r4.z;
    o0.w = saturate(r0.x * 0.333299994 + r4.w);
  } else {
    r3.x = r5.x;
    r3.y = r2.y;
    o0.w = r4.w;
  }
  r0.x = cmp(0 < cb1[7].z);
  if (r0.x != 0) {
    r0.xw = -cb1[7].xy + r1.zw;
    r1.yz = cb1[7].zz * abs(r0.xw);
    r1.x = cb1[6].w * r1.y;
    r0.x = dot(r1.xz, r1.xz);
    r0.x = 1 + -r0.x;
    r0.x = max(0, r0.x);
    r0.x = log2(r0.x);
    r0.x = cb1[7].w * r0.x;
    r0.x = exp2(r0.x);
    r1.xyz = float3(1,1,1) + -cb1[6].xyz;
    r1.xyz = r0.xxx * r1.xyz + cb1[6].xyz;
    r3.xyz = r3.xyz * r1.xyz;
  }
  float3 untonemapped = (r3.xyz);
  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s0_s,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR);

  r1.xyz = renodx::lut::Sample(t3, lut_config, untonemapped);
  /*
  r1.xyz = r3.zxy * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
  r1.xyz = log2(r1.xyz);
  r1.xyz = saturate(r1.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));
  r1.yzw = cb1[0].zzz * r1.xyz;
  r0.x = floor(r1.y);
  r2.xy = float2(0.5,0.5) * cb1[0].xy;
  r2.yz = r1.zw * cb1[0].xy + r2.xy;
  r2.x = r0.x * cb1[0].y + r2.y;
  r3.xyzw = t3.SampleLevel(s0_s, r2.xz, 0).xyzw;
  r4.x = cb1[0].y;
  r4.y = 0;
  r1.yz = r4.xy + r2.xz;
  r2.xyzw = t3.SampleLevel(s0_s, r1.yz, 0).xyzw;
  r0.x = r1.x * cb1[0].z + -r0.x;
  r1.xyz = r2.xyz + -r3.xyz;
  r1.xyz = r0.xxx * r1.xyz + r3.xyz;
  */
  r0.x = cmp(0 < cb1[13].x);
  if (r0.x != 0) {
    r0.xy = r0.yz * cb1[8].xy + cb1[8].zw;
    r0.xyzw = t2.Sample(s1_s, r0.xy).xyzw;
    r0.x = -0.5 + r0.w;
    r0.x = r0.x + r0.x;
    r0.y = dot(r1.xyz, float3(0.212672904,0.715152204,0.0721750036));
    r0.y = sqrt(r0.y);
    r0.y = cb1[13].y * -r0.y + 1;
    r0.xzw = r1.xyz * r0.xxx;
    r0.xzw = cb1[13].xxx * r0.xzw;
    r1.xyz = r0.xzw * r0.yyy + r1.xyz;
  }
  // o0.xyz = saturate(r1.xyz);
  o0.xyz = renodx::draw::RenderIntermediatePass(r1.xyz);
  return;
}