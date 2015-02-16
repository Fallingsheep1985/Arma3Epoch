/*
Created By Fallingsheep

add this to your init
//Deploy bike/chopper
[] execVM "deploy\deployvehicle.sqf";
*/

//BUILD BIKE
if (("ItemScraps" in magazines player)&&("ToolKit" in magazines player)) then{
	act = player addaction [("<t color=""#0074E8"">" + ("Build Bike") +"</t>"),"deploy\Bike.sqf","",5,false,true,"",""];
};
//BUILD CHOPPER
if (("ItemScraps" in magazines player)&&("jerrycan_epoch" in magazines player)&&("CircuitParts" in magazines player)&&("VehicleRepair" in magazines player)) then {
	act = player addaction [("<t color=""#0074E8"">" + ("Build Chopper") +"</t>"),"deploy\chopper.sqf","",5,false,true,"",""];
};
//PACK BIKE
_target = cursorTarget;
_isbike = _target isKindOf "ebike_epoch";
if (_isbike) then{
	act = player addaction [("<t color=""#0074E8"">" + ("PackBike") +"</t>"),"deploy\packbike2.sqf","",5,false,true,"",""];
};