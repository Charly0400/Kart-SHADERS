using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ItemManager : MonoBehaviour
{
    public int typeOfItem = 0; 
    public GameObject bananaPrefab;
    public GameObject MushroomPrefab;
    public Transform kartSpawnerItems;
    private GameObject TempItem;
    private bool updateItemPos = false;
    private void Awake()
    {
        GameObject TempItem = new GameObject();
    }

    public void UseItem()
    {
        
        if (typeOfItem == 0)
        {

        }
        else if (typeOfItem == 1)
        {

            TempItem = Instantiate(bananaPrefab, kartSpawnerItems);
            print(typeOfItem);
            typeOfItem = 0;
        }
        else if (typeOfItem == 2)
        {

            TempItem = Instantiate(MushroomPrefab, kartSpawnerItems);
            print(typeOfItem);
            typeOfItem = 0;
        }
    }

    private void Update()
    {
        if (TempItem != null && updateItemPos == true) 
        {
            TempItem.transform.position = kartSpawnerItems.position;
        }
        
    }
    public void ActivateItem()
    {
        updateItemPos = false;
        if (TempItem.gameObject.CompareTag("Banana"))
        {
            TempItem.GetComponent<Rigidbody>().useGravity = true;
            TempItem.transform.position = kartSpawnerItems.position;
        }
        else if (TempItem.gameObject.CompareTag("Mushroom"))
        {
            TempItem.GetComponent<MushroomLogic>().Boost();
        }
        TempItem = null;
    }

    public void UpdatePosItem()
    {
        updateItemPos = true;
        Update();
    }

}
