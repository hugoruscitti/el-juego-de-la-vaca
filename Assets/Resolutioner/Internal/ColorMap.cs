#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;
using System.Collections;

public static class ColorMap {
	
	public static Texture2D Create(Texture2D palette) {
		float colorResolution=32;
		Texture2D output=new Texture2D(Mathf.RoundToInt(colorResolution*colorResolution), Mathf.RoundToInt(colorResolution)*3, TextureFormat.RGBA32, false);
		output.filterMode=FilterMode.Point;
						
		Color[] paletteColors=BuildPaletteFromTexture(palette);
		
		for (int r = 0; r < colorResolution; r++) {
			for (int g = 0; g < colorResolution; g++) {
				for (int b = 0; b < colorResolution; b++) {
					Color currentColor=new Color(r/colorResolution,g/colorResolution,b/colorResolution,255);
					float error1=0, error2=0;
					Color nearestColor=FindNearestPaletteColor(currentColor, paletteColors, out error1);
					Color secondNearestColor=FindSecondNearestPaletteColor(currentColor, paletteColors, nearestColor, out error2);
					float ditherWeight=1-(error1)/(error1+error2);
					SetOutputColor(ref output, r, g, b, nearestColor, secondNearestColor, ditherWeight, colorResolution);
				}
			}
		}
		output.Apply();
		
		System.IO.File.WriteAllBytes(Application.dataPath + "/Resolutioner/Resources/ProcessedPalettes/"+palette.name+".png", output.EncodeToPNG());
		AssetDatabase.Refresh();
		return output;
	}
	
	public static Color FindNearestPaletteColor(Color targetColor, Color[] palette, out float outError) {
		Color result=Color.white;
		float minError=float.MaxValue;
		for (int c = 0; c < palette.Length; c++) {
			float error=CalculateColorError(targetColor, palette[c]);
			if (error<minError) {
				minError=error;
				result=palette[c];
			}
		}
		outError=minError;
		return result;
	}
	
	public static Color FindSecondNearestPaletteColor(Color targetColor, Color[] palette, Color nearest, out float outError) {
		Color result=Color.white;
		float minError=float.MaxValue;
		for (int i = 0; i < palette.Length; i++) {
			float error=CalculateColorError(targetColor, palette[i]);
			if (nearest.r==palette[i].r && nearest.g==palette[i].g && nearest.b==palette[i].b) {
				//Skip this color
			} else {
				if (error<minError) {
					minError=error;
					result=palette[i];
				}
			}
		}
		outError=minError;
		return result;
	}
	
	public static float CalculateColorError(Color color1, Color color2) {
		//HSBColor colorA=new HSBColor(color1);
		//HSBColor colorB=new HSBColor(color2);
		//return new Vector3((colorA.h-colorB.h)*3, (colorA.s-colorB.s)*3, (colorA.b-colorB.b)*4).magnitude/10f;
		//return new Vector3((color1.r-color2.r)*0.299f, (color1.g-color2.g)*0.7152f, (color1.b-color2.b)*0.0722f).magnitude;
		return new Vector3((color1.r-color2.r), (color1.g-color2.g), (color1.b-color2.b)).magnitude;
	}
	
	public static Color[] BuildPaletteFromTexture(Texture2D paletteTexture) {
		Color[] result=new Color[paletteTexture.width];
		for (int i = 0; i < paletteTexture.width; i++) {
			result[i]=paletteTexture.GetPixel(i,0);
		}
		return result;
	}
	
	public static void SetOutputColor(ref Texture2D outputTexture, int r, int g, int b, Color nearestColor, Color secondNearestColor, float ditherWeight, float colorResolution) {
		int size=Mathf.RoundToInt(colorResolution);
		outputTexture.SetPixel(r+b*size, g, nearestColor);
		outputTexture.SetPixel(r+b*size, g+size, secondNearestColor);
		outputTexture.SetPixel(r+b*size, g+size*2, new Color(ditherWeight, ditherWeight, ditherWeight));
	}
}
#endif