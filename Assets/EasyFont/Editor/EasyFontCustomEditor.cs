using System;
using UnityEngine;
using System.Collections;
using UnityEditor;
using System.Reflection;
using UnityEditorInternal;
using System.Collections.Generic;
using System.Linq;


[CustomEditor (typeof (EasyFontTextMesh))]
[CanEditMultipleObjects]
public class EasyFontCustomEditor : Editor {
	
	
	private bool		wasPrefabModified;
	private bool 		isFirstTime = true;
	private string[]	sortingLayersNames;
	private int 		popupSortingLayersIndex;

	void OnEnable()
	{
		EasyFontTextMesh customFont = target as EasyFontTextMesh;
		
		if (customFont.GUIChanged || isFirstTime)
		{
			//customFont.RefreshMeshEditor();
			RefreshAllSceneText(); //Refresh all test to solve the duplicate command issue (Text is not seeing when duplicating). Comment this line an use line above if you have a lot of text
									// and are sufferig slowdonws in the editor when selecting texts
			isFirstTime = false; //This is a hack because on enable is called a lot of times because of the porpertie font
		}

		sortingLayersNames = GetSortingLayerNames();

		//Initialize shorting layer index
		for (int i = 0; i< sortingLayersNames.Length ; i++)
		{
			if (sortingLayersNames[i] == customFont.GetComponent<Renderer>().sortingLayerName)
				popupSortingLayersIndex = i;
		}


	}


	void OnDisable()
	{
		EasyFontTextMesh customFont = target as EasyFontTextMesh;
		
		if (customFont.GUIChanged) //Hack because of the properties is calling this even if there is no OnDisable
			isFirstTime = true;
	}
	
	public override void OnInspectorGUI()
	{
		serializedObject.Update();


		DrawDefaultInspector();
		
		EasyFontTextMesh customFont = target as EasyFontTextMesh;
	
		
		//SerializedObject serializedObject = new SerializedObject(customFont);


		SerializedProperty serializedText 				= serializedObject.FindProperty("_privateProperties.text");
		SerializedProperty serializedFontType 			= serializedObject.FindProperty("_privateProperties.font");
		SerializedProperty serializedDetailMaterial 	= serializedObject.FindProperty("_privateProperties.customDetailMaterial");
		SerializedProperty serializedFontSize 			= serializedObject.FindProperty("_privateProperties.fontSize");
		SerializedProperty serializedCharacterSize 		= serializedObject.FindProperty("_privateProperties.size");
		SerializedProperty serializedTextAnchor 		= serializedObject.FindProperty("_privateProperties.textAnchor");
		SerializedProperty serializedTextAlignment 		= serializedObject.FindProperty("_privateProperties.textAlignment");
		SerializedProperty serializedLineSpacing 		= serializedObject.FindProperty("_privateProperties.lineSpacing");
		SerializedProperty serializedFontFillType 		= serializedObject.FindProperty("_privateProperties.fillColorStyle");
		SerializedProperty serializedFontColorTop 		= serializedObject.FindProperty("_privateProperties.fontColorTop");
		SerializedProperty serializedFontColorBottom 	= serializedObject.FindProperty("_privateProperties.fontColorBottom");
		SerializedProperty serializedFillMaterial 		= serializedObject.FindProperty("_privateProperties.fillMaterial");
		SerializedProperty serializedEnableShadow 		= serializedObject.FindProperty("_privateProperties.enableShadow");
		SerializedProperty serializedShadowColor 		= serializedObject.FindProperty("_privateProperties.shadowColor");
		SerializedProperty serializedShadowDistance 	= serializedObject.FindProperty("_privateProperties.shadowDistance");
		SerializedProperty serializedEnableOutline 		= serializedObject.FindProperty("_privateProperties.enableOutline");
		SerializedProperty serializedOutlineColor 		= serializedObject.FindProperty("_privateProperties.outlineColor");
		SerializedProperty serializedOutlineWidth 		= serializedObject.FindProperty("_privateProperties.outLineWidth");
		SerializedProperty serializedOutLineQuality		= serializedObject.FindProperty("_privateProperties.outlineQuality");
		SerializedProperty serializedSortingLayerOrder	= serializedObject.FindProperty("_privateProperties.sortingLayerOrder");
		SerializedProperty serializedSortingLayerName	= serializedObject.FindProperty("_privateProperties.sortingLayerName");
		
		SerializedProperty[] allSerializedProperties = new SerializedProperty[21]
		{	
			serializedText, serializedFontType, serializedDetailMaterial , serializedFontSize, serializedCharacterSize,serializedTextAnchor, serializedTextAlignment,
			serializedLineSpacing, serializedFontFillType, serializedFontColorTop, serializedFontColorBottom, serializedFillMaterial, serializedEnableShadow, serializedShadowColor, serializedShadowDistance,
			serializedEnableOutline, serializedOutlineColor, serializedOutlineWidth, serializedOutLineQuality, serializedSortingLayerOrder, serializedSortingLayerName
		};
        
		#region properties

		GUIStyle textColor = new GUIStyle();

		//Render settings
		if(serializedSortingLayerName.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedSortingLayerName.prefabOverride);

		popupSortingLayersIndex = EditorGUILayout.Popup("Sorting Layer",popupSortingLayersIndex,sortingLayersNames);
		serializedSortingLayerName.stringValue = sortingLayersNames[popupSortingLayersIndex];

		if(serializedSortingLayerOrder.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedSortingLayerOrder.prefabOverride);

		EditorGUILayout.PropertyField(serializedSortingLayerOrder, new GUIContent("Order In layer", "Sets the Z shorting index in this layer"));


		//Text
		if(serializedText.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedText.prefabOverride);
		
		EditorGUILayout.LabelField(new GUIContent("Text", "This is the text that is going to be used"));
		EditorGUILayout.BeginVertical("box");

		serializedText.stringValue = EditorGUILayout.TextArea(serializedText.stringValue);

		
		EditorGUILayout.EndVertical();

		//Font
		if(serializedFontType.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedFontType.prefabOverride);

		EditorGUILayout.PropertyField(serializedFontType, new GUIContent("Font","The desired font type"));
	
		if (customFont.FontType == null)
		{
			customFont.FontType = Resources.GetBuiltinResource(typeof(Font), "Arial.ttf") as Font; 
		}
		
		//Font material
		if(serializedDetailMaterial.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedDetailMaterial.prefabOverride);

		if (customFont.FillColorStyle != EasyFontTextMesh.FILL_COLOR_STYLE.textureGradient)
		{
			EditorGUILayout.PropertyField(serializedDetailMaterial, new GUIContent("Detail Material", "Used for additional FX"));
		}
		else
		{
			textColor.normal.textColor = Color.red;
			EditorGUILayout.BeginHorizontal();
			//EditorGUILayout.LabelField("Detail material is Disabled when TextureGradient Font Color Style is selected", textColor);
			EditorGUILayout.LabelField(new GUIContent( "Detail material","Disabled when TextureGradient Font Color Style is selected"), textColor);
			EditorGUILayout.LabelField(new GUIContent( "DISABLED", "Disabled when TextureGradient Font Color Style is selected"), textColor);
			EditorGUILayout.EndHorizontal();
		}

		if (customFont.FontType == null)
		{
			customFont.FontType = Resources.GetBuiltinResource(typeof(Font), "Arial.ttf") as Font; 
		}
		
		//Font Size
		if(serializedFontSize.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedFontSize.prefabOverride);
			

		EditorGUILayout.PropertyField(serializedFontSize, new GUIContent("Font size", "This is the actual font size. It will set the texture size"));
		
		//CharacterSize

		if(serializedCharacterSize.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedCharacterSize.prefabOverride);

		//serializedCharacterSize.floatValue = EditorGUILayout.FloatField(new GUIContent("Character size", "How big the characters are going to be renderer"), serializedCharacterSize.floatValue); 
		EditorGUILayout.PropertyField(serializedCharacterSize, new GUIContent("Character Size", "How big the characters are going to be renderer"));

		//Text anchor
		if(serializedTextAnchor.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedTextAnchor.prefabOverride);

		EditorGUILayout.PropertyField(serializedTextAnchor, new GUIContent("Text Anchor", "Position of the texts pivot's point"));

		//Text alignment
		if(serializedTextAlignment.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedTextAlignment.prefabOverride);

		EditorGUILayout.PropertyField(serializedTextAlignment, new GUIContent("Text alignment", "Line alignment"));

		//Line spacing
		if(serializedLineSpacing .isInstantiatedPrefab)
			SetBoldDefaultFont(serializedLineSpacing.prefabOverride);

		EditorGUILayout.PropertyField(serializedLineSpacing,  new GUIContent("Line spacing", "Distance between lines"));
		
		// Font color
		if (serializedFontFillType.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedFontFillType.prefabOverride);

		EditorGUILayout.PropertyField(serializedFontFillType, new GUIContent("Font Color Style", "The fill color style"));

		EditorGUILayout.BeginVertical("box");	

		switch (customFont.FillColorStyle)
		{
			case EasyFontTextMesh.FILL_COLOR_STYLE.single:

				if(serializedFontColorTop.isInstantiatedPrefab)
					SetBoldDefaultFont(serializedFontColorTop.prefabOverride);
				
				EditorGUILayout.PropertyField(serializedFontColorTop, new GUIContent("Color", "Color for the top"));

			break;

			case EasyFontTextMesh.FILL_COLOR_STYLE.gradient:
				
				if(serializedFontColorTop.isInstantiatedPrefab)
					SetBoldDefaultFont(serializedFontColorTop.prefabOverride);
				
				EditorGUILayout.PropertyField(serializedFontColorTop, new GUIContent("Top Color", "Color for the top"));
				
				if(serializedFontColorBottom.isInstantiatedPrefab)
					SetBoldDefaultFont(serializedFontColorBottom.prefabOverride);
				
				EditorGUILayout.PropertyField(serializedFontColorBottom, new GUIContent("Bottom Color", "Color for the bottom"));	

				
			break;

			case EasyFontTextMesh.FILL_COLOR_STYLE.textureGradient:
				
				if(serializedFillMaterial.isInstantiatedPrefab)
					SetBoldDefaultFont(serializedFillMaterial.prefabOverride);
				
				EditorGUILayout.PropertyField(serializedFillMaterial, new GUIContent("Fill material", "The desired fill material for the letters. Don't forget to assign the font texture correctly"));

				customFont.CustomDetailMaterial = null; //Detail material is not compatible with texture gradient because both uses second uv chanell
				
			EditorGUILayout.HelpBox("Detail Material is not compatible with TextureGradient fill style. It will be automatically disabled", MessageType.Warning);

			break;
		}

		EditorGUILayout.EndVertical();	
		
		// Shadow
		if(serializedEnableShadow.isInstantiatedPrefab)
			SetBoldDefaultFont(serializedEnableShadow.prefabOverride);
		
		EditorGUILayout.PropertyField(serializedEnableShadow, new GUIContent("Enable Shadow", "Enable/Disable shadow"));
		
		if (customFont.EnableShadow) //Only show the options when enabled
		{
			EditorGUILayout.BeginVertical("box");
			
			if(serializedShadowColor.isInstantiatedPrefab)
				SetBoldDefaultFont(serializedShadowColor.prefabOverride);
			
			EditorGUILayout.PropertyField(serializedShadowColor, new GUIContent("Shadow color", "Sets the sahdow's color"));

			if(serializedShadowDistance.isInstantiatedPrefab)
				SetBoldDefaultFont(serializedShadowDistance.prefabOverride);

			serializedShadowDistance.vector3Value = EditorGUILayout.Vector3Field(new GUIContent("Shadow distance", "The distance between the main characters and its shadow"), serializedShadowDistance.vector3Value);

			EditorGUILayout.EndVertical();
		}
		
		
		//Outline
		if(serializedEnableOutline.isInstantiatedPrefab)
				SetBoldDefaultFont(serializedEnableOutline.prefabOverride);

		EditorGUILayout.PropertyField(serializedEnableOutline, new GUIContent("Enable Outline", "Enable/Disable the text's outline"));

		if (customFont.EnableOutline) //Only show the options when enabled
		{
			EditorGUILayout.BeginVertical("box");
			
			if(serializedOutlineColor.isInstantiatedPrefab)
				SetBoldDefaultFont(serializedOutlineColor.prefabOverride);

			EditorGUILayout.PropertyField(serializedOutlineColor, new GUIContent("Outline color", "Sets the ouline color"));

			if(serializedOutlineWidth.isInstantiatedPrefab)
				SetBoldDefaultFont(serializedOutlineWidth.prefabOverride);

			EditorGUILayout.PropertyField(serializedOutlineWidth,  new GUIContent("Outline width", "Sets the outline width"));

			if(serializedOutLineQuality.isInstantiatedPrefab)
				SetBoldDefaultFont(serializedOutLineQuality.prefabOverride);

			EditorGUILayout.PropertyField(serializedOutLineQuality, new GUIContent("High Quality", "Increase the number of vertex but gives better results"));

			EditorGUILayout.EndVertical();
		}
		
		#endregion
		
		#region buttons and info
		
		if (GUILayout.Button("Refresh"))
		{
			Debug.Log("Refreshing Text mesh");
			//customFont.RefreshMeshEditor(); //Because clicking the button produces a GUIChange this is done automaticcaly
			
		} 
		
		if (GUILayout.Button("Refresh all"))
		{
			RefreshAllSceneText();
			//OnPlayModeChanged();
		}
		
		GUIStyle buttonStyleRed = new GUIStyle("button");
		buttonStyleRed.normal.textColor = Color.red;
		
		if (GUILayout.Button("Destroy Text component",buttonStyleRed))
		{
			Renderer tempRenderer = customFont.gameObject.GetComponent<Renderer>();
			MeshFilter	tempMeshFilter = customFont.GetComponent<MeshFilter>();
			DestroyImmediate(customFont);
			DestroyImmediate(tempRenderer);
			DestroyImmediate(tempMeshFilter.sharedMesh);
			DestroyImmediate(tempMeshFilter);
			return;
		}
		

		textColor.normal.textColor = Color.green;
		EditorGUILayout.LabelField (string.Format("Vertex count {0}", customFont.GetVertexCount().ToString()),textColor);
		if (customFont.GetComponent<Renderer>().sharedMaterial != null)
		{
			if (customFont.GetComponent<Renderer>().sharedMaterial.mainTexture != null)
				EditorGUILayout.LabelField (string.Format("Font Texture Size {0} x {1}", customFont.GetComponent<Renderer>().sharedMaterial.mainTexture.width.ToString(),customFont.GetComponent<Renderer>().sharedMaterial.mainTexture.height.ToString()),textColor);
			else
			{
				textColor.normal.textColor = Color.red;
				EditorGUILayout.LabelField (string.Format("Font Texture Size {0}", "Texture is Null",textColor));
			}
		}
		
		
		#endregion
		
		#region prefab checks
		//Check if the prefab has changed to refresh the text
		bool checkCurrentPrefabModification = false;
		
		PropertyModification[] modifiedProperties = PrefabUtility.GetPropertyModifications((UnityEngine.Object)customFont);
		if (modifiedProperties != null && modifiedProperties.Length > 0)
		{
			for (int i = 0; i<modifiedProperties.Length; i++)
			{
				foreach (SerializedProperty serializerPropertyIterator in allSerializedProperties)
				{
					if (serializerPropertyIterator.propertyPath == modifiedProperties[i].propertyPath)
					{
						wasPrefabModified = true;
						checkCurrentPrefabModification = true;
					}
				}
			}
			
		}
		else
		{
			checkCurrentPrefabModification = false;			
		}
		
		if (wasPrefabModified && !checkCurrentPrefabModification)
		{
			RefreshAllSceneText();
			wasPrefabModified = false;
		}
		
		//Security check. If the mesh is null a prefab revert has been made
		if (customFont.GetComponent<MeshFilter>().sharedMesh == null)
			customFont.RefreshMeshEditor();
			
		#endregion

		serializedObject.ApplyModifiedProperties();

		//Track changes

		customFont.GUIChanged = GUI.changed;

		if (customFont.GUIChanged)
		{

			RefreshSelectedText();
			EditorUtility.SetDirty(customFont);
		}

		//If you undo with a multiple selection the GuiChange is not called.... So here it s a workaround

		if (Event.current.commandName == "UndoRedoPerformed") {
			RefreshSelectedText();
		}
		
		
		
	}
	
	
	void RefreshAllSceneText()
	{
		UnityEngine.Object[] customFonts = Resources.FindObjectsOfTypeAll(typeof(EasyFontTextMesh));
		
		if (customFonts.Length > 0)
		{
			for (int i= 0; i < customFonts.Length; i++)
			{
				if (AssetDatabase.GetAssetPath(customFonts[i]) == "") //Only affect the scene assets
				{
					EasyFontTextMesh tempCustomFont =  (EasyFontTextMesh)customFonts[i];	
					tempCustomFont.RefreshMeshEditor(); 
				}
			}
		}
		
	}

	void RefreshSelectedText()
	{
		foreach(GameObject iteratorGameObject in Selection.gameObjects)
		{
			EasyFontTextMesh temp = iteratorGameObject.GetComponent<EasyFontTextMesh>();
			
			if (temp != null)
				temp.RefreshMeshEditor();
		}
	}
	
	private MethodInfo boldFontMethodInfo = null;
 
	private void SetBoldDefaultFont(bool value) {
	    
		boldFontMethodInfo = typeof(EditorGUIUtility).GetMethod("SetBoldDefaultFont", BindingFlags.Static | BindingFlags.NonPublic);
		boldFontMethodInfo.Invoke(null, new[] { value as object });
	}


	/// <summary>
	/// Gets the sorting layer names. This is a helper method because Unity doesn't expose the sorting layer names easily
	/// </summary>
	/// <returns>The sorting layer names.</returns>
	private string[] GetSortingLayerNames() 
	{
		Type internalEditorUtilityType = typeof(InternalEditorUtility);
		PropertyInfo sortingLayersProperty = internalEditorUtilityType.GetProperty("sortingLayerNames", BindingFlags.Static | BindingFlags.NonPublic);
		string[] sortingLayers = (string[])sortingLayersProperty.GetValue(null, new object[0]);
		
		return sortingLayers;

	}

	
}
