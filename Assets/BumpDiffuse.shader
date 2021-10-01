Shader "Holistic/BumpDiffuse" {
    Properties {
        _myTex ("Diffuse Texture", 2D) = "white" {}
        _myNormal ("Normal Texture", 2D) = "bump" {}
        _mySlider ("Bump Amount", Range(0,10)) = 1
        _myScale ("Texture Bump Scale", Range(0.5,2)) = 1
    }
    SubShader {
        CGPROGRAM
        
        #pragma surface surf Lambert

        sampler2D _myTex;
        sampler2D _myNormal;
        half _mySlider;
        half _myScale;

        struct Input
        {
            float2 uv_myTex;
            float2 uv_myNormal;
        };

        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = tex2D(_myTex, IN.uv_myTex * _myScale).rgb;
            o.Normal = UnpackNormal(tex2D(_myNormal, IN.uv_myNormal * _myScale));
            o.Normal *= float3(_mySlider, _mySlider, 1);
        }
        ENDCG
    }
    FallBack "Diffuse"
}