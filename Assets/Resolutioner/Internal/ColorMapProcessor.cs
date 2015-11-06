#if UNITY_EDITOR
using UnityEngine;
using UnityEditor;

public class ColorMapProcessor : AssetPostprocessor {
	
	void OnPreprocessTexture() {
		
		if(assetPath.Contains("Resources/ProcessedPalettes") || assetPath.Contains("Resources/Palettes") || assetPath.Contains("Resources/Ramps") || assetPath.Contains("Resources/Pixel") || assetPath.Contains("Resources/Scanlines")) {
			TextureImporter importer = assetImporter as TextureImporter;
			importer.textureType  = TextureImporterType.Advanced;
			importer.textureFormat = TextureImporterFormat.AutomaticTruecolor;
			importer.isReadable = true;
			importer.filterMode = FilterMode.Point;
			importer.npotScale = TextureImporterNPOTScale.None;
			importer.mipmapEnabled = false;
			importer.spriteImportMode = SpriteImportMode.None;
			
			Object asset = AssetDatabase.LoadAssetAtPath(importer.assetPath, typeof(Texture2D));
			if (asset) {
				EditorUtility.SetDirty(asset);
			} else {
				importer.textureType  = TextureImporterType.Advanced ;   
			}
		}
		
	}
}
#endif