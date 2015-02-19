//Created by - Fallingsheep
//Special thanks - infistar for vehicle spawn code
_target = cursorTarget;
_isbike = _target typeof "ebike_epoch";
if (_isbike) then{
    deleteVehicle _target;
    player addMagazine "ItemScraps";
    player addMagazine "VehicleRepair";
    SystemChat "You packed the EBike.";
};