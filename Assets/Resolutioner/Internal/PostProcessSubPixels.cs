using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class PostProcessSubPixels : PostProcessBase {
	
	override protected Material GetRenderMaterial() {
		return Resources.Load<Material>("Materials/Pixel-Subpixels");
	}
	
	public void SetSubPixelTexture(Texture2D texture) {
		if (renderMaterial.HasProperty("_Pixel")) {
			renderMaterial.SetTexture("_Pixel", texture);
		}
	}
	
	void Update () {
		if (renderMaterial!=null) {
			try {
				Texture pixelTexture=renderMaterial.GetTexture("_Pixel");
				renderMaterial.SetFloat("_PixelWidth", pixelTexture.width);
				renderMaterial.SetFloat("_PixelHeight", pixelTexture.height);
				
				renderMaterial.SetFloat("_PixelScale", resolutioner.subPixelScale);
				
				renderMaterial.SetFloat("_Brightness", resolutioner.brightness);
				renderMaterial.SetFloat("_Contrast", resolutioner.contrast);
				renderMaterial.SetFloat("_RGBMode", (resolutioner.pixelColorMode)?0:1);
			} catch {}
		}
	}
}
