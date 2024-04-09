Shader "Custom/CarLightEmission"
{
    Properties
    {
        _Color1("Color 1", Color) = (1,1,1,1)
        _Color2("Color 2", Color) = (1,1,1,1)
        _Color3("Color 3", Color) = (1,1,1,1)
        _RimColor("Rim Color", Color) = (1,1,1,1)
        _RimPower("Rim Power", Range(0.5, 8)) = 3.0
    }
        SubShader
    {
        Tags { "RenderType" = "Opaque" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float3 worldNormal;
        };

        half _RimPower;

        fixed4 _Color1;
        fixed4 _Color2;
        fixed4 _Color3;
        fixed4 _RimColor;

        void surf(Input IN, inout SurfaceOutput o)
        {
            half rim = 1.0 - saturate(dot(normalize(IN.worldNormal), _WorldSpaceCameraPos));
            rim = pow(rim, _RimPower);

            fixed3 color1 = _Color1.rgb;
            fixed3 color2 = _Color2.rgb;
            fixed3 color3 = _Color3.rgb;

            half blend = dot(normalize(IN.worldNormal), float3(1, 1, 1)) / 3.0;

            fixed3 finalColor = lerp(lerp(color1, color2, blend), color3, blend);

            o.Albedo = finalColor;
            o.Emission = _RimColor.rgb * rim;
        }
        ENDCG
    }
        FallBack "Diffuse"
}
