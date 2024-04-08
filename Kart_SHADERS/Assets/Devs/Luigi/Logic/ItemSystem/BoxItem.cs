using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoxItem : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            if (other.gameObject.GetComponent<ItemManager>().typeOfItem == 0)
            {
                other.gameObject.GetComponent<ItemManager>().typeOfItem = Random.Range(1, 3);
                print(other.gameObject.GetComponent<ItemManager>().typeOfItem);
            }
            Destroy(gameObject);
        }
    }
}
