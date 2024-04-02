using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEditor.Progress;

public class Banana : MonoBehaviour
{
    [SerializeField] string playerTag = "Player";
    private float originalPlayerSpeed;
    private Player player;

    void Start()
    {
        player = GameObject.FindGameObjectWithTag(playerTag).GetComponent<Player>();
    }

    public void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(playerTag))
        {
            if (player != null)
            {
                originalPlayerSpeed = player.speed;
                player.speed = 0f;
                Destroy(gameObject);
                player.Invoke("OgSpeed", 2f);
            }
            else
            {
                Debug.LogError("No se encontró el script del jugador en el objeto colisionado.");
            }
        }
    }

    public void Activate()
    {
        player.itemB -= 1;
        Instantiate(player.banana, player.bananaSpawner.position, Quaternion.identity);
    }
}
