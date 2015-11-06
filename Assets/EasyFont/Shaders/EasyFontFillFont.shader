// unlit, vertex color, 2 textures, alpha blended
// cull off

Shader "GUI/EasyFont Text fill" 
{
	Properties 
	{
		_MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
		_GradientTex ("Gradient (RGBA)", 2D) = "white" {}
	}

	SubShader
	{
		Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
		ZWrite Off Lighting Off Cull Off Fog { Mode Off } 
		Blend SrcAlpha OneMinusSrcAlpha
		LOD 110
		
		Pass 
		{
			CGPROGRAM
		    #pragma vertex vert
        	#pragma fragment frag
			#pragma fragmentoption ARB_precision_hint_fastest
			#include "UnityCG.cginc"
			
			sampler2D _MainTex;
			sampler2D _GradientTex;
			half4 _GradientTex_ST;

			struct vin
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float2 texcoord : TEXCOORD0;
				float2 texcoord1 : TEXCOORD1;
			};

			struct v2f
			{
				float4 vertex : POSITION;
				fixed4 color : COLOR;
				float4 texcoord01 : TEXCOORD0;
			};

			v2f vert(vin v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.color = v.color;
				o.texcoord01.xy = v.texcoord;
				o.texcoord01.zw = TRANSFORM_TEX(v.texcoord1, _GradientTex);
				return o;
			}

			fixed4 frag(v2f i) : COLOR
			{
				fixed4 col =  tex2D(_GradientTex, i.texcoord01.zw) * i.color;
				col.a *= tex2D(_MainTex, i.texcoord01.xy).a;
				return col;
			}
			
			ENDCG
		} 
	}
}
