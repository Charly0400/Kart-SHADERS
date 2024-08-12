using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BananaLogic : MonoBehaviour
{
    private void Awake()
    {
        gameObject.GetComponent<Rigidbody>().useGravity = false;
    }
    public IEnumerator OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            print(collision.gameObject);
            collision.gameObject.GetComponent<Rigidbody>().drag = 100f;
            gameObject.GetComponent<MeshRenderer>().enabled = false;
            yield return new WaitForSeconds(.05f);
            collision.gameObject.GetComponent<Rigidbody>().drag = 0.1f;
            Destroy(gameObject);
            print("return original drag");

        }
    }
}

