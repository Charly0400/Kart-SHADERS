Shader "Custom/TriRoadShader"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _Color1("Color 1", Color) = (1,1,1,1)
        _Color2("Color 2", Color) = (0,0,0,1)
        _Color3("Color 3", Color) = (0,0,0,1)
        _DistortionSpeed("Distortion Speed", float) = 1.0
        _ReflectionStrength("Reflection Strength", float) = 0.5
    }
        SubShader
        {
            Tags { "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Opaque" }
            Blend SrcAlpha OneMinusSrcAlpha
            Pass
            {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include "UnityCG.cginc"

                struct appdata
                {
                    float4 vertex : POSITION;
                    float2 uv : TEXCOORD0;
                };

                struct v2f
                {
                    float2 uv : TEXCOORD0;
                    float4 vertex : SV_POSITION;
                    float3 worldPos : TEXCOORD1;
                };

                sampler2D _MainTex;
                float4 _MainTex_ST;
                float4 _Color1;
                float4 _Color2;
                float4 _Color3;
                float _DistortionSpeed;
                float _ReflectionStrength;

                v2f vert(appdata v)
                {
                    v2f o;
                    o.vertex = UnityObjectToClipPos(v.vertex);
                    o.uv = v.uv;
                    o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                    return o;
                }

                fixed4 frag(v2f i) : SV_Target
                {
                    float2 uv = i.uv;
                    float3 worldPos = i.worldPos;
                    float time = _Time.y * _DistortionSpeed;
                    float2 distortionUV = uv + 0.1 * sin(worldPos.yz * 10.0 - time);
                    float reflection = tex2D(_MainTex, distortionUV).r;

                    // Interpolación entre los tres colores
                    fixed4 col;
                    if (reflection < 0.333)
                        col = lerp(_Color1, _Color2, reflection * 3);
                    else if (reflection < 0.666)
                        col = lerp(_Color2, _Color3, (reflection - 0.333) * 3);
                    else
                        col = lerp(_Color3, _Color1, (reflection - 0.666) * 3);

                    fixed3 reflectionColor = reflect(float3(0, 1, 0), normalize(worldPos - _WorldSpaceCameraPos));
                    col.rgb += _ReflectionStrength * reflectionColor.rgb;
                    return col;
                }
                ENDCG
            }
        }
}
