
//BTC Lift,cargo and fast rope
_logistic = execVM "=BTC=_Logistic\=BTC=_logistic_Init.sqf";
//Loadouts
[] execVM "custom\loadout.sqf";
//Status Bar
[] execVM "custom\fn_statusBar.sqf"; 
//Intro stuff
//CAMERA INTRO
[] execVM "custom\serverIntro.sqf";
//WELCOME MESSAGES
[] execVM "custom\welcome.sqf";
//DIARY RULES ETC
[] execVM "custom\briefing.sqf";

CIVILIAN setfriend [RESISTANCE, 0];
RESISTANCE setFriend [CIVILIAN, 0];
//NAMETAGS
[] execVM "custom\Nametags.sqf";

//Custom LOOT (arma2 style)
if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "LSpawner\fn_LSgetBuildingstospawnLoot.sqf"; 
	LSdeleter = compile preProcessFileLineNumbers "LSpawner\LSdeleter.sqf";
	execVM "LSpawner\Lootspawner.sqf";
};

//SEM Missions
if(hasInterface)then{execVM "custom\semClient.sqf"};

//VEMF Missions
if (isServer) then {
	[] ExecVM "\VEMF\init.sqf";
};
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

//BUILD BIKE
if (("ItemScraps" in magazines player)&&("VehicleRepair" in magazines player)) then{
    act = player addaction [("<t color=""#0074E8"">" + ("Build Bike") +"</t>"),"deploy\deploybike.sqf","",5,false,true,"",""];
};
//PACK BIKE
_target = cursorTarget;
_isbike = _target isKindOf "ebike_epoch";
if (_isbike) then{
    act = player addaction [("<t color=""#0074E8"">" + ("Pack Bike") +"</t>"),"deploy\packbike.sqf","",5,false,true,"",""];
};
//BUILD CHOPPER
 if (("ItemScraps" in magazines player)&&("jerrycan_epoch" in magazines player)&&("CircuitParts" in magazines player)&&("VehicleRepair" in magazines player)) then {
    act = player addaction [("<t color=""#0074E8"">" + ("Build Chopper") +"</t>"),"deploy\deploychopper.sqf","",5,false,true,"",""];
};
//PACK CHOPPER
_target = cursorTarget;
_isbike = _target isKindOf "B_Heli_Light_01_EPOCH";
if (_isbike) then{
    act = player addaction [("<t color=""#0074E8"">" + ("Pack Chopper") +"</t>"),"deploy\packchopper.sqf","",5,false,true,"",""];
};