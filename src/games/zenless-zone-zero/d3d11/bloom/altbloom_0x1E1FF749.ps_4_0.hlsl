// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 26 05:01:12 2025
#include "../../shared.h"

// Bloom shader in character menu

Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0)
{
  float4 cb0[168];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : TEXCOORD0,
  float4 v2 : TEXCOORD1,
  out float4 o0 : SV_Target0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.xyzw = cb0[167].xyxy * float4(-4.09528494,-4.09528494,-2.22262812,-2.22262812) + v1.xyxy;
  r0.xyzw = max(v2.xyxy, r0.xyzw);
  r0.xyzw = min(v2.zwzw, r0.xyzw);
  r1.xyzw = t0.Sample(s0_s, r0.zw).xyzw;
  r0.xyzw = t0.Sample(s0_s, r0.xy).xyzw;
  r1.xyzw = float4(0.133484393,0.133484393,0.133484393,0.133484393) * r1.xyzw;
  r0.xyzw = r0.xyzw * float4(0.00570466183,0.00570466183,0.00570466183,0.00570466183) + r1.xyzw;
  r1.xyzw = cb0[167].xyxy * float4(-0.437803,-0.437803,1.32076705,1.32076705) + v1.xyxy;
  r1.xyzw = max(v2.xyxy, r1.xyzw);
  r1.xyzw = min(v2.zwzw, r1.xyzw);
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.xyzw = r2.xyzw * float4(0.501891971,0.501891971,0.501891971,0.501891971) + r0.xyzw;
  r0.xyzw = r1.xyzw * float4(0.323496908,0.323496908,0.323496908,0.323496908) + r0.xyzw;
  r1.xyzw = cb0[167].xyxy * float4(3.14797401,3.14797401,5,5) + v1.xyxy;
  r1.xyzw = max(v2.xyxy, r1.xyzw);
  r1.xyzw = min(v2.zwzw, r1.xyzw);
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.xyzw = r2.xyzw * float4(0.03487847,0.03487847,0.03487847,0.03487847) + r0.xyzw;
  o0.xyzw = r1.xyzw * float4(0.000543567527,0.000543567527,0.000543567527,0.000543567527) + r0.xyzw;

  // Lerp between clamped and unclamped bloom based on slider
  o0.xyz = lerp(saturate(o0.xyz), o0.xyz, injectedData.fxBloomIntensity);
  
  return;
}