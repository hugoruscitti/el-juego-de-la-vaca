// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:7109,x:33819,y:34182,varname:node_7109,prsc:2|emission-1015-OUT;n:type:ShaderForge.SFN_Tex2d,id:3005,x:32681,y:34162,ptovrint:False,ptlb:Dithering,ptin:_Dithering,varname:node_3005,prsc:2,tex:938c35af58bed134d8d76104607084ec,ntxv:0,isnm:False|UVIN-9155-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9798,x:31073,y:33841,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_9798,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_ValueProperty,id:9366,x:31073,y:33916,ptovrint:False,ptlb:Height,ptin:_Height,varname:_Width_copy,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_Append,id:656,x:31261,y:33841,varname:node_656,prsc:2|A-9798-OUT,B-9366-OUT;n:type:ShaderForge.SFN_TexCoord,id:9809,x:31440,y:33653,varname:node_9809,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:43,x:31440,y:33520,varname:node_43,prsc:2|A-9809-UVOUT,B-656-OUT;n:type:ShaderForge.SFN_Tex2d,id:3211,x:32040,y:33346,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_3211,prsc:2,tex:f731d83065a431c4e8a109c3e504e7da,ntxv:0,isnm:False|UVIN-7898-OUT;n:type:ShaderForge.SFN_Floor,id:3162,x:31619,y:33520,varname:node_3162,prsc:2|IN-43-OUT;n:type:ShaderForge.SFN_Divide,id:7898,x:32040,y:33534,varname:node_7898,prsc:2|A-2568-OUT,B-656-OUT;n:type:ShaderForge.SFN_Add,id:2568,x:31815,y:33520,varname:node_2568,prsc:2|A-3162-OUT,B-4693-OUT;n:type:ShaderForge.SFN_Vector1,id:6807,x:31807,y:34006,varname:node_6807,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:5686,x:31644,y:34041,varname:node_5686,prsc:2|A-7898-OUT,B-9804-OUT;n:type:ShaderForge.SFN_Frac,id:2450,x:32030,y:34162,varname:node_2450,prsc:2|IN-5686-OUT;n:type:ShaderForge.SFN_Divide,id:9804,x:31440,y:34041,varname:node_9804,prsc:2|A-656-OUT,B-8127-OUT;n:type:ShaderForge.SFN_Divide,id:6853,x:32229,y:34162,varname:node_6853,prsc:2|A-2450-OUT,B-5019-OUT;n:type:ShaderForge.SFN_Add,id:9155,x:32464,y:34162,varname:node_9155,prsc:2|A-6853-OUT,B-1144-OUT;n:type:ShaderForge.SFN_Append,id:1144,x:32464,y:34025,varname:node_1144,prsc:2|A-6981-OUT,B-1564-OUT;n:type:ShaderForge.SFN_Vector1,id:1564,x:32464,y:33977,varname:node_1564,prsc:2,v1:0;n:type:ShaderForge.SFN_Power,id:3461,x:32591,y:33366,cmnt:Correct gamma,varname:node_3461,prsc:2|VAL-1398-OUT,EXP-2609-OUT;n:type:ShaderForge.SFN_Slider,id:2609,x:32274,y:33526,ptovrint:False,ptlb:GammaCorrection,ptin:_GammaCorrection,varname:node_2609,prsc:2,min:0,cur:2,max:20;n:type:ShaderForge.SFN_Code,id:1398,x:32274,y:33366,varname:node_1398,prsc:2,code:cgBlAHQAdQByAG4AIAAoAEEAKgAwAC4AMgA5ADkAKwBCACoAMAAuADUAOAA3ACsAQwAqADAALgAxADEANAApADsA,output:0,fname:Lightness,width:247,height:132,input:0,input:0,input:0,input_1_label:A,input_2_label:B,input_3_label:C|A-3211-R,B-3211-G,C-3211-B;n:type:ShaderForge.SFN_If,id:1015,x:33330,y:34370,varname:node_1015,prsc:2|A-3005-RGB,B-4303-OUT,GT-6208-RGB,EQ-6208-RGB,LT-3472-RGB;n:type:ShaderForge.SFN_Vector1,id:4303,x:32681,y:34325,varname:node_4303,prsc:2,v1:0.5;n:type:ShaderForge.SFN_ValueProperty,id:3540,x:31982,y:33983,ptovrint:False,ptlb:DitheringLevels,ptin:_DitheringLevels,varname:node_3540,prsc:2,glob:False,v1:17;n:type:ShaderForge.SFN_Vector1,id:3390,x:31982,y:34069,varname:node_3390,prsc:2,v1:1;n:type:ShaderForge.SFN_Append,id:5019,x:32229,y:34025,varname:node_5019,prsc:2|A-3540-OUT,B-3390-OUT;n:type:ShaderForge.SFN_ValueProperty,id:8127,x:31244,y:34085,ptovrint:False,ptlb:DitherTileSize,ptin:_DitherTileSize,varname:node_8127,prsc:2,glob:False,v1:4;n:type:ShaderForge.SFN_Tex2d,id:3472,x:32622,y:34470,varname:node_3472,prsc:2,ntxv:0,isnm:False|UVIN-9772-OUT,TEX-6118-TEX;n:type:ShaderForge.SFN_Multiply,id:1984,x:32961,y:33521,varname:node_1984,prsc:2|A-3461-OUT,B-3474-OUT;n:type:ShaderForge.SFN_ValueProperty,id:650,x:32477,y:33627,ptovrint:False,ptlb:ColorCount,ptin:_ColorCount,varname:node_650,prsc:2,glob:False,v1:4;n:type:ShaderForge.SFN_Multiply,id:3474,x:32947,y:33667,varname:node_3474,prsc:2|A-6780-OUT,B-3540-OUT;n:type:ShaderForge.SFN_Multiply,id:5771,x:32961,y:33366,varname:node_5771,prsc:2|A-3461-OUT,B-6780-OUT;n:type:ShaderForge.SFN_Divide,id:3657,x:33337,y:33366,cmnt:LowColorIndex,varname:node_3657,prsc:2|A-400-OUT,B-6780-OUT;n:type:ShaderForge.SFN_Divide,id:8182,x:33337,y:33521,cmnt:FullColorIndex,varname:node_8182,prsc:2|A-5422-OUT,B-3474-OUT;n:type:ShaderForge.SFN_Subtract,id:8093,x:33537,y:33521,cmnt:DitheringIndex,varname:node_8093,prsc:2|A-8182-OUT,B-3657-OUT;n:type:ShaderForge.SFN_Append,id:9772,x:32122,y:34468,varname:node_9772,prsc:2|A-3657-OUT,B-535-OUT;n:type:ShaderForge.SFN_Vector1,id:535,x:31881,y:34554,varname:node_535,prsc:2,v1:0;n:type:ShaderForge.SFN_Divide,id:1158,x:32063,y:34627,varname:node_1158,prsc:2|A-1872-OUT,B-6780-OUT;n:type:ShaderForge.SFN_Vector1,id:1872,x:31881,y:34671,varname:node_1872,prsc:2,v1:1;n:type:ShaderForge.SFN_Floor,id:400,x:33147,y:33366,varname:node_400,prsc:2|IN-5771-OUT;n:type:ShaderForge.SFN_Floor,id:5422,x:33147,y:33521,varname:node_5422,prsc:2|IN-1984-OUT;n:type:ShaderForge.SFN_Multiply,id:6981,x:33537,y:33699,varname:node_6981,prsc:2|A-8093-OUT,B-3540-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6118,x:32410,y:34568,ptovrint:False,ptlb:Palette,ptin:_Palette,varname:node_6118,glob:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6208,x:32622,y:34676,varname:node_6208,prsc:2,ntxv:0,isnm:False|UVIN-5156-OUT,TEX-6118-TEX;n:type:ShaderForge.SFN_Add,id:5156,x:32327,y:34751,varname:node_5156,prsc:2|A-9772-OUT,B-7117-OUT;n:type:ShaderForge.SFN_Append,id:7117,x:32063,y:34792,varname:node_7117,prsc:2|A-1158-OUT,B-535-OUT;n:type:ShaderForge.SFN_Add,id:6780,x:32659,y:33627,varname:node_6780,prsc:2|A-650-OUT,B-1795-OUT;n:type:ShaderForge.SFN_Vector1,id:1795,x:32477,y:33706,varname:node_1795,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:4693,x:31619,y:33427,varname:node_4693,prsc:2,v1:0.5;proporder:3211-3005-6118-9798-9366-2609-3540-8127-650;pass:END;sub:END;*/

Shader "Pixelatto/Dither-Indexed" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Dithering ("Dithering", 2D) = "white" {}
        _Palette ("Palette", 2D) = "white" {}
        _Width ("Width", Float ) = 200
        _Height ("Height", Float ) = 200
        _GammaCorrection ("GammaCorrection", Range(0, 20)) = 2
        _DitheringLevels ("DitheringLevels", Float ) = 17
        _DitherTileSize ("DitherTileSize", Float ) = 4
        _ColorCount ("ColorCount", Float ) = 4
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
            
            uniform float _DitheringLevels;
            uniform float _DitherTileSize;
            uniform float _ColorCount;
            uniform sampler2D _Palette; uniform float4 _Palette_ST;
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
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_7898, _MainTex));
                float node_3461 = pow(Lightness( _MainTex_var.r , _MainTex_var.g , _MainTex_var.b ),_GammaCorrection); // Correct gamma
                float node_6780 = (_ColorCount+1.0);
                float node_3474 = (node_6780*_DitheringLevels);
                float node_3657 = (floor((node_3461*node_6780))/node_6780); // LowColorIndex
                float2 node_9155 = ((frac((node_7898*(node_656/_DitherTileSize)))/float2(_DitheringLevels,1.0))+float2((((floor((node_3461*node_3474))/node_3474)-node_3657)*_DitheringLevels),0.0));
                float4 _Dithering_var = tex2D(_Dithering,TRANSFORM_TEX(node_9155, _Dithering));
                float node_1015_if_leA = step(_Dithering_var.rgb,0.5);
                float node_1015_if_leB = step(0.5,_Dithering_var.rgb);
                float node_535 = 0.0;
                float2 node_9772 = float2(node_3657,node_535);
                float4 node_3472 = tex2D(_Palette,TRANSFORM_TEX(node_9772, _Palette));
                float2 node_5156 = (node_9772+float2((1.0/node_6780),node_535));
                float4 node_6208 = tex2D(_Palette,TRANSFORM_TEX(node_5156, _Palette));
                float3 emissive = lerp((node_1015_if_leA*node_3472.rgb)+(node_1015_if_leB*node_6208.rgb),node_6208.rgb,node_1015_if_leA*node_1015_if_leB);
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
