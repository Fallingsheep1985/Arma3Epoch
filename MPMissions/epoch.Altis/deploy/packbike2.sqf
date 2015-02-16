_target = cursorTarget;
_isbike = _target typeof "EBike";
if (_isbike) then{
	deleteVehicle _target;
	player addMagazine "ItemScraps";
};