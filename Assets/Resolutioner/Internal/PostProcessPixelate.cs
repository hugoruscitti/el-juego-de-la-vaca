using UnityEngine;
using System.Collections;
 
[ExecuteInEditMode]
public class PostProcessPixelate : PostProcessBase {
	
	override protected Material GetRenderMaterial() {
		return Resources.Load<Material>("Materials/Pixel-Pixelate");
	}
	
	void Update () {
		if (renderMaterial!=null) {
			try {
				if (renderMaterial.HasProperty("_Zoom"))   {
					renderMaterial.SetFloat("_Zoom", resolutioner.pixelScale);
				}
			} catch {}
		}
	}
}
