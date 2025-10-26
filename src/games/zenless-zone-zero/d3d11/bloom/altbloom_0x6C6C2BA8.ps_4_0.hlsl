// ---- Created with 3Dmigoto v1.3.16 on Sun Oct 26 04:48:16 2025
#include "../../shared.h"


// Bloom shader in game world

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

  r0.xyzw = cb0[167].xyxy * float4(-10.2120304,-10.2120304,-8.25679779,-8.25679779) + v1.xyxy;
  r0.xyzw = max(v2.xyxy, r0.xyzw);
  r0.xyzw = min(v2.zwzw, r0.xyzw);
  r1.xyzw = t0.Sample(s0_s, r0.zw).xyzw;
  r0.xyzw = t0.Sample(s0_s, r0.xy).xyzw;
  r1.xyzw = float4(0.00347413006,0.00347413006,0.00347413006,0.00347413006) * r1.xyzw;
  r0.xyzw = r0.xyzw * float4(0.00034523831,0.00034523831,0.00034523831,0.00034523831) + r1.xyzw;
  r1.xyzw = cb0[167].xyxy * float4(-6.30732918,-6.30732918,-4.36294699,-4.36294699) + v1.xyxy;
  r1.xyzw = max(v2.xyxy, r1.xyzw);
  r1.xyzw = min(v2.zwzw, r1.xyzw);
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.xyzw = r2.xyzw * float4(0.0214569494,0.0214569494,0.0214569494,0.0214569494) + r0.xyzw;
  r0.xyzw = r1.xyzw * float4(0.081447579,0.081447579,0.081447579,0.081447579) + r0.xyzw;
  r1.xyzw = cb0[167].xyxy * float4(-2.42249203,-2.42249203,-0.484377503,-0.484377503) + v1.xyxy;
  r1.xyzw = max(v2.xyxy, r1.xyzw);
  r1.xyzw = min(v2.zwzw, r1.xyzw);
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.xyzw = r2.xyzw * float4(0.190226302,0.190226302,0.190226302,0.190226302) + r0.xyzw;
  r0.xyzw = r1.xyzw * float4(0.273582488,0.273582488,0.273582488,0.273582488) + r0.xyzw;
  r1.xyzw = cb0[167].xyxy * float4(1.45325398,1.45325398,3.39231896,3.39231896) + v1.xyxy;
  r1.xyzw = max(v2.xyxy, r1.xyzw);
  r1.xyzw = min(v2.zwzw, r1.xyzw);
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.xyzw = r2.xyzw * float4(0.242374405,0.242374405,0.242374405,0.242374405) + r0.xyzw;
  r0.xyzw = r1.xyzw * float4(0.132255405,0.132255405,0.132255405,0.132255405) + r0.xyzw;
  r1.xyzw = cb0[167].xyxy * float4(5.33456421,5.33456421,7.28137398,7.28137398) + v1.xyxy;
  r1.xyzw = max(v2.xyxy, r1.xyzw);
  r1.xyzw = min(v2.zwzw, r1.xyzw);
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.xyzw = r2.xyzw * float4(0.0444238,0.0444238,0.0444238,0.0444238) + r0.xyzw;
  r0.xyzw = r1.xyzw * float4(0.00917632505,0.00917632505,0.00917632505,0.00917632505) + r0.xyzw;
  r1.xyzw = cb0[167].xyxy * float4(9.23367119,9.23367119,11,11) + v1.xyxy;
  r1.xyzw = max(v2.xyxy, r1.xyzw);
  r1.xyzw = min(v2.zwzw, r1.xyzw);
  r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
  r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
  r0.xyzw = r2.xyzw * float4(0.00116418698,0.00116418698,0.00116418698,0.00116418698) + r0.xyzw;
  o0.xyzw = r1.xyzw * float4(7.32016633e-005,7.32016633e-005,7.32016633e-005,7.32016633e-005) + r0.xyzw;

  // Lerp between clamped and unclamped bloom based on slider
  o0.xyz = lerp(saturate(o0.xyz), o0.xyz, injectedData.fxBloomIntensity);

  return;
}