Shader "Custom/IlluminationLambert"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _RampTex("Ramp Tex",2D) = "white"{}
    }
        SubShader
    {
        Tags { "Queue" = "Geometry" }

        CGPROGRAM
        #pragma surface surf ToonRamp

        sampler2D _RampTex;

        half4 LightingToonRamp(SurfaceOutput s, half3 lightDir, /*half3 viewDir,*/ half atten)
        {
            float diff = dot(s.Normal, lightDir);
            float h = diff * 0.5 + 0.5;
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb;

            half4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
            c.a = s.Alpha;
            return c;

            /*half3 h = normalize(lightDir + viewDir);
            half diff = max(0, dot(s.Normal, lightDir));
            float nh = max(0, dot(s.Normal, h));
            float spec = pow(nh, 48.0);

            half4 c;
            c.rgb = (s.Albedo * _LightColor0.rgb * diff + _LightColor0.rgb * spec) * atten;
            c.a = s.Alpha;
            return c;*/

            /*half NdotL = dot(s.Normal,lightDir);
            half4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten);
            c.a = s.Alpha;
            return c;*/
        }

        float4 _Color;

        struct Input
        {
            float2 uv_MainTex;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
