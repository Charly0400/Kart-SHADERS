Shader "Custom/BumpShader"
{
    Properties
    {
        _MyTex("Albedo", 2D)="white"{}
        _MyBump("Bump Texture",2D)="bump"{}
        _MyCube("Cubo",CUBE) = "white"{}
        BumpRange("BumpRange", Range(0,10)) = 1
    }
        SubShader
    {
        CGPROGRAM


            #pragma surface surf Lambert
            sampler2D _MyTex;
            sampler2D _MyBump;
            samplerCUBE _MyCube;
            half BumpRange;

            struct Input {
                float2 uv_MyTex;
                float2 uv_MyBump;
                float3 worldRefl; INTERNAL_DATA
            };

            void surf(Input IN, inout SurfaceOutput o) {
                o.Normal = UnpackNormal(tex2D(_MyBump, IN.uv_MyBump));
                o.Albedo = texCUBE(_MyCube, WorldReflectionVector(IN, o.Normal)).rgb;
                //o.Normal *= float3(BumpRange, BumpRange, 1);
                //o.Emission = texCUBE(_MyCube, WorldReflectionVector(IN,o.Normal)).rgb;
            }

        ENDCG
    }
    FallBack "Diffuse"
}
