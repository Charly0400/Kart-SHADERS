Shader "Custom/BlinnPhong"
{
    Properties
    {
        _MyTex("Textura",2D) = "white"{}
        _MyBump("Bump Texture",2D) = "bump"{}
        _Color("Color",Color) = (1,1,1,1)
        _MetalTex("Metal",2D) = "white"{}
        _Metallic("Metallic", Range(0.0,1.0)) = 0.0
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }

        CGPROGRAM
        #pragma surface surf StandardSpecular

        struct Input
        {
            float2 uv_MyTex;
            float2 uv_MyBump;
            float2 uv_MetalTex;
        };

        sampler2D _MetalTex;
        half _Metallic;
        fixed4 _Color;
        sampler2D _MyBump;

        sampler2D _MyTex;

        void surf (Input IN, inout SurfaceOutputStandardSpecular o)
        {
            fixed4 baseColor = tex2D(_MyTex, IN.uv_MyTex) * _Color;
            o.Albedo = baseColor.rgb;
            o.Specular = _Metallic;
            o.Normal = UnpackNormal(tex2D(_MyBump, IN.uv_MyBump));
            o.Smoothness = tex2D(_MetalTex, IN.uv_MetalTex).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
