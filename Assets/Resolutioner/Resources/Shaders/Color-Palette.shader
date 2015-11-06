// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:8930,x:32676,y:32908,varname:node_8930,prsc:2|emission-9333-RGB;n:type:ShaderForge.SFN_Tex2d,id:9333,x:32429,y:33009,ptovrint:False,ptlb:Palette,ptin:_Palette,varname:node_9333,prsc:2,tex:99a26bf5b93d3a043a920627ca664e51,ntxv:3,isnm:False|UVIN-5983-OUT;n:type:ShaderForge.SFN_Append,id:8640,x:31539,y:32883,varname:node_8640,prsc:2|A-9902-OUT,B-2494-OUT;n:type:ShaderForge.SFN_Vector1,id:2494,x:31539,y:33029,varname:node_2494,prsc:2,v1:3;n:type:ShaderForge.SFN_TexCoord,id:6760,x:31539,y:32669,varname:node_6760,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:371,x:31967,y:32461,varname:node_371,prsc:2|A-4947-OUT,B-6760-UVOUT;n:type:ShaderForge.SFN_Append,id:6847,x:31758,y:32669,varname:node_6847,prsc:2|A-9902-OUT,B-9902-OUT;n:type:ShaderForge.SFN_Multiply,id:4947,x:31758,y:32461,varname:node_4947,prsc:2|A-6847-OUT,B-8640-OUT;n:type:ShaderForge.SFN_Divide,id:7032,x:32378,y:32461,varname:node_7032,prsc:2|A-6630-OUT,B-4947-OUT;n:type:ShaderForge.SFN_Divide,id:6442,x:32063,y:32680,varname:node_6442,prsc:2|A-7032-OUT,B-8640-OUT;n:type:ShaderForge.SFN_Append,id:9614,x:31539,y:33093,varname:node_9614,prsc:2|A-7631-OUT,B-3083-OUT;n:type:ShaderForge.SFN_Vector1,id:3083,x:31539,y:33240,varname:node_3083,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:7161,x:31819,y:33009,varname:node_7161,prsc:2|A-6442-OUT,B-9614-OUT;n:type:ShaderForge.SFN_Multiply,id:115,x:31173,y:33419,varname:node_115,prsc:2|A-4802-OUT,B-9902-OUT;n:type:ShaderForge.SFN_Divide,id:2180,x:31489,y:33419,varname:node_2180,prsc:2|A-7228-OUT,B-9902-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:4802,x:31005,y:33419,varname:node_4802,prsc:2,min:0,max:0.9999999|IN-9651-B;n:type:ShaderForge.SFN_Divide,id:8004,x:32060,y:33009,varname:node_8004,prsc:2|A-7161-OUT,B-6847-OUT;n:type:ShaderForge.SFN_Add,id:5983,x:32243,y:33009,varname:node_5983,prsc:2|A-8004-OUT,B-9154-OUT;n:type:ShaderForge.SFN_Divide,id:4406,x:32060,y:33242,varname:node_4406,prsc:2|A-5392-OUT,B-8640-OUT;n:type:ShaderForge.SFN_Vector1,id:5392,x:32060,y:33172,varname:node_5392,prsc:2,v1:1;n:type:ShaderForge.SFN_Divide,id:5926,x:32243,y:33242,varname:node_5926,prsc:2|A-4406-OUT,B-6847-OUT;n:type:ShaderForge.SFN_Multiply,id:9154,x:32429,y:33242,varname:node_9154,prsc:2|A-5926-OUT,B-3393-OUT;n:type:ShaderForge.SFN_Append,id:1127,x:32243,y:33429,varname:node_1127,prsc:2|A-9651-R,B-9651-G;n:type:ShaderForge.SFN_Multiply,id:3393,x:32429,y:33429,varname:node_3393,prsc:2|A-1127-OUT,B-7333-OUT;n:type:ShaderForge.SFN_Tex2d,id:9651,x:30817,y:33260,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_9651,prsc:2,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Round,id:7228,x:31334,y:33419,varname:node_7228,prsc:2|IN-115-OUT;n:type:ShaderForge.SFN_Floor,id:6630,x:32174,y:32461,varname:node_6630,prsc:2|IN-371-OUT;n:type:ShaderForge.SFN_Multiply,id:7631,x:31664,y:33419,varname:node_7631,prsc:2|A-2180-OUT,B-9902-OUT;n:type:ShaderForge.SFN_Subtract,id:7333,x:31173,y:33276,varname:node_7333,prsc:2|A-9902-OUT,B-8207-OUT;n:type:ShaderForge.SFN_Vector1,id:8207,x:31173,y:33208,varname:node_8207,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:2522,x:30804,y:32970,varname:node_2522,prsc:2,v1:32;n:type:ShaderForge.SFN_Relay,id:9902,x:30990,y:32970,varname:node_9902,prsc:2|IN-2522-OUT;proporder:9651-9333;pass:END;sub:END;*/

Shader "Pixelatto/Color-Palette" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Palette ("Palette", 2D) = "bump" {}
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
            uniform sampler2D _Palette; uniform float4 _Palette_ST;
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
                float node_9902 = 32.0;
                float2 node_6847 = float2(node_9902,node_9902);
                float2 node_8640 = float2(node_9902,3.0);
                float2 node_4947 = (node_6847*node_8640);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float2 node_5983 = (((((floor((node_4947*i.uv0))/node_4947)/node_8640)+float2(((round((clamp(_MainTex_var.b,0,0.9999999)*node_9902))/node_9902)*node_9902),0.0))/node_6847)+(((1.0/node_8640)/node_6847)*(float2(_MainTex_var.r,_MainTex_var.g)*(node_9902-1.0))));
                float4 _Palette_var = tex2D(_Palette,TRANSFORM_TEX(node_5983, _Palette));
                float3 emissive = _Palette_var.rgb;
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
