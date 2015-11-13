using UnityEngine;
using System.Collections;

public class MoveToRight : MonoBehaviour {

	void moveToRight() {
		float delta = GetComponent<BoxCollider2D>().size.x * transform.localScale.x;
		transform.position = new Vector3(transform.position.x + delta, transform.position.y, transform.position.z);
	}

}
