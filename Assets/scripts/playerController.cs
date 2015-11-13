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
	private float distanceCounter;
	public GameObject PuntajeController;

	void Start() {
		areRunningEnabled = false;
		advance = new Vector3(1, 0, 0);
		distanceCounter = 0f;
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
			distanceCounter += runningSpeed / 10f;
		}


		updatePuntajeController(distanceCounter);
	}

	void updatePuntajeController(float distanceCounter) {
		PuntajeController.SendMessage("updateCounter", distanceCounter);
	}

	void startRunning() {
		areRunningEnabled = true;
	}
}
