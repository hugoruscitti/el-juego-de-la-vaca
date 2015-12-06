using UnityEngine;
using System.Collections;

public class motion : MonoBehaviour {
	public float speed;

	void Update () {
		transform.position = new Vector3(transform.position.x - speed, transform.position.y, transform.position.z);

		if (transform.position.x < -80) {
			transform.position = new Vector3(58, transform.position.y, transform.position.z);
		}
	}
}
