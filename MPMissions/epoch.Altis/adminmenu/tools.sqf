_pathtotools = "adminmenu\tools\";
_pathtoweapon = "adminmenu\weapons\";
_pathtovehicles = "adminmenu\veh\";
_pathtosoldier= "adminmenu\spawn\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';
_EXECscript3 = 'player execVM "'+_pathtoweapon+'%1"';
_EXECscript5 = 'player execVM "'+_pathtovehicles+'%1"';
_EXECscript6 = 'player execVM "'+_pathtosoldier+'%1"';


if ((getPlayerUID player) in ["76561198083039115"]) then { //all admins
	if ((getPlayerUID player) in ["76561198083039115"]) then { //Admins Go Here aswell
		adminmenu =
		[
			["Fusions Menu",true],
				["Tools", [4], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
				["Cars", [4], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
				["Weapons", [5], "#USER:WeaponMenu", -5, [["expression", ""]], "1", "1"],
				["Spawn Groups", [5], "#USER:Soldier", -5, [["expression", ""]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]		
		];};
} else {
adminmenu =
[
	["",true],
		//["Toggle Debug", [2], "", -5, [["expression", format[_execdebug,"playerstats.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
	["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];};
ToolsMenu =
[
	["Tools",true],
        ["Teleport", [2],  "", -5, [["expression", format[_EXECscript1,"teleport.sqf"]]], "1", "1"],
		["Teleport Player To Me", [3],  "", -5, [["expression", format[_EXECscript1,"tptome.sqf"]]], "1", "1"],		
        ["God Mode", [4],  "", -5, [["expression", format[_EXECscript1,"god.sqf"]]], "1", "1"],
		["Car God Mode", [5],  "", -5, [["expression", format[_EXECscript1,"cargod.sqf"]]], "1", "1"],
		["Heal Self", [6],  "", -5, [["expression", format[_EXECscript1,"heal.sqf"]]], "1", "1"],
		["Heal Player(s)", [7],  "", -5, [["expression", format[_EXECscript1,"healp.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];

WeaponMenu =
[
	["Weapons",true],
	//Add Weapons Here Gave some examples :D
		["MX", [2],  "", -5, [["expression", format[_EXECscript3,"mx.sqf"]]], "1", "1"],
		["MK 200", [3],  "", -5, [["expression", format[_EXECscript3,"mk200.sqf"]]], "1", "1"],
		["LRR", [4],  "", -5, [["expression", format[_EXECscript3,"lrr.sqf"]]], "1", "1"],
		["EBR", [5],  "", -5, [["expression", format[_EXECscript3,"ebr.sqf"]]], "1", "1"],
		["GM6", [6],  "", -5, [["expression", format[_EXECscript3,"gm6.sqf"]]], "1", "1"],
		["P07", [7],  "", -5, [["expression", format[_EXECscript3,"phgun.sqf"]]], "1", "1"],
		
			["Next page", [12], "#USER:WeaponMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
WeaponMenu2 = 
[
	["Weapons 2",true],
	//Add Weapons Here Gave another page because it could get a little confusing :P
		["MX", [2],  "", -5, [["expression", format[_EXECscript3,"mx.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
		
];
VehicleMenu = 
[
	["Vehicles",true],
		["ATV", [2],  "", -5, [["expression", format[_EXECscript5,"ATV.sqf"]]], "1", "1"],
		["Hunter Armed", [3],  "", -5, [["expression", format[_EXECscript5,"hunter.sqf"]]], "1", "1"],
		["Offroad Truck HMG .50", [4],  "", -5, [["expression", format[_EXECscript5,"offroad.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Next page", [12], "#USER:VehicleMenu2", -5, [["expression", ""]], "1", "1"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
VehicleMenu2 = 
[
	["Vehicles 2",true],
		["Example", [2],  "", -5, [["expression", format[_EXECscript5,"Example.sqf"]]], "1", "1"],
		["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
Soldier = 
[
	["Spawner", true],
		["Select Spawn Position (OpFor)", [2],  "", -5, [["expression", format[_EXECscript6,"east.sqf"]]], "1", "1"],
		["Delete Previous Spawn Area (OpFor)", [3],  "", -5, [["expression", format[_EXECscript6,"deleteop.sqf"]]], "1", "1"],
		["Spawn(OpFor)", [4],  "", -5, [["expression", format[_EXECscript6,"eastsp.sqf"]]], "1", "1"],
		["Select Spawn Position (BluFor)", [5],  "", -5, [["expression", format[_EXECscript6,"west.sqf"]]], "1", "1"],
		["Delete Previous Spawn Area (BluFor)", [6],  "", -5, [["expression", format[_EXECscript6,"deletebl.sqf"]]], "1", "1"],
		["Spawn(BluFor)", [7],  "", -5, [["expression", format[_EXECscript6,"westsp.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [13], "", -3, [["expression", ""]], "1", "1"]
];
		
showCommandingMenu "#USER:adminmenu";