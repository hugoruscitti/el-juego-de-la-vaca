using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class PostProcessDither : PostProcessBase {
	
	public Texture2D currentPaletteTexture;
	public Texture2D currentDitherTexture;
	
	override protected Material GetRenderMaterial() {
		Material result=null;
		switch (resolutioner.ditherMode) {
		case Resolutioner.DitherMode.Monochrome:	result=Resources.Load<Material>("Materials/Dither-Monochrome"); break;
		case Resolutioner.DitherMode.Indexed: 		result=Resources.Load<Material>("Materials/Dither-Indexed"); break;
		case Resolutioner.DitherMode.Palette:		result=Resources.Load<Material>("Materials/Dither-Palette"); break;
		default:									result=Resources.Load<Material>("Materials/Dither-Monochrome"); break;
		}
		currentDitherTexture =(Texture2D)result.GetTexture("_Dithering");
		currentPaletteTexture=(Texture2D)result.GetTexture("_Palette");
		return result;
	}
	
	public void SetDitherPattern(Texture2D texture) {
		currentDitherTexture=texture;
		if (renderMaterial.HasProperty("_Dithering")) {
			renderMaterial.SetTexture("_Dithering", texture);
		}
	}
	
	public void SetPalette(Texture2D texture) {
		currentPaletteTexture=texture;
		if (renderMaterial.HasProperty("_Palette")) {
			renderMaterial.SetTexture("_Palette", texture);
		}
	}
	
	void Update () {
		if (renderMaterial!=null) {
			try {
				CheckMaterial();
				if (renderMaterial.HasProperty("_Dithering")) {
					Texture ditherTexture=renderMaterial.GetTexture("_Dithering");
					renderMaterial.SetFloat("_DitheringLevels", Mathf.FloorToInt(ditherTexture.width/ditherTexture.height));
					renderMaterial.SetFloat("_DitherTileSize", ditherTexture.height);
				}
				if (renderMaterial.HasProperty("_Palette")) {
					Texture paletteTexture=renderMaterial.GetTexture("_Palette");
					if (paletteTexture!=null) {
						renderMaterial.SetFloat("_ColorCount", paletteTexture.width);
					}
				}
				if (renderMaterial.HasProperty("_GammaCorrection")) {
					renderMaterial.SetFloat("_GammaCorrection", resolutioner.gammaCorrection);
				}
				if (renderMaterial.HasProperty("_LightColor")) {
					renderMaterial.SetColor("_LightColor", resolutioner.lightColor);
				}
				if (renderMaterial.HasProperty("_DarkColor")) {
					renderMaterial.SetColor("_DarkColor", resolutioner.darkColor);
				}
			} catch {}
		}
	}
	
	void CheckMaterial() {
		if (renderMaterial.name!="Materials/Dither-Monochrome" && resolutioner.ditherMode==Resolutioner.DitherMode.Monochrome) {
			renderMaterial=GetRenderMaterial();
		}
		if (renderMaterial.name!="Materials/Dither-Indexed" && resolutioner.ditherMode==Resolutioner.DitherMode.Indexed) {
			renderMaterial=GetRenderMaterial();
		}
		if (renderMaterial.name!="Materials/Dither-Palette" && resolutioner.ditherMode==Resolutioner.DitherMode.Palette) {
			renderMaterial=GetRenderMaterial();
		}
	}
}
