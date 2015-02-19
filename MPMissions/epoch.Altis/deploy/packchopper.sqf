//Created by - Fallingsheep
//Special thanks - infistar for vehicle spawn code
_target = cursorTarget;
_ischopper = _target typeof "B_Heli_Light_01_EPOCH";
if (_ischopper) then{
    deleteVehicle _target;
    player addMagazine "ItemScraps";
    player addMagazine "VehicleRepair";
	player addMagazine "CircuitParts";
	player addMagazine "jerrycan_epoch"; // change to empty
    SystemChat "You packed the Chopper.";
};