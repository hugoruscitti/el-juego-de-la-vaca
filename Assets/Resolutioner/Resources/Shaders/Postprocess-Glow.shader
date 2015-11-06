// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:4917,x:33157,y:32072,varname:node_4917,prsc:2|emission-7530-OUT;n:type:ShaderForge.SFN_Tex2d,id:5199,x:31540,y:32527,varname:node_5199,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-904-OUT,TEX-7625-TEX;n:type:ShaderForge.SFN_TexCoord,id:3168,x:31180,y:32085,varname:node_3168,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:7932,x:31374,y:32395,varname:node_7932,prsc:2|A-3168-UVOUT,B-2760-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5954,x:30492,y:32385,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_5954,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_ValueProperty,id:4745,x:30492,y:32471,ptovrint:False,ptlb:Height,ptin:_Height,varname:_Width_copy,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_Append,id:9651,x:30650,y:32385,varname:node_9651,prsc:2|A-5954-OUT,B-4745-OUT;n:type:ShaderForge.SFN_Divide,id:2621,x:30997,y:32375,varname:node_2621,prsc:2|A-6799-OUT,B-9651-OUT;n:type:ShaderForge.SFN_Multiply,id:6217,x:31179,y:32243,varname:node_6217,prsc:2|A-2621-OUT,B-1851-OUT;n:type:ShaderForge.SFN_Multiply,id:2760,x:31179,y:32375,varname:node_2760,prsc:2|A-2621-OUT,B-8708-OUT;n:type:ShaderForge.SFN_Vector2,id:8708,x:30997,y:32261,varname:node_8708,prsc:2,v1:0,v2:1;n:type:ShaderForge.SFN_Vector2,id:1851,x:30997,y:32164,varname:node_1851,prsc:2,v1:1,v2:0;n:type:ShaderForge.SFN_Add,id:8066,x:31376,y:32121,varname:node_8066,prsc:2|A-3168-UVOUT,B-6217-OUT;n:type:ShaderForge.SFN_Subtract,id:4319,x:31376,y:32264,varname:node_4319,prsc:2|A-3168-UVOUT,B-6217-OUT;n:type:ShaderForge.SFN_Subtract,id:904,x:31374,y:32527,varname:node_904,prsc:2|A-3168-UVOUT,B-2760-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:7625,x:31180,y:31925,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_7625,glob:False,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:3189,x:31540,y:32395,varname:node_3189,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-7932-OUT,TEX-7625-TEX;n:type:ShaderForge.SFN_Tex2d,id:9393,x:31540,y:32264,varname:node_9393,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-4319-OUT,TEX-7625-TEX;n:type:ShaderForge.SFN_Tex2d,id:2385,x:31540,y:32121,varname:node_2385,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-8066-OUT,TEX-7625-TEX;n:type:ShaderForge.SFN_Tex2d,id:6275,x:31540,y:32744,varname:node_6275,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-3168-UVOUT,TEX-7625-TEX;n:type:ShaderForge.SFN_Add,id:9895,x:31727,y:32121,cmnt:Orto1,varname:node_9895,prsc:2|A-2385-RGB,B-9393-RGB,C-3189-RGB,D-5199-RGB;n:type:ShaderForge.SFN_Vector1,id:3209,x:31727,y:32251,varname:node_3209,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:2873,x:31373,y:31739,varname:node_2873,prsc:2|A-3168-UVOUT,B-7600-OUT;n:type:ShaderForge.SFN_Subtract,id:9945,x:31373,y:31894,varname:node_9945,prsc:2|A-3168-UVOUT,B-7600-OUT;n:type:ShaderForge.SFN_Subtract,id:398,x:31373,y:31589,varname:node_398,prsc:2|A-3168-UVOUT,B-2357-OUT;n:type:ShaderForge.SFN_Add,id:4293,x:31373,y:31433,varname:node_4293,prsc:2|A-3168-UVOUT,B-2357-OUT;n:type:ShaderForge.SFN_Tex2d,id:6088,x:31540,y:31894,varname:node_6088,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-9945-OUT,TEX-7625-TEX;n:type:ShaderForge.SFN_Tex2d,id:5204,x:31540,y:31739,varname:node_5204,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-2873-OUT,TEX-7625-TEX;n:type:ShaderForge.SFN_Tex2d,id:4992,x:31540,y:31589,varname:node_4992,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-398-OUT,TEX-7625-TEX;n:type:ShaderForge.SFN_Tex2d,id:1290,x:31540,y:31433,varname:node_1290,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-4293-OUT,TEX-7625-TEX;n:type:ShaderForge.SFN_Add,id:4515,x:31727,y:31894,cmnt:Diag1,varname:node_4515,prsc:2|A-1290-RGB,B-4992-RGB,C-5204-RGB,D-6088-RGB;n:type:ShaderForge.SFN_Vector1,id:1391,x:31727,y:31823,varname:node_1391,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:4533,x:32053,y:31949,varname:node_4533,prsc:2|A-678-OUT,B-9580-OUT;n:type:ShaderForge.SFN_Multiply,id:678,x:31893,y:31894,varname:node_678,prsc:2|A-1391-OUT,B-4515-OUT;n:type:ShaderForge.SFN_Multiply,id:9580,x:31893,y:32121,varname:node_9580,prsc:2|A-9895-OUT,B-3209-OUT;n:type:ShaderForge.SFN_Add,id:7600,x:31175,y:31739,varname:node_7600,prsc:2|A-6217-OUT,B-2760-OUT;n:type:ShaderForge.SFN_Subtract,id:2357,x:31175,y:31589,varname:node_2357,prsc:2|A-6217-OUT,B-2760-OUT;n:type:ShaderForge.SFN_Multiply,id:9622,x:31749,y:32800,varname:node_9622,prsc:2|A-6275-RGB,B-3094-OUT;n:type:ShaderForge.SFN_Vector1,id:3094,x:31540,y:32886,varname:node_3094,prsc:2,v1:4;n:type:ShaderForge.SFN_Divide,id:2579,x:32289,y:32028,varname:node_2579,prsc:2|A-9302-OUT,B-9406-OUT;n:type:ShaderForge.SFN_Vector1,id:9406,x:32102,y:32121,varname:node_9406,prsc:2,v1:16;n:type:ShaderForge.SFN_Slider,id:6885,x:31973,y:32488,ptovrint:False,ptlb:Amount,ptin:_Amount,varname:node_6885,prsc:2,min:0,cur:1,max:2;n:type:ShaderForge.SFN_OneMinus,id:2235,x:32053,y:31806,varname:node_2235,prsc:2|IN-4533-OUT;n:type:ShaderForge.SFN_Add,id:8176,x:32507,y:32028,varname:node_8176,prsc:2|A-2579-OUT,B-3786-OUT;n:type:ShaderForge.SFN_Divide,id:3786,x:31974,y:32800,varname:node_3786,prsc:2|A-9622-OUT,B-9406-OUT;n:type:ShaderForge.SFN_Multiply,id:5854,x:32246,y:31843,varname:node_5854,prsc:2|A-2235-OUT,B-4533-OUT;n:type:ShaderForge.SFN_OneMinus,id:9302,x:32427,y:31843,varname:node_9302,prsc:2|IN-5854-OUT;n:type:ShaderForge.SFN_Multiply,id:2244,x:32507,y:32172,varname:node_2244,prsc:2|A-8176-OUT,B-6885-OUT;n:type:ShaderForge.SFN_Multiply,id:3667,x:32688,y:32750,varname:node_3667,prsc:2|A-6275-RGB,B-8758-OUT;n:type:ShaderForge.SFN_OneMinus,id:8758,x:32407,y:32560,varname:node_8758,prsc:2|IN-6885-OUT;n:type:ShaderForge.SFN_Vector1,id:6799,x:30650,y:32277,cmnt:Range,varname:node_6799,prsc:2,v1:1.1;n:type:ShaderForge.SFN_Add,id:4987,x:32694,y:32172,varname:node_4987,prsc:2|A-2244-OUT,B-3667-OUT;n:type:ShaderForge.SFN_Power,id:7530,x:32907,y:32172,varname:node_7530,prsc:2|VAL-4987-OUT,EXP-6845-OUT;n:type:ShaderForge.SFN_Slider,id:6845,x:32537,y:32336,ptovrint:False,ptlb:Boost,ptin:_Boost,varname:node_6845,prsc:2,min:1,cur:1,max:20;proporder:5954-4745-7625-6885-6845;pass:END;sub:END;*/

Shader "Pixelatto/Postprocess-Glow" {
    Properties {
        _Width ("Width", Float ) = 200
        _Height ("Height", Float ) = 200
        _MainTex ("MainTex", 2D) = "white" {}
        _Amount ("Amount", Range(0, 2)) = 1
        _Boost ("Boost", Range(1, 20)) = 1
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
            uniform float _Width;
            uniform float _Height;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Amount;
            uniform float _Boost;
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
                float node_1391 = 1.0;
                float2 node_2621 = (1.1/float2(_Width,_Height));
                float2 node_6217 = (node_2621*float2(1,0));
                float2 node_2760 = (node_2621*float2(0,1));
                float2 node_2357 = (node_6217-node_2760);
                float2 node_4293 = (i.uv0+node_2357);
                float4 node_1290 = tex2D(_MainTex,TRANSFORM_TEX(node_4293, _MainTex));
                float2 node_398 = (i.uv0-node_2357);
                float4 node_4992 = tex2D(_MainTex,TRANSFORM_TEX(node_398, _MainTex));
                float2 node_7600 = (node_6217+node_2760);
                float2 node_2873 = (i.uv0+node_7600);
                float4 node_5204 = tex2D(_MainTex,TRANSFORM_TEX(node_2873, _MainTex));
                float2 node_9945 = (i.uv0-node_7600);
                float4 node_6088 = tex2D(_MainTex,TRANSFORM_TEX(node_9945, _MainTex));
                float3 node_4515 = (node_1290.rgb+node_4992.rgb+node_5204.rgb+node_6088.rgb); // Diag1
                float2 node_8066 = (i.uv0+node_6217);
                float4 node_2385 = tex2D(_MainTex,TRANSFORM_TEX(node_8066, _MainTex));
                float2 node_4319 = (i.uv0-node_6217);
                float4 node_9393 = tex2D(_MainTex,TRANSFORM_TEX(node_4319, _MainTex));
                float2 node_7932 = (i.uv0+node_2760);
                float4 node_3189 = tex2D(_MainTex,TRANSFORM_TEX(node_7932, _MainTex));
                float2 node_904 = (i.uv0-node_2760);
                float4 node_5199 = tex2D(_MainTex,TRANSFORM_TEX(node_904, _MainTex));
                float3 node_9895 = (node_2385.rgb+node_9393.rgb+node_3189.rgb+node_5199.rgb); // Orto1
                float node_3209 = 2.0;
                float3 node_4533 = ((node_1391*node_4515)+(node_9895*node_3209));
                float node_9406 = 16.0;
                float4 node_6275 = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 node_2244 = ((((1.0 - ((1.0 - node_4533)*node_4533))/node_9406)+((node_6275.rgb*4.0)/node_9406))*_Amount);
                float3 node_3667 = (node_6275.rgb*(1.0 - _Amount));
                float3 node_7530 = pow((node_2244+node_3667),_Boost);
                float3 emissive = node_7530;
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
