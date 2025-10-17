#include "../tonemap.hlsl"

// Used during Vital View in Evasive Assists
// ---- Created with 3Dmigoto v1.4.1 on Sat Jun  7 03:49:32 2025
Texture2D<float4> t10 : register(t10);

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
  float4 r0, r1, r2, r3, r4, r5, r6, r7, r8, r9;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = cmp(0.5 < cb2[16].w);
  r0.x = r0.x ? cb0[14].x : cb0[17].y;
  r0.yz = v1.xy * float2(2, 2) + float2(-1, -1);
  r1.xy = float2(1, 1) + -abs(r0.yz);
  r0.w = -1 + cb0[5].z;
  r2.x = cb0[5].y * r0.w;
  r0.w = cb0[5].y * r0.w + -1;
  r3.y = cb2[1].x * r0.w + 1;
  r3.xw = float2(1, 0);
  r1.zw = r3.xy * r0.yz;
  r1.z = dot(r1.zw, r1.zw);
  r1.z = sqrt(r1.z);
  r1.y = r3.y * r1.y;
  r1.x = min(r1.x, r1.y);
  r4.xyzw = cmp(cb2[0].zxxx < float4(0.5, 0.5, 1.5, 2.5));
  r1.y = -r1.z * 0.707000017 + 1;
  r1.x = r4.x ? r1.x : r1.y;
  r1.y = cmp(cb2[0].w >= r1.x);
  r1.y = r1.y ? 1.000000 : 0;
  r1.z = 1 + -cb2[1].y;
  r1.z = cb2[0].w * r1.z + -cb2[0].w;
  r1.x = -cb2[0].w + r1.x;
  r1.z = 1 / r1.z;
  r1.x = saturate(r1.x * r1.z);
  r1.z = r1.x * -2 + 3;
  r1.x = r1.x * r1.x;
  r1.x = r1.z * r1.x;
  r1.zw = cmp(float2(9.99999975e-05, 0.5) < cb2[1].yw);
  r1.x = r1.z ? r1.x : r1.y;
  r1.y = 1 + -r1.x;
  r1.x = r1.w ? r1.y : r1.x;
  r1.x = cb2[1].z * r1.x;
  r1.y = cmp(9.99999975e-05 < cb2[0].w);
  r1.y = r1.y ? r1.x : 0;
  r1.x = r1.x * r1.y;
  r1.y = cmp(0.5 < cb2[14].z);
  if (r1.y != 0) {
    r3.y = cb2[0].y * r0.w + 1;
    r3.x = 1;
    r1.yz = r3.xy * r0.yz;
    r1.w = min(abs(r1.z), abs(r1.y));
    r2.w = max(abs(r1.z), abs(r1.y));
    r2.w = 1 / r2.w;
    r1.w = r2.w * r1.w;
    r2.w = r1.w * r1.w;
    r3.x = r2.w * 0.0208350997 + -0.0851330012;
    r3.x = r2.w * r3.x + 0.180141002;
    r3.x = r2.w * r3.x + -0.330299497;
    r2.w = r2.w * r3.x + 0.999866009;
    r3.x = r2.w * r1.w;
    r3.y = cmp(abs(r1.y) < abs(r1.z));
    r3.x = r3.x * -2 + 1.57079637;
    r3.x = r3.y ? r3.x : 0;
    r1.w = r1.w * r2.w + r3.x;
    r2.w = cmp(r1.y < -r1.y);
    r2.w = r2.w ? -3.141593 : 0;
    r1.w = r2.w + r1.w;
    r2.w = min(r1.z, r1.y);
    r3.x = max(r1.z, r1.y);
    r2.w = cmp(r2.w < -r2.w);
    r3.x = cmp(r3.x >= -r3.x);
    r2.w = r2.w ? r3.x : 0;
    r3.x = r2.w ? -r1.w : r1.w;
    r1.y = dot(r1.yz, r1.yz);
    r3.y = sqrt(r1.y);
    r1.yz = float2(1.27323949, 0.636619747) * r3.xy;
    r3.xy = float2(-0.5, -0.5) + v1.xy;
    r2.y = 1;
    r2.yw = r3.xy * r2.yx + float2(0.5, 0.5);
    r1.w = cmp(0.5 < cb2[14].w);
    r1.yz = r1.ww ? r1.yz : r2.yw;
    r1.yz = r1.yz * cb2[15].xy + cb2[15].zw;
    r1.yz = r0.xx * cb2[16].yz + r1.yz;
    r5.xyzw = t10.Sample(s8_s, r1.yz).xyzw;
    r1.yz = r5.xy * float2(2, 2) + float2(-1, -1);
    r1.yz = cb2[16].xx * r1.yz;
    r1.yz = r1.yz * r1.xx;
    r1.yz = float2(0.100000001, 0.100000001) * r1.yz;
  } else {
    r1.yz = float2(0, 0);
  }
  r1.w = cmp(0 < cb1[11].w);
  if (r1.w != 0) {
    r5.xyzw = t3.Sample(s2_s, v1.xy).xyzw;
    r2.yw = r5.xy * float2(0.100000001, 0.100000001) + r1.yz;
    r3.xy = v1.xy + r2.yw;
    r5.xy = r2.yw * r5.zz;
    r5.xy = cb1[11].ww * r5.xy;
    r6.xyzw = r5.xyxy * cb1[11].xxyy + r2.ywyw;
    r2.yw = r5.xy * cb1[11].zz + r2.yw;
  } else {
    r3.xy = v1.xy;
    r6.xyzw = float4(0, 0, 0, 0);
    r2.yw = float2(0, 0);
  }
  r5.xy = float2(-0.5, -0.5) + cb1[24].xy;
  r5.xy = -r5.xy + r0.yz;
  r1.w = dot(r5.xy, r5.xy);
  r5.xy = r5.xy * r1.ww;
  r5.xy = cb1[12].zz * r5.xy;
  r5.xy = float2(-0.333333343, -0.333333343) * r5.xy;
  r5.z = 9.99999975e-05;
  r1.w = dot(r5.xyz, r5.xyz);
  r1.w = rsqrt(r1.w);
  r5.zw = r5.xy * r1.ww;
  r1.w = dot(r5.xy, r5.xy);
  r1.w = sqrt(r1.w);
  r4.x = 0.942809045 * cb1[12].z;
  r1.w = r1.w / r4.x;
  r1.w = log2(r1.w);
  r1.w = cb1[24].z * r1.w;
  r1.w = exp2(r1.w);
  r5.xy = r5.zw * r1.ww;
  r5.zw = r5.xy * r4.xx;
  r6.xy = v1.xy + r6.xy;
  r7.xyzw = t0.Sample(s0_s, r6.xy).xyzw;
  r6.xy = v1.xy + r6.zw;
  r5.xy = r5.xy * r4.xx + r6.xy;
  r6.xyzw = t0.Sample(s0_s, r5.xy).xyzw;
  r2.yw = v1.xy + r2.yw;
  r2.yw = r5.zw * float2(2, 2) + r2.yw;
  r5.xyzw = t0.Sample(s0_s, r2.yw).xyzw;
  r8.xyzw = t0.Sample(s0_s, r3.xy).xyzw;
  r1.w = cmp(cb1[21].z < 0.5);
  r2.yw = cmp(float2(0, 0) < cb1[21].xy);
  r2.y = (int)r2.w | (int)r2.y;
  r1.w = r1.w ? r2.y : 0;
  if (r1.w != 0) {
    r1.w = cb0[137].y * r3.y;
    r1.w = cb1[25].x * r1.w;
    r2.y = r1.w + r1.w;
    r2.y = cmp(r2.y >= -r2.y);
    r6.xz = r2.yy ? float2(2, 0.5) : float2(-2, -0.5);
    r1.w = r6.z * r1.w;
    r1.w = frac(r1.w);
    r2.y = r6.x * r1.w;
    r4.x = cmp(1 < r2.y);
    r1.w = -r6.x * r1.w + 2;
    r1.w = r4.x ? r1.w : r2.y;
    r1.w = r1.w * 2 + -1;
    r8.x = cb1[25].z * r1.w + r3.x;
    r1.w = cb0[137].x * cb0[137].w;
    r2.y = abs(cb1[26].y) + r8.x;
    r4.x = cb1[26].y * r3.y;
    r2.y = r2.y * r1.w + -r4.x;
    r1.w = dot(cb1[26].xx, r1.ww);
    r1.w = r2.y / r1.w;
    r1.w = frac(r1.w);
    r1.w = cmp(0.5 >= r1.w);
    r1.w = r1.w ? 0.999989986 : -1;
    r8.y = cb1[26].z * r1.w + r3.y;
    r9.xyzw = t4.Sample(s3_s, r8.xy).xyzw;
    r6.xzw = log2(abs(r9.xyz));
    r6.xzw = float3(0.333333343, 0.333333343, 0.333333343) * r6.xzw;
    r6.xzw = exp2(r6.xzw);
    r6.xzw = r6.xzw * float3(1.49380159, 1.49380159, 1.49380159) + -r9.xyz;
    r7.yzw = cmp(r9.xyz >= float3(0.300000012, 0.300000012, 0.300000012));
    r7.yzw = r7.yzw ? float3(1, 1, 1) : 0;
    r6.xzw = float3(-0.699999988, -0.699999988, -0.699999988) + r6.xzw;
    r6.xzw = r7.yzw * r6.xzw + r9.xyz;
    r6.xzw = cb1[21].xxx * r6.xzw;
    r5.x = r7.x;
    r5.y = r6.y;
    r1.w = dot(r5.xyz, float3(0.298999995, 0.587000012, 0.114));
    r2.y = cmp(0.5 < cb1[22].x);
    r7.yzw = r1.www * r6.xzw + -r6.xzw;
    r7.yzw = r8.www * r7.yzw + r6.xzw;
    r7.yzw = r2.yyy ? r7.yzw : r6.xzw;
    if (r2.w != 0) {
      r2.yw = r3.xy * cb1[20].xy + cb1[20].zw;
      r9.xyzw = t5.Sample(s0_s, r2.yw).xyzw;
      r8.xyz = cb1[21].yyy * r9.xyz;
      r7.yzw = r8.xyz * r6.xzw + r7.yzw;
    }
    r5.xyz = r7.yzw + r5.xyz;
    r1.w = r7.y + r7.z;
    r1.w = r1.w + r7.w;
    o0.w = saturate(r1.w * 0.333299994 + r8.w);
  } else {
    r5.x = r7.x;
    r5.y = r6.y;
    o0.w = r8.w;
  }

  // possibly vignette
  r1.w = cmp(0 < cb1[7].z);
  if (r1.w != 0) {
    r2.yw = -cb1[7].xy + r3.xy;
    r6.yz = cb1[7].zz * abs(r2.yw);
    r6.x = cb1[6].w * r6.y;
    r1.w = dot(r6.xz, r6.xz);
    r1.w = 1 + -r1.w;
    r1.w = max(0, r1.w);
    r1.w = log2(r1.w);
    r1.w = cb1[7].w * r1.w;
    r1.w = exp2(r1.w);
    r6.xyz = float3(1, 1, 1) + -cb1[6].xyz;
    r6.xyz = r1.www * r6.xyz + cb1[6].xyz;
    r5.xyz = r6.xyz * r5.xyz;
  }
  float3 untonemapped = (r5.xyz);

  r3.xyz = applyUserToneMap(untonemapped, cb1[0], t2, s0_s);

  /* Original LUT Sampling
  r5.xyz = saturate(r5.xyz);
  r6.xyz = float3(12.9200001, 12.9200001, 12.9200001) * r5.zxy;
  r7.xyz = log2(r5.zxy);
  r7.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r7.xyz;
  r7.xyz = exp2(r7.xyz);
  r7.xyz = r7.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997);
  r5.xyz = cmp(float3(0.00313080009, 0.00313080009, 0.00313080009) >= r5.zxy);
  r5.xyz = r5.xyz ? r6.xyz : r7.xyz;
  r5.yzw = cb1[0].zzz * r5.xyz;
  r1.w = floor(r5.y);
  r2.yw = float2(0.5, 0.5) * cb1[0].xy;
  r6.yz = r5.zw * cb1[0].xy + r2.yw;
  r6.x = r1.w * cb1[0].y + r6.y;
  r7.xyzw = t2.SampleLevel(s0_s, r6.xz, 0).xyzw;
  r3.z = cb1[0].y;
  r2.yw = r6.xz + r3.zw;
  r3.xyzw = t2.SampleLevel(s0_s, r2.yw, 0).xyzw;
  r1.w = r5.x * cb1[0].z + -r1.w;
  r3.xyz = r3.xyz + -r7.xyz;
  r3.xyz = r1.www * r3.xyz + r7.xyz;
  r5.xyz = float3(0.0773993805, 0.0773993805, 0.0773993805) * r3.xyz;
  r6.xyz = float3(0.0549999997, 0.0549999997, 0.0549999997) + r3.xyz;
  r6.xyz = float3(0.947867334, 0.947867334, 0.947867334) * r6.xyz;
  r6.xyz = log2(abs(r6.xyz));
  r6.xyz = float3(2.4000001, 2.4000001, 2.4000001) * r6.xyz;
  r6.xyz = exp2(r6.xyz);
  r3.xyz = cmp(float3(0.0404499993, 0.0404499993, 0.0404499993) >= r3.xyz);
  r3.xyz = r3.xyz ? r5.xyz : r6.xyz;*/

  r1.w = cmp(0 < cb1[13].x);
  if (r1.w != 0) {
    r2.yw = v1.xy * cb1[8].xy + cb1[8].zw;
    r5.xyzw = t1.Sample(s1_s, r2.yw).xyzw;
    r1.w = -0.5 + r5.w;
    r1.w = r1.w + r1.w;
    r2.y = dot(r3.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
    r2.y = sqrt(r2.y);
    r2.y = cb1[13].y * -r2.y + 1;
    r5.xyz = r3.xyz * r1.www;
    r5.xyz = cb1[13].xxx * r5.xyz;
    r3.xyz = r5.xyz * r2.yyy + r3.xyz;
  }
  r5.y = cb2[0].y * r0.w + 1;
  r5.x = 1;
  r0.yz = r5.xy * r0.yz;
  r0.w = min(abs(r0.z), abs(r0.y));
  r1.w = max(abs(r0.z), abs(r0.y));
  r1.w = 1 / r1.w;
  r0.w = r1.w * r0.w;
  r1.w = r0.w * r0.w;
  r2.y = r1.w * 0.0208350997 + -0.0851330012;
  r2.y = r1.w * r2.y + 0.180141002;
  r2.y = r1.w * r2.y + -0.330299497;
  r1.w = r1.w * r2.y + 0.999866009;
  r2.y = r1.w * r0.w;
  r2.w = cmp(abs(r0.y) < abs(r0.z));
  r2.y = r2.y * -2 + 1.57079637;
  r2.y = r2.w ? r2.y : 0;
  r0.w = r0.w * r1.w + r2.y;
  r1.w = cmp(r0.y < -r0.y);
  r1.w = r1.w ? -3.141593 : 0;
  r0.w = r1.w + r0.w;
  r1.w = min(r0.z, r0.y);
  r2.y = max(r0.z, r0.y);
  r1.w = cmp(r1.w < -r1.w);
  r2.y = cmp(r2.y >= -r2.y);
  r1.w = r1.w ? r2.y : 0;
  r0.w = r1.w ? -r0.w : r0.w;
  r0.y = dot(r0.yz, r0.yz);
  r0.y = sqrt(r0.y);
  r5.xy = float2(1.27323949, 0.5) * r0.wy;
  r0.yz = r0.xx * cb2[10].zw + cb3[0].xy;
  r2.yw = r0.xx * cb2[11].xy + cb3[0].zw;
  r5.zw = float2(-0.5, -0.5) + v1.xy;
  r2.z = 1;
  r2.xz = r5.zw * r2.zx + float2(0.5, 0.5);
  r0.w = cmp(0.5 < cb2[6].z);
  r5.zw = r0.ww ? r5.xy : r2.xz;
  r5.zw = r5.zw * cb2[7].xy + cb2[7].zw;
  r5.zw = r0.xx * cb2[8].xy + r5.zw;
  r5.zw = r5.zw + r1.yz;
  r6.xy = cmp(float2(0.5, 0.5) < cb2[11].wz);
  r6.xz = r6.xx ? r5.xy : r2.xz;
  r6.xz = r6.xz * cb2[12].xy + cb2[12].zw;
  r2.yw = r6.xz + r2.yw;
  r2.yw = r2.yw + r1.yz;
  r0.w = (uint)cb2[13].x;
  r7.xyzw = t9.Sample(s7_s, r2.yw).xyzw;
  r0.w = min(3, (uint)r0.w);
  r0.w = dot(r7.xyzw, icb[r0.w + 0].xyzw);
  r0.w = -0.498039216 + r0.w;
  r0.w = r0.w + r0.w;
  r2.yw = cmp(float2(0.5, 3.5) < cb2[3].xy);
  r1.w = 0.00092592591 * cb0[137].y;
  r1.w = max(1, r1.w);
  r1.w = r2.y ? 1 : r1.w;
  r6.xz = r2.yy ? r5.xy : r2.xz;
  r6.xz = cb2[2].xy * r6.xz;
  r6.xz = r6.xz * r1.ww + cb2[2].zw;
  r6.xz = r0.xx * cb2[6].xy + r6.xz;
  r6.xz = r0.ww * cb2[13].yy + r6.xz;
  r6.xz = r6.xz + r1.yz;
  r0.x = cmp(0.5 < cb2[8].w);
  r2.xy = r0.xx ? r5.xy : r2.xz;
  r2.xy = r2.xy * cb2[9].xy + cb2[9].zw;
  r0.xy = r2.xy + r0.yz;
  r0.xy = r0.ww * cb2[13].zz + r0.xy;
  r0.xy = r0.xy + r1.yz;
  r0.z = (uint)cb2[10].y;
  r7.xyzw = t8.Sample(s6_s, r0.xy).xyzw;
  r0.x = min(3, (uint)r0.z);
  r0.x = dot(r7.xyzw, icb[r0.x + 0].xyzw);
  r7.xyzw = t6.Sample(s4_s, r6.xz).xyzw;
  r0.y = r6.y ? r0.x : 1;
  r0.zw = (uint2)cb2[3].yz;
  r0.zw = min(uint2(0, 0), (uint2)r0.zw);
  r0.z = dot(r7.xyzw, icb[r0.z + 0].xyzw);
  r1.y = saturate(cb2[3].w * r0.y);
  r6.xyzw = cb2[5].xyzw + -cb2[4].xyzw;
  r1.yzw = r1.yyy * r6.xyz + cb2[4].xyz;
  r1.yzw = r7.xyz * r1.yzw;
  r0.z = cb2[3].w * r0.z;
  r0.y = saturate(r0.z * r0.y);
  r2.xyz = r0.yyy * r6.xyz + cb2[4].xyz;
  r1.yzw = r2.www ? r1.yzw : r2.xyz;
  r0.y = dot(r7.xyzw, icb[r0.w + 0].xyzw);
  r0.z = r0.y * r0.x;
  r0.z = cmp(r0.z >= cb2[10].x);
  r0.z = r0.z ? 1.000000 : 0;
  r0.x = r0.y * r0.x + -cb2[10].x;
  r0.x = saturate(cb2[14].x * r0.x);
  r0.w = cmp(0.5 < cb2[13].w);
  r0.x = r0.w ? r0.x : r0.z;
  r0.z = (uint)cb2[6].w;
  r2.xyzw = t7.Sample(s5_s, r5.zw).xyzw;
  r0.z = min(3, (uint)r0.z);
  r0.z = dot(r2.xyzw, icb[r0.z + 0].xyzw);
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
  r5.xyz = float3(-1, -1, -1) + r1.yzw;
  r5.xyz = r0.xxx * r5.xyz + float3(1, 1, 1);
  r5.xyz = r5.xyz * r3.xyz;
  r1.xyz = float3(-0.5, -0.5, -0.5) + r1.yzw;
  r1.xyz = r0.xxx * r1.xyz + float3(0.5, 0.5, 0.5);
  r6.xyz = cmp(r3.xyz < float3(0.5, 0.5, 0.5));
  r7.xyz = r3.xyz * r1.xyz;
  r7.xyz = r7.xyz + r7.xyz;
  r3.xyz = float3(1, 1, 1) + -r3.xyz;
  r1.xyz = float3(1, 1, 1) + -r1.xyz;
  r1.xyz = r3.xyz * r1.xyz;
  r1.xyz = -r1.xyz * float3(2, 2, 2) + float3(1, 1, 1);
  r1.xyz = r6.xyz ? r7.xyz : r1.xyz;
  r1.xyz = r4.www ? r5.xyz : r1.xyz;
  r1.xyz = r4.zzz ? r2.xyz : r1.xyz;
  // o0.xyz = saturate(r4.yyy ? r0.yzw : r1.xyz);
  o0.xyz = r4.yyy ? r0.yzw : r1.xyz;
  o0.rgb = renodx::draw::RenderIntermediatePass(o0.xyz);
  return;
}
