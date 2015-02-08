	/* KiloSwiss */
if(isDedicated)exitWith{}; //Everything below this line is only executed on the client (player or local host)

[] spawn {	waitUntil{player == player && !isNil "SEM_version"}; sleep 50;
	/* This is the advertisement. */
	private "_worldName";
	_worldName = switch(toLower worldName)do{
		case "bootcamp_acr"		:{"Bukovina"};
		case "woodland_acr"		:{"Bystrica"};
		case "chernarus_summer"	:{"Chernarus (summer)"};
		case "mbg_celle2"		:{"Celle"};
		case "isladuala"		:{"Isla-Duala"};
		case "panthera2"		:{"Panthera"};
		case "panthera3" 		:{"Panthera"};
		case "smd_sahrani_a2"	:{"Sahrani"};
		case "sara"				:{"Sahrani"};
		case "saralite"			:{"Sahrani"};
		case "sara_dbe1"		:{"Sahrani"};
		case "tavi"				:{"Taviana"};
		default{worldName};
	};
	titleText [format["\nWelcome to EPOCH %1 survivor %2.", _worldName, name player], "PLAIN DOWN", 2];
	sleep 15;
	titleText [format["This server is running %1 v%2", str "Simple Epoch Missions", SEM_version], "PLAIN DOWN", 2];
	/* End of advertisement */
	"SEM_version" addPublicVariableEventHandler {titleText [format["This server is running %1 v%2",	str "Simple Epoch Missions", _this select 1], "PLAIN DOWN"]};
};	


SEM_client_createMissionMarker = {	private ["_create","_markerTimeout","_markerPos","_markerID","_markerA","_markerB","_markerC","_markerC_Pos","_markerName"];
	_create = _this select 0;
	
	//Create Marker
	if(_create)then[{
	
	_markerPos = _this select 1;
	_markerID = _this select 2;
	_markerName = _this select 3;
	
	_markerA = createMarkerLocal [format["SEM_MissionMarkerA_%1", _markerID], _markerPos];
	_markerB = createMarkerLocal [format["SEM_MissionMarkerB_%1", _markerID], _markerPos];
	_markerC = createMarkerLocal [format["SEM_MissionMarkerC_%1", _markerID], _markerPos];
	
	{	_x setMarkerShapeLocal "ELLIPSE"; _x setMarkerSizeLocal [350,350];
		_x setMarkerPosLocal _markerPos}forEach [_markerA,_markerB];
	
	_markerA setMarkerBrushLocal "Cross";
	_markerA setMarkerColorLocal "ColorYellow";

	_markerB setMarkerBrushLocal "Border";
	_markerB setMarkerColorLocal "ColorRed";
	
	_markerC_Pos = [(_markerPos select 0) - (count _markerName * 12), (_markerPos select 1) - 370, 0];
	_markerC setMarkerShapeLocal "Icon";
	_markerC setMarkerTypeLocal "HD_Arrow";
	_markerC setMarkerColorLocal "ColorRed";
	_markerC setMarkerPosLocal _markerC_Pos;
	_markerC setMarkerTextLocal _markerName;
	_markerC setMarkerDirLocal 37;
	
	},{	//else delete marker

	_this spawn { private ["_markerTimeout","_markerID"];
		_markerTimeout = _this select 1;
		_markerID = _this select 2;
		
		if(_markerTimeout > 0)then{
			format["SEM_MissionMarkerB_%1", _markerID] setMarkerColorLocal "ColorGreen";
			format["SEM_MissionMarkerC_%1", _markerID] setMarkerColorLocal "ColorGreen";
			sleep _markerTimeout;
		};
		
		if (getMarkerColor format["SEM_MissionMarkerA_%1", _markerID] != "")then{	//Only delete existing Marker
			deleteMarkerLocal format["SEM_MissionMarkerA_%1", _markerID];
			deleteMarkerLocal format["SEM_MissionMarkerB_%1", _markerID];
			deleteMarkerLocal format["SEM_MissionMarkerC_%1", _markerID];
		};
	};	
	}];
};

if(!isNil "SEM_globalMissionMarker")then{SEM_globalMissionMarker call SEM_client_createMissionMarker};
"SEM_globalMissionMarker" addPublicVariableEventHandler {_this select 1 call SEM_client_createMissionMarker};

SEM_lastEvent = 0;
"SEM_globalHint" addPublicVariableEventHandler { 
	_this select 1 spawn {	private "_sound";
	//waitUntil{time - SEM_lastEvent > 20}; SEM_lastEvent = time;
	waitUntil{if(time - SEM_lastEvent > 20)exitwith{SEM_lastEvent = time; true}; false};
		_sound = _this select 0;
		switch(_sound)do{
			case 0:{playSound "UAV_05"}; //Mission start
			case 1:{playSound "UAV_01"}; //Mission fail (object destroyed)
			case 2:{playSound "UAV_04"}; //Mission fail (time out)
			case 3:{playsound "UAV_03"}; //Mission success
		};
		hint parseText format["%1", _this select 1];
	};
};

"SEM_vehDamage" addPublicVariableEventHandler { private ["_vk","_vP","_s"];
	_vk = _this select 1;
	_vP = vehicle player;
	if(!local _vk)exitWith{};
	if(_vk != _vP)exitWith{};
	_s = [	"MOTOR","karoserie","palivo","glass1","glass2","glass3","door1","door2","door3","door4",
	"wheel_1_1_steering","wheel_2_1_steering","wheel_1_2_steering","wheel_2_2_steering",
	"wheel_1_3_steering","wheel_2_3_steering","wheel_1_4_steering","wheel_2_4_steering"];
	{_vk setHit [_x,(_vk getHit _x)+(.2+(random .15))]}count _s;
};


[] spawn {
	waitUntil{!isNil "SEM_AIsniperDamageDistance"};
	waitUntil{!isNil "SEM_AI_Units"};

	while{true}do{	private "_units";
		_units = SEM_AI_Units;
		{	sleep 0.05;
		if(_x distance (vehicle player) > SEM_AIsniperDamageDistance)then[{
				if(!isPlayer _x)then{_x allowDamage false};
		},{
			if(!isPlayer _x)then{_x allowDamage true};
		}];
		}forEach _units;
	};
};
//if(!isNil "SEM_AIsniperDamageEH")then{SEM_AI_Units call SEM_client_AIaddDamageEH};
//"SEM_AI_Units" addPublicVariableEventHandler {_this select 1 call SEM_client_AIaddDamageEH};