using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public int itemA = 0;
    public int itemB = 0;
    public int maxItems = 1;

    public bool boosted = false;
    
    public Banana bananaScript;
    public Mushroom mushroomScript;

    public GameObject banana;
    public Transform bananaSpawner;

    public float speed = 5f;

    void Start()
    {
        bananaScript = banana.GetComponent<Banana>();
        mushroomScript = GetComponent<Mushroom>();
    }

    //void Update()
    //{
    //    float horizontalInput = Input.GetAxis("Horizontal");
    //    float verticalInput = Input.GetAxis("Vertical");

    //    Vector3 movement = new Vector3(horizontalInput, 0f, verticalInput) * speed * Time.deltaTime;

    //    transform.Translate(movement);

    //    if (Input.GetKeyDown(KeyCode.Space))
    //    {
    //        if (itemA >= 1 && !boosted)
    //        {
    //            mushroomScript.Activate();
    //        }
    //        if (itemB >= 1)
    //        {
    //            bananaScript.Activate();
    //        }
    //    }
    //}

    public void AddItem(int item)
    {
        if (item == 0 && itemA < maxItems && itemB == 0)
        {
            itemA++;
            Debug.Log("Item A count: " + itemA);
        }
        else if (item == 1 && itemB < maxItems && itemA == 0)
        {
            itemB++;
            Debug.Log("Item B count: " + itemB);
        }
    }

    public void OgSpeed()
    {
        speed = 5;
        boosted = false;
    }
}
