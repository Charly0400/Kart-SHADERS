Shader "Custom/TireShadder"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _EmissionColor("Emission Color", Color) = (0, 1, 0, 1)
        _EmissionStrength("Emission Strength", Range(0.0, 10.0)) = 1.0
    }

        SubShader
        {
            Tags { "RenderType" = "Opaque" }
            LOD 200

            CGPROGRAM
            #pragma surface surf Lambert

            struct Input
            {
                float2 uv_MainTex;
            };

            sampler2D _MainTex;
            fixed4 _EmissionColor;
            float _EmissionStrength;

            void surf(Input IN, inout SurfaceOutput o)
            {
                fixed4 texColor = tex2D(_MainTex, IN.uv_MainTex);

                o.Albedo = texColor.rgb; // Color de la textura sin modificar

                // Emission basada en la distancia
                float distanceToEdge = 1.0 - length(IN.uv_MainTex - 0.5);
                o.Emission = _EmissionColor.rgb * smoothstep(0.3, 0.4, distanceToEdge) * _EmissionStrength;

                o.Alpha = texColor.a;
            }
            ENDCG
        }
    FallBack "Diffuse"
}
