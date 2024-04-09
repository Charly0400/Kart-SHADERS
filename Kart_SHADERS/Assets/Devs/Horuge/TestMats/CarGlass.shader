Shader "Custom/CarLightEmission"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _Glossiness("Smoothness", Range(0,1)) = 0.5
        _Metallic("Metallic", Range(0,1)) = 0.0
        _DistortionStrength("Distortion Strength", Range(0,1)) = 0.1
        _DistortionSpeed("Distortion Speed", Range(0,10)) = 1.0
    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
            float3 worldPos;
        };

        fixed4 _Color;
        float _Glossiness;
        float _Metallic;
        float _DistortionStrength;
        float _DistortionSpeed;

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 baseColor = _Color;
            o.Albedo = baseColor.rgb;
            o.Alpha = baseColor.a;
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;

            float distortion = sin(_Time.y * _DistortionSpeed + IN.uv_MainTex.x * 10) * _DistortionStrength;
            float2 distortedUV = IN.uv_MainTex + float2(distortion, distortion);
            o.Normal = UnpackNormal(fixed4(distortedUV, 0, 0));

            o.Normal = normalize(reflect(IN.worldPos - _WorldSpaceCameraPos, o.Normal));
        }
        ENDCG
    }
        FallBack "Diffuse"
}
