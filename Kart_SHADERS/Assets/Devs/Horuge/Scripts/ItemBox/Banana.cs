using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Banana : MonoBehaviour
{
    [SerializeField] string playerTag = "Player";
    private float originalPlayerSpeed;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(playerTag))
        {
            Player playerScript = other.GetComponent<Player>();
            if (playerScript != null)
            {
                originalPlayerSpeed = playerScript.speed;
                playerScript.speed = 0f;
                Destroy(gameObject);
                playerScript.Invoke("OgSpeed", 2f);
            }
            else
            {
                Debug.LogError("No se encontró el script del jugador en el objeto colisionado.");
            }
        }
    }
}
