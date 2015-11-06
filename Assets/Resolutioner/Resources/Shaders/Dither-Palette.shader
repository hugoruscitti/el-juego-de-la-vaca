// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:0,bdst:1,culm:0,dpts:2,wrdp:True,dith:0,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:7655,x:33498,y:33278,varname:node_7655,prsc:2|emission-5834-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:2155,x:31869,y:33955,ptovrint:False,ptlb:Palette,ptin:_Palette,varname:node_2155,glob:False,tex:415255727e8f59044933055e965a7139,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7406,x:28848,y:33505,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_7406,prsc:2,tex:3d63e4cd5acf1db4fbef890e6285ff8d,ntxv:0,isnm:False|UVIN-2380-OUT;n:type:ShaderForge.SFN_TexCoord,id:2473,x:30238,y:33836,varname:node_2473,prsc:2,uv:0;n:type:ShaderForge.SFN_Divide,id:6604,x:30440,y:33683,cmnt:Tile UVs,varname:node_6604,prsc:2|A-2473-UVOUT,B-1499-OUT;n:type:ShaderForge.SFN_Tex2d,id:6865,x:32202,y:33598,varname:node_6865,prsc:2,tex:415255727e8f59044933055e965a7139,ntxv:0,isnm:False|UVIN-521-OUT,TEX-2155-TEX;n:type:ShaderForge.SFN_Vector1,id:1056,x:30238,y:33622,varname:node_1056,prsc:2,v1:3;n:type:ShaderForge.SFN_Append,id:1499,x:30238,y:33683,varname:node_1499,prsc:2|A-4955-OUT,B-1056-OUT;n:type:ShaderForge.SFN_Add,id:5385,x:31140,y:33295,varname:node_5385,prsc:2|A-3937-OUT,B-9090-OUT;n:type:ShaderForge.SFN_Append,id:9090,x:31140,y:33413,varname:node_9090,prsc:2|A-4323-OUT,B-4611-OUT;n:type:ShaderForge.SFN_Add,id:5090,x:31140,y:33646,varname:node_5090,prsc:2|A-3937-OUT,B-4216-OUT;n:type:ShaderForge.SFN_Append,id:4216,x:31140,y:33771,varname:node_4216,prsc:2|A-4323-OUT,B-1457-OUT;n:type:ShaderForge.SFN_Vector1,id:4611,x:31140,y:33552,varname:node_4611,prsc:2,v1:0;n:type:ShaderForge.SFN_Add,id:7032,x:31140,y:34005,varname:node_7032,prsc:2|A-3937-OUT,B-3417-OUT;n:type:ShaderForge.SFN_Append,id:3417,x:31140,y:34127,varname:node_3417,prsc:2|A-4323-OUT,B-8531-OUT;n:type:ShaderForge.SFN_Tex2d,id:372,x:32202,y:33867,varname:node_372,prsc:2,tex:415255727e8f59044933055e965a7139,ntxv:0,isnm:False|UVIN-8797-OUT,TEX-2155-TEX;n:type:ShaderForge.SFN_Tex2d,id:7834,x:32202,y:33731,varname:node_7834,prsc:2,tex:415255727e8f59044933055e965a7139,ntxv:0,isnm:False|UVIN-3367-OUT,TEX-2155-TEX;n:type:ShaderForge.SFN_Relay,id:3937,x:30933,y:33689,varname:node_3937,prsc:2|IN-3900-OUT;n:type:ShaderForge.SFN_Divide,id:3900,x:30440,y:33520,cmnt:Pixel UVs,varname:node_3900,prsc:2|A-6604-OUT,B-4955-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6363,x:29790,y:33514,varname:node_6363,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-5036-OUT;n:type:ShaderForge.SFN_Relay,id:4323,x:30268,y:34036,varname:node_4323,prsc:2|IN-6363-B;n:type:ShaderForge.SFN_Multiply,id:7336,x:29254,y:33772,varname:node_7336,prsc:2|A-3102-OUT,B-4955-OUT;n:type:ShaderForge.SFN_Divide,id:4509,x:29593,y:33772,varname:node_4509,prsc:2|A-8593-OUT,B-4955-OUT;n:type:ShaderForge.SFN_Add,id:521,x:31631,y:33552,varname:node_521,prsc:2|A-5385-OUT,B-3997-OUT;n:type:ShaderForge.SFN_Multiply,id:5797,x:31140,y:33042,varname:node_5797,prsc:2|A-4955-OUT,B-1499-OUT;n:type:ShaderForge.SFN_Divide,id:9866,x:31360,y:33042,varname:node_9866,prsc:2|A-302-OUT,B-5797-OUT;n:type:ShaderForge.SFN_Vector1,id:302,x:31140,y:32968,varname:node_302,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:5638,x:31404,y:33237,varname:node_5638,prsc:2|A-9866-OUT,B-4174-OUT;n:type:ShaderForge.SFN_Append,id:5617,x:30238,y:33191,varname:node_5617,prsc:2|A-6363-R,B-6363-G;n:type:ShaderForge.SFN_Multiply,id:4174,x:30452,y:33191,varname:node_4174,prsc:2|A-5617-OUT,B-4955-OUT;n:type:ShaderForge.SFN_Add,id:3367,x:31631,y:33695,varname:node_3367,prsc:2|A-5090-OUT,B-3997-OUT;n:type:ShaderForge.SFN_Add,id:8797,x:31631,y:33840,varname:node_8797,prsc:2|A-7032-OUT,B-3997-OUT;n:type:ShaderForge.SFN_Vector1,id:9586,x:30733,y:34316,varname:node_9586,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:8521,x:30823,y:34381,varname:node_8521,prsc:2,v1:3;n:type:ShaderForge.SFN_Divide,id:1457,x:30733,y:34169,varname:node_1457,prsc:2|A-9586-OUT,B-8521-OUT;n:type:ShaderForge.SFN_Multiply,id:8531,x:30921,y:34169,varname:node_8531,prsc:2|A-1457-OUT,B-2630-OUT;n:type:ShaderForge.SFN_Vector1,id:2630,x:30921,y:34316,varname:node_2630,prsc:2,v1:2;n:type:ShaderForge.SFN_Round,id:8593,x:29413,y:33772,varname:node_8593,prsc:2|IN-7336-OUT;n:type:ShaderForge.SFN_Tex2d,id:1267,x:32904,y:33217,ptovrint:False,ptlb:Dithering,ptin:_Dithering,varname:node_1267,prsc:2,tex:090dd1b00b836f64499dcf9a07f7b829,ntxv:0,isnm:False|UVIN-429-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4412,x:28947,y:34432,ptovrint:False,ptlb:DitheringLevels,ptin:_DitheringLevels,varname:node_4412,prsc:2,glob:False,v1:5;n:type:ShaderForge.SFN_ValueProperty,id:354,x:28323,y:33537,ptovrint:False,ptlb:Width,ptin:_Width,varname:node_354,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_ValueProperty,id:9168,x:28323,y:33608,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_9168,prsc:2,glob:False,v1:200;n:type:ShaderForge.SFN_Append,id:5141,x:28549,y:33537,varname:node_5141,prsc:2|A-354-OUT,B-9168-OUT;n:type:ShaderForge.SFN_Multiply,id:7669,x:28549,y:33693,varname:node_7669,prsc:2|A-5141-OUT,B-268-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:268,x:28323,y:33693,varname:node_268,prsc:2,uv:0;n:type:ShaderForge.SFN_Floor,id:9592,x:28549,y:33831,varname:node_9592,prsc:2|IN-7669-OUT;n:type:ShaderForge.SFN_Divide,id:2380,x:28549,y:33968,varname:node_2380,prsc:2|A-7625-OUT,B-5141-OUT;n:type:ShaderForge.SFN_Relay,id:3223,x:29544,y:34162,varname:node_3223,prsc:2|IN-7490-OUT;n:type:ShaderForge.SFN_Relay,id:5364,x:31064,y:32522,varname:node_5364,prsc:2|IN-3223-OUT;n:type:ShaderForge.SFN_Vector1,id:3865,x:28739,y:33765,cmnt:Half Pixel Offset,varname:node_3865,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Relay,id:429,x:32683,y:33168,cmnt:DitherPosition,varname:node_429,prsc:2|IN-9632-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3268,x:28318,y:34220,ptovrint:False,ptlb:DitherTileSize,ptin:_DitherTileSize,varname:node_3268,prsc:2,glob:False,v1:4;n:type:ShaderForge.SFN_Divide,id:5336,x:28549,y:34139,varname:node_5336,prsc:2|A-5141-OUT,B-3268-OUT;n:type:ShaderForge.SFN_Multiply,id:4612,x:28752,y:34139,varname:node_4612,prsc:2|A-2380-OUT,B-5336-OUT;n:type:ShaderForge.SFN_Frac,id:8367,x:28947,y:34139,varname:node_8367,prsc:2|IN-4612-OUT;n:type:ShaderForge.SFN_Divide,id:7490,x:29128,y:34139,varname:node_7490,prsc:2|A-8367-OUT,B-5072-OUT;n:type:ShaderForge.SFN_Append,id:5072,x:29137,y:34471,varname:node_5072,prsc:2|A-4412-OUT,B-9374-OUT;n:type:ShaderForge.SFN_Vector1,id:9374,x:28947,y:34515,varname:node_9374,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:7625,x:28739,y:33831,varname:node_7625,prsc:2|A-9592-OUT,B-3865-OUT;n:type:ShaderForge.SFN_Add,id:9632,x:32262,y:32417,varname:node_9632,prsc:2|A-5364-OUT,B-1069-OUT;n:type:ShaderForge.SFN_Vector1,id:4955,x:30025,y:33558,varname:node_4955,prsc:2,v1:32;n:type:ShaderForge.SFN_Multiply,id:2793,x:31923,y:32593,varname:node_2793,prsc:2|A-372-R,B-4412-OUT;n:type:ShaderForge.SFN_Floor,id:8492,x:32092,y:32593,varname:node_8492,prsc:2|IN-2793-OUT;n:type:ShaderForge.SFN_Divide,id:3687,x:32262,y:32593,varname:node_3687,prsc:2|A-8492-OUT,B-4412-OUT;n:type:ShaderForge.SFN_Append,id:1069,x:32434,y:32593,varname:node_1069,prsc:2|A-3687-OUT,B-4801-OUT;n:type:ShaderForge.SFN_Vector1,id:4801,x:32262,y:32751,varname:node_4801,prsc:2,v1:0;n:type:ShaderForge.SFN_If,id:5834,x:32864,y:33604,varname:node_5834,prsc:2|A-2705-OUT,B-1267-R,GT-7834-RGB,EQ-7834-RGB,LT-6865-RGB;n:type:ShaderForge.SFN_Vector1,id:2705,x:32823,y:33858,varname:node_2705,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Power,id:6028,x:29254,y:33522,varname:node_6028,prsc:2|VAL-7406-RGB,EXP-4809-OUT;n:type:ShaderForge.SFN_Slider,id:4809,x:28923,y:33387,ptovrint:False,ptlb:GammaCorrection,ptin:_GammaCorrection,varname:node_4809,prsc:2,min:0.5,cur:1,max:3;n:type:ShaderForge.SFN_ConstantClamp,id:5036,x:29778,y:33772,varname:node_5036,prsc:2,min:0,max:0.999|IN-4509-OUT;n:type:ShaderForge.SFN_Clamp01,id:3102,x:29082,y:33772,varname:node_3102,prsc:2|IN-6189-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:3997,x:31581,y:33237,varname:node_3997,prsc:2,min:0,max:0.999|IN-5638-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:6189,x:29461,y:33522,varname:node_6189,prsc:2|IN-6028-OUT,IMIN-7374-OUT,IMAX-3716-OUT,OMIN-7374-OUT,OMAX-9044-OUT;n:type:ShaderForge.SFN_Vector1,id:7374,x:29461,y:33409,varname:node_7374,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:3716,x:29460,y:33466,varname:node_3716,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:9044,x:29460,y:33266,varname:node_9044,prsc:2|A-3716-OUT,B-7061-OUT;n:type:ShaderForge.SFN_Divide,id:7061,x:29460,y:33134,varname:node_7061,prsc:2|A-3716-OUT,B-5890-OUT;n:type:ShaderForge.SFN_Subtract,id:5890,x:29286,y:33134,varname:node_5890,prsc:2|A-4955-OUT,B-3716-OUT;proporder:7406-1267-2155-4412-3268-354-9168-4809;pass:END;sub:END;*/

Shader "Pixelatto/Dither-Palette" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Dithering ("Dithering", 2D) = "white" {}
        _Palette ("Palette", 2D) = "white" {}
        _DitheringLevels ("DitheringLevels", Float ) = 5
        _DitherTileSize ("DitherTileSize", Float ) = 4
        _Width ("Width", Float ) = 200
        _Height ("Height", Float ) = 200
        _GammaCorrection ("GammaCorrection", Range(0.5, 3)) = 1
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
            uniform sampler2D _Palette; uniform float4 _Palette_ST;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _Dithering; uniform float4 _Dithering_ST;
            uniform float _DitheringLevels;
            uniform float _Width;
            uniform float _Height;
            uniform float _DitherTileSize;
            uniform float _GammaCorrection;
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
                float2 node_5141 = float2(_Width,_Height);
                float2 node_2380 = ((floor((node_5141*i.uv0))+0.5)/node_5141);
                float node_4955 = 32.0;
                float2 node_1499 = float2(node_4955,3.0);
                float2 node_3937 = ((i.uv0/node_1499)/node_4955);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_2380, _MainTex));
                float node_7374 = 0.0;
                float node_3716 = 1.0;
                float3 node_6363 = clamp((round((saturate((node_7374 + ( (pow(_MainTex_var.rgb,_GammaCorrection) - node_7374) * ((node_3716-(node_3716/(node_4955-node_3716))) - node_7374) ) / (node_3716 - node_7374)))*node_4955))/node_4955),0,0.999).rgb;
                float node_4323 = node_6363.b;
                float node_1457 = (1.0/3.0);
                float2 node_3997 = clamp(((1.0/(node_4955*node_1499))*(float2(node_6363.r,node_6363.g)*node_4955)),0,0.999);
                float2 node_8797 = ((node_3937+float2(node_4323,(node_1457*2.0)))+node_3997);
                float4 node_372 = tex2D(_Palette,TRANSFORM_TEX(node_8797, _Palette));
                float2 node_429 = ((frac((node_2380*(node_5141/_DitherTileSize)))/float2(_DitheringLevels,1.0))+float2((floor((node_372.r*_DitheringLevels))/_DitheringLevels),0.0)); // DitherPosition
                float4 _Dithering_var = tex2D(_Dithering,TRANSFORM_TEX(node_429, _Dithering));
                float node_5834_if_leA = step(0.5,_Dithering_var.r);
                float node_5834_if_leB = step(_Dithering_var.r,0.5);
                float2 node_521 = ((node_3937+float2(node_4323,0.0))+node_3997);
                float4 node_6865 = tex2D(_Palette,TRANSFORM_TEX(node_521, _Palette));
                float2 node_3367 = ((node_3937+float2(node_4323,node_1457))+node_3997);
                float4 node_7834 = tex2D(_Palette,TRANSFORM_TEX(node_3367, _Palette));
                float3 emissive = lerp((node_5834_if_leA*node_6865.rgb)+(node_5834_if_leB*node_7834.rgb),node_7834.rgb,node_5834_if_leA*node_5834_if_leB);
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
