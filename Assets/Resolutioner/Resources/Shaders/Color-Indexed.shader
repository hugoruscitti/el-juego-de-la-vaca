// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:7109,x:30592,y:36382,varname:node_7109,prsc:2|emission-5545-RGB;n:type:ShaderForge.SFN_Tex2dAsset,id:2605,x:30213,y:36278,ptovrint:False,ptlb:Palette16,ptin:_Palette16,varname:node_2605,glob:False,tex:9bb1265b762bd804598745da2c938ada,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2347,x:29430,y:36290,varname:node_2347,prsc:2,ntxv:0,isnm:False|TEX-1550-TEX;n:type:ShaderForge.SFN_Slider,id:2619,x:29624,y:36214,ptovrint:False,ptlb:LightOffset,ptin:_LightOffset,varname:node_2619,prsc:2,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Code,id:7361,x:29633,y:36311,varname:node_7361,prsc:2,code:cgBlAHQAdQByAG4AIAAoAEEAKgAwAC4AMgAxADIANgArAEIAKgAwAC4ANwAxADUAMgArAEMAKgAwAC4AMAA3ADIAMgApADsA,output:0,fname:Lightness,width:247,height:132,input:0,input:0,input:0,input_1_label:A,input_2_label:B,input_3_label:C|A-2347-R,B-2347-G,C-2347-B;n:type:ShaderForge.SFN_Tex2d,id:5545,x:30386,y:36484,varname:node_5545,prsc:2,tex:9bb1265b762bd804598745da2c938ada,ntxv:0,isnm:False|UVIN-2047-OUT,TEX-2605-TEX;n:type:ShaderForge.SFN_Append,id:2047,x:30213,y:36484,varname:node_2047,prsc:2|A-5695-OUT,B-9142-OUT;n:type:ShaderForge.SFN_Vector1,id:9142,x:30213,y:36620,varname:node_9142,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:5695,x:29994,y:36484,varname:node_5695,prsc:2|VAL-7590-OUT,EXP-9528-OUT;n:type:ShaderForge.SFN_Slider,id:9528,x:29624,y:36500,ptovrint:False,ptlb:GammaCorrection,ptin:_GammaCorrection,varname:node_9528,prsc:2,min:0.1,cur:1,max:10;n:type:ShaderForge.SFN_Add,id:6933,x:29994,y:36248,varname:node_6933,prsc:2|A-2619-OUT,B-7361-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:1550,x:29214,y:36330,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_1550,glob:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Clamp01,id:7590,x:29994,y:36366,varname:node_7590,prsc:2|IN-6933-OUT;proporder:1550-2605-2619-9528;pass:END;sub:END;*/

Shader "Pixelatto/Color-Indexed" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Palette16 ("Palette16", 2D) = "white" {}
        _LightOffset ("LightOffset", Range(-1, 1)) = 0
        _GammaCorrection ("GammaCorrection", Range(0.1, 10)) = 1
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
            uniform sampler2D _Palette16; uniform float4 _Palette16_ST;
            uniform float _LightOffset;
            float Lightness( float A , float B , float C ){
            return (A*0.2126+B*0.7152+C*0.0722);
            }
            
            uniform float _GammaCorrection;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
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
                float4 node_2347 = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float2 node_2047 = float2(pow(saturate((_LightOffset+Lightness( node_2347.r , node_2347.g , node_2347.b ))),_GammaCorrection),0.0);
                float4 node_5545 = tex2D(_Palette16,TRANSFORM_TEX(node_2047, _Palette16));
                float3 emissive = node_5545.rgb;
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
