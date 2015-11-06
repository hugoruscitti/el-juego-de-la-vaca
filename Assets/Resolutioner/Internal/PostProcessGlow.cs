using UnityEngine;
using System.Collections;

public class PostProcessGlow : PostProcessBase {

	public Material testRenderMaterial;
	
	override protected Material GetRenderMaterial() {
		return Resources.Load<Material>("Materials/Post-Glow");
	}
	
	void Update () {
		if (renderMaterial!=null) {
			try {
				if (renderMaterial.HasProperty("_Amount")) {
					renderMaterial.SetFloat("_Amount", resolutioner.glowAmount);
				}
				if (renderMaterial.HasProperty("_Boost")) {
					renderMaterial.SetFloat("_Boost", resolutioner.glowBoost);
				}
			} catch {}
		}
	}
}
