// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:6172,x:34037,y:32771,varname:node_6172,prsc:2|emission-4454-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4904,x:31856,y:33070,ptovrint:False,ptlb:PixelWidth,ptin:_PixelWidth,varname:node_4904,prsc:2,glob:False,v1:3;n:type:ShaderForge.SFN_ValueProperty,id:902,x:31856,y:32917,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_902,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_ValueProperty,id:40,x:31856,y:32988,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_40,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_Append,id:4869,x:32059,y:32917,varname:node_4869,prsc:2|A-902-OUT,B-40-OUT;n:type:ShaderForge.SFN_Tex2d,id:7442,x:32907,y:32736,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_7442,prsc:2,tex:aa762ee7680f35f4fb9a9210fa94ce61,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Divide,id:6291,x:32230,y:32917,varname:node_6291,prsc:2|A-4869-OUT,B-7520-OUT;n:type:ShaderForge.SFN_TexCoord,id:4776,x:32230,y:32779,varname:node_4776,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:9575,x:32499,y:32917,varname:node_9575,prsc:2|A-4776-UVOUT,B-6291-OUT;n:type:ShaderForge.SFN_Frac,id:7695,x:32750,y:32933,varname:node_7695,prsc:2|IN-9575-OUT;n:type:ShaderForge.SFN_Tex2d,id:5406,x:32907,y:32933,ptovrint:False,ptlb:Scanline,ptin:_Scanline,varname:node_5406,prsc:2,tex:140ec02b04ab7b44ebd4933a8285a430,ntxv:0,isnm:False|UVIN-7695-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3597,x:32059,y:33217,ptovrint:False,ptlb:PixelScale,ptin:_PixelScale,varname:node_3597,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:7520,x:32230,y:33070,varname:node_7520,prsc:2|A-3350-OUT,B-3597-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3775,x:31856,y:33139,ptovrint:False,ptlb:PixelHeight,ptin:_PixelHeight,varname:node_3775,prsc:2,glob:False,v1:3;n:type:ShaderForge.SFN_Append,id:3350,x:32059,y:33070,varname:node_3350,prsc:2|A-4904-OUT,B-3775-OUT;n:type:ShaderForge.SFN_Multiply,id:4454,x:33213,y:32838,varname:node_4454,prsc:2|A-7442-RGB,B-9695-OUT;n:type:ShaderForge.SFN_Add,id:3244,x:33116,y:32995,varname:node_3244,prsc:2|A-5406-RGB,B-4317-OUT;n:type:ShaderForge.SFN_Clamp01,id:9695,x:33283,y:32995,varname:node_9695,prsc:2|IN-3244-OUT;n:type:ShaderForge.SFN_Slider,id:7982,x:32611,y:33153,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_7982,prsc:2,min:0,cur:0.9444444,max:1;n:type:ShaderForge.SFN_OneMinus,id:4317,x:32941,y:33153,varname:node_4317,prsc:2|IN-7982-OUT;proporder:7442-5406-902-40-4904-3775-3597-7982;pass:END;sub:END;*/

Shader "Pixelatto/Pixel-Scanlines" {
    Properties {
        _MainTex ("MainTex", 2D) = "black" {}
        _Scanline ("Scanline", 2D) = "white" {}
        _Width ("Width", Float ) = 200
        _Height ("Height", Float ) = 200
        _PixelWidth ("PixelWidth", Float ) = 3
        _PixelHeight ("PixelHeight", Float ) = 3
        _PixelScale ("PixelScale", Float ) = 1
        _Intensity ("Intensity", Range(0, 1)) = 0.9444444
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
            uniform sampler2D _Scanline; uniform float4 _Scanline_ST;
            uniform float _PixelScale;
            uniform float _PixelHeight;
            uniform float _Intensity;
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
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float2 node_6291 = (float2(_Width,_Height)/(float2(_PixelWidth,_PixelHeight)*_PixelScale));
                float2 node_9575 = (i.uv0*node_6291);
                float2 node_7695 = frac(node_9575);
                float4 _Scanline_var = tex2D(_Scanline,TRANSFORM_TEX(node_7695, _Scanline));
                float3 emissive = (_MainTex_var.rgb*saturate((_Scanline_var.rgb+(1.0 - _Intensity))));
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
