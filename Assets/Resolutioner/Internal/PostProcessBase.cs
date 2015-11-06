using UnityEngine;
using System.Collections;

[ExecuteInEditMode]
public abstract class PostProcessBase : MonoBehaviour {
	
	public Material renderMaterial {get {if (renderMaterial_==null) {renderMaterial_=GetRenderMaterial();} return renderMaterial_;} set {renderMaterial_=value;}}
	public Material renderMaterial_;
	
	protected abstract Material GetRenderMaterial();
	
	protected Resolutioner resolutioner {get{if (resolutioner_==null) {resolutioner_=GetComponent<Resolutioner>();} if (resolutioner_==null) {DestroyImmediate(this);} return resolutioner_;}}
	private Resolutioner resolutioner_;
	
	void LateUpdate() {
		if (resolutioner==null) {
			DestroyImmediate(this);
		}
	}
	
	protected virtual void OnRenderImage(RenderTexture src, RenderTexture dest) {
		if (resolutioner.enabled==false) {
			enabled=false;
		}
		SendImageSizeToShader();
		if (renderMaterial!=null) {
			Graphics.Blit(src, dest, GetRenderMaterial());
		} else {
			Graphics.Blit(src, dest);
		}
	}
	
	void SendImageSizeToShader() {
		if (GetRenderMaterial()!=null) {
			if (renderMaterial.HasProperty("_Width"))  {renderMaterial.SetFloat("_Width", Screen.width*Camera.main.rect.width);}
			if (renderMaterial.HasProperty("_Height")) {renderMaterial.SetFloat("_Height", Screen.height*Camera.main.rect.height);}
		}
	}
	
}
