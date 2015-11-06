using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public class PostProcessScanlines : PostProcessBase {
	
	override protected Material GetRenderMaterial() {
		return Resources.Load<Material>("Materials/Pixel-Scanlines");
	}
	
	public void SetScanlineTexture(Texture2D texture) {
		if (renderMaterial.HasProperty("_Scanline")) {
			renderMaterial.SetTexture("_Scanline", texture);
		}
	}
	
	void Update () {
		if (renderMaterial!=null) {
			try {
				Texture scanlineTexture=renderMaterial.GetTexture("_Scanline");
				if (scanlineTexture!=null) {
					renderMaterial.SetFloat("_PixelWidth", scanlineTexture.width);
					renderMaterial.SetFloat("_PixelHeight", scanlineTexture.height);
				}
				renderMaterial.SetFloat("_PixelScale", resolutioner.scanlinesScale);
				renderMaterial.SetFloat("_Intensity", resolutioner.scanlineIntensity);
			} catch {}
		}
	}
}
