// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 26 04:00:14 2025
#include "../../shared.h"

// Trigger aftershock - open world
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
  float4 r0,r1,r2,r3,r4,r5,r6;
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
  r0.y = cmp(0 < cb1[11].w);
  if (r0.y != 0) {
    r2.xyzw = t3.Sample(s2_s, v1.xy).xyzw;
    r0.yz = float2(0.100000001,0.100000001) * r2.xy;
    r1.zw = r2.xy * float2(0.100000001,0.100000001) + r1.zw;
    r1.xy = r0.yz * r2.zz;
    r1.xy = cb1[11].ww * r1.xy;
    r2.xyzw = r1.xyxy * cb1[11].xxyy + r0.yzyz;
    r0.yz = r1.xy * cb1[11].zz + r0.yz;
  } else {
    r2.xyzw = float4(0,0,0,0);
    r0.yz = float2(0,0);
  }
  r1.xy = v1.xy * float2(2,2) + float2(-1,-1);
  r3.xy = float2(-0.5,-0.5) + cb1[24].xy;
  r1.xy = -r3.xy + r1.xy;
  r0.w = dot(r1.xy, r1.xy);
  r1.xy = r1.xy * r0.ww;
  r1.xy = cb1[12].zz * r1.xy;
  r3.xy = float2(-0.333333343,-0.333333343) * r1.xy;
  r3.z = 9.99999975e-005;
  r0.w = dot(r3.xyz, r3.xyz);
  r0.w = rsqrt(r0.w);
  r1.xy = r3.xy * r0.ww;
  r0.w = dot(r3.xy, r3.xy);
  r0.w = sqrt(r0.w);
  r3.x = 0.942809045 * cb1[12].z;
  r0.w = r0.w / r3.x;
  r0.w = log2(r0.w);
  r0.w = cb1[24].z * r0.w;
  r0.w = exp2(r0.w);
  r1.xy = r1.xy * r0.ww;
  r3.yz = r1.xy * r3.xx;
  r2.xy = v1.xy + r2.xy;
  if (r0.x != 0) {
    r4.xy = float2(-0.5,-0.5) + r2.xy;
    r4.zw = r4.xy * cb1[5].zz + float2(0.5,0.5);
    r4.xy = r4.xy * cb1[5].zz + -cb1[4].xy;
    r4.xy = cb1[4].zw * r4.xy;
    r0.w = dot(r4.xy, r4.xy);
    r0.w = sqrt(r0.w);
    r3.w = cmp(0 < cb1[5].w);
    if (r3.w != 0) {
      r5.xy = cb1[5].xy * r0.ww;
      sincos(r5.x, r5.x, r6.x);
      r3.w = r5.x / r6.x;
      r5.x = 1 / r5.y;
      r3.w = r3.w * r5.x + -1;
      r2.xy = r4.xy * r3.ww + r4.zw;
    } else {
      r3.w = 1 / r0.w;
      r3.w = cb1[5].x * r3.w;
      r0.w = cb1[5].y * r0.w;
      r5.x = min(1, abs(r0.w));
      r5.y = max(1, abs(r0.w));
      r5.y = 1 / r5.y;
      r5.x = r5.x * r5.y;
      r5.y = r5.x * r5.x;
      r5.z = r5.y * 0.0208350997 + -0.0851330012;
      r5.z = r5.y * r5.z + 0.180141002;
      r5.z = r5.y * r5.z + -0.330299497;
      r5.y = r5.y * r5.z + 0.999866009;
      r5.z = r5.x * r5.y;
      r5.w = cmp(1 < abs(r0.w));
      r5.z = r5.z * -2 + 1.57079637;
      r5.z = r5.w ? r5.z : 0;
      r5.x = r5.x * r5.y + r5.z;
      r0.w = min(1, r0.w);
      r0.w = cmp(r0.w < -r0.w);
      r0.w = r0.w ? -r5.x : r5.x;
      r0.w = r3.w * r0.w + -1;
      r2.xy = r4.xy * r0.ww + r4.zw;
    }
  }
  r4.xyzw = t0.Sample(s0_s, r2.xy).xyzw;
  r2.xy = v1.xy + r2.zw;
  r1.xy = r1.xy * r3.xx + r2.xy;
  if (r0.x != 0) {
    r2.xy = float2(-0.5,-0.5) + r1.xy;
    r2.zw = r2.xy * cb1[5].zz + float2(0.5,0.5);
    r2.xy = r2.xy * cb1[5].zz + -cb1[4].xy;
    r2.xy = cb1[4].zw * r2.xy;
    r0.w = dot(r2.xy, r2.xy);
    r0.w = sqrt(r0.w);
    r3.x = cmp(0 < cb1[5].w);
    if (r3.x != 0) {
      r3.xw = cb1[5].xy * r0.ww;
      sincos(r3.x, r3.x, r5.x);
      r3.x = r3.x / r5.x;
      r3.w = 1 / r3.w;
      r3.x = r3.x * r3.w + -1;
      r1.xy = r2.xy * r3.xx + r2.zw;
    } else {
      r3.x = 1 / r0.w;
      r3.x = cb1[5].x * r3.x;
      r0.w = cb1[5].y * r0.w;
      r3.w = min(1, abs(r0.w));
      r4.y = max(1, abs(r0.w));
      r4.y = 1 / r4.y;
      r3.w = r4.y * r3.w;
      r4.y = r3.w * r3.w;
      r4.z = r4.y * 0.0208350997 + -0.0851330012;
      r4.z = r4.y * r4.z + 0.180141002;
      r4.z = r4.y * r4.z + -0.330299497;
      r4.y = r4.y * r4.z + 0.999866009;
      r4.z = r4.y * r3.w;
      r4.w = cmp(1 < abs(r0.w));
      r4.z = r4.z * -2 + 1.57079637;
      r4.z = r4.w ? r4.z : 0;
      r3.w = r3.w * r4.y + r4.z;
      r0.w = min(1, r0.w);
      r0.w = cmp(r0.w < -r0.w);
      r0.w = r0.w ? -r3.w : r3.w;
      r0.w = r3.x * r0.w + -1;
      r1.xy = r2.xy * r0.ww + r2.zw;
    }
  }
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r0.yz = v1.xy + r0.yz;
  r0.yz = r3.yz * float2(2,2) + r0.yz;
  if (r0.x != 0) {
    r0.xw = float2(-0.5,-0.5) + r0.yz;
    r1.xy = r0.xw * cb1[5].zz + float2(0.5,0.5);
    r0.xw = r0.xw * cb1[5].zz + -cb1[4].xy;
    r0.xw = cb1[4].zw * r0.xw;
    r2.x = dot(r0.xw, r0.xw);
    r2.x = sqrt(r2.x);
    r2.z = cmp(0 < cb1[5].w);
    if (r2.z != 0) {
      r2.zw = cb1[5].xy * r2.xx;
      sincos(r2.z, r3.x, r5.x);
      r2.z = r3.x / r5.x;
      r2.w = 1 / r2.w;
      r2.z = r2.z * r2.w + -1;
      r0.yz = r0.xw * r2.zz + r1.xy;
    } else {
      r2.z = 1 / r2.x;
      r2.z = cb1[5].x * r2.z;
      r2.x = cb1[5].y * r2.x;
      r2.w = min(1, abs(r2.x));
      r3.x = max(1, abs(r2.x));
      r3.x = 1 / r3.x;
      r2.w = r3.x * r2.w;
      r3.x = r2.w * r2.w;
      r3.y = r3.x * 0.0208350997 + -0.0851330012;
      r3.y = r3.x * r3.y + 0.180141002;
      r3.y = r3.x * r3.y + -0.330299497;
      r3.x = r3.x * r3.y + 0.999866009;
      r3.y = r3.x * r2.w;
      r3.z = cmp(1 < abs(r2.x));
      r3.y = r3.y * -2 + 1.57079637;
      r3.y = r3.z ? r3.y : 0;
      r2.w = r2.w * r3.x + r3.y;
      r2.x = min(1, r2.x);
      r2.x = cmp(r2.x < -r2.x);
      r2.x = r2.x ? -r2.w : r2.w;
      r2.x = r2.z * r2.x + -1;
      r0.yz = r0.xw * r2.xx + r1.xy;
    }
  }
  r0.xyzw = t0.Sample(s0_s, r0.yz).xyzw;
  r3.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.w = cmp(cb1[21].z < 0.5);
  r1.xy = cmp(float2(0,0) < cb1[21].xy);
  r1.x = (int)r1.y | (int)r1.x;
  r0.w = r0.w ? r1.x : 0;
  if (r0.w != 0) {
    r0.w = cb0[137].y * r1.w;
    r0.w = cb1[25].x * r0.w;
    r1.x = r0.w + r0.w;
    r1.x = cmp(r1.x >= -r1.x);
    r2.xz = r1.xx ? float2(2,0.5) : float2(-2,-0.5);
    r0.w = r2.z * r0.w;
    r0.w = frac(r0.w);
    r1.x = r2.x * r0.w;
    r2.z = cmp(1 < r1.x);
    r0.w = -r2.x * r0.w + 2;
    r0.w = r2.z ? r0.w : r1.x;
    r0.w = r0.w * 2 + -1;
    r3.x = cb1[25].z * r0.w + r1.z;
    r0.w = cb0[137].x * cb0[137].w;
    r1.x = abs(cb1[26].y) + r3.x;
    r2.x = cb1[26].y * r1.w;
    r1.x = r1.x * r0.w + -r2.x;
    r0.w = dot(cb1[26].xx, r0.ww);
    r0.w = r1.x / r0.w;
    r0.w = frac(r0.w);
    r0.w = cmp(0.5 >= r0.w);
    r0.w = r0.w ? 0.999989986 : -1;
    r3.y = cb1[26].z * r0.w + r1.w;
    r5.xyzw = t4.Sample(s3_s, r3.xy).xyzw;
    r2.xzw = log2(abs(r5.xyz));
    r2.xzw = float3(0.333333343,0.333333343,0.333333343) * r2.xzw;
    r2.xzw = exp2(r2.xzw);
    r2.xzw = r2.xzw * float3(1.49380159,1.49380159,1.49380159) + -r5.xyz;
    r3.xyz = cmp(r5.xyz >= float3(0.300000012,0.300000012,0.300000012));
    r3.xyz = r3.xyz ? float3(1,1,1) : 0;
    r2.xzw = float3(-0.699999988,-0.699999988,-0.699999988) + r2.xzw;
    r2.xzw = r3.xyz * r2.xzw + r5.xyz;
    r2.xzw = cb1[21].xxx * r2.xzw;
    r0.x = r4.x;
    r0.y = r2.y;
    r0.w = dot(r0.xyz, float3(0.298999995,0.587000012,0.114));
    r1.x = cmp(0.5 < cb1[22].x);
    r3.xyz = r0.www * r2.xzw + -r2.xzw;
    r3.xyz = r3.www * r3.xyz + r2.xzw;
    r3.xyz = r1.xxx ? r3.xyz : r2.xzw;
    if (r1.y != 0) {
      r1.xy = r1.zw * cb1[20].xy + cb1[20].zw;
      r5.xyzw = t5.Sample(s0_s, r1.xy).xyzw;
      r4.yzw = cb1[21].yyy * r5.xyz;
      r3.xyz = r4.yzw * r2.xzw + r3.xyz;
    }
    r0.w = r3.x + r3.y;
    r0.xyzw = r3.xyzz + r0.xyzw;
    o0.w = saturate(r0.w * 0.333299994 + r3.w);
  } else {
    r0.x = r4.x;
    r0.y = r2.y;
    o0.w = r3.w;
  }
  r0.w = cmp(0 < cb1[7].z);
  if (r0.w != 0) {
    r1.xy = -cb1[7].xy + r1.zw;
    r1.yz = cb1[7].zz * abs(r1.xy);
    r1.x = cb1[6].w * r1.y;
    r0.w = dot(r1.xz, r1.xz);
    r0.w = 1 + -r0.w;
    r0.w = max(0, r0.w);
    r0.w = log2(r0.w);
    r0.w = cb1[7].w * r0.w;
    r0.w = exp2(r0.w);
    r1.xyz = float3(1,1,1) + -cb1[6].xyz;
    r1.xyz = r0.www * r1.xyz + cb1[6].xyz;
    r0.xyz = r1.xyz * r0.xyz;
  }
  float3 untonemapped = (r0.xyz);

  renodx::lut::Config lut_config = renodx::lut::config::Create(
      s0_s,
      1.f,
      0.f,
      renodx::lut::config::type::ARRI_C1000_NO_CUT,
      renodx::lut::config::type::LINEAR);

  r0.xyz = renodx::lut::Sample(t2, lut_config, untonemapped);
  /*
  r0.xyz = r0.zxy * float3(5.55555582,5.55555582,5.55555582) + float3(0.0479959995,0.0479959995,0.0479959995);
  r0.xyz = log2(r0.xyz);
  r0.xyz = saturate(r0.xyz * float3(0.0734997839,0.0734997839,0.0734997839) + float3(0.386036009,0.386036009,0.386036009));
  r0.yzw = cb1[0].zzz * r0.xyz;
  r0.y = floor(r0.y);
  r1.xy = float2(0.5,0.5) * cb1[0].xy;
  r1.yz = r0.zw * cb1[0].xy + r1.xy;
  r1.x = r0.y * cb1[0].y + r1.y;
  r2.xyzw = t2.SampleLevel(s0_s, r1.xz, 0).xyzw;
  r3.x = cb1[0].y;
  r3.y = 0;
  r0.zw = r3.xy + r1.xz;
  r1.xyzw = t2.SampleLevel(s0_s, r0.zw, 0).xyzw;
  r0.x = r0.x * cb1[0].z + -r0.y;
  r0.yzw = r1.xyz + -r2.xyz;
  r0.xyz = r0.xxx * r0.yzw + r2.xyz;
  */
  r0.w = cmp(0 < cb1[13].x);
  if (r0.w != 0) {
    r1.xy = v1.xy * cb1[8].xy + cb1[8].zw;
    r1.xyzw = t1.Sample(s1_s, r1.xy).xyzw;
    r0.w = -0.5 + r1.w;
    r0.w = r0.w + r0.w;
    r1.x = dot(r0.xyz, float3(0.212672904,0.715152204,0.0721750036));
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