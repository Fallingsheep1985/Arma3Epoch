//Admin list
SUPERADMIN_LIST = [
	"76561198087015545",
	"0"
];
ADMIN_LIST = [
	"0",
	"0"
];
MOD_LIST = [
	"0",
	"0"
];
MASTERADMIN_LIST = SUPERADMIN_LIST + ADMIN_LIST + MOD_LIST;
BANNED_LIST = [
	"0","76561198059930120","76561198134916119","76561198130615382","76561198000135158","76561198098132364","76561198127436055",
	"76561198120497784","76561198151285096","76561198037143375","76561198053362106","76561197960693668","76561198150211409","76561198118994984",
	"76561198150211409","76561198118066332","76561198148495214","76561198124727926","76561198087505309","76561198106834234","76561198056113988",
	"76561198153161518","76561198077972256","76561198144416171","76561198151661947","76561198075411542","76561198106140797","76561198118378695",
	"76561198062509950","76561198080657666","76561198156021205","76561198126816660","76561197979392398","76561197969005505","76561197978751247",
	"76561197971107759","76561197967087500","76561197995117205","76561197964338716","76561198128229370","76561198141766032","76561198131838128",
	"76561198037171839","76561198137119508","76561198077957452","76561198055161991","76561198089299178","76561198129631838"
];
//BTC Lift,cargo and fast rope
_logistic = execVM "=BTC=_Logistic\=BTC=_logistic_Init.sqf";

//Loadouts
[] execVM "custom\loadout.sqf";

//Deploy bike/chopper
[] execVM "custom\deployvehicle.sqf";

//Status Bar
[] execVM "custom\fn_statusBar.sqf"; 
//Monitor
[] execVM "custom\debug_monitor.sqf";
//Intro stuff
//CAMERA INTRO
[] execVM "custom\serverIntro.sqf";
//WELCOME MESSAGES
[] execVM "custom\welcome.sqf";
//DIARY RULES ETC
[] execVM "custom\briefing.sqf";

//Admin Menu
[] execVM "adminmenu\run.sqf";
[] execVM "adminmenu\loop.sqf";





//Custom LOOT
if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "LSpawner\fn_LSgetBuildingstospawnLoot.sqf"; 
	LSdeleter = compile preProcessFileLineNumbers "LSpawner\LSdeleter.sqf";
	execVM "LSpawner\Lootspawner.sqf";
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
