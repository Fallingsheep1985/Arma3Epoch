
_target = cursorTarget;
_isbike = _target isKindOf "ebike_epoch";
if (_isbike) then{
	player addaction [("<t color=""#0074E8"">" + ("PackBike") +"</t>"),"custom\packbike2.sqf","",5,false,true,"",""];
};