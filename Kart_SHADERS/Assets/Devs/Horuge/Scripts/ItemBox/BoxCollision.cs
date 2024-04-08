using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEditor.Progress;

public class BoxCollision : MonoBehaviour
{
    private bool canActivate = true;

    private void OnTriggerEnter(Collider other)
    {
        if (canActivate && other.CompareTag("Player"))
        {
            Player player = other.GetComponent<Player>();

            if (player != null)
            {
                int randomItem = Random.Range(0, 2);
                player.AddItem(randomItem);
                canActivate = false;
                gameObject.SetActive(false);
                Invoke("Reactivate", 10f);
            }
        }
    }

    private void Reactivate()
    {
        canActivate = true;
        gameObject.SetActive(true);
    }
}
