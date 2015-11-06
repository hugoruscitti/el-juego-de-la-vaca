// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:7109,x:30631,y:35883,varname:node_7109,prsc:2|emission-2968-OUT;n:type:ShaderForge.SFN_Slider,id:2619,x:29437,y:35994,ptovrint:False,ptlb:LightOffset,ptin:_LightOffset,varname:node_2619,prsc:2,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:8702,x:29813,y:35976,varname:node_8702,prsc:2|A-8093-OUT,B-2619-OUT;n:type:ShaderForge.SFN_Code,id:8093,x:29607,y:35801,varname:node_8093,prsc:2,code:cgBlAHQAdQByAG4AIAAoAEEAKgAwAC4AMgA5ADkAKwBCACoAMAAuADcAMQA1ADIAKwBDACoAMAAuADAANwAyADIAKQA7AA==,output:0,fname:Lightness,width:292,height:112,input:0,input:0,input:0,input_1_label:A,input_2_label:B,input_3_label:C|A-7721-R,B-7721-G,C-7721-B;n:type:ShaderForge.SFN_Tex2d,id:7721,x:29437,y:35782,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_7721,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:132,x:29813,y:36151,ptovrint:False,ptlb:GrayLevels,ptin:_GrayLevels,varname:node_132,prsc:2,glob:False,v1:4;n:type:ShaderForge.SFN_Multiply,id:2506,x:29995,y:35976,varname:node_2506,prsc:2|A-8702-OUT,B-7200-OUT;n:type:ShaderForge.SFN_Round,id:2161,x:30158,y:35976,varname:node_2161,prsc:2|IN-2506-OUT;n:type:ShaderForge.SFN_Divide,id:9997,x:30319,y:35976,varname:node_9997,prsc:2|A-2161-OUT,B-7200-OUT;n:type:ShaderForge.SFN_Vector1,id:2823,x:29813,y:36225,varname:node_2823,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:7200,x:29995,y:36138,varname:node_7200,prsc:2|A-132-OUT,B-2823-OUT;n:type:ShaderForge.SFN_Multiply,id:2968,x:30319,y:35835,varname:node_2968,prsc:2|A-772-RGB,B-9997-OUT;n:type:ShaderForge.SFN_Color,id:772,x:30319,y:35659,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:node_772,prsc:2,glob:False,c1:1,c2:1,c3:1,c4:1;proporder:7721-132-2619-772;pass:END;sub:END;*/

Shader "Pixelatto/Color-Grayscale" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _GrayLevels ("GrayLevels", Float ) = 4
        _LightOffset ("LightOffset", Range(-1, 1)) = 0
        _LightColor ("LightColor", Color) = (1,1,1,1)
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
            uniform float _LightOffset;
            float Lightness( float A , float B , float C ){
            return (A*0.299+B*0.7152+C*0.0722);
            }
            
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _GrayLevels;
            uniform float4 _LightColor;
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
                float node_7200 = (_GrayLevels-1.0);
                float3 emissive = (_LightColor.rgb*(round(((Lightness( _MainTex_var.r , _MainTex_var.g , _MainTex_var.b )+_LightOffset)*node_7200))/node_7200));
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
