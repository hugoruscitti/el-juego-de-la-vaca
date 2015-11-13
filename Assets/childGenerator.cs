using UnityEngine;
using System.Collections;

public class childGenerator : MonoBehaviour {
	public GameObject[] prefabFactory;
	public float counter;
	public float timeToSpawnLimit;
	private float timeToSpawn;
	public GameObject camera;
	public float randomDistance;
	public float initialXPosition;


	void Start () {
		counter = 0.0f;
		timeToSpawn = 0.0f;
	}

	void Update () {
		counter += Time.deltaTime;
		timeToSpawn += Time.deltaTime;

		if (timeToSpawn > timeToSpawnLimit) {
			timeToSpawn -= timeToSpawnLimit;
			spawnOnePrefab();
		}
	}

	void spawnOnePrefab() {
		float x = camera.transform.position.x + Random.Range(-randomDistance, randomDistance) + initialXPosition;
		float y = camera.transform.position.y + Random.Range(-randomDistance, randomDistance);

		GameObject newObject = Instantiate(prefabFactory[0]);
		newObject.transform.parent = gameObject.transform;
		newObject.transform.position = new Vector3(x , y, transform.position.z);
	}
}
