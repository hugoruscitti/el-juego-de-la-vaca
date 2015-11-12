using UnityEngine;
using System.Collections;
using CnControls;

public class playerController : MonoBehaviour {
	public float speed;
	private Vector3 direction;
	public GameObject target;
	private Vector3 advance;
	public float runningSpeed;
	public float reduceHorizontalSpeedFactor;
	private bool areRunningEnabled;

	void Start() {
		areRunningEnabled = false;
		advance = new Vector3(1, 0, 0);
	}

	void Update () {
		Vector3 movementKeyboard = new Vector3(Input.GetAxis("Horizontal") * reduceHorizontalSpeedFactor, 0, Input.GetAxis("Vertical"));
		Vector3 movementJoystick = new Vector3(CnInputManager.GetAxis("Horizontal") * reduceHorizontalSpeedFactor, 0, CnInputManager.GetAxis("Vertical"));

		direction = (movementKeyboard + movementJoystick) * speed;
	}

	void FixedUpdate() {
		if (areRunningEnabled) {
			target.transform.Translate(direction);
			target.transform.Translate(advance * runningSpeed);
		}
	}

	void startRunning() {
		areRunningEnabled = true;
	}
}
