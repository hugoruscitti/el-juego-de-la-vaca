using UnityEngine;
using System.Collections;
using CnControls;

public class playerController : MonoBehaviour {
	public float speed;
	private Vector3 newPos;

	void Update () {
		Vector3 position = new Vector3(transform.position.x, transform.position.y, transform.position.z);

		Vector3 movementKeyboard = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
		Vector3 movementJoystick = new Vector3(CnInputManager.GetAxis("Horizontal"), 0, CnInputManager.GetAxis("Vertical"));

		newPos = position + (movementKeyboard + movementJoystick) * speed;
	}

	void FixedUpdate() {
		transform.position = newPos;
	}
}
