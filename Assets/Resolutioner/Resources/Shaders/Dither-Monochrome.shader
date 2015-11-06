// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:7109,x:33277,y:34069,varname:node_7109,prsc:2|emission-1015-OUT;n:type:ShaderForge.SFN_Tex2d,id:3005,x:32760,y:34167,ptovrint:False,ptlb:Dithering,ptin:_Dithering,varname:node_3005,prsc:2,tex:938c35af58bed134d8d76104607084ec,ntxv:0,isnm:False|UVIN-9155-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9798,x:31440,y:33844,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_9798,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_ValueProperty,id:9366,x:31440,y:33919,ptovrint:False,ptlb:Height,ptin:_Height,varname:_Width_copy,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_Append,id:656,x:31628,y:33844,varname:node_656,prsc:2|A-9798-OUT,B-9366-OUT;n:type:ShaderForge.SFN_TexCoord,id:9809,x:31440,y:33653,varname:node_9809,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:43,x:31628,y:33681,varname:node_43,prsc:2|A-9809-UVOUT,B-656-OUT;n:type:ShaderForge.SFN_Tex2d,id:3211,x:32027,y:33496,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_3211,prsc:2,tex:3a5a96df060a5cf4a9cc0c59e13486b7,ntxv:0,isnm:False|UVIN-7898-OUT;n:type:ShaderForge.SFN_Floor,id:3162,x:31807,y:33681,varname:node_3162,prsc:2|IN-43-OUT;n:type:ShaderForge.SFN_Divide,id:7898,x:32027,y:33681,varname:node_7898,prsc:2|A-2568-OUT,B-656-OUT;n:type:ShaderForge.SFN_Add,id:2568,x:31807,y:33538,varname:node_2568,prsc:2|A-3162-OUT,B-4766-OUT;n:type:ShaderForge.SFN_Multiply,id:5686,x:31842,y:34162,varname:node_5686,prsc:2|A-7898-OUT,B-9804-OUT;n:type:ShaderForge.SFN_Frac,id:2450,x:32030,y:34162,varname:node_2450,prsc:2|IN-5686-OUT;n:type:ShaderForge.SFN_Divide,id:9804,x:31440,y:34041,varname:node_9804,prsc:2|A-656-OUT,B-8127-OUT;n:type:ShaderForge.SFN_Divide,id:6853,x:32229,y:34162,varname:node_6853,prsc:2|A-2450-OUT,B-5019-OUT;n:type:ShaderForge.SFN_Add,id:9155,x:32454,y:34162,varname:node_9155,prsc:2|A-6853-OUT,B-1144-OUT;n:type:ShaderForge.SFN_Append,id:1144,x:32625,y:34002,varname:node_1144,prsc:2|A-1221-OUT,B-1564-OUT;n:type:ShaderForge.SFN_Vector1,id:1564,x:32442,y:34025,varname:node_1564,prsc:2,v1:0;n:type:ShaderForge.SFN_Posterize,id:1221,x:32625,y:33836,varname:node_1221,prsc:2|IN-3461-OUT,STPS-3520-OUT;n:type:ShaderForge.SFN_Power,id:3461,x:32873,y:33681,varname:node_3461,prsc:2|VAL-1398-OUT,EXP-2609-OUT;n:type:ShaderForge.SFN_Slider,id:2609,x:32716,y:33578,ptovrint:False,ptlb:GammaCorrection,ptin:_GammaCorrection,varname:node_2609,prsc:2,min:0,cur:1.8,max:20;n:type:ShaderForge.SFN_Code,id:1398,x:32223,y:33516,varname:node_1398,prsc:2,code:cgBlAHQAdQByAG4AIAAoAEEAKgAwAC4AMgA5ADkAKwBCACoAMAAuADUAOAA3ACsAQwAqADAALgAxADEANAApADsA,output:0,fname:Lightness,width:247,height:132,input:0,input:0,input:0,input_1_label:A,input_2_label:B,input_3_label:C|A-3211-R,B-3211-G,C-3211-B;n:type:ShaderForge.SFN_Color,id:3650,x:32951,y:34378,ptovrint:False,ptlb:DarkColor,ptin:_DarkColor,varname:node_3650,prsc:2,glob:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Color,id:3348,x:32960,y:33919,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:node_3348,prsc:2,glob:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_If,id:1015,x:32960,y:34167,varname:node_1015,prsc:2|A-3005-RGB,B-4303-OUT,GT-3348-RGB,EQ-3650-RGB,LT-3650-RGB;n:type:ShaderForge.SFN_Vector1,id:4303,x:32760,y:34355,varname:node_4303,prsc:2,v1:0.5;n:type:ShaderForge.SFN_ValueProperty,id:3540,x:32070,y:33914,ptovrint:False,ptlb:DitheringLevels,ptin:_DitheringLevels,varname:node_3540,prsc:2,glob:False,v1:17;n:type:ShaderForge.SFN_Add,id:3520,x:32270,y:33870,varname:node_3520,prsc:2|A-3390-OUT,B-3540-OUT;n:type:ShaderForge.SFN_Vector1,id:3390,x:32270,y:33799,varname:node_3390,prsc:2,v1:1;n:type:ShaderForge.SFN_Append,id:5019,x:32229,y:34025,varname:node_5019,prsc:2|A-3540-OUT,B-3390-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8127,x:31244,y:34085,ptovrint:False,ptlb:DitherTileSize,ptin:_DitherTileSize,varname:node_8127,prsc:2,glob:False,v1:4;n:type:ShaderForge.SFN_Vector1,id:4766,x:31807,y:33456,varname:node_4766,prsc:2,v1:0.5;proporder:3211-3005-9798-9366-2609-3348-3650-3540-8127;pass:END;sub:END;*/

Shader "Pixelatto/Dither-Monochrome" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Dithering ("Dithering", 2D) = "white" {}
        _Width ("Width", Float ) = 200
        _Height ("Height", Float ) = 200
        _GammaCorrection ("GammaCorrection", Range(0, 20)) = 1.8
        _LightColor ("LightColor", Color) = (1,1,1,1)
        _DarkColor ("DarkColor", Color) = (0,0,0,1)
        _DitheringLevels ("DitheringLevels", Float ) = 17
        _DitherTileSize ("DitherTileSize", Float ) = 4
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
            uniform sampler2D _Dithering; uniform float4 _Dithering_ST;
            uniform float _Width;
            uniform float _Height;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _GammaCorrection;
            float Lightness( float A , float B , float C ){
            return (A*0.299+B*0.587+C*0.114);
            }
            
            uniform float4 _DarkColor;
            uniform float4 _LightColor;
            uniform float _DitheringLevels;
            uniform float _DitherTileSize;
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
                float2 node_656 = float2(_Width,_Height);
                float2 node_7898 = ((floor((i.uv0*node_656))+0.5)/node_656);
                float node_3390 = 1.0;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_7898, _MainTex));
                float node_3520 = (node_3390+_DitheringLevels);
                float2 node_9155 = ((frac((node_7898*(node_656/_DitherTileSize)))/float2(_DitheringLevels,node_3390))+float2(floor(pow(Lightness( _MainTex_var.r , _MainTex_var.g , _MainTex_var.b ),_GammaCorrection) * node_3520) / (node_3520 - 1),0.0));
                float4 _Dithering_var = tex2D(_Dithering,TRANSFORM_TEX(node_9155, _Dithering));
                float node_1015_if_leA = step(_Dithering_var.rgb,0.5);
                float node_1015_if_leB = step(0.5,_Dithering_var.rgb);
                float3 emissive = lerp((node_1015_if_leA*_DarkColor.rgb)+(node_1015_if_leB*_LightColor.rgb),_DarkColor.rgb,node_1015_if_leA*node_1015_if_leB);
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
