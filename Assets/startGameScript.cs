using UnityEngine;
using System.Collections;

public class startGameScript : MonoBehaviour {
	public GameObject camera;
	public GameObject playerController;

	void onEndInitialJump () {
		playerController.SendMessage("startRunning");
		camera.SendMessage("startFollowCow");
	}

}
