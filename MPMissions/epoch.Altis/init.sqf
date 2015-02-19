
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

//Admin Menu
/*
[] execVM "adminmenu\run.sqf";
[] execVM "adminmenu\loop.sqf";
*/
CIVILIAN setfriend [RESISTANCE, 0];
RESISTANCE setFriend [CIVILIAN, 0];
//NAMETAGS
[] execVM "custom\Nametags.sqf";

//Custom LOOT
if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "LSpawner\fn_LSgetBuildingstospawnLoot.sqf"; 
	LSdeleter = compile preProcessFileLineNumbers "LSpawner\LSdeleter.sqf";
	execVM "LSpawner\Lootspawner.sqf";
	//spawn more loot!
	[]spawn EPOCH_server_spawnBoatLoot2;
};

//SEM Missions
if(hasInterface)then{execVM "custom\semClient.sqf"};

if (isServer) then {
	[] ExecVM "\VEMF\init.sqf";
};
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

//Created by - Fallingsheep
//Special thanks - infistar for vehicle spawn code

//BUILD BIKE
if (("ItemScraps" in magazines player)&&("VehicleRepair" in magazines player)) then{
    act = player addaction [("<t color=""#0074E8"">" + ("Build Bike") +"</t>"),"deploy\deploybike.sqf","",5,false,true,"",""];
};
//PACK BIKE
_target = cursorTarget;
_isbike = _target isKindOf "ebike_epoch";
if (_isbike) then{
    act = player addaction [("<t color=""#0074E8"">" + ("PackBike") +"</t>"),"deploy\packbike.sqf","",5,false,true,"",""];
};