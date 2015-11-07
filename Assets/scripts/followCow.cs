using UnityEngine;
using System.Collections;

public class followCow : MonoBehaviour {
	public GameObject cow;
	public float cameraSpeed;
	public float deltaPosition;

	void Start () {

	}

	void FixedUpdate () {
		Vector3 cameraPosition = transform.position;
		cameraPosition.x = cow.transform.position.x - deltaPosition;
		transform.position = Vector3.Lerp(transform.position, cameraPosition, cameraSpeed * Time.fixedDeltaTime);
	}
}
