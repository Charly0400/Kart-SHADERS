using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BoxItem : MonoBehaviour
{
    private bool canActivate = true;
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            print(other.gameObject);
            if (other.gameObject.GetComponentInParent<ItemManager>().typeOfItem == 0)
            {
                other.gameObject.GetComponentInParent<ItemManager>().typeOfItem = Random.Range(1, 3);
                canActivate = false;
                gameObject.SetActive(false);
                Invoke("Reactive", 1f);
            }

        }
    }

    //private void OnCollisionEnter(Collision collision)
    //{
    //    print(collision.gameObject);
    //    if (collision.gameObject.CompareTag("Player"))
    //    {
    //        if (collision.gameObject.GetComponent<ItemManager>().typeOfItem == 0)
    //        {
    //            collision.gameObject.GetComponent<ItemManager>().typeOfItem = Random.Range(1, 3);
    //            canActivate = false;
    //            gameObject.SetActive(false);
    //            Invoke("Reactive", 10f);
    //        }

    //    }
    //}
    private void Reactive()
    {
        canActivate = true;
        gameObject.SetActive(true);
    }

}
