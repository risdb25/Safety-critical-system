package body SelfDrivingCar with SPARK_Mode
is
   procedure turnCarOn
   is
   begin
      myCar.status := On;
   end turnCarOn;

   procedure changeGear (g : in Gearbox)
   is
   begin
      myCar.gearEngaged := g;
   end changeGear;

   procedure applyAcceleratorPedal (speedLimit : in Speed)
   is
   begin
      myCar.currentSpeed := myCar.currentSpeed + 1;
      if (myCar.batteryCharge < 15) then
         --This would be the low battery warning message
         --just need some code as a placeholder
         myCar.currentSpeed := myCar.currentSpeed;
      end if;
   end applyAcceleratorPedal;

end SelfDrivingCar;
