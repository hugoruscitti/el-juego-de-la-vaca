// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:6172,x:34037,y:32771,varname:node_6172,prsc:2|emission-4229-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4904,x:31856,y:33070,ptovrint:False,ptlb:PixelWidth,ptin:_PixelWidth,varname:node_4904,prsc:2,glob:False,v1:3;n:type:ShaderForge.SFN_ValueProperty,id:902,x:31856,y:32917,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_902,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_ValueProperty,id:40,x:31856,y:32988,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_40,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_Append,id:4869,x:32059,y:32917,varname:node_4869,prsc:2|A-902-OUT,B-40-OUT;n:type:ShaderForge.SFN_Tex2d,id:7442,x:32907,y:32736,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_7442,prsc:2,tex:aa762ee7680f35f4fb9a9210fa94ce61,ntxv:2,isnm:False|UVIN-6676-OUT;n:type:ShaderForge.SFN_Divide,id:6291,x:32230,y:32917,varname:node_6291,prsc:2|A-4869-OUT,B-7520-OUT;n:type:ShaderForge.SFN_TexCoord,id:4776,x:32230,y:32779,varname:node_4776,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:9575,x:32499,y:32917,varname:node_9575,prsc:2|A-4776-UVOUT,B-6291-OUT;n:type:ShaderForge.SFN_Frac,id:7695,x:32750,y:32933,varname:node_7695,prsc:2|IN-9575-OUT;n:type:ShaderForge.SFN_Tex2d,id:5406,x:32907,y:32933,ptovrint:False,ptlb:Pixel,ptin:_Pixel,varname:node_5406,prsc:2,tex:2a7d4e6144ea80145baa056af5f8367e,ntxv:0,isnm:False|UVIN-7695-OUT;n:type:ShaderForge.SFN_Multiply,id:2397,x:33196,y:32847,varname:node_2397,prsc:2|A-9532-OUT,B-8722-OUT;n:type:ShaderForge.SFN_Floor,id:4865,x:32499,y:32779,varname:node_4865,prsc:2|IN-9575-OUT;n:type:ShaderForge.SFN_Divide,id:6676,x:32727,y:32736,varname:node_6676,prsc:2|A-9616-OUT,B-6291-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3597,x:32059,y:33217,ptovrint:False,ptlb:PixelScale,ptin:_PixelScale,varname:node_3597,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:7520,x:32230,y:33070,varname:node_7520,prsc:2|A-3350-OUT,B-3597-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3775,x:31856,y:33139,ptovrint:False,ptlb:PixelHeight,ptin:_PixelHeight,varname:node_3775,prsc:2,glob:False,v1:3;n:type:ShaderForge.SFN_Append,id:3350,x:32059,y:33070,varname:node_3350,prsc:2|A-4904-OUT,B-3775-OUT;n:type:ShaderForge.SFN_OneMinus,id:7674,x:32907,y:33117,varname:node_7674,prsc:2|IN-5406-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:8722,x:33103,y:33117,ptovrint:False,ptlb:RGBMode,ptin:_RGBMode,varname:node_8722,prsc:2,on:False|A-5406-RGB,B-7674-OUT;n:type:ShaderForge.SFN_Vector1,id:1131,x:32230,y:32662,varname:node_1131,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:9616,x:32499,y:32646,varname:node_9616,prsc:2|A-1131-OUT,B-4865-OUT;n:type:ShaderForge.SFN_Append,id:4650,x:32907,y:32201,varname:node_4650,prsc:2|A-7475-OUT,B-1350-OUT,C-1350-OUT;n:type:ShaderForge.SFN_Vector1,id:7475,x:32731,y:32357,varname:node_7475,prsc:2,v1:1;n:type:ShaderForge.SFN_Append,id:5897,x:32907,y:32357,varname:node_5897,prsc:2|A-1350-OUT,B-7475-OUT,C-1350-OUT;n:type:ShaderForge.SFN_Append,id:7028,x:32907,y:32534,varname:node_7028,prsc:2|A-1350-OUT,B-1350-OUT,C-7475-OUT;n:type:ShaderForge.SFN_Multiply,id:4375,x:33113,y:32201,varname:node_4375,prsc:2|A-4650-OUT,B-7442-R;n:type:ShaderForge.SFN_Multiply,id:9330,x:33113,y:32357,varname:node_9330,prsc:2|A-5897-OUT,B-7442-G;n:type:ShaderForge.SFN_Multiply,id:4166,x:33113,y:32534,varname:node_4166,prsc:2|A-7028-OUT,B-7442-B;n:type:ShaderForge.SFN_Add,id:9532,x:33292,y:32534,varname:node_9532,prsc:2|A-4375-OUT,B-9330-OUT,C-4166-OUT;n:type:ShaderForge.SFN_Vector1,id:1350,x:32731,y:32534,varname:node_1350,prsc:2,v1:0.1;n:type:ShaderForge.SFN_Slider,id:7209,x:33338,y:33021,ptovrint:False,ptlb:Brightness,ptin:_Brightness,varname:node_7209,prsc:2,min:0,cur:0,max:0.2;n:type:ShaderForge.SFN_Add,id:2404,x:33379,y:32847,varname:node_2404,prsc:2|A-2397-OUT,B-7209-OUT;n:type:ShaderForge.SFN_Slider,id:1059,x:33648,y:33026,ptovrint:False,ptlb:Contrast,ptin:_Contrast,varname:node_1059,prsc:2,min:-1,cur:0.5,max:1;n:type:ShaderForge.SFN_OneMinus,id:85,x:33379,y:32718,varname:node_85,prsc:2|IN-2404-OUT;n:type:ShaderForge.SFN_Subtract,id:1730,x:33566,y:32718,varname:node_1730,prsc:2|A-2404-OUT,B-6748-OUT;n:type:ShaderForge.SFN_Vector1,id:6748,x:33566,y:32646,varname:node_6748,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:2578,x:33749,y:32718,varname:node_2578,prsc:2|A-1730-OUT,B-85-OUT,C-2404-OUT,D-1059-OUT,E-8797-OUT;n:type:ShaderForge.SFN_Subtract,id:4229,x:33684,y:32855,varname:node_4229,prsc:2|A-2404-OUT,B-2578-OUT;n:type:ShaderForge.SFN_Vector1,id:8797,x:33749,y:32646,varname:node_8797,prsc:2,v1:-1;proporder:7442-5406-902-40-4904-3775-3597-8722-7209-1059;pass:END;sub:END;*/

Shader "Pixelatto/Pixel-Subpixels" {
    Properties {
        _MainTex ("MainTex", 2D) = "black" {}
        _Pixel ("Pixel", 2D) = "white" {}
        _Width ("Width", Float ) = 200
        _Height ("Height", Float ) = 200
        _PixelWidth ("PixelWidth", Float ) = 3
        _PixelHeight ("PixelHeight", Float ) = 3
        _PixelScale ("PixelScale", Float ) = 1
        [MaterialToggle] _RGBMode ("RGBMode", Float ) = 1
        _Brightness ("Brightness", Range(0, 0.2)) = 0
        _Contrast ("Contrast", Range(-1, 1)) = 0.5
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float _PixelWidth;
            uniform float _Width;
            uniform float _Height;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Pixel; uniform float4 _Pixel_ST;
            uniform float _PixelScale;
            uniform float _PixelHeight;
            uniform fixed _RGBMode;
            uniform float _Brightness;
            uniform float _Contrast;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
                float node_7475 = 1.0;
                float node_1350 = 0.1;
                float3 node_4650 = float3(node_7475,node_1350,node_1350);
                float2 node_6291 = (float2(_Width,_Height)/(float2(_PixelWidth,_PixelHeight)*_PixelScale));
                float2 node_9575 = (i.uv0*node_6291);
                float2 node_6676 = ((0.5+floor(node_9575))/node_6291);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_6676, _MainTex));
                float3 node_5897 = float3(node_1350,node_7475,node_1350);
                float3 node_7028 = float3(node_1350,node_1350,node_7475);
                float3 node_9532 = ((node_4650*_MainTex_var.r)+(node_5897*_MainTex_var.g)+(node_7028*_MainTex_var.b));
                float2 node_7695 = frac(node_9575);
                float4 _Pixel_var = tex2D(_Pixel,TRANSFORM_TEX(node_7695, _Pixel));
                float3 _RGBMode_var = lerp( _Pixel_var.rgb, (1.0 - _Pixel_var.rgb), _RGBMode );
                float3 node_2397 = (node_9532*_RGBMode_var);
                float3 node_2404 = (node_2397+_Brightness);
                float3 emissive = (node_2404-((node_2404-0.5)*(1.0 - node_2404)*node_2404*_Contrast*(-1.0)));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
