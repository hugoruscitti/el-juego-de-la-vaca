// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:2006,x:32905,y:32708,varname:node_2006,prsc:2|emission-7774-OUT;n:type:ShaderForge.SFN_Tex2d,id:8032,x:31659,y:32706,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8032,prsc:2,tex:f731d83065a431c4e8a109c3e504e7da,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Divide,id:6488,x:32345,y:32864,varname:node_6488,prsc:2|A-4372-OUT,B-4845-OUT;n:type:ShaderForge.SFN_Vector1,id:4785,x:32021,y:32990,varname:node_4785,prsc:2,v1:3.999;n:type:ShaderForge.SFN_Multiply,id:2080,x:32021,y:32723,varname:node_2080,prsc:2|A-7398-OUT,B-3823-OUT;n:type:ShaderForge.SFN_Append,id:7398,x:31848,y:32723,varname:node_7398,prsc:2|A-8032-R,B-8032-G;n:type:ShaderForge.SFN_Vector1,id:3823,x:32021,y:32652,varname:node_3823,prsc:2,v1:7.999;n:type:ShaderForge.SFN_Floor,id:202,x:32185,y:32723,varname:node_202,prsc:2|IN-2080-OUT;n:type:ShaderForge.SFN_Divide,id:2149,x:32345,y:32723,varname:node_2149,prsc:2|A-202-OUT,B-1756-OUT;n:type:ShaderForge.SFN_Vector1,id:1756,x:32185,y:32652,varname:node_1756,prsc:2,v1:8;n:type:ShaderForge.SFN_Multiply,id:9274,x:32021,y:32864,varname:node_9274,prsc:2|A-8032-B,B-4785-OUT;n:type:ShaderForge.SFN_Floor,id:4372,x:32185,y:32864,varname:node_4372,prsc:2|IN-9274-OUT;n:type:ShaderForge.SFN_Vector1,id:4845,x:32185,y:32990,varname:node_4845,prsc:2,v1:4;n:type:ShaderForge.SFN_Append,id:7774,x:32537,y:32723,varname:node_7774,prsc:2|A-2149-OUT,B-6488-OUT;proporder:8032;pass:END;sub:END;*/

Shader "Pixelatto/Color-8Bits" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
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
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 emissive = float3((floor((float2(_MainTex_var.r,_MainTex_var.g)*7.999))/8.0),(floor((_MainTex_var.b*3.999))/4.0));
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
