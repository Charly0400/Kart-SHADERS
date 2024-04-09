Shader "Custom/TireShadder"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _Color1("Color 1", Color) = (1,1,1,1)
        _Color2("Color 2", Color) = (1,1,1,1)
        _Color3("Color 3", Color) = (1,1,1,1)
        _Color4("Color 4", Color) = (1,1,1,1)
    }
    SubShader {
        Tags { "RenderType" = "Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;
        fixed4 _Color1;
        fixed4 _Color2;
        fixed4 _Color3;
        fixed4 _Color4;

        struct Input {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o) {
            fixed4 texColor = tex2D(_MainTex, IN.uv_MainTex);

            if (IN.uv_MainTex.x < 0.5 && IN.uv_MainTex.y < 0.5)
                o.Albedo = texColor * _Color1;
            else if (IN.uv_MainTex.x < 0.5 && IN.uv_MainTex.y >= 0.5)
                o.Albedo = texColor * _Color2;
            else if (IN.uv_MainTex.x >= 0.5 && IN.uv_MainTex.y < 0.5)
                o.Albedo = texColor * _Color3;
            else
                o.Albedo = texColor * _Color4;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
