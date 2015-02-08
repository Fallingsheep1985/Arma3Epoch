//Admin list
ADMIN_LIST = ["76561198087015545","0","0"]
//VEMF Missions
if (!isDedicated) then {
	"VEMFChatMsg" addPublicVariableEventHandler {
		systemChat ((_this select 1) select 0);
		[
			[
				[((_this select 1) select 0),"align = 'center' size = '1' font='PuristaBold'"],
				["","<br/>"],
				[((_this select 1) select 1),"align = 'center' size = '0.5'"]
			]
		] spawn BIS_fnc_typeText2;
		VEMFChatMsg = nil;
	};
};

//Status Bar
[] execVM "custom\fn_statusBar.sqf"; 

// Welcome Credits
[] execVM "custom\welcome.sqf";

//Admin Menu
execVM "adminmenu\activate.sqf";
execVM "adminmenu\loop.sqf";


//Loadouts
[] execVM "custom\loadout.sqf";

//Custom LOOT
if (isServer) then {
    fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "custom\LSpawner\fn_LSgetBuildingstospawnLoot.sqf";
    LSdeleter = compile preProcessFileLineNumbers "custom\LSpawner\LSdeleter.sqf";
    execVM "custom\LSpawner\Lootspawner.sqf";
};


//BUILD BIKE
if (("ItemScraps" in magazines player)&&("ToolKit" in magazines player)) then{
	player addaction [("<t color=""#0074E8"">" + ("Build Bike") +"</t>"),"custom\Bike.sqf","",5,false,true,"",""];
};
//BUILD CHOPPER
if (("ItemScraps" in magazines player)&&("jerrycan_epoch" in magazines player)&&("CircuitParts" in magazines player)&&("VehicleRepair" in magazines player)) then {
	player addaction [("<t color=""#0074E8"">" + ("Build Chopper") +"</t>"),"custom\chopper.sqf","",5,false,true,"",""];
};
//PACK BIKE
_target = cursorTarget;
_isbike = _target isKindOf "ebike_epoch";
if (_isbike) then{
	player addaction [("<t color=""#0074E8"">" + ("PackBike") +"</t>"),"custom\packbike2.sqf","",5,false,true,"",""];
};