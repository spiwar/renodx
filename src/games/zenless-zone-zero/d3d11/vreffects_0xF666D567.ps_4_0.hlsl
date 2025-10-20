#include "../tonemap.hlsl"

// Used on the combat intro
// ---- Created with 3Dmigoto v1.4.1 on Mon Oct 20 03:56:56 2025
Texture2D<float4> t2 : register(t2);

Texture2D<float4> _VR_SourceImage : register(t1);

Texture2D<float4> t0 : register(t0);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1) {
  float4 cb1[32];
}

cbuffer cb0 : register(b0) {
  float4 cb0[140];
}

// 3Dmigoto declarations
#define cmp -

void main(
    float4 v0: SV_POSITION0,
    float4 v1: TEXCOORD0,
    float4 v2: TEXCOORD1,
    out float4 o0: SV_Target0) {
  float4 r0, r1, r2, r3, _VR_SourceImage0, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cb0[137].y * v1.y;
  r0.x = cb1[4].x * r0.x;
  r0.y = r0.x + r0.x;
  r0.y = cmp(r0.y >= -r0.y);
  r0.yz = r0.yy ? float2(2, 0.5) : float2(-2, -0.5);
  r0.x = r0.x * r0.z;
  r0.x = frac(r0.x);
  r0.z = r0.y * r0.x;
  r0.w = cmp(1 < r0.z);
  r0.x = -r0.y * r0.x + 2;
  r0.x = r0.w ? r0.x : r0.z;
  r0.y = r0.x * 2 + -1;
  r1.x = cb1[4].z * r0.y + v1.x;
  r2.y = cb0[137].x * cb0[137].w;
  r0.y = abs(cb1[5].y) + r1.x;
  r0.z = cb1[5].y * v1.y;
  r0.y = r0.y * r2.y + -r0.z;
  r0.z = dot(cb1[5].xx, r2.yy);
  r0.y = r0.y / r0.z;
  r0.y = frac(r0.y);
  r0.y = cmp(0.5 >= r0.y);
  r0.z = r0.y ? 0.999989986 : -1;
  r1.y = cb1[5].z * r0.z + v1.y;
  r0.z = cmp(r1.y >= 1);
  r0.w = cmp(0 >= r1.y);
  r0.zw = r0.zw ? float2(1, 1) : 0;
  r3.x = r0.y ? r0.z : r0.w;
  _VR_SourceImage0 = renodx::draw::InvertIntermediatePass(_VR_SourceImage.Sample(s1_s, r1.xy).xyzw);
  float4 untonemapped = _VR_SourceImage0;
  float3 untonemapped_neutral = renodx::tonemap::renodrt::NeutralSDR(_VR_SourceImage0.xyz);
  _VR_SourceImage0.xyz = untonemapped_neutral;
  r0.yz = -cb0[139].zw + r1.xy;
  r5.xyzw = t0.SampleLevel(s0_s, r0.yz, 0).xyzw;
  r0.yz = r0.yz * float2(2, 2) + float2(-1, -1);
  r6.xyzw = cb0[134].xyzw * -r0.zzzz;
  r6.xyzw = cb0[133].xyzw * r0.yyyy + r6.xyzw;
  r6.xyzw = cb0[135].xyzw * r5.xxxx + r6.xyzw;
  r6.xyzw = cb0[136].xyzw + r6.xyzw;
  r0.yzw = r6.xyz / r6.www;
  r0.yzw = -cb0[30].xyz + r0.yzw;
  r0.z = dot(r0.yzw, r0.yzw);
  r0.z = sqrt(r0.z);
  r0.y = dot(r0.yw, cb1[31].xy);
  r0.y = max(0, r0.y);
  r0.z = cmp(2000 < r0.z);
  r0.y = r0.z ? 0 : r0.y;
  r0.z = cb0[61].z * r5.x + cb0[61].w;
  r0.z = 1 / r0.z;
  r0.w = cmp(0.5 < cb1[31].w);
  r0.y = r0.w ? r0.y : r0.z;
  r0.z = -cb1[1].z + r0.y;
  r0.z = saturate(cb1[1].w * r0.z);
  r5.xyzw = cb1[3].xyzw + -cb1[2].xyzw;
  r5.xyzw = r0.zzzz * r5.xyzw + cb1[2].xyzw;
  r0.z = cmp(_VR_SourceImage0.y >= _VR_SourceImage0.z);
  r0.z = r0.z ? 1.000000 : 0;
  r6.xy = _VR_SourceImage0.zy;
  r6.zw = float2(-1, 0.666666687);
  r7.xy = -r6.xy + _VR_SourceImage0.yz;
  r7.zw = float2(1, -1);
  r6.xyzw = r0.zzzz * r7.xyzw + r6.xyzw;
  r0.z = cmp(_VR_SourceImage0.x >= r6.x);
  r0.z = r0.z ? 1.000000 : 0;
  r7.xyz = r6.xyw;
  r7.w = _VR_SourceImage0.x;
  r6.xyw = r7.wyx;
  r6.xyzw = r6.xyzw + -r7.xyzw;
  r6.xyzw = r0.zzzz * r6.yzwx + r7.yzwx;
  r0.z = min(r6.z, r6.x);
  r0.z = r6.w + -r0.z;
  r0.w = r6.z + -r6.x;
  r1.z = r0.z * 6 + 9.99999975e-05;
  r0.w = r0.w / r1.z;
  r0.w = r6.y + r0.w;
  r6.y = abs(r0.w);
  r0.w = 9.99999975e-05 + r6.w;
  r6.z = r0.z / r0.w;
  r6.yzw = cb1[0].zxy + r6.wyz;
  r0.z = 1 + -r5.w;
  r6.x = r6.w * r0.z;
  r6.xy = saturate(r6.xy);
  r7.xyz = float3(1, 0.666666687, 0.333333343) + r6.zzz;
  r7.xyz = frac(r7.xyz);
  r7.xyz = r7.xyz * float3(6, 6, 6) + float3(-3, -3, -3);
  r7.xyz = saturate(float3(-1, -1, -1) + abs(r7.xyz));
  r7.xyz = float3(-1, -1, -1) + r7.xyz;
  r6.xzw = r6.xxx * r7.xyz + float3(1, 1, 1);
  r6.xyz = r6.yyy * r6.xzw + -cb1[1].yyy;
  r6.xyz = r6.xyz * cb1[1].xxx + cb1[1].yyy;
  r5.xyz = r6.xyz * r5.xyz + -r6.xyz;
  r5.xyz = r5.www * r5.xyz + r6.xyz;
  r3.y = 1;
  r6.xyzw = cb1[6].xyzw * r3.yyyx;
  r0.zw = cmp(cb1[8].xy < float2(0.5, 0.5));
  if (r0.z != 0) {
    r7.xyz = cb1[6].xyz * r3.yyy + -r5.xyz;
    r7.xyz = r6.www * r7.xyz + r5.xyz;
  } else {
    r0.z = cmp(cb1[8].x < 1.5);
    if (r0.z != 0) {
      r7.xyz = r6.xyz * r6.www + r5.xyz;
    } else {
      r0.z = cmp(cb1[8].x < 2.5);
      if (r0.z != 0) {
        r8.xyz = cmp(float3(1, 1, 1) < r5.xyz);
        r9.xyz = log2(abs(r5.xyz));
        r9.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r9.xyz;
        r9.xyz = exp2(r9.xyz);
        r9.xyz = saturate(r9.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r8.xyz = r8.xyz ? r5.xyz : r9.xyz;
        r9.xyz = cmp(float3(1, 1, 1) < cb1[6].xyz);
        r10.xyz = log2(abs(r6.xyz));
        r10.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r10.xyz;
        r10.xyz = exp2(r10.xyz);
        r10.xyz = saturate(r10.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r9.xyz = r9.xyz ? r6.xyz : r10.xyz;
        r9.xyz = float3(-0.5, -0.5, -0.5) + r9.xyz;
        r9.xyz = r6.www * r9.xyz + float3(0.5, 0.5, 0.5);
        r10.xyz = r9.xyz * r8.xyz;
        r10.xyz = r10.xyz + r10.xyz;
        r11.xyz = r8.xyz * r8.xyz;
        r12.xyz = -r9.xyz * float3(2, 2, 2) + float3(1, 1, 1);
        r10.xyz = r11.xyz * r12.xyz + r10.xyz;
        r11.xyz = float3(1, 1, 1) + -r9.xyz;
        r11.xyz = r11.xyz * r8.xyz;
        r11.xyz = r11.xyz + r11.xyz;
        r12.xyz = sqrt(r8.xyz);
        r9.xyz = r9.xyz * float3(2, 2, 2) + float3(-1, -1, -1);
        r9.xyz = r12.xyz * r9.xyz + r11.xyz;
        r8.xyz = cmp(r8.xyz >= float3(0.5, 0.5, 0.5));
        r8.xyz = r8.xyz ? float3(1, 1, 1) : 0;
        r9.xyz = r9.xyz + -r10.xyz;
        r8.xyz = r8.xyz * r9.xyz + r10.xyz;
        r9.xyz = r8.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r9.xyz = r8.xyz * r9.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r7.xyz = r9.xyz * r8.xyz;
      } else {
        r0.z = cmp(cb1[8].x < 3.5);
        r8.xyz = cmp(float3(1, 1, 1) < r5.xyz);
        r9.xyz = log2(abs(r5.xyz));
        r9.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r9.xyz;
        r9.xyz = exp2(r9.xyz);
        r9.xyz = saturate(r9.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r8.xyz = r8.xyz ? r5.xyz : r9.xyz;
        r9.xyz = cmp(float3(1, 1, 1) < cb1[6].xyz);
        r10.xyz = log2(abs(r6.xyz));
        r10.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r10.xyz;
        r10.xyz = exp2(r10.xyz);
        r10.xyz = saturate(r10.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r6.xyz = r9.xyz ? r6.xyz : r10.xyz;
        r6.xyz = float3(-0.5, -0.5, -0.5) + r6.xyz;
        r6.xyz = r6.www * r6.xyz + float3(0.5, 0.5, 0.5);
        r9.xyz = r6.xyz * r8.xyz;
        r10.xyz = r9.xyz + r9.xyz;
        r11.xyz = float3(1, 1, 1) + -r8.xyz;
        r11.xyz = r11.xyz + r11.xyz;
        r6.xyz = float3(1, 1, 1) + -r6.xyz;
        r6.xyz = -r11.xyz * r6.xyz + float3(1, 1, 1);
        r8.xyz = cmp(r8.xyz >= float3(0.5, 0.5, 0.5));
        r8.xyz = r8.xyz ? float3(1, 1, 1) : 0;
        r6.xyz = -r9.xyz * float3(2, 2, 2) + r6.xyz;
        r6.xyz = r8.xyz * r6.xyz + r10.xyz;
        r8.xyz = r6.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r8.xyz = r6.xyz * r8.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r6.xyz = r8.xyz * r6.xyz;
        r8.xyz = cb1[6].xyz * r3.yyy + float3(-1, -1, -1);
        r8.xyz = r6.www * r8.xyz + float3(1, 1, 1);
        r5.xyz = r8.xyz * r5.xyz;
        r7.xyz = r0.zzz ? r6.xyz : r5.xyz;
      }
    }
  }
  r3.z = 1 + -r3.x;
  r5.xyzw = cb1[7].xyzw * r3.yyyz;
  if (r0.w != 0) {
    r3.xzw = cb1[7].xyz * r3.yyy + -r7.xyz;
    r3.xzw = r5.www * r3.xzw + r7.xyz;
  } else {
    r0.z = cmp(cb1[8].y < 1.5);
    if (r0.z != 0) {
      r3.xzw = r5.xyz * r5.www + r7.xyz;
    } else {
      r0.z = cmp(cb1[8].y < 2.5);
      if (r0.z != 0) {
        r6.xyz = cmp(float3(1, 1, 1) < r7.xyz);
        r8.xyz = log2(abs(r7.xyz));
        r8.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r8.xyz;
        r8.xyz = exp2(r8.xyz);
        r8.xyz = saturate(r8.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r6.xyz = r6.xyz ? r7.xyz : r8.xyz;
        r8.xyz = cmp(float3(1, 1, 1) < cb1[7].xyz);
        r9.xyz = log2(abs(r5.xyz));
        r9.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r9.xyz;
        r9.xyz = exp2(r9.xyz);
        r9.xyz = saturate(r9.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r8.xyz = r8.xyz ? r5.xyz : r9.xyz;
        r8.xyz = float3(-0.5, -0.5, -0.5) + r8.xyz;
        r8.xyz = r5.www * r8.xyz + float3(0.5, 0.5, 0.5);
        r9.xyz = r8.xyz * r6.xyz;
        r9.xyz = r9.xyz + r9.xyz;
        r10.xyz = r6.xyz * r6.xyz;
        r11.xyz = -r8.xyz * float3(2, 2, 2) + float3(1, 1, 1);
        r9.xyz = r10.xyz * r11.xyz + r9.xyz;
        r10.xyz = float3(1, 1, 1) + -r8.xyz;
        r10.xyz = r10.xyz * r6.xyz;
        r10.xyz = r10.xyz + r10.xyz;
        r11.xyz = sqrt(r6.xyz);
        r8.xyz = r8.xyz * float3(2, 2, 2) + float3(-1, -1, -1);
        r8.xyz = r11.xyz * r8.xyz + r10.xyz;
        r6.xyz = cmp(r6.xyz >= float3(0.5, 0.5, 0.5));
        r6.xyz = r6.xyz ? float3(1, 1, 1) : 0;
        r8.xyz = r8.xyz + -r9.xyz;
        r6.xyz = r6.xyz * r8.xyz + r9.xyz;
        r8.xyz = r6.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r8.xyz = r6.xyz * r8.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r3.xzw = r8.xyz * r6.xyz;
      } else {
        r0.z = cmp(cb1[8].y < 3.5);
        r6.xyz = cmp(float3(1, 1, 1) < r7.xyz);
        r8.xyz = log2(abs(r7.xyz));
        r8.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r8.xyz;
        r8.xyz = exp2(r8.xyz);
        r8.xyz = saturate(r8.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r6.xyz = r6.xyz ? r7.xyz : r8.xyz;
        r8.xyz = cmp(float3(1, 1, 1) < cb1[7].xyz);
        r9.xyz = log2(abs(r5.xyz));
        r9.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r9.xyz;
        r9.xyz = exp2(r9.xyz);
        r9.xyz = saturate(r9.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r5.xyz = r8.xyz ? r5.xyz : r9.xyz;
        r5.xyz = float3(-0.5, -0.5, -0.5) + r5.xyz;
        r5.xyz = r5.www * r5.xyz + float3(0.5, 0.5, 0.5);
        r8.xyz = r5.xyz * r6.xyz;
        r9.xyz = r8.xyz + r8.xyz;
        r10.xyz = float3(1, 1, 1) + -r6.xyz;
        r10.xyz = r10.xyz + r10.xyz;
        r5.xyz = float3(1, 1, 1) + -r5.xyz;
        r5.xyz = -r10.xyz * r5.xyz + float3(1, 1, 1);
        r6.xyz = cmp(r6.xyz >= float3(0.5, 0.5, 0.5));
        r6.xyz = r6.xyz ? float3(1, 1, 1) : 0;
        r5.xyz = -r8.xyz * float3(2, 2, 2) + r5.xyz;
        r5.xyz = r6.xyz * r5.xyz + r9.xyz;
        r6.xyz = r5.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r6.xyz = r5.xyz * r6.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r5.xyz = r6.xyz * r5.xyz;
        r6.xyz = cb1[7].xyz * r3.yyy + float3(-1, -1, -1);
        r6.xyz = r5.www * r6.xyz + float3(1, 1, 1);
        r6.xyz = r7.xyz * r6.xyz;
        r3.xzw = r0.zzz ? r5.xyz : r6.xyz;
      }
    }
  }
  r5.xyzw = -cb1[9].xyzw + r0.yyyy;
  r6.xyzw = saturate(cb1[11].xyzw * r5.xyzw);
  r7.xyzw = cb1[10].xyzw + -r0.yyyy;
  r7.xyzw = saturate(cb1[12].xyzw * r7.xyzw);
  r6.xyzw = min(r7.xyzw, r6.xyzw);
  r7.xyzw = cb1[10].xyzw + -cb1[9].xyzw;
  r5.xyzw = saturate(r5.xyzw / r7.xyzw);
  r0.y = cb1[15].w * r5.x;
  r7.xyz = cb1[15].xyz + -cb1[14].xyz;
  r0.yzw = r0.yyy * r7.xyz + cb1[14].xyz;
  r1.z = cb1[14].w * r6.x;
  r1.w = cb1[17].w * r5.y;
  r7.xyz = cb1[17].xyz + -cb1[16].xyz;
  r7.xyz = r1.www * r7.xyz + cb1[16].xyz;
  r1.w = cb1[16].w * r6.y;
  r2.z = cb1[19].w * r5.z;
  r5.xyz = cb1[19].xyz + -cb1[18].xyz;
  r5.xyz = r2.zzz * r5.xyz + cb1[18].xyz;
  r2.z = cb1[18].w * r6.z;
  r2.w = cb1[21].w * r5.w;
  r6.xyz = cb1[21].xyz + -cb1[20].xyz;
  r6.xyz = r2.www * r6.xyz + cb1[20].xyz;
  r2.w = cb1[20].w * r6.w;
  r8.xyzw = cmp(cb1[13].xyzw < float4(0.5, 0.5, 0.5, 0.5));
  if (r8.x != 0) {
    r9.xyz = r0.yzw + -r3.xzw;
    r9.xyz = r1.zzz * r9.xyz + r3.xzw;
  } else {
    r3.y = cmp(cb1[13].x < 1.5);
    if (r3.y != 0) {
      r9.xyz = r0.yzw * r1.zzz + r3.xzw;
    } else {
      r3.y = cmp(cb1[13].x < 2.5);
      if (r3.y != 0) {
        r10.xyz = cmp(float3(1, 1, 1) < r3.xzw);
        r11.xyz = log2(abs(r3.xzw));
        r11.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r11.xyz;
        r11.xyz = exp2(r11.xyz);
        r11.xyz = saturate(r11.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r10.xyz = r10.xyz ? r3.xzw : r11.xyz;
        r11.xyz = cmp(float3(1, 1, 1) < r0.yzw);
        r12.xyz = log2(abs(r0.yzw));
        r12.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r12.xyz;
        r12.xyz = exp2(r12.xyz);
        r12.xyz = saturate(r12.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r11.xyz = r11.xyz ? r0.yzw : r12.xyz;
        r11.xyz = float3(-0.5, -0.5, -0.5) + r11.xyz;
        r11.xyz = r1.zzz * r11.xyz + float3(0.5, 0.5, 0.5);
        r12.xyz = r11.xyz * r10.xyz;
        r12.xyz = r12.xyz + r12.xyz;
        r13.xyz = r10.xyz * r10.xyz;
        r14.xyz = -r11.xyz * float3(2, 2, 2) + float3(1, 1, 1);
        r12.xyz = r13.xyz * r14.xyz + r12.xyz;
        r13.xyz = float3(1, 1, 1) + -r11.xyz;
        r13.xyz = r13.xyz * r10.xyz;
        r13.xyz = r13.xyz + r13.xyz;
        r14.xyz = sqrt(r10.xyz);
        r11.xyz = r11.xyz * float3(2, 2, 2) + float3(-1, -1, -1);
        r11.xyz = r14.xyz * r11.xyz + r13.xyz;
        r10.xyz = cmp(r10.xyz >= float3(0.5, 0.5, 0.5));
        r10.xyz = r10.xyz ? float3(1, 1, 1) : 0;
        r11.xyz = r11.xyz + -r12.xyz;
        r10.xyz = r10.xyz * r11.xyz + r12.xyz;
        r11.xyz = r10.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r11.xyz = r10.xyz * r11.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r9.xyz = r11.xyz * r10.xyz;
      } else {
        r3.y = cmp(cb1[13].x < 3.5);
        r10.xyz = cmp(float3(1, 1, 1) < r3.xzw);
        r11.xyz = log2(abs(r3.xzw));
        r11.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r11.xyz;
        r11.xyz = exp2(r11.xyz);
        r11.xyz = saturate(r11.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r10.xyz = r10.xyz ? r3.xzw : r11.xyz;
        r11.xyz = cmp(float3(1, 1, 1) < r0.yzw);
        r12.xyz = log2(abs(r0.yzw));
        r12.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r12.xyz;
        r12.xyz = exp2(r12.xyz);
        r12.xyz = saturate(r12.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r11.xyz = r11.xyz ? r0.yzw : r12.xyz;
        r11.xyz = float3(-0.5, -0.5, -0.5) + r11.xyz;
        r11.xyz = r1.zzz * r11.xyz + float3(0.5, 0.5, 0.5);
        r12.xyz = r11.xyz * r10.xyz;
        r13.xyz = r12.xyz + r12.xyz;
        r14.xyz = float3(1, 1, 1) + -r10.xyz;
        r14.xyz = r14.xyz + r14.xyz;
        r11.xyz = float3(1, 1, 1) + -r11.xyz;
        r11.xyz = -r14.xyz * r11.xyz + float3(1, 1, 1);
        r10.xyz = cmp(r10.xyz >= float3(0.5, 0.5, 0.5));
        r10.xyz = r10.xyz ? float3(1, 1, 1) : 0;
        r11.xyz = -r12.xyz * float3(2, 2, 2) + r11.xyz;
        r10.xyz = r10.xyz * r11.xyz + r13.xyz;
        r11.xyz = r10.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r11.xyz = r10.xyz * r11.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r10.xyz = r11.xyz * r10.xyz;
        r0.yzw = float3(-1, -1, -1) + r0.yzw;
        r0.yzw = r1.zzz * r0.yzw + float3(1, 1, 1);
        r0.yzw = r3.xzw * r0.yzw;
        r9.xyz = r3.yyy ? r10.xyz : r0.yzw;
      }
    }
  }
  if (r8.y != 0) {
    r0.yzw = -r9.xyz + r7.xyz;
    r0.yzw = r1.www * r0.yzw + r9.xyz;
  } else {
    r1.z = cmp(cb1[13].y < 1.5);
    if (r1.z != 0) {
      r0.yzw = r7.xyz * r1.www + r9.xyz;
    } else {
      r1.z = cmp(cb1[13].y < 2.5);
      if (r1.z != 0) {
        r3.xyz = cmp(float3(1, 1, 1) < r9.xyz);
        r10.xyz = log2(abs(r9.xyz));
        r10.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r10.xyz;
        r10.xyz = exp2(r10.xyz);
        r10.xyz = saturate(r10.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r3.xyz = r3.xyz ? r9.xyz : r10.xyz;
        r10.xyz = cmp(float3(1, 1, 1) < r7.xyz);
        r11.xyz = log2(abs(r7.xyz));
        r11.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r11.xyz;
        r11.xyz = exp2(r11.xyz);
        r11.xyz = saturate(r11.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r10.xyz = r10.xyz ? r7.xyz : r11.xyz;
        r10.xyz = float3(-0.5, -0.5, -0.5) + r10.xyz;
        r10.xyz = r1.www * r10.xyz + float3(0.5, 0.5, 0.5);
        r11.xyz = r10.xyz * r3.xyz;
        r11.xyz = r11.xyz + r11.xyz;
        r12.xyz = r3.xyz * r3.xyz;
        r13.xyz = -r10.xyz * float3(2, 2, 2) + float3(1, 1, 1);
        r11.xyz = r12.xyz * r13.xyz + r11.xyz;
        r12.xyz = float3(1, 1, 1) + -r10.xyz;
        r12.xyz = r12.xyz * r3.xyz;
        r12.xyz = r12.xyz + r12.xyz;
        r13.xyz = sqrt(r3.xyz);
        r10.xyz = r10.xyz * float3(2, 2, 2) + float3(-1, -1, -1);
        r10.xyz = r13.xyz * r10.xyz + r12.xyz;
        r3.xyz = cmp(r3.xyz >= float3(0.5, 0.5, 0.5));
        r3.xyz = r3.xyz ? float3(1, 1, 1) : 0;
        r10.xyz = r10.xyz + -r11.xyz;
        r3.xyz = r3.xyz * r10.xyz + r11.xyz;
        r10.xyz = r3.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r10.xyz = r3.xyz * r10.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r0.yzw = r10.xyz * r3.xyz;
      } else {
        r1.z = cmp(cb1[13].y < 3.5);
        r3.xyz = cmp(float3(1, 1, 1) < r9.xyz);
        r10.xyz = log2(abs(r9.xyz));
        r10.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r10.xyz;
        r10.xyz = exp2(r10.xyz);
        r10.xyz = saturate(r10.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r3.xyz = r3.xyz ? r9.xyz : r10.xyz;
        r10.xyz = cmp(float3(1, 1, 1) < r7.xyz);
        r11.xyz = log2(abs(r7.xyz));
        r11.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r11.xyz;
        r11.xyz = exp2(r11.xyz);
        r11.xyz = saturate(r11.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r10.xyz = r10.xyz ? r7.xyz : r11.xyz;
        r10.xyz = float3(-0.5, -0.5, -0.5) + r10.xyz;
        r10.xyz = r1.www * r10.xyz + float3(0.5, 0.5, 0.5);
        r11.xyz = r10.xyz * r3.xyz;
        r12.xyz = r11.xyz + r11.xyz;
        r13.xyz = float3(1, 1, 1) + -r3.xyz;
        r13.xyz = r13.xyz + r13.xyz;
        r10.xyz = float3(1, 1, 1) + -r10.xyz;
        r10.xyz = -r13.xyz * r10.xyz + float3(1, 1, 1);
        r3.xyz = cmp(r3.xyz >= float3(0.5, 0.5, 0.5));
        r3.xyz = r3.xyz ? float3(1, 1, 1) : 0;
        r10.xyz = -r11.xyz * float3(2, 2, 2) + r10.xyz;
        r3.xyz = r3.xyz * r10.xyz + r12.xyz;
        r10.xyz = r3.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r10.xyz = r3.xyz * r10.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r3.xyz = r10.xyz * r3.xyz;
        r7.xyz = float3(-1, -1, -1) + r7.xyz;
        r7.xyz = r1.www * r7.xyz + float3(1, 1, 1);
        r7.xyz = r9.xyz * r7.xyz;
        r0.yzw = r1.zzz ? r3.xyz : r7.xyz;
      }
    }
  }
  if (r8.z != 0) {
    r3.xyz = r5.xyz + -r0.yzw;
    r3.xyz = r2.zzz * r3.xyz + r0.yzw;
  } else {
    r1.z = cmp(cb1[13].z < 1.5);
    if (r1.z != 0) {
      r3.xyz = r5.xyz * r2.zzz + r0.yzw;
    } else {
      r1.z = cmp(cb1[13].z < 2.5);
      if (r1.z != 0) {
        r7.xyz = cmp(float3(1, 1, 1) < r0.yzw);
        r8.xyz = log2(abs(r0.yzw));
        r8.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r8.xyz;
        r8.xyz = exp2(r8.xyz);
        r8.xyz = saturate(r8.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r7.xyz = r7.xyz ? r0.yzw : r8.xyz;
        r8.xyz = cmp(float3(1, 1, 1) < r5.xyz);
        r9.xyz = log2(abs(r5.xyz));
        r9.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r9.xyz;
        r9.xyz = exp2(r9.xyz);
        r9.xyz = saturate(r9.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r8.xyz = r8.xyz ? r5.xyz : r9.xyz;
        r8.xyz = float3(-0.5, -0.5, -0.5) + r8.xyz;
        r8.xyz = r2.zzz * r8.xyz + float3(0.5, 0.5, 0.5);
        r9.xyz = r8.xyz * r7.xyz;
        r9.xyz = r9.xyz + r9.xyz;
        r10.xyz = r7.xyz * r7.xyz;
        r11.xyz = -r8.xyz * float3(2, 2, 2) + float3(1, 1, 1);
        r9.xyz = r10.xyz * r11.xyz + r9.xyz;
        r10.xyz = float3(1, 1, 1) + -r8.xyz;
        r10.xyz = r10.xyz * r7.xyz;
        r10.xyz = r10.xyz + r10.xyz;
        r11.xyz = sqrt(r7.xyz);
        r8.xyz = r8.xyz * float3(2, 2, 2) + float3(-1, -1, -1);
        r8.xyz = r11.xyz * r8.xyz + r10.xyz;
        r7.xyz = cmp(r7.xyz >= float3(0.5, 0.5, 0.5));
        r7.xyz = r7.xyz ? float3(1, 1, 1) : 0;
        r8.xyz = r8.xyz + -r9.xyz;
        r7.xyz = r7.xyz * r8.xyz + r9.xyz;
        r8.xyz = r7.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r8.xyz = r7.xyz * r8.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r3.xyz = r8.xyz * r7.xyz;
      } else {
        r1.z = cmp(cb1[13].z < 3.5);
        r7.xyz = cmp(float3(1, 1, 1) < r0.yzw);
        r8.xyz = log2(abs(r0.yzw));
        r8.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r8.xyz;
        r8.xyz = exp2(r8.xyz);
        r8.xyz = saturate(r8.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r7.xyz = r7.xyz ? r0.yzw : r8.xyz;
        r8.xyz = cmp(float3(1, 1, 1) < r5.xyz);
        r9.xyz = log2(abs(r5.xyz));
        r9.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r9.xyz;
        r9.xyz = exp2(r9.xyz);
        r9.xyz = saturate(r9.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r8.xyz = r8.xyz ? r5.xyz : r9.xyz;
        r8.xyz = float3(-0.5, -0.5, -0.5) + r8.xyz;
        r8.xyz = r2.zzz * r8.xyz + float3(0.5, 0.5, 0.5);
        r9.xyz = r8.xyz * r7.xyz;
        r10.xyz = r9.xyz + r9.xyz;
        r11.xyz = float3(1, 1, 1) + -r7.xyz;
        r11.xyz = r11.xyz + r11.xyz;
        r8.xyz = float3(1, 1, 1) + -r8.xyz;
        r8.xyz = -r11.xyz * r8.xyz + float3(1, 1, 1);
        r7.xyz = cmp(r7.xyz >= float3(0.5, 0.5, 0.5));
        r7.xyz = r7.xyz ? float3(1, 1, 1) : 0;
        r8.xyz = -r9.xyz * float3(2, 2, 2) + r8.xyz;
        r7.xyz = r7.xyz * r8.xyz + r10.xyz;
        r8.xyz = r7.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r8.xyz = r7.xyz * r8.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r7.xyz = r8.xyz * r7.xyz;
        r5.xyz = float3(-1, -1, -1) + r5.xyz;
        r5.xyz = r2.zzz * r5.xyz + float3(1, 1, 1);
        r0.yzw = r5.xyz * r0.yzw;
        r3.xyz = r1.zzz ? r7.xyz : r0.yzw;
      }
    }
  }
  if (r8.w != 0) {
    r0.yzw = r6.xyz + -r3.xyz;
    r0.yzw = r2.www * r0.yzw + r3.xyz;
  } else {
    r1.z = cmp(cb1[13].w < 1.5);
    if (r1.z != 0) {
      r0.yzw = r6.xyz * r2.www + r3.xyz;
    } else {
      r1.z = cmp(cb1[13].w < 2.5);
      if (r1.z != 0) {
        r5.xyz = cmp(float3(1, 1, 1) < r3.xyz);
        r7.xyz = log2(abs(r3.xyz));
        r7.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r7.xyz;
        r7.xyz = exp2(r7.xyz);
        r7.xyz = saturate(r7.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r5.xyz = r5.xyz ? r3.xyz : r7.xyz;
        r7.xyz = cmp(float3(1, 1, 1) < r6.xyz);
        r8.xyz = log2(abs(r6.xyz));
        r8.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r8.xyz;
        r8.xyz = exp2(r8.xyz);
        r8.xyz = saturate(r8.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r7.xyz = r7.xyz ? r6.xyz : r8.xyz;
        r7.xyz = float3(-0.5, -0.5, -0.5) + r7.xyz;
        r7.xyz = r2.www * r7.xyz + float3(0.5, 0.5, 0.5);
        r8.xyz = r7.xyz * r5.xyz;
        r8.xyz = r8.xyz + r8.xyz;
        r9.xyz = r5.xyz * r5.xyz;
        r10.xyz = -r7.xyz * float3(2, 2, 2) + float3(1, 1, 1);
        r8.xyz = r9.xyz * r10.xyz + r8.xyz;
        r9.xyz = float3(1, 1, 1) + -r7.xyz;
        r9.xyz = r9.xyz * r5.xyz;
        r9.xyz = r9.xyz + r9.xyz;
        r10.xyz = sqrt(r5.xyz);
        r7.xyz = r7.xyz * float3(2, 2, 2) + float3(-1, -1, -1);
        r7.xyz = r10.xyz * r7.xyz + r9.xyz;
        r5.xyz = cmp(r5.xyz >= float3(0.5, 0.5, 0.5));
        r5.xyz = r5.xyz ? float3(1, 1, 1) : 0;
        r7.xyz = r7.xyz + -r8.xyz;
        r5.xyz = r5.xyz * r7.xyz + r8.xyz;
        r7.xyz = r5.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r7.xyz = r5.xyz * r7.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r0.yzw = r7.xyz * r5.xyz;
      } else {
        r1.z = cmp(cb1[13].w < 3.5);
        r5.xyz = cmp(float3(1, 1, 1) < r3.xyz);
        r7.xyz = log2(abs(r3.xyz));
        r7.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r7.xyz;
        r7.xyz = exp2(r7.xyz);
        r7.xyz = saturate(r7.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r5.xyz = r5.xyz ? r3.xyz : r7.xyz;
        r7.xyz = cmp(float3(1, 1, 1) < r6.xyz);
        r8.xyz = log2(abs(r6.xyz));
        r8.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r8.xyz;
        r8.xyz = exp2(r8.xyz);
        r8.xyz = saturate(r8.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997));
        r7.xyz = r7.xyz ? r6.xyz : r8.xyz;
        r7.xyz = float3(-0.5, -0.5, -0.5) + r7.xyz;
        r7.xyz = r2.www * r7.xyz + float3(0.5, 0.5, 0.5);
        r8.xyz = r7.xyz * r5.xyz;
        r9.xyz = r8.xyz + r8.xyz;
        r10.xyz = float3(1, 1, 1) + -r5.xyz;
        r10.xyz = r10.xyz + r10.xyz;
        r7.xyz = float3(1, 1, 1) + -r7.xyz;
        r7.xyz = -r10.xyz * r7.xyz + float3(1, 1, 1);
        r5.xyz = cmp(r5.xyz >= float3(0.5, 0.5, 0.5));
        r5.xyz = r5.xyz ? float3(1, 1, 1) : 0;
        r7.xyz = -r8.xyz * float3(2, 2, 2) + r7.xyz;
        r5.xyz = r5.xyz * r7.xyz + r9.xyz;
        r7.xyz = r5.xyz * float3(0.305306017, 0.305306017, 0.305306017) + float3(0.682171106, 0.682171106, 0.682171106);
        r7.xyz = r5.xyz * r7.xyz + float3(0.0125228781, 0.0125228781, 0.0125228781);
        r5.xyz = r7.xyz * r5.xyz;
        r6.xyz = float3(-1, -1, -1) + r6.xyz;
        r6.xyz = r2.www * r6.xyz + float3(1, 1, 1);
        r3.xyz = r6.xyz * r3.xyz;
        r0.yzw = r1.zzz ? r5.xyz : r3.xyz;
      }
    }
  }
  r2.x = 1;
  r3.xyzw = cb1[22].xyzw * r2.xyxy + r1.xyxy;
  r5.xyz = renodx::tonemap::renodrt::NeutralSDR(renodx::draw::InvertIntermediatePass(_VR_SourceImage.Sample(s1_s, r3.xy).xyz));
  r3.xyz = renodx::tonemap::renodrt::NeutralSDR(renodx::draw::InvertIntermediatePass(_VR_SourceImage.Sample(s1_s, r3.zw).xyz));
  r3.xyz = cb1[25].xyz * r3.yyy;
  r3.xyz = r5.xxx * cb1[24].xyz + r3.xyz;
  r1.zw = cb1[23].xy * r2.xy + r1.xy;
  r2.xyz = renodx::tonemap::renodrt::NeutralSDR(renodx::draw::InvertIntermediatePass(_VR_SourceImage.Sample(s1_s, r1.zw).xyz));
  r2.xyz = r2.zzz * cb1[26].xyz + r3.xyz;
  r2.xyz = r2.xyz + -r0.yzw;
  _VR_SourceImage0.xyz = cb1[23].zzz * r2.xyz + r0.yzw;
  r0.x = cb1[4].y * r0.x;
  r0.x = r0.x * -2 + cb1[4].y;
  r0.xyzw = _VR_SourceImage0.xyzw + r0.xxxx;
  r1.z = cmp(0.5 < cb1[29].w);
  if (r1.z != 0) {
    r1.zw = trunc(cb1[29].xy);
    r1.zw = float2(1, 1) / r1.zw;
    r2.xy = (int2)cb1[29].zx;
    r1.xy = r1.xy / cb1[29].xy;
    r2.z = (int)r2.x & 0x80000000;
    r3.xy = max((int2)-r2.xy, (int2)r2.xy);
    uiDest.x = (uint)r3.x / (uint)r3.y;
    _VR_SourceImage0.x = (uint)r3.x % (uint)r3.y;
    r3.x = uiDest.x;
    r2.w = -(int)_VR_SourceImage0.x;
    r2.z = r2.z ? r2.w : _VR_SourceImage0.x;
    r2.z = (int)r2.z;
    _VR_SourceImage0.x = r2.z * r1.z;
    r1.z = (int)r2.y ^ (int)r2.x;
    r2.x = -(int)r3.x;
    r1.z = (int)r1.z & 0x80000000;
    r1.z = r1.z ? r2.x : r3.x;
    r1.z = (int)r1.z;
    _VR_SourceImage0.y = r1.z * r1.w;
    r1.xy = _VR_SourceImage0.xy + r1.xy;
    r1.xyzw = t2.Sample(s1_s, r1.xy).xyzw;
    r2.xyzw = cb1[30].xyzw * r1.xyzw;
    r1.x = -r1.w * cb1[30].w + 1;
    r1.yzw = r2.xyz * r2.www;
    r0.xyz = r0.xyz * r1.xxx + r1.yzw;
  }
  o0.xyz = renodx::draw::RenderIntermediatePass(renodx::tonemap::UpgradeToneMap(untonemapped.xyz, untonemapped_neutral, r0.xyz));
  o0.w = r0.w;
  return;
}