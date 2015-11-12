using UnityEngine;
using System.Collections;

public class followCow : MonoBehaviour {
	public GameObject cow;
	public float cameraSpeed;
	public float deltaPosition;
	private bool followEnabled;

	void Start () {
		followEnabled = false;
	}

	void FixedUpdate () {
		if (followEnabled) {
			Vector3 cameraPosition = transform.position;
			cameraPosition.x = cow.transform.position.x - deltaPosition;
			transform.position = Vector3.Lerp(transform.position, cameraPosition, cameraSpeed * Time.fixedDeltaTime);
		}
	}

	void startFollowCow() {
		followEnabled = true;
	}
}
