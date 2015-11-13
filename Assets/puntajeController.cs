using UnityEngine;
using System.Collections;

public class puntajeController : MonoBehaviour {
	public GameObject TextoPuntaje;

	// Use this for initialization
	void Start () {
		definirPuntaje(0);
	}

	// Update is called once per frame
	void Update () {

	}

	void definirPuntaje(int puntaje) {
		TextoPuntaje.GetComponent<EasyFontTextMesh>().Text = puntaje.ToString() + " Metros";
	}

	void updateCounter(float nuevoContador) {
		definirPuntaje((int)nuevoContador);
	}
}
