using UnityEngine;
using System.Collections;
using System.Collections.Generic;
#if UNITY_EDITOR
using UnityEditor;
#endif

[RequireComponent(typeof(Camera))]
[ExecuteInEditMode]
public class Resolutioner : MonoBehaviour {
	
	public Orientation orientation;
	
	public bool limitScreenSize=false;
	public int maxWidth;
	public int maxHeight;
	public List<ResolutionerAspect> aspectRatios;
	
	public bool useResolution;
	public bool useDithering;
	public bool useColorFilter;
	public bool usePixelation;
	public bool useSubPixels;
	public bool useGlow;
	public bool useScanlines;
	public bool useGizmos;
	
	public float cameraOrthographicSize=6.5f;
	public DitherMode ditherMode;
	public ColorMode colorMode;
	public ColorBitDepth colorBitDepth=ColorBitDepth.SixBits;
	public int pixelScale=1;
	public int subPixelScale=1;
	public int scanlinesScale=1;
	public float brightness=0;
	public float contrast=0;
	public float gammaCorrection=1;
	public bool pixelColorMode;
	public float gizmosDepth=10;
	public Color lightColor=Color.white;
	public Color darkColor=Color.black;
	[Range(0.5f,   2)]public float glowAmount;
	[Range(   0,  20)]public float glowBoost;
	[Range(   0,   1)]public float scanlineIntensity=0.5f;
	[Range(   1, 100)]public int grayscaleLevels=4;
	[Range(  -1,   1)]public float lightOffset=0;
	
	float widthFactor   {get {return(float)maxWidth/(float)Screen.width;}}
	float heightFactor  {get {return(float)maxHeight/(float)Screen.height;}}
	float PixelsToScreen{get {return 1f/(float)(Screen.height);}}
	float ScreenToUnits {get {return thisCamera.orthographicSize;}}
	float PixelsToUnits {get {return PixelsToScreen*ScreenToUnits;}}
	
	Camera thisCamera {get {if (thisCamera_==null) {thisCamera_=GetComponent<Camera>();} return thisCamera_;}} Camera thisCamera_;
	int checkWidth, checkHeight;
	int checkScreenWidth, checkScreenHeight;
	bool dirty=false;
	float cameraRatio;
	
	public PostProcessDither	postprocessDither;
	public PostProcessColor		postprocessColor;
	public PostProcessPixelate	postprocessPixelate;
	public PostProcessSubPixels	postprocessSubPixels;
	public PostProcessGlow		postprocessGlow;
	public PostProcessScanlines	postprocessScanlines;
	
	public enum Orientation 	{Portrait, Landscape}
	public enum DitherMode  	{Monochrome, Indexed, Palette}
	public enum ColorMode		{Monochrome, Grayscale, BitLimited, FixedPalette}
	public enum ColorBitDepth	{ThreeBits=3, SixBits=6, EightBits=8, NineBits=9}
	
	void Start() {
		dirty=true;
	}
	
	void Update() {
		CheckPostProcessers();
		AdjustResolution();
	}
	
	void CheckPostProcessers() {
		CheckProcesser<PostProcessDither>		(ref postprocessDither);
		CheckProcesser<PostProcessColor>		(ref postprocessColor);
		CheckProcesser<PostProcessPixelate>		(ref postprocessPixelate);
		CheckProcesser<PostProcessSubPixels>	(ref postprocessSubPixels);
		CheckProcesser<PostProcessGlow>			(ref postprocessGlow);
		CheckProcesser<PostProcessScanlines>	(ref postprocessScanlines);
		postprocessDither.enabled=useDithering;
		postprocessColor.enabled=useColorFilter;
		postprocessPixelate.enabled=usePixelation;
		postprocessSubPixels.enabled=useSubPixels;
		postprocessGlow.enabled=useGlow;
		postprocessScanlines.enabled=useScanlines;
	}
	
	void LateUpdate() {
		postprocessDither.enabled=useDithering;
		postprocessSubPixels.enabled=useSubPixels;
		postprocessPixelate.enabled=usePixelation;
		postprocessSubPixels.enabled=usePixelation && useSubPixels;
		postprocessScanlines.enabled=usePixelation && useScanlines;
		postprocessGlow.enabled=useGlow;
		postprocessColor.enabled=useColorFilter;
		postprocessSubPixels.enabled=useSubPixels;
		postprocessDither.hideFlags=HideFlags.HideInInspector;
		postprocessColor.hideFlags=HideFlags.HideInInspector;
		postprocessPixelate.hideFlags=HideFlags.HideInInspector;
		postprocessSubPixels.hideFlags=HideFlags.HideInInspector;
		postprocessGlow.hideFlags=HideFlags.HideInInspector;
		postprocessScanlines.hideFlags=HideFlags.HideInInspector;
	}
	
	void CheckProcesser<ProcesserType>(ref ProcesserType processer, bool enable=true) where ProcesserType : Component {
		if (enable) {
			if (processer==null) {
				processer=GetComponent<ProcesserType>();
				if (processer==null) {
					processer=gameObject.AddComponent<ProcesserType>();
				}
			}
		} else {
			if (processer==null) {
				processer=GetComponent<ProcesserType>();
				if (processer!=null) {
					DestroyImmediate(processer);
				}
			}
		}
	}
	
	void AdjustResolution() {
		if (usePixelation) {
			thisCamera.orthographicSize=cameraOrthographicSize*pixelScale;
		}
	
		if (dirty || limitScreenSize) {
			if (dirty || checkWidth!=maxWidth || checkHeight!=maxHeight || checkScreenWidth!=Screen.width || checkScreenHeight!=Screen.height) {
				if (!Application.isPlaying) {
					if (maxWidth>Screen.width)   {maxWidth =Screen.width;}
					if (maxHeight>Screen.height) {maxHeight=Screen.height;}
				}
				Vector2 portSize=new Vector2(widthFactor, heightFactor);
				Vector2 portMargin=new Vector2(1f-portSize.x, 1f-portSize.y);
				thisCamera.rect=new Rect(Mathf.Clamp01(portMargin.x/2), Mathf.Clamp01(portMargin.y/2), Mathf.Clamp01(portSize.x), Mathf.Clamp01(portSize.y));
				checkWidth=maxWidth;
				checkHeight=maxHeight;
				checkScreenWidth=Screen.width;
				checkScreenHeight=Screen.height;
			}
			dirty=false;
		} else {
			thisCamera.rect=new Rect(0,0,1,1);
			maxWidth=Screen.width;
			maxHeight=Screen.height;
			checkWidth=maxWidth;
			checkHeight=maxHeight;
		}
	}
	
	#if UNITY_EDITOR
	void OnDrawGizmos() {
		if (useGizmos) {
			DrawResolutionGizmos();
		}
	}
	
	void DrawResolutionGizmos() {
		cameraRatio=thisCamera.aspect;
		float cameraHeight;
		float cameraWidth;
		Vector3 cameraSize;
		float gizmoSizeFactor=(usePixelation?1f/pixelScale:1f);
		if (thisCamera.orthographic) {
			cameraHeight = Screen.height;
			cameraWidth=cameraHeight*cameraRatio;
			cameraSize=new Vector3(cameraWidth, cameraHeight)*PixelsToUnits*gizmoSizeFactor;
		} else {
			cameraHeight = gizmosDepth*Mathf.Tan(thisCamera.fieldOfView*0.5f*Mathf.Deg2Rad);
			cameraWidth=cameraHeight*cameraRatio;
			cameraSize=new Vector3(cameraWidth, cameraHeight)*gizmoSizeFactor;
		}
		
		for (int i = 0; i < aspectRatios.Count; i++) {
			if (aspectRatios[i]!=null) {
				float height=cameraHeight;
				float width;
				if (orientation==Orientation.Landscape) {
					width=height*aspectRatios[i].ratio;
				} else {
					width=height/aspectRatios[i].ratio;
				}
				Vector3 screenSize=new Vector3(width, height)*gizmoSizeFactor*(thisCamera.orthographic?PixelsToUnits:1);
				DrawRect(screenSize, aspectRatios[i].color);
				DrawLabel(screenSize, aspectRatios[i], i);
			}
		}
		
		DrawRect(cameraSize, Color.white);
		DrawDashRect(cameraSize*0.95f, Color.white*0.8f);
		DrawLabelCamera(cameraSize);
	}
	#endif
	
	void DrawRect(Vector3 size, Color color) {
		Color saveColor=Gizmos.color;
		Gizmos.color=color;
		Gizmos.DrawLine(transform.position+transform.right*(-size.x)+transform.up*( size.y)+gizmosDepth*transform.forward, transform.position+transform.right*( size.x)+transform.up*( size.y)+gizmosDepth*transform.forward);
		Gizmos.DrawLine(transform.position+transform.right*( size.x)+transform.up*( size.y)+gizmosDepth*transform.forward, transform.position+transform.right*( size.x)+transform.up*(-size.y)+gizmosDepth*transform.forward);
		Gizmos.DrawLine(transform.position+transform.right*( size.x)+transform.up*(-size.y)+gizmosDepth*transform.forward, transform.position+transform.right*(-size.x)+transform.up*(-size.y)+gizmosDepth*transform.forward);
		Gizmos.DrawLine(transform.position+transform.right*(-size.x)+transform.up*(-size.y)+gizmosDepth*transform.forward, transform.position+transform.right*(-size.x)+transform.up*( size.y)+gizmosDepth*transform.forward);
		Gizmos.color=saveColor;
	}

	void DrawDashRect(Vector3 size, Color color) {
		Color saveColor=Gizmos.color;
		Gizmos.color=color;
		DrawDashLine(transform.position+transform.right*(-size.x)+transform.up*( size.y)+gizmosDepth*transform.forward, transform.position+transform.right*( size.x)+transform.up*( size.y)+gizmosDepth*transform.forward);
		DrawDashLine(transform.position+transform.right*( size.x)+transform.up*( size.y)+gizmosDepth*transform.forward, transform.position+transform.right*( size.x)+transform.up*(-size.y)+gizmosDepth*transform.forward);
		DrawDashLine(transform.position+transform.right*( size.x)+transform.up*(-size.y)+gizmosDepth*transform.forward, transform.position+transform.right*(-size.x)+transform.up*(-size.y)+gizmosDepth*transform.forward);
		DrawDashLine(transform.position+transform.right*(-size.x)+transform.up*(-size.y)+gizmosDepth*transform.forward, transform.position+transform.right*(-size.x)+transform.up*( size.y)+gizmosDepth*transform.forward);
		Gizmos.color=saveColor;
	}
	
	void DrawLabel(Vector3 size, ResolutionerAspect ratio, float offset) {
		#if UNITY_EDITOR
		Color saveColor=Gizmos.color;
		Color saveColorHandles=Handles.color;
		GUIStyle handlesStyle = new GUIStyle();
		Gizmos.color=ratio.color;
		string text;
		float verticalOffset;
		handlesStyle.normal.textColor = ratio.color;
		handlesStyle.fontSize=(int)(1f/HandleUtility.GetHandleSize(transform.position+new Vector3(-size.x,size.y)+gizmosDepth*transform.forward));
		float scale=0.2f*HandleUtility.GetHandleSize(transform.position+new Vector3(-size.x,size.y)+gizmosDepth*transform.forward);
		if (orientation == Orientation.Landscape) {
			text = " " + ratio.aspectName + " (" + (int)(Screen.height * heightFactor * ratio.ratio) + "x" + Screen.height * heightFactor + ")";
			verticalOffset=(aspectRatios.Count-offset+1)*scale;
		} else {
			text = " " + ratio.inverseName + " (" + Screen.height * heightFactor + "x" + (int)(Screen.height * heightFactor * ratio.ratio) + ")";
			verticalOffset=(offset+2)*scale;
		}
		Gizmos.DrawLine(transform.position+transform.right*(-size.x)+transform.up*(size.y+verticalOffset)+gizmosDepth*transform.forward, transform.position+transform.right*(-size.x)+ transform.up*size.y+gizmosDepth*transform.forward);
		Handles.Label(transform.position+transform.right*(-size.x)+transform.up*(size.y+verticalOffset)+gizmosDepth*transform.forward, text, handlesStyle);
		Gizmos.color=saveColor;
		Handles.color=saveColorHandles;
		#endif
	}

	void DrawLabelCamera(Vector3 size) {
		#if UNITY_EDITOR
		Color saveColor=Gizmos.color;
		Color saveColorHandles=Handles.color;
		GUIStyle handlesStyle = new GUIStyle();
		float scale=0.2f*HandleUtility.GetHandleSize(transform.position+new Vector3(-size.x,size.y)+gizmosDepth*transform.forward);
		Gizmos.color=Color.white;
		string text="";
		ResolutionerAspect nearestAspect=FindNearestAspect(cameraRatio);
		if (nearestAspect!=null) {
			if (orientation == Orientation.Landscape) {
				text = " Current aspect (closest) ≈ " + nearestAspect.aspectName + " (" + (int)(Screen.width * widthFactor) + "x" + Screen.height * heightFactor + ")";
			} else {
				text = " Current aspect (closest) ≈ " + nearestAspect.inverseName + " (" + Screen.height * heightFactor + "x" + (int)(Screen.width * widthFactor) + ")";
			}
		}
		handlesStyle.normal.textColor = Color.white;
		handlesStyle.fontSize=(int)(1f/HandleUtility.GetHandleSize(transform.position+transform.right*(-size.x)+transform.up*(-size.y)+gizmosDepth*transform.forward));
		Gizmos.DrawLine(transform.position+transform.right*(-size.x)+transform.up*(size.y+1*scale)+gizmosDepth*transform.forward, transform.position+transform.right*(-size.x) + transform.up*(size.y)+gizmosDepth*transform.forward);
		Handles.Label(transform.position+transform.right*(-size.x)+transform.up*(size.y+1*scale)+gizmosDepth*transform.forward, text, handlesStyle);
		Gizmos.color=saveColor;
		Handles.color=saveColorHandles;
		#endif
	}

	void DrawDashLine(Vector3 a, Vector3 b, int parts=20) {
		if (parts == 0) {
			return;
		}

		float length = (a - b).magnitude / parts;
		Vector3 dir = (a - b).normalized*length;
		for (int i = 0; i < parts; i+=2) {
			Gizmos.DrawLine(b+dir*i, b+dir*(i+1));
		}
	}

	ResolutionerAspect FindNearestAspect(float value) {
		ResolutionerAspect result = null;
		float min = float.PositiveInfinity;
		if (orientation == Orientation.Portrait) {
			value=1/value;
		}

		foreach (var item in aspectRatios) {
			if (item!=null) {
				float current=Mathf.Abs(item.ratio-value);
				if (current<min) {
					min=current;
					result=item;
				}
			}
		}
		return result;
	}
}

[System.Serializable]
public class ResolutionerAspect {
	public int xRatio=16;
	public int yRatio=9;
	public Color color=Color.yellow;
	
	public string aspectName {get {return xRatio+":"+yRatio;}}
	public string inverseName {get {return yRatio+":"+xRatio;}}
	public float ratio {get {return (float)xRatio/(float)yRatio;}}
	
	public ResolutionerAspect(int xRatio, int yRatio, Color color) {
		this.xRatio=xRatio;
		this.yRatio=yRatio;
		this.color=color;
	}
}

#if UNITY_EDITOR

[CustomPropertyDrawer(typeof(ResolutionerAspect))]
public class ResolutionerAspectDrawer : PropertyDrawer {
	public override float GetPropertyHeight (SerializedProperty property, GUIContent label) {
		return 16+2;
	}
	
	public override void OnGUI (Rect position, SerializedProperty property, GUIContent label) {
	
		SerializedProperty xRatio=property.FindPropertyRelative("xRatio");
		SerializedProperty yRatio=property.FindPropertyRelative("yRatio");
		SerializedProperty color=property.FindPropertyRelative("color");
		
		label=EditorGUI.BeginProperty(position, label, property);
		Rect contentPosition=EditorGUI.PrefixLabel(position, new GUIContent("Aspect: "+((float)xRatio.intValue/(float)yRatio.intValue)));
		
		float smallWidth=64f;
		
		Rect leftRect1=new Rect(contentPosition.x, contentPosition.y, smallWidth*0.8f, contentPosition.height);
		Rect separatorRect=new Rect(contentPosition.x+smallWidth*0.8f+2, contentPosition.y, 8, contentPosition.height);
		Rect leftRect2=new Rect(contentPosition.x+smallWidth, contentPosition.y, smallWidth*0.8f, contentPosition.height);
		Rect rightRect=new Rect(contentPosition.x+smallWidth*2, contentPosition.y, contentPosition.width-smallWidth*2, contentPosition.height);
		int saveIndentLevel=EditorGUI.indentLevel;
		EditorGUI.indentLevel=0;
		
		xRatio.intValue=EditorGUI.IntField(leftRect1, xRatio.intValue);
		EditorGUI.LabelField(separatorRect, ":");
		yRatio.intValue=EditorGUI.IntField(leftRect2, yRatio.intValue);
		color.colorValue=EditorGUI.ColorField(rightRect, color.colorValue);
		EditorGUI.EndProperty();
		
		EditorGUI.indentLevel=saveIndentLevel;
	}
	
}

[CustomEditor(typeof(Resolutioner))]
public class ResolutionManagerEditor : Editor {
	
	SerializedProperty useResolution, useDithering, useColorFilter, usePixelation, useSubPixels, useScanlines, useGlow, useGizmos;
	SerializedProperty ditherMode, colorMode, colorBitDepth, pixelScale, subPixelScale, scanlinesScale, brightness, contrast, gammaCorrection, pixelColorMode, grayscaleLevels, lightColor, darkColor, lightOffset, scanlineIntensity, glowAmount, glowBoost;
	SerializedProperty cameraOrthographicSize, orientation, gizmos, limitScreenSize, maxWidth, maxHeight, aspectRatios;
	SerializedProperty postprocessDither, postprocessColor, postprocessSubPixels, postprocessScanlines;//, postprocessPixelate, postprocessGlow;
	
	Texture2D[] pixelTextures, pixelShapes, ditherPatterns, colorRamps, palettes, processedPalettes, scanlines;
	
	void OnEnable() {
		pixelTextures		=Resources.LoadAll<Texture2D>("Pixels");
		pixelShapes			=Resources.LoadAll<Texture2D>("PixelShapes");
		ditherPatterns		=Resources.LoadAll<Texture2D>("Dithers");
		colorRamps			=Resources.LoadAll<Texture2D>("Ramps");
		palettes			=Resources.LoadAll<Texture2D>("Palettes");
		processedPalettes	=Resources.LoadAll<Texture2D>("ProcessedPalettes");
		scanlines			=Resources.LoadAll<Texture2D>("Scanlines");
	}
	
	Texture resolutionerLogo_;
	Texture resolutionerLogo {
		get {
			if (resolutionerLogo_==null) {
				string path=AssetDatabase.GUIDToAssetPath(AssetDatabase.FindAssets("Resolutioner")[0]).Replace("Resolutioner.cs","")+"/Internal/Images/resolutioner_logo.png";
				resolutionerLogo_ = (Texture)AssetDatabase.LoadAssetAtPath(path, typeof(Texture));
				Debug.Log(path);
			}
			return resolutionerLogo_;
		}
	}
	Texture pixelattoIcon_;
	Texture pixelattoIcon {
		get {
			if (pixelattoIcon_==null) {
				string path=AssetDatabase.GUIDToAssetPath(AssetDatabase.FindAssets("Resolutioner")[0]).Replace("Resolutioner.cs","")+"/Internal/Images/pixelatto_icon.png";
				pixelattoIcon_ = (Texture)AssetDatabase.LoadAssetAtPath(path, typeof(Texture));
				Debug.Log(path);
			}
			return pixelattoIcon_;
		}
	}

	void OnSceneGUI() {
		SceneView.RepaintAll();
	}

	override public void OnInspectorGUI() {
		GetProperties();
	
		DrawTitle();
		DrawResolutionOptions();
		DrawPixelateOptions();
		DrawDitherOptions();
		DrawColorFilterOptions();
		DrawGlowOptions();
		DrawGizmoOptions();
		
		serializedObject.ApplyModifiedProperties();
	}
	
	void DrawTitle() {
		GUILayout.Space(8f);
		if (resolutionerLogo!=null) {
			var headerRect = GUILayoutUtility.GetRect(Screen.width, 5.0f);
			headerRect.x=headerRect.x-16;
			headerRect.width = resolutionerLogo.width;
			headerRect.height = resolutionerLogo.height;
			GUILayout.Space( headerRect.height );
			GUI.DrawTexture( headerRect, resolutionerLogo);
			
			if (GUI.Button(new Rect(Screen.width-60, headerRect.y+4, headerRect.height*0.875f, headerRect.height*0.875f), new GUIContent(pixelattoIcon, "More Pixelatto Assets"))) {
				Application.OpenURL("http://www.pixelatto.com/");
			}
		}
	}
	
	void DrawResolutionOptions() {
		if (useResolution.boolValue=EditorGUILayout.BeginToggleGroup(new GUIContent("Resolution", "Constraint screen resolution"), useResolution.boolValue)) {
			EditorGUI.indentLevel++;
			DrawScreenSizeProperty();
			EditorGUI.indentLevel--;
		}
		try {
			limitScreenSize.boolValue=limitScreenSize.boolValue && useResolution.boolValue;
		} catch {}
		EditorGUILayout.EndToggleGroup();
	}
	
	void DrawGizmoOptions() {
		if (useGizmos.boolValue=EditorGUILayout.BeginToggleGroup(new GUIContent("Aspect Gizmos", "Display screen aspect gizmos"), useGizmos.boolValue)) {
			EditorGUI.indentLevel++;
			EditorGUILayout.PropertyField(orientation);
			DrawResolutionList();
			EditorGUI.indentLevel--;
		}
		EditorGUILayout.EndToggleGroup();
	}
	
	void DrawDitherOptions() {
		if (useDithering.boolValue=EditorGUILayout.BeginToggleGroup(new GUIContent("Dithering", "Discrete color-blending options"), useDithering.boolValue)) {
			EditorGUI.indentLevel++;
			
			DrawDitherPatternList();
			
			EditorGUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Gamma Correction");
			int saveIndentLevel=EditorGUI.indentLevel;
			EditorGUI.indentLevel=0;
			gammaCorrection.floatValue=EditorGUILayout.Slider(gammaCorrection.floatValue, 0.5f, 3f);
			EditorGUI.indentLevel=saveIndentLevel;
			EditorGUILayout.EndHorizontal();
			EditorGUILayout.PropertyField(ditherMode, new GUIContent("Color Mode"));
			
			if (ditherMode.enumValueIndex==(int)Resolutioner.DitherMode.Monochrome) {
				EditorGUILayout.PropertyField(lightColor);
				EditorGUILayout.PropertyField(darkColor);
			}
			if (ditherMode.enumValueIndex==(int)Resolutioner.DitherMode.Indexed) {
				DrawColorRampList();
			}
			if (ditherMode.enumValueIndex==(int)Resolutioner.DitherMode.Palette) {
				DrawDitherPaletteList();
			}
			
			EditorGUI.indentLevel--;
		}
		EditorGUILayout.EndToggleGroup();
	}
	
	void DrawColorRampList() {
		float buttonHeight=24f;
		EditorGUILayout.BeginVertical();
		EditorGUILayout.BeginHorizontal();
		EditorGUILayout.PrefixLabel("Color Ramp");
		int saveIndentLevel=EditorGUI.indentLevel;
		EditorGUI.indentLevel=0;
		Rect contentRect=EditorGUI.IndentedRect(EditorGUILayout.GetControlRect());
		EditorGUILayout.EndHorizontal();
		Rect currentRect=new Rect(contentRect.x, contentRect.y, contentRect.width, buttonHeight);
		EditorGUI.indentLevel=saveIndentLevel;
		foreach (Texture2D ramp in colorRamps) {
			if (GUI.Button(currentRect, new GUIContent("", ramp.name))) {
				PostProcessDither target=((PostProcessDither)postprocessDither.objectReferenceValue);
				if (target!=null) {
					target.SetPalette(ramp);
				}
			}
			GUI.DrawTexture(currentRect.AddMargin(4f), ramp, ScaleMode.ScaleAndCrop); 
			currentRect=new Rect(currentRect.x, currentRect.y+currentRect.height+2, currentRect.width, currentRect.height);	
		}
		GUILayout.Space((buttonHeight+2)*colorRamps.Length);
		EditorGUILayout.EndVertical();
	}
	
	void DrawDitherPaletteList() {
		float buttonHeight=24f;
		EditorGUILayout.BeginVertical();
		EditorGUILayout.BeginHorizontal();
		EditorGUILayout.PrefixLabel("Palette");
		int saveIndentLevel=EditorGUI.indentLevel;
		EditorGUI.indentLevel=0;
		Rect contentRect=EditorGUI.IndentedRect(EditorGUILayout.GetControlRect());
		EditorGUILayout.EndHorizontal();
		Rect currentRect =new Rect(contentRect.x, contentRect.y, (contentRect.width)*0.45f, buttonHeight);
		Rect currentRect2=new Rect(contentRect.x+(contentRect.width)*0.45f+2, contentRect.y, (contentRect.width)*0.1f, buttonHeight);
		Rect currentRect3=new Rect(contentRect.x+(contentRect.width)*0.55f+4, contentRect.y, (contentRect.width)*0.45f, buttonHeight);
		EditorGUI.indentLevel=saveIndentLevel;
		foreach (Texture2D palette in palettes) {
			Texture2D processedPalette=FindProcessedPalette(palette);
			if (processedPalette!=null) {
				PostProcessDither target=((PostProcessDither)postprocessDither.objectReferenceValue);
				if (target!=null) {
					if (target.currentPaletteTexture==processedPalette) {
						GUI.Toggle(currentRect, true, "", GUI.skin.GetStyle("Button"));
					} else {
						if (GUI.Button(currentRect, new GUIContent("", palette.name))) {
							target.SetPalette(processedPalette);
						}
					}
				}
			}
			GUI.DrawTexture(currentRect.AddMargin(4f), palette, ScaleMode.StretchToFill);
			
			if (GUI.Button(currentRect2.AddMargin(2f), new GUIContent("->", "Process palette"))) {
				ProcessPalette(palette);
			}
			
			if (processedPalette!=null) {
				float texWidth=currentRect3.width/5f;
				Rect texRect1=new Rect(currentRect3.x+0*texWidth, currentRect3.y, texWidth, currentRect3.height);
				Rect texRect2=new Rect(currentRect3.x+1*texWidth, currentRect3.y, texWidth, currentRect3.height);
				Rect texRect3=new Rect(currentRect3.x+2*texWidth, currentRect3.y, texWidth, currentRect3.height);
				Rect texRect4=new Rect(currentRect3.x+3*texWidth, currentRect3.y, texWidth, currentRect3.height);
				Rect texRect5=new Rect(currentRect3.x+4*texWidth, currentRect3.y, texWidth, currentRect3.height);
				
				float texTileWidth=(float)1/32f;
				EditorGUI.DrawRect(currentRect3, new Color(0.2f,0.2f,0.2f));
				
				GUI.DrawTextureWithTexCoords(texRect1.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(0*texTileWidth,0,texTileWidth,0.3333f));
				GUI.DrawTextureWithTexCoords(texRect2.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(7*texTileWidth,0,texTileWidth,0.3333f));
				GUI.DrawTextureWithTexCoords(texRect3.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(15*texTileWidth,0,texTileWidth,0.3333f));
				GUI.DrawTextureWithTexCoords(texRect4.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(23*texTileWidth,0,texTileWidth,0.3333f));
				GUI.DrawTextureWithTexCoords(texRect5.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(31*texTileWidth,0,texTileWidth,0.3333f));
			} else {
				GUI.Label(currentRect3.AddMargin(4), "Processing Required");
			}
			currentRect =new Rect(currentRect.x, currentRect.y+currentRect.height+2, currentRect.width, currentRect.height);
			currentRect2=new Rect(currentRect2.x, currentRect2.y+currentRect2.height+2, currentRect2.width, currentRect2.height);
			currentRect3=new Rect(currentRect3.x, currentRect3.y+currentRect3.height+2, currentRect3.width, currentRect3.height);
		}
		GUILayout.Space((buttonHeight+2)*palettes.Length);
		EditorGUILayout.EndVertical();
	}
	
	void DrawColorPaletteList() {
		float buttonHeight=24f;
		EditorGUILayout.BeginVertical();
		EditorGUILayout.BeginHorizontal();
		EditorGUILayout.PrefixLabel("Palette");
		int saveIndentLevel=EditorGUI.indentLevel;
		EditorGUI.indentLevel=0;
		Rect contentRect=EditorGUI.IndentedRect(EditorGUILayout.GetControlRect());
		EditorGUILayout.EndHorizontal();
		Rect currentRect =new Rect(contentRect.x, contentRect.y, (contentRect.width)*0.45f, buttonHeight);
		Rect currentRect2=new Rect(contentRect.x+(contentRect.width)*0.45f+2, contentRect.y, (contentRect.width)*0.1f, buttonHeight);
		Rect currentRect3=new Rect(contentRect.x+(contentRect.width)*0.55f+4, contentRect.y, (contentRect.width)*0.45f, buttonHeight);
		EditorGUI.indentLevel=saveIndentLevel;
		foreach (Texture2D palette in palettes) {
			Texture2D processedPalette=FindProcessedPalette(palette);
			if (processedPalette!=null) {
				PostProcessColor target=((PostProcessColor)postprocessColor.objectReferenceValue);
				if (target!=null) {
					if (target.currentPaletteTexture==processedPalette) {
						GUI.Toggle(currentRect, true, "", GUI.skin.GetStyle("Button"));
					} else {
						if (GUI.Button(currentRect, new GUIContent("", palette.name))) {
							target.SetPalette(processedPalette);
						}
					}
				}
			}
			GUI.DrawTexture(currentRect.AddMargin(4f), palette, ScaleMode.StretchToFill);
			
			if (GUI.Button(currentRect2.AddMargin(2f), new GUIContent("->", "Process palette"))) {
				ProcessPalette(palette);
			}
			
			if (processedPalette!=null) {
				float texWidth=currentRect3.width/5f;
				Rect texRect1=new Rect(currentRect3.x+0*texWidth, currentRect3.y, texWidth, currentRect3.height);
				Rect texRect2=new Rect(currentRect3.x+1*texWidth, currentRect3.y, texWidth, currentRect3.height);
				Rect texRect3=new Rect(currentRect3.x+2*texWidth, currentRect3.y, texWidth, currentRect3.height);
				Rect texRect4=new Rect(currentRect3.x+3*texWidth, currentRect3.y, texWidth, currentRect3.height);
				Rect texRect5=new Rect(currentRect3.x+4*texWidth, currentRect3.y, texWidth, currentRect3.height);
				
				float texTileWidth=(float)1/32f;
				EditorGUI.DrawRect(currentRect3, new Color(0.2f,0.2f,0.2f));
				
				GUI.DrawTextureWithTexCoords(texRect1.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(0*texTileWidth,0,texTileWidth,0.3333f));
				GUI.DrawTextureWithTexCoords(texRect2.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(7*texTileWidth,0,texTileWidth,0.3333f));
				GUI.DrawTextureWithTexCoords(texRect3.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(15*texTileWidth,0,texTileWidth,0.3333f));
				GUI.DrawTextureWithTexCoords(texRect4.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(23*texTileWidth,0,texTileWidth,0.3333f));
				GUI.DrawTextureWithTexCoords(texRect5.AddMargin(2).SquareInsideRect(), processedPalette, new Rect(31*texTileWidth,0,texTileWidth,0.3333f));
			} else {
				GUI.Label(currentRect3.AddMargin(4), "Processing Required");
			}
			currentRect =new Rect(currentRect.x, currentRect.y+currentRect.height+2, currentRect.width, currentRect.height);
			currentRect2=new Rect(currentRect2.x, currentRect2.y+currentRect2.height+2, currentRect2.width, currentRect2.height);
			currentRect3=new Rect(currentRect3.x, currentRect3.y+currentRect3.height+2, currentRect3.width, currentRect3.height);
		}
		GUILayout.Space((buttonHeight+2)*palettes.Length);
		EditorGUILayout.EndVertical();
	}
	
	void DrawDitherPatternList() {
		float buttonHeight=24f;
		EditorGUILayout.BeginVertical();
		EditorGUILayout.BeginHorizontal();
		EditorGUILayout.PrefixLabel("Pattern");
		int saveIndentLevel=EditorGUI.indentLevel;
		EditorGUI.indentLevel=0;
		Rect contentRect=EditorGUI.IndentedRect(EditorGUILayout.GetControlRect());
		EditorGUILayout.EndHorizontal();
		Rect currentRect=new Rect(contentRect.x, contentRect.y, (contentRect.width)*0.6f, buttonHeight);
		Rect currentRect2=new Rect(contentRect.x+(contentRect.width)*0.6f, contentRect.y, (contentRect.width)*0.4f, buttonHeight);
		EditorGUI.indentLevel=saveIndentLevel;
		foreach (Texture2D ditherPattern in ditherPatterns) {
			PostProcessDither target=((PostProcessDither)postprocessDither.objectReferenceValue);
			if (target!=null) {
				if (target.currentDitherTexture==ditherPattern) {
					GUI.Toggle(currentRect, true, "", GUI.skin.GetStyle("Button"));
				} else {
					if (GUI.Button(currentRect, new GUIContent("", ditherPattern.name))) {
						target.SetDitherPattern(ditherPattern);
					}
				}
			}
			GUI.DrawTexture(currentRect.AddMargin(4f), ditherPattern, ScaleMode.StretchToFill);
			GUI.Label(currentRect2, " "+ditherPattern.height+"x"+ditherPattern.height+" ("+Mathf.RoundToInt(ditherPattern.width/ditherPattern.height)+" Levels)");
			currentRect=new Rect(currentRect.x, currentRect.y+currentRect.height+2, currentRect.width, currentRect.height);
			currentRect2=new Rect(currentRect2.x, currentRect2.y+currentRect2.height+2, currentRect2.width, currentRect2.height);
		}
		GUILayout.Space((buttonHeight+2)*ditherPatterns.Length);
		EditorGUILayout.EndVertical();
	}
	
	void DrawColorFilterOptions() {
		if (useColorFilter.boolValue=EditorGUILayout.BeginToggleGroup(new GUIContent("Color Filtering", "Override final image colors"), useColorFilter.boolValue)) {
			EditorGUI.indentLevel++;
				EditorGUILayout.PropertyField(colorMode);
				EditorGUI.indentLevel++;
					switch (colorMode.enumValueIndex) {
						case ((int)Resolutioner.ColorMode.Monochrome):		DrawMonochromeOptions(); break;
						case ((int)Resolutioner.ColorMode.Grayscale):		DrawGrayscaleOptions(); break;
						case ((int)Resolutioner.ColorMode.BitLimited):		DrawBitLimitOptions(); break;
						case ((int)Resolutioner.ColorMode.FixedPalette):	DrawFixedPaletteOptions(); break;
					}
				EditorGUI.indentLevel--;
			EditorGUI.indentLevel--;
		}
		EditorGUILayout.EndToggleGroup();
	}
	
	void DrawGlowOptions() {
		if (useGlow.boolValue=EditorGUILayout.BeginToggleGroup(new GUIContent("Glow", "Glow effect options"), useGlow.boolValue)) {
			EditorGUI.indentLevel++;
			EditorGUILayout.PropertyField(glowAmount);
			EditorGUILayout.PropertyField(glowBoost);
			EditorGUI.indentLevel--;
		}
		EditorGUILayout.EndToggleGroup();
	}
	
	void DrawMonochromeOptions() {
		EditorGUILayout.PropertyField(lightOffset);
		EditorGUILayout.PropertyField(lightColor);
		EditorGUILayout.PropertyField(darkColor);
	}
	
	void DrawGrayscaleOptions() {
		EditorGUILayout.PropertyField(grayscaleLevels);
		EditorGUILayout.PropertyField(lightOffset);
		EditorGUILayout.PropertyField(lightColor, new GUIContent("Tint Color"));
	}
	
	void DrawBitLimitOptions() {
		EditorGUILayout.PropertyField(colorBitDepth);
		switch (colorBitDepth.enumValueIndex) {
		case ((int)Resolutioner.ColorBitDepth.ThreeBits):	break;
		case ((int)Resolutioner.ColorBitDepth.SixBits):		break;
		case ((int)Resolutioner.ColorBitDepth.EightBits):	break;
		case ((int)Resolutioner.ColorBitDepth.NineBits):	break;
		}
	}
	
	void DrawFixedPaletteOptions() {
		DrawColorPaletteList();
	}
	
	void ProcessPalette(Texture2D palette) {
		ColorMap.Create(palette);
		AssetDatabase.ImportAsset("Assets/Resolutioner/Resources/ProcessedPalettes/"+palette.name+".png");
		AssetDatabase.Refresh();
		OnEnable();
	}
	
	Texture2D FindProcessedPalette(Texture2D originPalette) {
		Texture2D result=null;
		foreach (var processedPalette in processedPalettes) {
			if (processedPalette.name==originPalette.name) {
				result=processedPalette;
				return result;
			}
		}
		return result;
	}
	
	void DrawPixelateOptions() {
		if (usePixelation.boolValue=EditorGUILayout.BeginToggleGroup(new GUIContent("Pixelation", "Set pixels-texels scale"), usePixelation.boolValue)) {
			EditorGUI.indentLevel++;
			EditorGUILayout.PropertyField(pixelScale);
			EditorGUILayout.PropertyField(cameraOrthographicSize);
			pixelScale.intValue=Mathf.Max(1, pixelScale.intValue);
			DrawSubPixelOptions();
			DrawScanlineOptions();
			EditorGUI.indentLevel--;
		}
		EditorGUILayout.EndToggleGroup();
	}
	
	void DrawSubPixelOptions() {
		if (useSubPixels.boolValue=EditorGUILayout.BeginToggleGroup(new GUIContent("Subpixels", "Subpixel layouts and patterns"), useSubPixels.boolValue)) {
			EditorGUI.indentLevel++;
			EditorGUILayout.PropertyField(subPixelScale, new GUIContent("Scale"));
			
			EditorGUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Color Mode");
			EditorGUI.BeginChangeCheck();
			GUILayout.Toggle( pixelColorMode.boolValue, "RGB", GUI.skin.GetStyle("Button"));
			GUILayout.Toggle(!pixelColorMode.boolValue, "CMY", GUI.skin.GetStyle("Button"));
			if (EditorGUI.EndChangeCheck()) {
				pixelColorMode.boolValue=!pixelColorMode.boolValue;
			}
			EditorGUILayout.EndHorizontal();
			
			EditorGUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Brightness");
			int saveIndentLevel=EditorGUI.indentLevel;
			EditorGUI.indentLevel=0;
			brightness.floatValue=EditorGUILayout.Slider(brightness.floatValue, 0, 0.2f);
			EditorGUI.indentLevel=saveIndentLevel;
			EditorGUILayout.EndHorizontal();
			
			EditorGUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Contrast");
			saveIndentLevel=EditorGUI.indentLevel;
			EditorGUI.indentLevel=0;
			contrast.floatValue=EditorGUILayout.Slider(contrast.floatValue, -1, 1);
			EditorGUI.indentLevel=saveIndentLevel;
			EditorGUILayout.EndHorizontal();
			
			float buttonSize=32f;
			EditorGUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Subpixel Image");
			saveIndentLevel=EditorGUI.indentLevel;
			EditorGUI.indentLevel=0;
			Rect contentRect=EditorGUI.IndentedRect(EditorGUILayout.GetControlRect());
			EditorGUILayout.EndHorizontal();
			Rect currentRect=new Rect(contentRect.x, contentRect.y, buttonSize, buttonSize);
			
			EditorGUILayout.BeginVertical();
			foreach (Texture2D pixelTexture in pixelTextures) {
				GetPixelButtonColor(pixelTexture);
				if (GUI.Button(currentRect, new GUIContent("", pixelTexture.name))) {
					PostProcessSubPixels target=((PostProcessSubPixels)postprocessSubPixels.objectReferenceValue);
					if (target!=null) {
						target.SetSubPixelTexture(pixelTexture);
					}
				}
				GUI.DrawTexture(currentRect.AddMargin(4f), pixelTexture, ScaleMode.ScaleToFit);
				currentRect=new Rect(currentRect.x+buttonSize, currentRect.y, currentRect.width, currentRect.height);
			}
			
			currentRect=new Rect(contentRect.x, contentRect.y+buttonSize+2, buttonSize, buttonSize);
			foreach (Texture2D pixelShape in pixelShapes) {
				GetPixelButtonColor(pixelShape);
				if (GUI.Button(currentRect, new GUIContent("", pixelShape.name))) {
					((PostProcessSubPixels)postprocessSubPixels.objectReferenceValue).SetSubPixelTexture(pixelShape);
				}
				GUI.DrawTexture(currentRect.AddMargin(4f), pixelShape, ScaleMode.ScaleToFit);
				currentRect=new Rect(currentRect.x+buttonSize, currentRect.y, currentRect.width, currentRect.height);
			}
			GUILayout.Space(32+16+2);
			EditorGUI.indentLevel=saveIndentLevel;
			GUILayout.EndVertical();
			
			EditorGUI.indentLevel--;
		}
		EditorGUILayout.EndToggleGroup();
		GUI.color=Color.white;
	}
	
	void DrawScanlineOptions() {
		if (useScanlines.boolValue=EditorGUILayout.BeginToggleGroup(new GUIContent("Scanlines", "Overlay scanline pattern"), useScanlines.boolValue)) {
			EditorGUI.indentLevel++;
			
			EditorGUILayout.PropertyField(scanlinesScale, new GUIContent("Scale"));
			EditorGUILayout.PropertyField(scanlineIntensity, new GUIContent("Intensity"));
			
			float buttonSize=32f;
			EditorGUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Pattern");
			int saveIndentLevel=EditorGUI.indentLevel;
			EditorGUI.indentLevel=0;
			Rect contentRect=EditorGUI.IndentedRect(EditorGUILayout.GetControlRect());
			EditorGUILayout.EndHorizontal();
			Rect currentRect=new Rect(contentRect.x, contentRect.y, buttonSize, buttonSize);
			
			EditorGUILayout.BeginVertical();
			foreach (Texture2D scanline in scanlines) {
				GetScanlineButtonColor(scanline);
				if (GUI.Button(currentRect, new GUIContent("", scanline.name))) {
					PostProcessScanlines target=((PostProcessScanlines)postprocessScanlines.objectReferenceValue);
					if (target!=null) {
						target.SetScanlineTexture(scanline);
					}
				}
				GUI.DrawTexture(currentRect.AddMargin(4f), scanline, ScaleMode.ScaleToFit);
				currentRect=new Rect(currentRect.x+buttonSize, currentRect.y, currentRect.width, currentRect.height);
			}
			
			GUILayout.Space(32+2);
			EditorGUI.indentLevel=saveIndentLevel;
			GUILayout.EndVertical();
			
			EditorGUI.indentLevel--;
		}
		EditorGUILayout.EndToggleGroup();
		GUI.color=Color.white;
	}
	
	void GetPixelButtonColor(Texture2D pixelTexture) {
		bool isSelected=(((PostProcessSubPixels)postprocessSubPixels.objectReferenceValue).renderMaterial.GetTexture("_Pixel")==pixelTexture);
		if (isSelected) {
			GUI.color=Color.gray;
		} else {
			GUI.color=Color.white;
		}
	}
	
	void GetScanlineButtonColor(Texture2D scanlineTexture) {
		PostProcessScanlines target=((PostProcessScanlines)postprocessScanlines.objectReferenceValue);
		if (target!=null) {
			bool isSelected=(target.renderMaterial.GetTexture("_Scanline")==scanlineTexture);
			if (isSelected) {
				GUI.color=Color.gray;
			} else {
				GUI.color=Color.white;
			}
		}
	}
	
	void DrawScreenSizeProperty() {
		EditorGUILayout.PropertyField(limitScreenSize);
		int savedIndentLevel=EditorGUI.indentLevel;
		if (limitScreenSize.boolValue) {
			EditorGUILayout.BeginHorizontal();
			EditorGUILayout.PrefixLabel("Max Screen Size");
			EditorGUI.indentLevel=0;
			maxWidth.intValue =EditorGUILayout.IntField(maxWidth.intValue );
			EditorGUILayout.LabelField("x", GUILayout.Width(10));
			maxHeight.intValue=EditorGUILayout.IntField(maxHeight.intValue);
			EditorGUILayout.EndHorizontal();
		}
		EditorGUI.indentLevel=savedIndentLevel;
	}
	
	void DrawResolutionList() {
		aspectRatios.arraySize=EditorGUILayout.IntField("Aspect Ratios", aspectRatios.arraySize);
		for (int i = 0; i < aspectRatios.arraySize; i++) {
			SerializedProperty currentRatio=aspectRatios.GetArrayElementAtIndex(i);
			EditorGUILayout.PropertyField(currentRatio);
		}
	}
	
	void GetProperties() {
		useResolution		=serializedObject.FindProperty("useResolution");
		useDithering		=serializedObject.FindProperty("useDithering");
		useColorFilter		=serializedObject.FindProperty("useColorFilter");
		usePixelation		=serializedObject.FindProperty("usePixelation");
		useSubPixels		=serializedObject.FindProperty("useSubPixels");
		useScanlines		=serializedObject.FindProperty("useScanlines");
		useGlow				=serializedObject.FindProperty("useGlow");
		useGizmos			=serializedObject.FindProperty("useGizmos");
		
		postprocessDither	=serializedObject.FindProperty("postprocessDither");
		postprocessColor	=serializedObject.FindProperty("postprocessColor");
		postprocessSubPixels=serializedObject.FindProperty("postprocessSubPixels");
		postprocessScanlines=serializedObject.FindProperty("postprocessScanlines");
		//postprocessGlow		=serializedObject.FindProperty("postprocessGlow");
		//postprocessPixelate	=serializedObject.FindProperty("postprocessPixelate");
		
		cameraOrthographicSize=serializedObject.FindProperty("cameraOrthographicSize");
		ditherMode			=serializedObject.FindProperty("ditherMode");
		colorMode			=serializedObject.FindProperty("colorMode");
		colorBitDepth		=serializedObject.FindProperty("colorBitDepth");
		pixelScale			=serializedObject.FindProperty("pixelScale");
		brightness			=serializedObject.FindProperty("brightness");
		contrast			=serializedObject.FindProperty("contrast");
		gammaCorrection		=serializedObject.FindProperty("gammaCorrection");
		pixelColorMode		=serializedObject.FindProperty("pixelColorMode");
		grayscaleLevels		=serializedObject.FindProperty("grayscaleLevels");
		lightOffset			=serializedObject.FindProperty("lightOffset");
		lightColor			=serializedObject.FindProperty("lightColor");
		darkColor			=serializedObject.FindProperty("darkColor");
		scanlineIntensity	=serializedObject.FindProperty("scanlineIntensity");
		glowAmount			=serializedObject.FindProperty("glowAmount");
		glowBoost			=serializedObject.FindProperty("glowBoost");
	
		orientation			=serializedObject.FindProperty("orientation");
		limitScreenSize		=serializedObject.FindProperty("limitScreenSize");
		maxWidth			=serializedObject.FindProperty("maxWidth");
		maxHeight			=serializedObject.FindProperty("maxHeight");
		aspectRatios		=serializedObject.FindProperty("aspectRatios");
		pixelScale			=serializedObject.FindProperty("pixelScale");
		subPixelScale		=serializedObject.FindProperty("subPixelScale");
		scanlinesScale		=serializedObject.FindProperty("scanlinesScale");
	}
}
#endif

public static class ResolutionerExtensionMethods {
	
	
	public static Rect AddMargin(this Rect inputRect, float margin) {
		return new Rect(inputRect.x+margin, inputRect.y+margin, inputRect.width-2*margin, inputRect.height-2*margin);
	}
	
	public static Rect SquareInsideRect(this Rect inputRect) {
		float horMargin=(inputRect.width-inputRect.height)*0.5f;
		return new Rect(inputRect.x+horMargin, inputRect.y, inputRect.width-2*horMargin, inputRect.height);
	}
}