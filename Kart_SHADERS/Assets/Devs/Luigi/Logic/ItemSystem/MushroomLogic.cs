using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.Vehicles.Car;

public class MushroomLogic : MonoBehaviour
{
    private GameObject player;
    private Vector3 OGVelocity;
  public IEnumerator Boost()
    {
        OGVelocity = player.GetComponent<Rigidbody>().velocity;
        print("boost");
        player = GameObject.FindGameObjectWithTag("Player");
        print(player);
        player.GetComponent<Rigidbody>().velocity = player.GetComponent<Rigidbody>().velocity * 10f;
        yield return new WaitForSeconds(0.5f);
        player.GetComponent<Rigidbody>().velocity = OGVelocity;
    }
}
