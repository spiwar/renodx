#include "../../tonemap.hlsl"

// Primary lutbuilder, only created once during scene load.
// ---- Created with 3Dmigoto v1.4.1 on Wed Oct 15 08:07:53 2025
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

SamplerState s2_s : register(s2);

SamplerState s1_s : register(s1);

SamplerState s0_s : register(s0);

cbuffer cb0 : register(b0) {
  float4 cb0[191];
}

// 3Dmigoto declarations
#define cmp -

void main(
    float4 v0: SV_POSITION0,
    float4 v1: TEXCOORD0,
    float4 v2: TEXCOORD1,
    out float4 o0: SV_Target0) {
  float4 r0, r1, r2, r3, r4, r5, r6;
  uint4 bitmask, uiDest;
  float4 fDest;

  // float3 colorLinear = LogCToLinear(colorLutSpace);
  // https://github.com/Unity-Technologies/Graphics/blob/438e5869f41f3920e7d1c4ee52ad273c0b9f82a6/Packages/com.unity.render-pipelines.universal/Shaders/PostProcessing/LutBuilderLdr.shader#L43

  r0.yz = -cb0[168].yz + v1.xy;
  r1.x = cb0[168].x * r0.y;
  r0.x = frac(r1.x);
  r1.x = r0.x / cb0[168].x;
  r0.w = -r1.x + r0.y;
  r0.xyz = r0.xzw * cb0[168].www + float3(-0.386036009, -0.386036009, -0.386036009);
  r0.xyz = float3(13.6054821, 13.6054821, 13.6054821) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = float3(-0.0479959995, -0.0479959995, -0.0479959995) + r0.xyz;
  r0.xyz = float3(0.179999992, 0.179999992, 0.179999992) * r0.xyz;
  r1.x = dot(float3(0.390404999, 0.549941003, 0.00892631989), r0.xyz);
  r1.y = dot(float3(0.070841603, 0.963172019, 0.00135775004), r0.xyz);
  r1.z = dot(float3(0.0231081992, 0.128021002, 0.936245024), r0.xyz);
  r0.xyz = cb0[169].xyz * r1.xyz;
  r1.x = dot(float3(2.85846996, -1.62879002, -0.0248910002), r0.xyz);
  r1.y = dot(float3(-0.210181996, 1.15820003, 0.000324280991), r0.xyz);
  r1.z = dot(float3(-0.0418119989, -0.118169002, 1.06867003), r0.xyz);
  r0.xyz = r1.xyz * float3(5.55555582, 5.55555582, 5.55555582) + float3(0.0479959995, 0.0479959995, 0.0479959995);
  r0.xyz = log2(r0.xyz);
  r0.xyz = r0.xyz * float3(0.0734997839, 0.0734997839, 0.0734997839) + float3(-0.0275523961, -0.0275523961, -0.0275523961);
  r0.xyz = r0.xyz * cb0[174].zzz + float3(0.0275523961, 0.0275523961, 0.0275523961);
  r0.xyz = float3(13.6054821, 13.6054821, 13.6054821) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r0.xyz = float3(-0.0479959995, -0.0479959995, -0.0479959995) + r0.xyz;
  r0.xyz = cb0[170].xyz * r0.xyz;
  r0.xyz = float3(0.179999992, 0.179999992, 0.179999992) * r0.xyz;
  r0.xyz = max(float3(0, 0, 0), r0.xyz);
  r0.xyz = log2(r0.xyz);
  r0.xyz = float3(0.454545468, 0.454545468, 0.454545468) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r1.xyz = min(float3(1, 1, 1), r0.xyz);
  r0.w = dot(r1.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
  r0.w = saturate(cb0[182].w + r0.w);
  r1.x = 1 + -r0.w;
  r1.yzw = float3(-0.5, -0.5, -0.5) + cb0[182].xyz;
  r1.xyz = r1.xxx * r1.yzw + float3(0.5, 0.5, 0.5);
  r2.xyz = float3(-0.5, -0.5, -0.5) + cb0[183].xyz;
  r2.xyz = r0.www * r2.xyz + float3(0.5, 0.5, 0.5);
  r3.xyz = r0.xyz + r0.xyz;
  r4.xyz = r0.xyz * r0.xyz;
  r5.xyz = -r1.xyz * float3(2, 2, 2) + float3(1, 1, 1);
  r4.xyz = r5.xyz * r4.xyz;
  r4.xyz = r3.xyz * r1.xyz + r4.xyz;
  r0.xyz = sqrt(r0.xyz);
  r5.xyz = r1.xyz * float3(2, 2, 2) + float3(-1, -1, -1);
  r6.xyz = float3(1, 1, 1) + -r1.xyz;
  r3.xyz = r6.xyz * r3.xyz;
  r0.xyz = r0.xyz * r5.xyz + r3.xyz;
  r1.xyz = cmp(r1.xyz >= float3(0.5, 0.5, 0.5));
  r3.xyz = r1.xyz ? float3(1, 1, 1) : 0;
  r1.xyz = r1.xyz ? float3(0, 0, 0) : float3(1, 1, 1);
  r1.xyz = r1.xyz * r4.xyz;
  r0.xyz = r0.xyz * r3.xyz + r1.xyz;
  r1.xyz = r0.xyz + r0.xyz;
  r3.xyz = r0.xyz * r0.xyz;
  r4.xyz = -r2.xyz * float3(2, 2, 2) + float3(1, 1, 1);
  r3.xyz = r4.xyz * r3.xyz;
  r3.xyz = r1.xyz * r2.xyz + r3.xyz;
  r0.xyz = sqrt(r0.xyz);
  r4.xyz = r2.xyz * float3(2, 2, 2) + float3(-1, -1, -1);
  r5.xyz = float3(1, 1, 1) + -r2.xyz;
  r1.xyz = r5.xyz * r1.xyz;
  r0.xyz = r0.xyz * r4.xyz + r1.xyz;
  r1.xyz = cmp(r2.xyz >= float3(0.5, 0.5, 0.5));
  r2.xyz = r1.xyz ? float3(1, 1, 1) : 0;
  r1.xyz = r1.xyz ? float3(0, 0, 0) : float3(1, 1, 1);
  r1.xyz = r1.xyz * r3.xyz;
  r0.xyz = r0.xyz * r2.xyz + r1.xyz;
  r0.xyz = log2(abs(r0.xyz));
  r0.xyz = float3(2.20000005, 2.20000005, 2.20000005) * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r1.x = dot(r0.xyz, cb0[171].xyz);
  r1.y = dot(r0.xyz, cb0[172].xyz);
  r1.z = dot(r0.xyz, cb0[173].xyz);
  r0.x = dot(r1.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
  r0.yz = cb0[181].yw + -cb0[181].xz;
  r0.xw = -cb0[181].xz + r0.xx;
  r0.yz = float2(1, 1) / r0.yz;
  r0.xy = saturate(r0.xw * r0.yz);
  r0.zw = r0.xy * float2(-2, -2) + float2(3, 3);
  r0.xy = r0.xy * r0.xy;
  r1.w = r0.w * r0.y;
  r0.x = -r0.z * r0.x + 1;
  r0.z = 1 + -r0.x;
  r0.y = -r0.w * r0.y + r0.z;
  r2.xyz = cb0[178].xyz * r1.xyz;
  r3.xyz = cb0[179].xyz * r1.xyz;
  r0.yzw = r3.xyz * r0.yyy;
  r0.xyz = r2.xyz * r0.xxx + r0.yzw;
  r1.xyz = cb0[180].xyz * r1.xyz;
  r0.xyz = r1.xyz * r1.www + r0.xyz;
  r0.xyz = r0.xyz * cb0[177].xyz + cb0[175].xyz;
  r1.xyz = cmp(float3(0, 0, 0) < r0.xyz);
  r2.xyz = cmp(r0.xyz < float3(0, 0, 0));
  r1.xyz = (int3)-r1.xyz + (int3)r2.xyz;
  r1.xyz = (int3)r1.xyz;
  r0.xyz = log2(abs(r0.xyz));
  r0.xyz = cb0[176].xyz * r0.xyz;
  r0.xyz = exp2(r0.xyz);
  r2.xyz = r1.xyz * r0.xyz;
  r0.x = cmp(r2.y >= r2.z);
  r0.x = r0.x ? 1.000000 : 0;
  r3.xy = r2.zy;
  r3.zw = float2(-1, 0.666666687);
  r1.xy = r1.yz * r0.yz + -r3.xy;
  r1.zw = float2(1, -1);
  r0.xyzw = r0.xxxx * r1.xyzw + r3.xyzw;
  r1.x = cmp(r2.x >= r0.x);
  r1.x = r1.x ? 1.000000 : 0;
  r3.xyz = r0.xyw;
  r3.w = r2.x;
  r0.xyw = r3.wyx;
  r0.xyzw = r0.xyzw + -r3.xyzw;
  r0.xyzw = r1.xxxx * r0.xyzw + r3.xyzw;
  r1.x = min(r0.w, r0.y);
  r1.x = -r1.x + r0.x;
  r0.y = r0.w + -r0.y;
  r0.w = r1.x * 6 + 9.99999975e-05;
  r0.y = r0.y / r0.w;
  r0.y = r0.z + r0.y;
  r3.x = abs(r0.y);
  r0.y = 9.99999975e-05 + r0.x;
  r3.z = r1.x / r0.y;
  r3.yw = float2(0, 0);
  r1.xyzw = t7.Sample(s0_s, r3.xy).xyzw;
  r1.x = saturate(r1.x);
  r0.y = r1.x + r1.x;
  r1.xyzw = t8.Sample(s0_s, r3.zw).xyzw;
  r1.x = saturate(r1.x);
  r0.y = dot(r1.xx, r0.yy);
  r1.x = dot(r2.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
  r1.yw = float2(0, 0);
  r2.xyzw = t9.Sample(s0_s, r1.xy).xyzw;
  r2.x = saturate(r2.x);
  r0.y = r2.x * r0.y;
  r1.z = cb0[174].x + r3.x;
  r2.xyzw = t6.Sample(s0_s, r1.zw).xyzw;
  r2.x = saturate(r2.x);
  r0.z = r2.x + r1.z;
  r1.xyz = float3(-0.5, 0.5, -1.5) + r0.zzz;
  r0.z = cmp(r1.x < 0);
  r0.w = cmp(1 < r1.x);
  r0.w = r0.w ? r1.z : r1.x;
  r0.z = r0.z ? r1.y : r0.w;
  r1.xyz = float3(1, 0.666666687, 0.333333343) + r0.zzz;
  r1.xyz = frac(r1.xyz);
  r1.xyz = r1.xyz * float3(6, 6, 6) + float3(-3, -3, -3);
  r1.xyz = saturate(float3(-1, -1, -1) + abs(r1.xyz));
  r1.xyz = float3(-1, -1, -1) + r1.xyz;
  r1.xyz = r3.zzz * r1.xyz + float3(1, 1, 1);
  r2.xyz = r1.xyz * r0.xxx;
  r0.z = dot(r2.xyz, float3(0.212672904, 0.715152204, 0.0721750036));
  r0.y = dot(cb0[174].yy, r0.yy);
  r1.xyz = r0.xxx * r1.xyz + -r0.zzz;
  r0.xyz = r0.yyy * r1.xyz + r0.zzz;
  r0.xyz = max(float3(0, 0, 0), r0.xyz);
  r1.xyz = r0.zxy * float3(5.55555582, 5.55555582, 5.55555582) + float3(0.0479959995, 0.0479959995, 0.0479959995);
  r1.xyz = log2(r1.xyz);
  r1.xyz = r1.xyz * float3(0.0734997839, 0.0734997839, 0.0734997839) + float3(0.386036009, 0.386036009, 0.386036009);
  r1.xyz = min(float3(1, 1, 1), r1.xyz);
  r1.yzw = cb0[167].zzz * r1.xyz;
  r0.w = floor(r1.y);
  r2.xy = float2(0.5, 0.5) * cb0[167].xy;
  r2.yz = r1.zw * cb0[167].xy + r2.xy;
  r2.x = r0.w * cb0[167].y + r2.y;
  r3.xyzw = t0.SampleLevel(s1_s, r2.xz, 0).xyzw;
  r4.x = cb0[167].y;
  r4.y = 0;
  r1.yz = r4.xy + r2.xz;
  r2.xyzw = t0.SampleLevel(s1_s, r1.yz, 0).xyzw;
  r0.w = r1.x * cb0[167].z + -r0.w;
  r1.xyz = r2.xyz + -r3.xyz;
  r1.xyz = r0.www * r1.xyz + r3.xyz;
  r1.xyz = float3(-0.386036009, -0.386036009, -0.386036009) + r1.xyz;
  r1.xyz = float3(13.6054821, 13.6054821, 13.6054821) * r1.xyz;
  r1.xyz = exp2(r1.xyz);
  r1.xyz = float3(-0.0479959995, -0.0479959995, -0.0479959995) + r1.xyz;
  r1.xyz = r1.xyz * float3(0.179999992, 0.179999992, 0.179999992) + -r0.xyz;
  r0.xyz = cb0[167].www * r1.xyz + r0.xyz;
  r0.w = max(r0.x, r0.y);
  r0.w = max(r0.w, r0.z);
  r0.w = 1 + r0.w;
  r0.w = 1 / r0.w;
  r0.xyz = r0.xyz * r0.www + float3(0.00390625, 0.00390625, 0.00390625);
  r0.w = 0;
  r1.xyzw = t2.Sample(s0_s, r0.xw).xyzw;
  r1.x = saturate(r1.x);
  r2.xyzw = t2.Sample(s0_s, r0.yw).xyzw;
  r1.y = saturate(r2.x);
  r0.xyzw = t2.Sample(s0_s, r0.zw).xyzw;
  r1.z = saturate(r0.x);
  r0.xyz = float3(0.00390625, 0.00390625, 0.00390625) + r1.xyz;
  r0.w = 0;
  r1.xyzw = t3.Sample(s0_s, r0.xw).xyzw;
  r1.x = saturate(r1.x);
  r2.xyzw = t4.Sample(s0_s, r0.yw).xyzw;
  r1.y = saturate(r2.x);
  r0.xyzw = t5.Sample(s0_s, r0.zw).xyzw;
  r1.z = saturate(r0.x);
  r0.x = max(r1.x, r1.y);
  r0.x = max(r0.x, r1.z);
  r0.x = 1 + -r0.x;
  r0.x = 1 / r0.x;
  r0.xyz = r1.xyz * r0.xxx;

  float3 untonemapped = r0.xyz;

  if (RENODX_TONE_MAP_TYPE != 0) {
    o0.xyz = applyUserToneMap(untonemapped, cb0[165], t1, s2_s);
    o0.w = 1.0f;
    return;
  }
  
  r0.w = cmp(0 < cb0[165].w);
  if (r0.w != 0) {
    r0.xyz = saturate(r0.xyz);
    r1.xyz = float3(12.9200001, 12.9200001, 12.9200001) * r0.xyz;
    r2.xyz = log2(r0.xyz);
    r2.xyz = float3(0.416666657, 0.416666657, 0.416666657) * r2.xyz;
    r2.xyz = exp2(r2.xyz);
    r2.xyz = r2.xyz * float3(1.05499995, 1.05499995, 1.05499995) + float3(-0.0549999997, -0.0549999997, -0.0549999997);
    r3.xyz = cmp(float3(0.00313080009, 0.00313080009, 0.00313080009) >= r0.xyz);
    r1.xyz = r3.xyz ? r1.xyz : r2.xyz;
    r2.xyz = cb0[165].zzz * r1.zxy;
    r0.w = floor(r2.x);
    r2.xw = float2(0.5, 0.5) * cb0[165].xy;
    r2.yz = r2.yz * cb0[165].xy + r2.xw;
    r2.x = r0.w * cb0[165].y + r2.y;
    r3.xyzw = t1.SampleLevel(s2_s, r2.xz, 0).xyzw;
    r4.x = cb0[165].y;
    r4.y = 0;
    r2.xy = r4.xy + r2.xz;
    r2.xyzw = t1.SampleLevel(s2_s, r2.xy, 0).xyzw;
    r0.w = r1.z * cb0[165].z + -r0.w;
    r2.xyz = r2.xyz + -r3.xyz;
    r2.xyz = r0.www * r2.xyz + r3.xyz;
    r2.xyz = r2.xyz + -r1.xyz;
    r1.xyz = cb0[165].www * r2.xyz + r1.xyz;
    r2.xyz = float3(0.0773993805, 0.0773993805, 0.0773993805) * r1.xyz;
    r3.xyz = float3(0.0549999997, 0.0549999997, 0.0549999997) + r1.xyz;
    r3.xyz = float3(0.947867334, 0.947867334, 0.947867334) * r3.xyz;
    r3.xyz = log2(abs(r3.xyz));
    r3.xyz = float3(2.4000001, 2.4000001, 2.4000001) * r3.xyz;
    r3.xyz = exp2(r3.xyz);
    r1.xyz = cmp(float3(0.0404499993, 0.0404499993, 0.0404499993) >= r1.xyz);
    r0.xyz = r1.xyz ? r2.xyz : r3.xyz;
  }
  r0.w = r0.x + r0.y;
  r0.w = r0.w + r0.z;
  r1.x = 0.333333343 * r0.w;
  r0.xyz = -r0.www * float3(0.333333343, 0.333333343, 0.333333343) + r0.xyz;
  o0.xyz = saturate(r0.xyz * cb0[190].zzz + r1.xxx);
  o0.w = 1;
  return;
}
