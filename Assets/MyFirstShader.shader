Shader "Holistic/HelloShader" {
    Properties {
        my_color ("Example Color", Color) = (1, 1, 1, 1)
        my_normal ("Example Normal", Color) = (1, 1, 1, 1)
        my_emission ("Example Emission", Color) = (1, 1, 1, 1)
    }
    
    SubShader {
        CGPROGRAM
            #pragma surface surf Lambert

            struct Input {
                float2 uvMainTex;
            };
            fixed4 my_color;
            fixed4 my_normal;
            fixed4 my_emission;

            void surf(Input IN, inout SurfaceOutput o) {
                o.Albedo = my_color.rgb;
                o.Normal = my_normal.rgb;
                o.Emission = my_emission.rgb;
            }
        ENDCG
    }
    
    FallBack "Diffuse"
}
