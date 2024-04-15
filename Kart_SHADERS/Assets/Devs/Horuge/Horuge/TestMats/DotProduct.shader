Shader "Custom/DotProduct"
{
    Properties
    {
        MyColor("Color",Color) = (1,1,1,1)
        MyEmission("Emission",Color) = (1,1,1,1)
        MyNormal("Normal",Color) = (1,1,1,1)
        Multiplication("Multiplication", int) = 5
        //MyColor1("Color",Color) = (1,1,1,1)
        //MyColor2("Color",Color) = (1,1,1,1)
        //MyColor3("Color",Color) = (1,1,1,1)
        //_MyTex("Textura",2D) = "white"{}
        //_RimColor("RimColor", Color) = (0,.5,.5,0)
        //MyRange("Rango",Range(0,10)) = 1
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        //fixed4 MyColor1;
        //fixed4 MyColor2;
        //fixed4 MyColor3;
        fixed4 MyEmission;
        fixed4 MyNormal;
        //fixed MyMultiplication;

        struct Input
        {
            float3 viewDir;
            //float2 uvMainTex;
            //float2 uv_MyTex;
            //float3 worldPos;
        };
        //float4 _RimColor;
        //half MyRange;
        //sampler2D _MyTex;

        void surf (Input IN, inout SurfaceOutput o)
        {
            half dotp = 1-dot(IN.viewDir, o.Normal);
            o.Albedo = float3(dotp, dotp, -dotp);
            o.Emission = MyEmission.xyz;
            o.Normal = MyNormal.xyz;
            //half rim = 1-(dot(normalize(IN.viewDir), o.Normal));
            //o.Albedo = tex2D(_MyTex, IN.uv_MyTex).rgb;
            //o.Emission = rim > 0.5 ? MyColor1 : rim > 0.3 ? MyColor2 : rim > 0.1 ? MyColor3 : 0;
            //o.Emission = frac(IN.worldPos.y * 10 * 0.5) > 0.6 ? MyColor1 * rim : frac(IN.worldPos.y * 10 * 0.5) > 0.4 ? MyColor2 * rim : frac(IN.worldPos.y * 10 * 0.5) > 0.2 ? MyColor3 * rim : 0;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
