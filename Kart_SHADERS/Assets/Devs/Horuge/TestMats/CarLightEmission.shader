Shader "Custom/CarLightEmission"
{
    Properties
    {
        _Intensity("Light Intensity", Range(0, 5)) = 1
        _Range("Light Range", Range(0, 10)) = 5
        _EmissionTex("Emission Texture", 2D) = "white" {}
        _EmissionColor("Emission Color", Color) = (1,1,1,1)
    }

        SubShader
        {
            Tags { "RenderType" = "Opaque" }

            CGPROGRAM
            #pragma surface surf Lambert

            struct Input
            {
                float2 uv_EmissionTex;
            };

            sampler2D _EmissionTex;
            fixed4 _EmissionColor;
            float _Intensity;
            float _Range;

            void surf(Input IN, inout SurfaceOutput o)
            {
                fixed4 emissionTexColor = tex2D(_EmissionTex, IN.uv_EmissionTex) * _EmissionColor * _Intensity;
                o.Emission = emissionTexColor.rgb;
            }
            ENDCG
        }

    FallBack "Diffuse"
}
