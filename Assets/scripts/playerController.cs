using UnityEngine;
using System.Collections;
using CnControls;

public class playerController : MonoBehaviour {
	public float speed;
	private Vector3 direction;
	public GameObject target;
	private Vector3 advance;
	public float runningSpeed;

	void Start() {
		advance = new Vector3(1, 0, 0);
	}

	void Update () {
		Vector3 movementKeyboard = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
		Vector3 movementJoystick = new Vector3(CnInputManager.GetAxis("Horizontal"), 0, CnInputManager.GetAxis("Vertical"));

		direction = (movementKeyboard + movementJoystick) * speed;
	}

	void FixedUpdate() {
		target.transform.Translate(direction);
		target.transform.Translate(advance * runningSpeed);
	}
}
