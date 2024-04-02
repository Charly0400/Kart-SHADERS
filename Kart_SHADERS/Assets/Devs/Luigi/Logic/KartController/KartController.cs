using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class KartController : MonoBehaviour
{
    private Rigidbody RB;

    private PlayerInputs inputActions;
    private float currentSpeed = 0;
    public float maxSpeed = 0;
    public float boostSpeed = 0;
    private float realSpeed = 0;

    private void Awake() {
        inputActions = new PlayerInputs();
    }
    void Start()
    {
        inputActions.Enable();

        inputActions.PlayerActions.Accelerate.performed += Accelerate;
        inputActions.PlayerActions.Accelerate.canceled += StopMoving;
        inputActions.PlayerActions.SlowDown.performed += SlowDown;
        inputActions.PlayerActions.SlowDown.canceled += StopMoving;


        RB = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void FixedUpdate() {
        realSpeed = transform.InverseTransformDirection(RB.velocity).z;
    }

    private void Accelerate(InputAction.CallbackContext callbackContext) {
        currentSpeed = Mathf.Lerp(currentSpeed, maxSpeed, Time.deltaTime * 0.5f);
        Vector3 vel = transform.forward * currentSpeed;
        vel.y = RB.velocity.y;
        RB.velocity = vel;
    }

    private void SlowDown(InputAction.CallbackContext callbackContext) {
        currentSpeed = Mathf.Lerp(currentSpeed, -maxSpeed/ 1.75f, 1f * Time.deltaTime);
        Vector3 vel = transform.forward * currentSpeed;
        vel.y = RB.velocity.y;
        RB.velocity = vel;
    }

    private void StopMoving(InputAction.CallbackContext callbackContext) 
    {
        currentSpeed = Mathf.Lerp(currentSpeed, 0, Time.deltaTime * 0.2f);
        Vector3 vel = transform.forward * currentSpeed;
        vel.y = RB.velocity.y;
        RB.velocity = vel;
    }
}
