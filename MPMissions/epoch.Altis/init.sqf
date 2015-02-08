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

//BIKE
act = player addaction [("<t color=""#0074E8"">" + ("Bike") +"</t>"),"custom\Bike.sqf","",5,false,true,"",""];

//Loadouts
[] execVM "custom\loadout.sqf";

//Custom LOOT
if (isServer) then {
    fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "custom\LSpawner\fn_LSgetBuildingstospawnLoot.sqf";
    LSdeleter = compile preProcessFileLineNumbers "custom\LSpawner\LSdeleter.sqf";
    execVM "custom\LSpawner\Lootspawner.sqf";
};