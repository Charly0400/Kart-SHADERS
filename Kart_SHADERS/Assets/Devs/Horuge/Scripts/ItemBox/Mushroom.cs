using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEditor.Progress;

public class Mushroom : MonoBehaviour
{
    private Player player;

    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player").GetComponent<Player>();
    }

    public void Activate()
    {
        player.itemA -= 1;
        player.speed += 5;
        player.Invoke("OgSpeed", 5f);
        player.boosted = true;
    }
}
