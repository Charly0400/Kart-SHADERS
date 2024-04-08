using System;
using UnityEngine;
using UnityStandardAssets.CrossPlatformInput;

namespace UnityStandardAssets.Vehicles.Car
{
    [RequireComponent(typeof (CarController))]
    public class CarUserControlP2 : MonoBehaviour
    {
        private CarController m_Car; // the car controller we want to use
        private ItemManager m_ItemManager; // the car controller we want to use


        private void Awake()
        {
            // get the car controller
            m_Car = GetComponent<CarController>();
            m_ItemManager = GetComponent<ItemManager>();
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.M))
            {
                m_ItemManager.UseItem();
            }

            if (Input.GetKey(KeyCode.M))
            {
                m_ItemManager.UpdatePosItem();
            }

            if (Input.GetKeyUp(KeyCode.M))
            {
                m_ItemManager.ActivateItem();
            }
        }
        private void FixedUpdate()
        {
            // pass the input to the car!
            float h = CrossPlatformInputManager.GetAxis("HorizontalP2");
            float v = CrossPlatformInputManager.GetAxis("VerticalP2");
#if !MOBILE_INPUT
            float handbrake = CrossPlatformInputManager.GetAxis("JumpP2");
            m_Car.Move(h, v, v, handbrake);
#else
            m_Car.Move(h, v, v, 0f);
#endif
        }
    }
}
