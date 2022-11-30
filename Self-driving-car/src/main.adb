with SelfDrivingCar; use SelfDrivingCar;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
begin
   --Extension to prove the system does not allow the car to exceed the speed limit:
   --  myCar.currentSpeed := 49;
   --  applyAcceleratorPedal(50);
   --  Put_Line("Speed is:"); Put_Line(myCar.currentSpeed'Image);
   --
   --  applyAcceleratorPedal(50);
   --  Put_Line("Speed is:"); Put_Line(myCar.currentSpeed'Image);




   --Extension to prove the system does not allow the car to start if the gear engaged is something other than P:
   --  Put_Line("Status is:"); Put_Line(myCar.status'Image);
   --  turnCarOn;
   --  Put_Line("Status is:"); Put_Line(myCar.status'Image);
   --
   --  myCar.gearEngaged := D;
   --  turnCarOn;




   --Extension to prove the system does not allow the car to start if there is not a minimum charge in the battery:
   --  Put_Line("Battery charge is:"); Put_Line(myCar.batteryCharge'Image);
   --  turnCarOn;
   --  Put_Line("Status is:"); Put_Line(myCar.status'Image);
   --
   --  myCar.batteryCharge := 0;
   --  turnCarOn;




   --Extension to prove the gear cannot be changed if the speed of the car is not 0:
   --  myCar.currentSpeed := 0;
   --  changeGear(D);
   --  Put_Line("Gear is:"); Put_Line(myCar.gearEngaged'Image);
   --
   --  myCar.currentSpeed := 20;
   --  changeGear(R);




   --Extension to prove the car cannot move towards an object:
   --  myCar.objectScanner := Detection;
   --  applyAcceleratorPedal(70);




   --Extension to prove the invariant works:
   myCar.diagnosticMode := Engaged;
   turnCarOn;

end Main;
