using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEditor.Progress;

public class Banana : MonoBehaviour
{

    public IEnumerator OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            //other.GetComponent<Rigidbody>().velocity = Vector3.zero;
            other.GetComponent<Rigidbody>().drag = 100f;
            yield return new WaitForSeconds(.05f);
            other.GetComponent<Rigidbody>().drag = 0.1f;
            Destroy(gameObject);
        }
    }
}
