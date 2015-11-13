using UnityEngine;
using System.Collections;

public class IsVisible : MonoBehaviour {
	public bool isVisibleFromCamera;
	public GameObject cielo;

	void Update () {
		//isVisibleFromCamera = cielo.GetComponent<Renderer>().IsVisibleFrom(Camera.main);

		//if (!isVisibleFromCamera) {
		//cielo.SendMessage("moveToRight");
		//}
	}


}
