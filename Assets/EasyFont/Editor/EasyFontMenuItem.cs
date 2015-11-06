using UnityEngine;
using System.Collections;
using UnityEditor;

public class EasyFontMenuItem : Editor {



	// Use this for initialization
	//[MenuItem("GameObject/CreateOther/EasyFontTextMesh")]
	[MenuItem("GameObject/Create Other/EasyFont TextMesh")]
	static void CreateEasyFontObject () {
		GameObject tempGameObject = new GameObject();
		tempGameObject.name = "EasyFontTextMesh";
		tempGameObject.AddComponent<EasyFontTextMesh>();
		tempGameObject.GetComponent<EasyFontTextMesh>().RefreshMeshEditor();
		Selection.activeGameObject = tempGameObject;
	}



}
