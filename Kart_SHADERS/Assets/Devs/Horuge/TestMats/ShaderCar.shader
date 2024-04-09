Shader "Custom/ShaderWall"
{
    Properties
    {
        MyColor("Color",Color) = (1,1,1,1)
        MyEmission("Emission",Color) = (1,1,1,1)
        MyNormal("Normal",Color) = (1,1,1,1)
        Multiplication("Multiplication", int) = 5

    }
        SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input {
            float2 uvMainTex;
        };

        fixed4 MyColor;
        fixed4 MyEmission;
        fixed4 MyNormal;
        fixed MyMultiplication;

        void surf(Input IN, inout SurfaceOutput o) {
            o.Albedo = MyColor.rgb * MyMultiplication;
            o.Emission = MyEmission.xyz;
            o.Albedo.b = 1;
            o.Normal = MyNormal.xyz;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
