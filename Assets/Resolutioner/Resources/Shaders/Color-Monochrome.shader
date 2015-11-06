// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:7109,x:30631,y:35883,varname:node_7109,prsc:2|emission-8275-OUT;n:type:ShaderForge.SFN_Slider,id:2619,x:29625,y:35969,ptovrint:False,ptlb:LightOffset,ptin:_LightOffset,varname:node_2619,prsc:2,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:8702,x:29978,y:35835,varname:node_8702,prsc:2|A-8093-OUT,B-2619-OUT;n:type:ShaderForge.SFN_Code,id:8093,x:29607,y:35801,varname:node_8093,prsc:2,code:cgBlAHQAdQByAG4AIAAoAEEAKgAwAC4AMgA5ADkAKwBCACoAMAAuADcAMQA1ADIAKwBDACoAMAAuADAANwAyADIAKQA7AA==,output:0,fname:Lightness,width:292,height:112,input:0,input:0,input:0,input_1_label:A,input_2_label:B,input_3_label:C|A-7721-R,B-7721-G,C-7721-B;n:type:ShaderForge.SFN_Tex2d,id:7721,x:29437,y:35782,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_7721,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Round,id:2161,x:30139,y:35835,varname:node_2161,prsc:2|IN-8702-OUT;n:type:ShaderForge.SFN_Color,id:772,x:30086,y:36045,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:node_772,prsc:2,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_If,id:8275,x:30372,y:35983,varname:node_8275,prsc:2|A-2161-OUT,B-1672-OUT,GT-772-RGB,EQ-772-RGB,LT-3686-RGB;n:type:ShaderForge.SFN_Color,id:3686,x:30086,y:36230,ptovrint:False,ptlb:DarkColor,ptin:_DarkColor,varname:_LightColor_copy,prsc:2,glob:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Vector1,id:1672,x:30304,y:36156,varname:node_1672,prsc:2,v1:0.5;proporder:7721-772-3686-2619;pass:END;sub:END;*/

Shader "Pixelatto/Color-Monochrome" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _LightColor ("LightColor", Color) = (1,1,1,1)
        _DarkColor ("DarkColor", Color) = (0,0,0,1)
        _LightOffset ("LightOffset", Range(-1, 1)) = 0
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
            uniform float4 _LightColor;
            uniform float4 _DarkColor;
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
                float node_8702 = (Lightness( _MainTex_var.r , _MainTex_var.g , _MainTex_var.b )+_LightOffset);
                float node_2161 = round(node_8702);
                float node_8275_if_leA = step(node_2161,0.5);
                float node_8275_if_leB = step(0.5,node_2161);
                float3 emissive = lerp((node_8275_if_leA*_DarkColor.rgb)+(node_8275_if_leB*_LightColor.rgb),_LightColor.rgb,node_8275_if_leA*node_8275_if_leB);
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
