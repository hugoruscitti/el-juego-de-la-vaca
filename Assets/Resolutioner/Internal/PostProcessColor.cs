using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class PostProcessColor : PostProcessBase {
	
	public Texture2D currentPaletteTexture;
	
	override protected Material GetRenderMaterial() {
		Material result=null;
		switch (resolutioner.colorMode) {
		case Resolutioner.ColorMode.Monochrome:		result=Resources.Load<Material>("Materials/Color-Monochrome"); break;
		case Resolutioner.ColorMode.Grayscale:		result=Resources.Load<Material>("Materials/Color-Grayscale"); break;
		case Resolutioner.ColorMode.BitLimited:		result=Resources.Load<Material>("Materials/Color-"+((int)resolutioner.colorBitDepth)+"Bits"); break;
		case Resolutioner.ColorMode.FixedPalette:	result=Resources.Load<Material>("Materials/Color-Palette"); break;
		default: 									result=Resources.Load<Material>("Materials/Color-Monochrome"); break;
		}
		if (result.HasProperty("_Palette")) {
			currentPaletteTexture=(Texture2D)result.GetTexture("_Palette");
		}
		return result;
	}
	
	void Update () {
		if (renderMaterial!=null) {
			try {
			CheckMaterial();
			if (renderMaterial.HasProperty("_GrayLevels")) {
				renderMaterial.SetFloat("_GrayLevels", resolutioner.grayscaleLevels);
			}
			if (renderMaterial.HasProperty("_LightOffset")) {
				renderMaterial.SetFloat("_LightOffset", resolutioner.lightOffset);
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
	
	public void SetPalette(Texture2D texture) {
		currentPaletteTexture=texture;
		if (renderMaterial.HasProperty("_Palette")) {
			renderMaterial.SetTexture("_Palette", texture);
		}
	}
	
	void CheckMaterial() {
		if (renderMaterial!=null) {
			if (renderMaterial.name!="Materials/Color-Monochrome" && resolutioner.colorMode==Resolutioner.ColorMode.Monochrome) {
				renderMaterial=GetRenderMaterial();
			}
			if (renderMaterial.name!="Materials/Color-Grayscale" && resolutioner.colorMode==Resolutioner.ColorMode.Grayscale) {
				renderMaterial=GetRenderMaterial();
			}
			if (renderMaterial.name!="Materials/Color-"+((int)resolutioner.colorBitDepth)+"Bits" && resolutioner.colorMode==Resolutioner.ColorMode.BitLimited) {
				renderMaterial=GetRenderMaterial();
			}
			if (renderMaterial.name!="Materials/Color-Palette" && resolutioner.colorMode==Resolutioner.ColorMode.FixedPalette) {
				renderMaterial=GetRenderMaterial();
			}
		} else {
			renderMaterial=GetRenderMaterial();
		}
	}
}
