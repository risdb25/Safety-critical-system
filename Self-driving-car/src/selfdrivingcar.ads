package SelfDrivingCar with SPARK_Mode
is

   --Car-related types
   type Gearbox is (P, D, R);
   type Sensor is (Detection, Clear);
   type Ignition is (On, Off);
   type Diagnostics is (Engaged, Disengaged);
   type Speed is range 0..70;
   type BatteryPercentage is range 0..100;


   type Car is record
      gearEngaged : Gearbox;
      objectScanner : Sensor;
      status : Ignition;
      diagnosticMode : Diagnostics;
      currentSpeed : Speed;
      batteryCharge : BatteryPercentage;
   end record;



   --Global variable of the record Car type with initial states
   myCar : Car := (gearEngaged => P, objectScanner => Clear,
                   status => Off, diagnosticMode => Disengaged,
                  currentSpeed => 0, batteryCharge => 100);



       --Invariant to check car is not in diagnostic mode (REQ)
   function Invariant return Boolean
   is
     (myCar.diagnosticMode /= Engaged);



   --method to turn car on
   --gear selected must be parked (REQ 1)
   --car must have minimum charge in battery (REQ 2)
   procedure turnCarOn
     with
       Global => (In_Out => myCar),
       Pre => Invariant and myCar.gearEngaged = P and myCar.batteryCharge > 0,
       Post => Invariant and (myCar.batteryCharge /= 0);



   --method to increase speed
   --check to ensure the increase will not mean speed limit is exceeded (REQ 4)
   --sensors do not detect an object (REQ 6)
   --system warns of low charge now it is in motion (REQ 3) - in procedure body.
   procedure applyAcceleratorPedal(speedLimit : in Speed)
     with
       Global => (In_Out => myCar),
       Pre => Invariant and ((myCar.currentSpeed + 1) <= speedLimit) and (myCar.objectScanner = Clear),
       Post => Invariant and (myCar.currentSpeed <= speedLimit);




   --method which acts as gear selector
   --speed must be 0 (REQ 5)
   procedure changeGear (g : in Gearbox)
     with
       Global => (In_Out => myCar),
       Pre => Invariant and myCar.currentSpeed = 0,
       Post => Invariant;

end SelfDrivingCar;
