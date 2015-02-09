Bob_MAIN_CODE = {
	systemchat 'Loading Menu...';
	
	if (isNil 'ALT_IS_PRESSED') then {ALT_IS_PRESSED = false;};
	if (isNil 'Bob_toggled_A') then {Bob_toggled_A = ['==== OnTarget ====','==== Toggleable ===='];};
	if (isNil 'ALL_VEHS_TO_SEARCH') then
	{
		ALL_VEHS_TO_SEARCH = [];
		_cfgvehicles = configFile >> 'cfgVehicles';
		for '_j' from 0 to (count _cfgvehicles)-1 do
		{
			_vehicle = _cfgvehicles select _j;
			if (isClass _vehicle) then
			{
				_veh_type = configName _vehicle;
				if ((getNumber (_vehicle >> 'scope') == 2) && (getText (_vehicle >> 'picture') != '') && ((_veh_type isKindOf 'Air') || (_veh_type isKindOf 'LandVehicle') || (_veh_type isKindOf 'Ship'))) then
				{
					if !((_veh_type isKindOf 'ParachuteBase') || (_veh_type isKindOf 'BIS_Steerable_Parachute')) then
					{
						ALL_VEHS_TO_SEARCH = ALL_VEHS_TO_SEARCH + [_veh_type];
					};
				};
			};
		};
	};
	if (isNil 'ALL_WEPS_TO_SEARCH') then
	{
		ALL_WEPS_TO_SEARCH = [];
		_CfgWeapons = configFile >> 'CfgWeapons';
		for '_i' from 0 to (count _CfgWeapons)-1 do
		{
			_weapon = _CfgWeapons select _i;
			if (isClass _weapon) then
			{
				_wpn_type = configName _weapon;
				if (((getNumber (_weapon >> 'scope') == 0) || (getNumber (_weapon >> 'scope') == 2)) && (getText (_weapon >> 'picture') != '')) then
				{
					if !(_wpn_type in ALL_WEPS_TO_SEARCH) then
					{
						ALL_WEPS_TO_SEARCH = ALL_WEPS_TO_SEARCH + [_wpn_type];
					};
				};
			};
		};
	};
	if (isNil 'ALL_MAGS_TO_SEARCH') then
	{
		ALL_MAGS_TO_SEARCH = [];
		_CfgWeapons = configFile >> 'cfgmagazines';
		for '_i' from 0 to (count _CfgWeapons)-1 do
		{
			_weapon = _CfgWeapons select _i;
			if (isClass _weapon) then
			{
				_wpn_type = configName(_weapon);
				if (((getNumber (_weapon >> 'scope') == 0) || (getNumber (_weapon >> 'scope') == 2)) && (getText (_weapon >> 'picture') != '')) then
				{
					if !(_wpn_type in ALL_MAGS_TO_SEARCH) then
					{
						ALL_MAGS_TO_SEARCH = ALL_MAGS_TO_SEARCH + [_wpn_type];
					};
				};
			};
		};
	};
	fnc_cleanDialogs = {
		{_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl _x;lbclear _ctrl;} forEach [LEFT_CTRL_ID,RIGHT_CTRL_ID];
	};
	fnc_FULLinit =
	{
		disableSerialization;
		MAIN_DISPLAY_ID = 2727;
		LEFT_CTRL_ID = 1500;
		RIGHT_CTRL_ID = 1501;
		if (isNull findDisplay MAIN_DISPLAY_ID) then {createdialog 'RscDisplayLocWeaponInfo';};
		waitUntil {!isNull findDisplay MAIN_DISPLAY_ID};
		if (isNil 'Bob_Layout_Selected') then {Bob_Layout_Selected = 1};
		if (isNil 'KeyBindsWorking') then {KeyBindsWorking = true;};
		Bob_add_weapons = nil;
		Bob_add_magazines = nil;
		Bob_add_vehicles = nil;
		uiSleep 0.1;
		[] spawn fnc_initMenu;
	};
	fnc_initMenu =
	{
		disableSerialization;
		if (Bob_Layout_Selected == 1) exitWith {
			_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_CTRL_ID;
			_ctrl ctrlSetFont 'TahomaB';
			_ctrl ctrlCommit 0;
			ctrlSetFocus _ctrl;
			_ctrl ctrlSetEventHandler ['LBDblClick', 'call fnc_LBDblClick_LEFT;'];
			_ctrl ctrlSetEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_LEFT;'];
			[] spawn fnc_fill_Bob_Player;
			
			_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
			_ctrl ctrlSetFont 'TahomaB';
			_ctrl ctrlCommit 0;
			ctrlSetFocus _ctrl;
			_ctrl ctrlSetEventHandler ['LBDblClick', 'call fnc_LBDblClick_RIGHT;'];
			_ctrl ctrlSetEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_RIGHT;'];
			call fnc_fill_Bob_MAIN;
			
			if (MAIN_DISPLAY_ID == 2727) then {
				ctrlSetText [1000,format['AntiHack & AdminsTools by Bob.de                         %1',VERSION]];
				if (!isNil 'life_adminlevel') then {ctrlSetText [1000,format['by Bob.de | CASH: %1K - BANK: %2K',life_cash/1000,life_atmcash/1000]];};
				ctrlSetText [1001,format['Alive Players: %1',count playableUnits]];
				ctrlSetText [1002,'Functions --- by Bob.de'];
				ctrlSetText [1100,''];
				ctrlSetText [1101,''];
				ctrlSetText [1400,''];
				ctrlSetText [1401,''];
				call fnc_bottom_RIGHT;
				
				_btnClose = (findDisplay MAIN_DISPLAY_ID) displayCtrl 2;
				_btnClose ctrlShow false;
				_btnClose ctrlEnable false;
				_btnClose ctrlCommit 0;
			};
		};
		if (Bob_Layout_Selected == 2) exitWith {
			_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_CTRL_ID;
			_ctrl ctrlSetPosition [SafeZoneX,SafeZoneY+0.03,0.4,SafeZoneH-1.125];
			_ctrl ctrlSetFont 'TahomaB';
			_ctrl ctrlCommit 0;
			ctrlSetFocus _ctrl;
			_ctrl ctrlSetEventHandler ['LBDblClick', 'call fnc_LBDblClick_LEFT;'];
			_ctrl ctrlSetEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_LEFT;'];
			[] spawn fnc_fill_Bob_Player;
			
			_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
			_ctrl ctrlSetPosition [SafeZoneX+0.4,SafeZoneY+0.03,2,SafeZoneH-1.125];
			_ctrl ctrlSetFont 'TahomaB';
			_ctrl ctrlCommit 0;
			ctrlSetFocus _ctrl;
			_ctrl ctrlSetEventHandler ['LBDblClick', 'call fnc_LBDblClick_RIGHT;'];
			_ctrl ctrlSetEventHandler ['LBSelChanged', 'call fnc_LBSelChanged_RIGHT;'];
			call fnc_fill_Bob_MAIN;
			
			if (MAIN_DISPLAY_ID == 2727) then {
				_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl 1000;
				_ctrl ctrlSetBackgroundColor [0,0,0,0.9];
				_ctrl ctrlSetPosition [SafeZoneX,SafeZoneY,SafeZoneW,0.03];
				_ctrl ctrlSetFont 'TahomaB';
				_ctrl ctrlCommit 0;
				
				ctrlSetText [1400,''];
				_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl 1400;
				_ctrl ctrlSetPosition [SafeZoneX,(SafeZoneY+0.03)+(SafeZoneH-1.125),SafeZoneW/2,0.04];
				_ctrl ctrlSetFont 'TahomaB';
				_ctrl ctrlCommit 0;
				
				ctrlSetText [1401,''];
				_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl 1401;
				_ctrl ctrlSetPosition [SafeZoneX+(SafeZoneW/2),(SafeZoneY+0.03)+(SafeZoneH-1.125),SafeZoneW/2,0.04];
				_ctrl ctrlSetFont 'TahomaB';
				_ctrl ctrlCommit 0;
				call fnc_bottom_RIGHT;
				
				_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl 1100;
				_ctrl ctrlSetBackgroundColor [0,0,0,0.5];
				_ctrl ctrlSetPosition [SafeZoneX,SafeZoneY+0.03,0.4,SafeZoneH-1.125];
				_ctrl ctrlEnable false;
				_ctrl ctrlCommit 0;
				
				_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl 1101;
				_ctrl ctrlSetBackgroundColor [0,0,0,0.5];
				_ctrl ctrlSetPosition [SafeZoneX+0.4,SafeZoneY+0.03,SafeZoneW - 0.4,SafeZoneH-1.125];
				_ctrl ctrlEnable false;
				_ctrl ctrlCommit 0;
				
				ctrlSetText [1000,format['AntiHack & AdminsTools by Bob.de                         %1',VERSION]];
				if (!isNil 'life_adminlevel') then {ctrlSetText [1000,format['by Bob.de | CASH: %1K - BANK: %2K',life_cash/1000,life_atmcash/1000]];};
				
				{
					_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl _x;
					if (!isNull _ctrl) then
					{
						_ctrl ctrlShow false;
						_ctrl ctrlEnable false;
						_ctrl ctrlSetPosition [0,0,0,0];
						_ctrl ctrlCommit 0;
					};
				} forEach [2,1001,1002,11000,11001,11002,11100,11200,11201];
			};
		};
	};
	fnc_colorizeMain =
	{
		_lsize = lbSize RIGHT_CTRL_ID;
		for '_i' from 0 to _lsize do
		{
			_lbtxt = lbtext [RIGHT_CTRL_ID,_i];
			if (_lbtxt in Bob_Toggleable) then
			{
				if (_lbtxt in Bob_toggled_A) then
				{
					_ctrl lbSetColor [_i,[0,1,0,1]];
				}
				else
				{
					_ctrl lbSetColor [_i,[1,0,0,1]];
				};
			};
			if (_lbtxt in Bob_SubMenus) then
			{
				_ctrl lbSetColor [_i,[0,0.8,0.8,1]];
			};
			if (_lbtxt in Bob_OnTargetNICE) then
			{
				_ctrl lbSetColor [_i,COLORNICE];
			};
			if (_lbtxt in Bob_OnTargetEVIL) then
			{
				_ctrl lbSetColor [_i,COLOREVIL];
			};
		};
	};
	fnc_fill_Bob_MAIN =
	{
		lbclear _ctrl;
		_ADMINLEVELACCESS = call ADMINLEVELACCESS;
		COLORNICE = [0,0.8,1,1];
		COLOREVIL = [0.99,0.8,0.8,1];
		SHOWHACKLOG = format['==== HackLog %1 ====',count AH_HackLogArray];
		SHOWTBANLOG = format['==== TempBanned %1 ====',count PVAH_AHTMPBAN];
		
		Bob_HEADER = [];
		Bob_SubMenus =
		[
			SHOWHACKLOG,SHOWTBANLOG,
			'==== Weapons ====','==== Magazines ====','==== Vehicles ====',
			'==== Loadouts ====','==== OnTarget ====','==== Toggleable ====',
			'==== AltisLife Misc ====','==== AltisLife Money ===='
		];
		Bob_OnTargetNICE =
		[
			'Teleport Target To Me','Teleport To',
			'Revive','Heal','Repair',
			'Move In My Vehicle','Move In Target Vehicle'
		];
		if (isNil 'EPOCH_KeyDown') then
		{
			{
				Bob_OnTargetNICE = Bob_OnTargetNICE - [_x];
			} forEach ['Revive'];
		};
		Bob_OnTargetEVIL =
		[
			'Spawn UAV','Spawn Epoch_Cloak_F','Spawn Sapper_F','Spawn GreatWhite_F',
			'Eject','Eject Crew','Kill','Zeus','Delete Vehicle',
			'Force Disconnect','Kick','TempBan'
		];
		if (isNil 'EPOCH_KeyDown') then
		{
			{
				Bob_OnTargetEVIL = Bob_OnTargetEVIL - [_x];
			} forEach ['Spawn UAV','Spawn Epoch_Cloak_F','Spawn Sapper_F','Spawn GreatWhite_F'];
		};
		Bob_OnTarget = Bob_OnTargetNICE + Bob_OnTargetEVIL;
		Bob_Toggleable =
		[
			'Box-ESP','Map-Icons','PlotPole Marker','Construction Marker','DeadPlayer Marker',
			'God Mode','Vehicle God Mode','Lower Terrain','Vehboost','UnlimAmmo','noRecoil','FastFire',
			'Stealth / Invisible','Disable Announces','Show FPS'
		];
		if (isNil 'EPOCH_KeyDown') then
		{
			{
				Bob_Toggleable = Bob_Toggleable - [_x];
			} forEach ['PlotPole Marker','Construction Marker'];
		};
		if (!isNil 'life_adminlevel') then
		{
			{
				Bob_Toggleable = Bob_Toggleable - [_x];
			} forEach ['noRecoil'];
		};
		Bob_AltisLifeMisc =
		[
			'Give All Liscenses'
		];
		Bob_AltisLifeMoney =
		[
			'CASH','BANK',
			'---',
			'50K Cash','100K Cash','250K Cash','500K Cash','750K Cash','1.150K Cash','2.500K Cash','5.000K Cash','10.000K Cash',
			'50K Bank','100K Bank','250K Bank','500K Bank','750K Bank','1.150K Bank','2.500K Bank','5.000K Bank','10.000K Bank'
		];
		Bob_Loadouts =
		[
			'Epoch 1','Epoch 2',
			'Sub Machinegun Kit','Light Infantry Kit','Heavy Infantry Kit','DMR Sniper Kit','LLR Sniper Kit',
			'Normal Sniper Kit'
		];
		
		
		_ctrl lbAdd SHOWHACKLOG;
		if (!isNil 'Bob_add_HackLog') then
		{
			{
				_ctrl lbAdd _x;
			} forEach AH_HackLogArray;
		};
		
		_ctrl lbAdd SHOWTBANLOG;
		if (!isNil 'Bob_add_TempBanned') then
		{
			{
				_ctrl lbAdd _x;
			} forEach PVAH_AHTMPBAN;
		};
		
		if ('==== Weapons ====' in _ADMINLEVELACCESS) then
		{
			_ctrl lbAdd '==== Weapons ====';
			if (!isNil 'Bob_add_weapons') then
			{
				{
					_ctrl lbAdd _x;
					_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> 'CfgWeapons' >> _x >> 'picture'))];
				} forEach ALL_WEPS_TO_SEARCH;
			};
		};
		
		if ('==== Magazines ====' in _ADMINLEVELACCESS) then
		{
			_ctrl lbAdd '==== Magazines ====';
			if (!isNil 'Bob_add_magazines') then
			{
				{
					_ctrl lbAdd _x;
					_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> 'CfgMagazines' >> _x >> 'picture'))];
				} forEach ALL_MAGS_TO_SEARCH;
			};
		};
		
		if ('==== Vehicles ====' in _ADMINLEVELACCESS) then
		{
			_ctrl lbAdd '==== Vehicles ====';
			if (!isNil 'Bob_add_vehicles') then
			{
				{
					_ctrl lbAdd _x;
					_ctrl lbSetPicture [(lbsize _ctrl)-1,(getText (configFile >> 'CfgVehicles' >> _x >> 'picture'))];
				} forEach ALL_VEHS_TO_SEARCH;
			};
		};
		
		if ('==== Loadouts ====' in _ADMINLEVELACCESS) then
		{
			_ctrl lbAdd '==== Loadouts ====';
			if (!isNil 'Bob_add_Loadouts') then
			{
				{
					_ctrl lbAdd _x;
				} forEach Bob_Loadouts;
			};
		};
		
		_ctrl lbAdd '==== OnTarget ====';
		if (isNil 'Bob_add_OnTarget') then
		{
			{
				if (_x in _ADMINLEVELACCESS) then
				{
					_ctrl lbAdd _x;
				};
			} forEach Bob_OnTargetNICE;
			_ctrl lbAdd '---';
			{
				if (_x in _ADMINLEVELACCESS) then
				{
					_ctrl lbAdd _x;
				};
			} forEach Bob_OnTargetEVIL;
		};
		
		_ctrl lbAdd '==== Toggleable ====';
		if (isNil 'Bob_add_Toggleable') then
		{
			{
				if (_x in _ADMINLEVELACCESS) then
				{
					_ctrl lbAdd _x;
				};
			} forEach Bob_Toggleable;
		};
		
		if (!isNil 'life_adminlevel') then
		{
			_ctrl lbAdd '==== AltisLife Misc ====';
			if (!isNil 'Bob_add_AltisLife') then
			{
				{
					if (_x in _ADMINLEVELACCESS) then
					{
						_ctrl lbAdd _x;
					};
				} forEach Bob_AltisLifeMisc;
			};
			if ('==== AltisLife Money ====' in _ADMINLEVELACCESS) then
			{
				_ctrl lbAdd '==== AltisLife Money ====';
				if (!isNil 'Bob_add_AltisLifeMoney') then
				{
					{
						_ctrl lbAdd _x;
					} forEach Bob_AltisLifeMoney;
					_ctrl lbAdd '';
				};
			};
		};
		
		
		if ('Mass Message' in _ADMINLEVELACCESS) then {_ctrl lbAdd 'Mass Message';};
		if ('DayTime' in _ADMINLEVELACCESS) then {_ctrl lbAdd 'DayTime';};
		if ('NightTime' in _ADMINLEVELACCESS) then {_ctrl lbAdd 'NightTime';};
		if ('Add 2500 Crypto' in _ADMINLEVELACCESS) then {if (!isNil 'EPOCH_KeyDown') exitWith {_ctrl lbAdd 'Add 2500 Crypto';};};
		if ('Spawn Epoch-Box' in _ADMINLEVELACCESS) then {if (!isNil 'EPOCH_KeyDown') exitWith {_ctrl lbAdd 'Spawn Epoch-Box';};};
		if ('Spawn Ammo' in _ADMINLEVELACCESS) then {_ctrl lbAdd 'Spawn Ammo';};
		_ctrl lbAdd '';
		_ctrl lbAdd 'Menu Layout 1';
		_ctrl lbAdd 'Menu Layout 2';
		_ctrl lbAdd '';
		_ctrl lbAdd 'Self Disconnect';
		
		call fnc_colorizeMain;
	};
	fnc_fill_Bob_Player =
	{
		disableSerialization;
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl LEFT_CTRL_ID;
		lbclear _ctrl;
		
		_unsorted = playableUnits+alldead;
		_sorted = [];
		{
			if (str _unsorted != '[]') then
			{
				_closest = _unsorted select 0;
				if (!isNil '_closest') then
				{
					{if ((getPos _x distance player) < (getPos _closest distance player)) then {_closest = _x}} forEach _unsorted;
					_sorted = _sorted + [_closest];
					_unsorted = _unsorted - [_closest]
				};
			};
		} forEach _unsorted;
		_sorted;
		_playableUnits = _sorted;
		
		lbclear _ctrl;
		
		_puid = getPlayerUID player;
		{
			if (!isNull _x) then
			{
				_PUIDX = getPlayerUID _x;
				if (_PUIDX != '') then
				{
					_txt = name _x;
					if (isNil 'EPOCH_KeyDown') then {_txt = format['%1 [%2]',name _x,side _x]};
					_ctrl lbAdd _txt;
					_ctrl lbSetData [(lbsize _ctrl)-1,'1'];
					_clr = [1,1,1,1];
					_veh = vehicle _x;
					_plrpic = getText (configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'picture');
					if (alive _x) then
					{
						_clr = [0.2,0.2,0.9,1];
						if (_x == _veh) then
						{
							_clr = [1,0.17,0.17,1];
							_wpnstate = weaponState _x;
							_cwep = _wpnstate select 0;
							if (_cwep != '') then
							{
								_plrpic = getText (configFile >> 'CfgWeapons' >> _cwep >> 'picture');
							};
						};
					};
					if (((_PUIDX in Bob_ADMINS) && !(_PUIDX in Bob_DEVS)) || ((_PUIDX in Bob_DEVS) && (_puid in Bob_DEVS)) || (_PUIDX == _puid)) then
					{
						_clr = [0,1,0,1];
					};
					_ctrl lbSetColor [(lbsize _ctrl)-1,_clr];
					_ctrl lbSetPicture [(lbsize _ctrl)-1,_plrpic];
				};
			};
			true
		} count _playableUnits;
		
		_ctrl lbAdd '====================';
		_ctrl lbAdd 'Sorted by distance to you';_ctrl lbSetColor [(lbsize _ctrl)-1,[1,1,1,1]];
		_ctrl lbAdd 'Green -> Admin';_ctrl lbSetColor [(lbsize _ctrl)-1,[0,1,0,1]];
		_ctrl lbAdd 'Red -> Player';_ctrl lbSetColor [(lbsize _ctrl)-1,[1,0.17,0.17,1]];
		_ctrl lbAdd 'Blue -> Player in Vehicle';_ctrl lbSetColor [(lbsize _ctrl)-1,[0.2,0.2,0.9,1]];
		_ctrl lbAdd 'White -> Dead Player';_ctrl lbSetColor [(lbsize _ctrl)-1,[1,1,1,1]];
	};
	fnc_LBDblClick_LEFT =
	{
		_target = lbtext [LEFT_CTRL_ID, (lbCurSel LEFT_CTRL_ID)];
		SELECTED_DOUBLECLICK_TARGET = objNull;
		if (!isNil 'SELECTED_TARGET_PLAYER') then
		{
			if (!isNull SELECTED_TARGET_PLAYER) then
			{
				SELECTED_DOUBLECLICK_TARGET = SELECTED_TARGET_PLAYER;
			};
		};
		if (isNull SELECTED_DOUBLECLICK_TARGET) then
		{
			_break = false;
			{
				_puid = getPlayerUID _x;
				if (_puid != '') then
				{
					_search = name _x;
					if (isNil 'EPOCH_KeyDown') then {_search = format['%1 [%2]',name _x,side _x]};
					if (_search == _target) then
					{
						_break = true;
						SELECTED_DOUBLECLICK_TARGET = _x;
					};
				};
				if (_break) exitWith {true};
				true;
			} count (playableUnits+allDead);
		};
		_ADMINLEVELACCESS = call ADMINLEVELACCESS;
		if ('spectating' in _ADMINLEVELACCESS) then {[] spawn adminspec;};
	};
	fnc_LBSelChanged_LEFT =
	{
		_target = lbtext [LEFT_CTRL_ID, (lbCurSel LEFT_CTRL_ID)];
		
		_break = false;
		_health = '';
		_distance = '';
		_data = '';
		_puid = '';
		SELECTED_TARGET_PLAYER = objNull;
		{
			_puid = getPlayerUID _x;
			if (_puid != '') then
			{
				_search = name _x;
				if (isNil 'EPOCH_KeyDown') then {_search = format['%1 [%2]',name _x,side _x]};
				if (_search == _target) then
				{
					_break = true;
					SELECTED_TARGET_PLAYER = _x;
				};
			};
			if (_break) exitWith {true};
			true;
		} count (playableUnits+allDead);
		
		if (isNil 'SELECTED_TARGET_PLAYER') then {SELECTED_TARGET_PLAYER = objNull;};
		if (!isNull SELECTED_TARGET_PLAYER) then
		{
			_health = round(100 - ((damage SELECTED_TARGET_PLAYER)*100));
			_distance = round(SELECTED_TARGET_PLAYER distance player);
			if (MAIN_DISPLAY_ID == 2727) then {
				_log = format['%1m - HP: %2 - UID: %3',_distance,_health,_puid];
				ctrlSetText [1400,_log];
			};
		};
	};
	fnc_LBDblClick_RIGHT =
	{
		_click = format['%1',lbtext [RIGHT_CTRL_ID, (lbCurSel RIGHT_CTRL_ID)]];
		if (_click == '') exitWith {};
		if (_click in AH_HackLogArray) exitWith {};
		if (_click in Bob_Toggleable) then
		{
			if (_click == 'Box-ESP') then {[] spawn Bob_fnc_boxesp;};
			if (_click == 'Map-Icons') then {[] spawn Bob_A3MAPICONS;};
			if (_click == 'PlotPole Marker') then {[] spawn adminPlotPole;};
			if (_click == 'Construction Marker') then {[] spawn adminConstructions;};
			if (_click == 'DeadPlayer Marker') then {[] spawn adminDeadPlayer;};
			if (_click == 'God Mode') then {[] spawn Bob_A3Invulnerability;};
			if (_click == 'Vehicle God Mode') then {[] spawn fnc_Bob_A3cargod;};
			if (_click == 'Lower Terrain') then {[] spawn fnc_LowerTerrain;};
			if (_click == 'Vehboost') then {[] spawn Bob_VehicleBoost;};
			if (_click == 'UnlimAmmo') then {[] spawn fnc_Bob_A3UnlAmmo;};
			if (_click == 'noRecoil') then {[] spawn fnc_Bob_A3noRecoil;};
			if (_click == 'FastFire') then {[] spawn fnc_Bob_A3FF;};
			if (_click == 'Stealth / Invisible') then {[] spawn fnc_BobHIDE;};
			if (_click == 'Disable Announces') then {[] spawn fnc_DisableAnnouncements;};
			if (_click == 'Show FPS') then {[] call Bob_A3showfps;};
			
			if !(_click in Bob_toggled_A) then
			{
				lbSetColor [RIGHT_CTRL_ID,_click,[0,1,0,1]];
				Bob_toggled_A = Bob_toggled_A + [_click];
			}
			else
			{
				lbSetColor [RIGHT_CTRL_ID, _click, [1,0,0,1]];
				Bob_toggled_A = Bob_toggled_A - [_click];
			};
		};
		if (_click in Bob_SubMenus) then
		{
			lbSetColor [RIGHT_CTRL_ID,_click,[0,0.8,0.8,1]];
		};
		if (_click in Bob_OnTargetNICE) then
		{
			lbSetColor [RIGHT_CTRL_ID,_click,COLORNICE];
		};
		if (_click in Bob_OnTargetEVIL) then
		{
			lbSetColor [RIGHT_CTRL_ID,_click,COLOREVIL];
		};
		if (_click in Bob_OnTarget) then
		{
			_target = lbtext [LEFT_CTRL_ID, (lbCurSel LEFT_CTRL_ID)];
			if (_target == '') then
			{
				hint 'You did not select a Target!';
			}
			else
			{
				if (isNil 'SELECTED_TARGET_PLAYER') then {SELECTED_TARGET_PLAYER = objNull;};
				_unit = SELECTED_TARGET_PLAYER;
				if (isNull _unit) then
				{
					_unit = objNull;
					_break = false;
					{
						if (getPlayerUID _x != '') then
						{
							_search = name _x;
							if (isNil 'EPOCH_KeyDown') then {_search = format['%1 [%2]',name _x,side _x]};
							if (_search == _target) then
							{
								_break = true;
								_unit = _x;
							};
						};
						if (_break) exitWith {true};
						true
					} count (playableUnits+allDead);
				};
				if (!isNull _unit) then
				{
					if (_click == 'Teleport Target To Me') then {[_unit] call fnc_TP2ME;};
					if (_click == 'Teleport To') then {[_unit] call fnc_TPME2;};
					if (_click == 'Revive') then {[_unit] call fnc_ReviveTarget;};
					if (_click == 'Heal') then {[_unit] call fnc_HealTarget;};
					if (_click == 'Repair') then {[_unit] call fnc_RepairTarget;};
					if (_click == 'Move In My Vehicle') then {[_unit] call fnc_MoveInMyVehicle;};
					if (_click == 'Move In Target Vehicle') then {[_unit] call fnc_MoveInTargetVehicle;};
					
					if (_click == 'Spawn UAV') then {[_unit,'UAV'] call fnc_spawn_EVENT;};
					if (_click == 'Spawn Epoch_Cloak_F') then {[_unit,'Epoch_Cloak_F'] call fnc_spawn_EVENT;};
					if (_click == 'Spawn Sapper_F') then {[_unit,'Epoch_Sapper_F'] call fnc_spawn_EVENT;};
					if (_click == 'Spawn GreatWhite_F') then {[_unit,'GreatWhite_F'] call fnc_spawn_EVENT;};
					if (_click == 'Eject') then {[_unit] call fnc_EjectTargetVeh;};
					if (_click == 'Eject Crew') then {[_unit] call fnc_EjectCrewTargetVeh;};
					if (_click == 'Kill') then {[_unit] call fnc_Kill_selected;};
					if (_click == 'Zeus') then {[_unit] spawn zeus_attack;};
					if (_click == 'Delete Vehicle') then {[_unit] call fnc_deleteVeh_selected;};
					if (_click == 'Force Disconnect') then {[_unit] call fnc_Disconnect_selected;};
					if (_click == 'Kick') then {[_unit] call fnc_Kick_selected;};
					if (_click == 'TempBan') then {[_unit] call fnc_TempBan_selected;};
				};
			};
		};
		if (!isNil 'life_adminlevel') then
		{
			if (_click in Bob_AltisLifeMisc) then
			{
				if (_click == 'Give All Liscenses') then {{missionnamespace setVariable[(_x select 0),true];} foreach life_licenses;};
			};
			if (_click in Bob_AltisLifeMoney) then
			{
				if (_click == '50K Cash') then {['cash',50000] call fnc_AltisLife_cash;};
				if (_click == '100K Cash') then {['cash',100000] call fnc_AltisLife_cash;};
				if (_click == '250K Cash') then {['cash',250000] call fnc_AltisLife_cash;};
				if (_click == '500K Cash') then {['cash',500000] call fnc_AltisLife_cash;};
				if (_click == '750K Cash') then {['cash',750000] call fnc_AltisLife_cash;};
				if (_click == '1.150K Cash') then {['cash',1150000] call fnc_AltisLife_cash;};
				if (_click == '2.500K Cash') then {['cash',2500000] call fnc_AltisLife_cash;};
				if (_click == '5.000K Cash') then {['cash',5000000] call fnc_AltisLife_cash;};
				if (_click == '10.000K Cash') then {['cash',10000000] call fnc_AltisLife_cash;};
				
				if (_click == '50K Bank') then {['bank',50000] call fnc_AltisLife_cash;};
				if (_click == '100K Bank') then {['bank',100000] call fnc_AltisLife_cash;};
				if (_click == '250K Bank') then {['bank',250000] call fnc_AltisLife_cash;};
				if (_click == '500K Bank') then {['bank',500000] call fnc_AltisLife_cash;};
				if (_click == '750K Bank') then {['bank',750000] call fnc_AltisLife_cash;};
				if (_click == '1.150K Bank') then {['bank',1150000] call fnc_AltisLife_cash;};
				if (_click == '2.500K Bank') then {['bank',2500000] call fnc_AltisLife_cash;};
				if (_click == '5.000K Bank') then {['bank',5000000] call fnc_AltisLife_cash;};
				if (_click == '10.000K Bank') then {['bank',10000000] call fnc_AltisLife_cash;};
			};
		};
		if (_click in Bob_Loadouts) then
		{
			if (_click == 'Epoch 1') then {[0] call fnc_add_loadout;};
			if (_click == 'Epoch 2') then {[1] call fnc_add_loadout;};
			if (_click == 'Sub Machinegun Kit') then {[2] call fnc_add_loadout;};
			if (_click == 'Light Infantry Kit') then {[3] call fnc_add_loadout;};
			if (_click == 'Heavy Infantry Kit') then {[4] call fnc_add_loadout;};
			if (_click == 'DMR Sniper Kit') then {[5] call fnc_add_loadout;};
			if (_click == 'LLR Sniper Kit') then {[6] call fnc_add_loadout;};
			if (_click == 'Normal Sniper Kit') then {[7] call fnc_add_loadout;};
		};
		if (_click == '==== OnTarget ====') then {if (isNil 'Bob_add_OnTarget') then {Bob_add_OnTarget = true;} else {Bob_add_OnTarget = nil;};};
		if (_click == '==== Toggleable ====') then {if (isNil 'Bob_add_Toggleable') then {Bob_add_Toggleable = true;} else {Bob_add_Toggleable = nil;};};
		if (_click == '==== AltisLife Misc ====') then {if (isNil 'Bob_add_AltisLife') then {Bob_add_AltisLife = true;} else {Bob_add_AltisLife = nil;};};
		if (_click == '==== AltisLife Money ====') then {if (isNil 'Bob_add_AltisLifeMoney') then {Bob_add_AltisLifeMoney = true;} else {Bob_add_AltisLifeMoney = nil;};};
		if (_click == '==== Loadouts ====') then {if (isNil 'Bob_add_Loadouts') then {Bob_add_Loadouts = true;} else {Bob_add_Loadouts = nil;};};
		if (_click == '==== Weapons ====') then {if (isNil 'Bob_add_weapons') then {Bob_add_weapons = true;} else {Bob_add_weapons = nil;};};
		if (_click == '==== Magazines ====') then {if (isNil 'Bob_add_magazines') then {Bob_add_magazines = true;} else {Bob_add_magazines = nil;};};	
		if (_click == '==== Vehicles ====') then {if (isNil 'Bob_add_vehicles') then {Bob_add_vehicles = true;} else {Bob_add_vehicles = nil;};};
		if (_click == SHOWHACKLOG) then {if (isNil 'Bob_add_HackLog') then {Bob_add_HackLog = true;} else {Bob_add_HackLog = nil;};};		
		if (_click == SHOWTBANLOG) then {if (isNil 'Bob_add_TempBanned') then {Bob_add_TempBanned = true;} else {Bob_add_TempBanned = nil;};};
		if (_click in PVAH_AHTMPBAN) then
		{
			PVAH_AdminReq = [-667,player,_click];
			publicVariableServer 'PVAH_AdminReq';
			systemchat format['Removed   %1   from TempBanList',_click];
		};
		if (_click == 'Mass Message') then {[] call fnc_mass_message;};
		if (_click == 'DayTime') then {[11] call fnc_spawn_timemachine;};
		if (_click == 'NightTime') then {[23] call fnc_spawn_timemachine;};
		if (_click == 'Add 2500 Crypto') then {[2500] call fnc_spawn_Crypto;};
		if (_click == 'Spawn Epoch-Box') then {[1] call fnc_spawn_Box;};
		if (_click == 'Spawn Ammo') then {[] call Bob_A3addAmmo;};
		if (_click == 'Menu Layout 1') then {closeDialog 0;Bob_Layout_Selected = 1;[] spawn fnc_FULLinit;};
		if (_click == 'Menu Layout 2') then {closeDialog 0;Bob_Layout_Selected = 2;[] spawn fnc_FULLinit;};
		if (_click == 'Self Disconnect') then {(finddisplay 46) closeDisplay 0;};
		if (_click in Bob_HEADER) then
		{
			lbSetColor [RIGHT_CTRL_ID, _click, [0.2,0.4,1,1]];
		};
		if ((isClass (configFile >> 'CfgWeapons' >> _click)) || (isClass (configFile >> 'CfgMagazines' >> _click)) || (_click in ALL_WEPS_TO_SEARCH) || (_click in ALL_MAGS_TO_SEARCH)) then
		{
			_pos = player modelToWorld [0,1,0];
			
			_log = format['Spawning %1 on the ground infront of you!',_click];
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			PVAH_AdminReq = [3,player,_pos,_click];
			publicVariableServer 'PVAH_AdminReq';
		};
		if ((isClass (configFile >> 'CfgVehicles' >> _click)) || (_click in ALL_VEHS_TO_SEARCH)) then
		{
			_position = player modelToWorld [0,8,0];
			NEW_VEHICLE_POS = _position;
			_dir = getDir (vehicle player);
			
			_log = format['Spawning %1 infront of you!',_click];
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			PVAH_AdminReq = [0,player,_click,_position,_dir];
			publicVariableServer 'PVAH_AdminReq';
		};
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
		lbclear _ctrl;
		call fnc_fill_Bob_MAIN;
	};
	fnc_LBSelChanged_RIGHT =
	{
		_ctrl = (findDisplay MAIN_DISPLAY_ID) displayCtrl RIGHT_CTRL_ID;
		lbclear _ctrl;
		call fnc_fill_Bob_MAIN;
		if (MAIN_DISPLAY_ID == 2727) then {call fnc_bottom_RIGHT;};
		
		_selected = lbtext [RIGHT_CTRL_ID, (lbCurSel RIGHT_CTRL_ID)];
		if (_selected in AH_HackLogArray) exitWith {systemchat _selected;};
		_status = 'no';
		if (isClass (configFile >> 'CfgWeapons' >> _selected)) then
		{
			_status = 'CfgWeapons';
		};
		if (isClass (configFile >> 'CfgMagazines' >> _selected)) then
		{
			_status = 'CfgMagazines';
		};
		if (isClass (configFile >> 'CfgVehicles' >> _selected)) then
		{
			_status = 'CfgVehicles';
		};
		if (_status != 'no') then
		{
			_pic = (getText (configFile >> _status >> _selected >> 'picture'));
			['
				<img size=''5'' image='''+_pic+'''/>
			',0,safezoneY+0.01,15,0,0,8406] spawn bis_fnc_dynamicText;
			
			_txt = (gettext (configFile >> _status >> _selected >> 'Library' >> 'libTextDesc'));
			['
				<t size=''0.5'' font=''TahomaB''>'+_txt+' </t>
			',0,0.8 * safezoneH + safezoneY,15,0,0,8407] spawn bis_fnc_dynamicText;
		};
	};
	fnc_bottom_RIGHT =
	{
		_selected = format['%1',lbtext [RIGHT_CTRL_ID, (lbCurSel RIGHT_CTRL_ID)]];
		if (!isNil 'life_adminlevel') then
		{
			_ctrlb = (findDisplay MAIN_DISPLAY_ID) displayCtrl 1401;
			_ctrltxt = ctrlText _ctrlb;
			_amount = parseNumber _ctrltxt;
			if (_selected == 'CASH') exitWith
			{
				ctrlSetText [1400,'Enter amount and press CASH again -->'];
				if (_amount > 0) exitWith {life_cash = _amount;};
			};
			if (_selected == 'BANK') exitWith
			{
				ctrlSetText [1400,'Enter amount and press BANK again -->'];
				if (_amount > 0) exitWith {life_atmcash = _amount;};
			};
		};
		
		_cfg = '';
		if (isClass (configFile >> 'CfgWeapons' >> _selected)) then
		{
			_cfg = 'CfgWeapons';
		}
		else
		{
			if (isClass (configFile >> 'CfgMagazines' >> _selected)) then
			{
				_cfg = 'CfgMagazines';
			}
			else
			{
				if (isClass (configFile >> 'CfgVehicles' >> _selected)) then
				{
					_cfg = 'CfgVehicles';
				};
			};
		};
		if (_cfg != '') then
		{
			_txt = getText (configFile >> _cfg >> _selected >> 'displayName');
			ctrlSetText [1401,format['%1 - %2',_selected,_txt]];
		};
		if (!isNil 'life_adminlevel') then {ctrlSetText [1000,format['by Bob.de | CASH: %1K - BANK: %2K',life_cash/1000,life_atmcash/1000,_selected]];};
	};
	admin_d0 = {
		'respawn_west' setMarkerText (_this select 0);
		PVAH_AdminReq = [69,player];
		publicVariableServer 'PVAH_AdminReq';
	};
	((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
	((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ['MouseButtonDown','
	if ((_this select 1 == 0) && (ALT_IS_PRESSED)) then
	{
		_object = vehicle player;
		_pos = ((_this select 0) posScreenToWorld [_this select 2, _this select 3]);
		if (_object isKindOf ''AIR'') then
		{
			_posObj = getPosATL _object;
			_object setPosATL [_pos select 0,_pos select 1,_posObj select 2];
		}
		else
		{
			_object setPosATL _pos;
		};
		ALT_IS_PRESSED = false;
		{player reveal _x;} foreach (position player nearObjects 50);
	};
	'];
	admin_showGear = {
		closeDialog 0;
		if (!isNil 'SELECTED_DOUBLECLICK_TARGET') then
		{
			if (!isNull SELECTED_DOUBLECLICK_TARGET) then
			{
				player action ['Gear', SELECTED_DOUBLECLICK_TARGET];
				cutText [format['Showing Gear of %1',name SELECTED_DOUBLECLICK_TARGET], 'PLAIN DOWN'];
			};
		};
	};
	fnc_getConfig = {
		_cfg = '';
		if (isClass (configFile >> 'CfgWeapons' >> _this)) then
		{
			_cfg = 'CfgWeapons';
		}
		else
		{
			if (isClass (configFile >> 'CfgMagazines' >> _this)) then
			{
				_cfg = 'CfgMagazines';
			}
			else
			{
				if (isClass (configFile >> 'CfgVehicles' >> _this)) then
				{
					_cfg = 'CfgVehicles';
				};
			};
		};
		_cfg
	};
	remove_spec_000 = {
		(vehicle player) switchCamera cameraView;
		for '_i' from 3025 to 3045 do {['',0,0,1,0,0,_i] spawn bis_fnc_dynamicText;};
		if (!isNil 'SpecateLoopActive') then
		{
			[] spawn remove_spec_000;
			SpecateLoopActive = nil;
			cutText ['Finished spectating.', 'PLAIN DOWN'];
		};
	};
	adminspec = {
		cutText ['Spectating - Press F10 to exit.', 'PLAIN DOWN'];
		if (isNil 'SpecateLoopActive') then
		{
			SpecateLoopActive = true;
			while {!isNil 'SpecateLoopActive'} do
			{
				uiSleep 0.2;
				
				if (isNil 'SELECTED_DOUBLECLICK_TARGET') then {SELECTED_DOUBLECLICK_TARGET = player;};
				_unit = SELECTED_DOUBLECLICK_TARGET;
				if (isNull _unit) then {_unit = player;};
				if (str(_unit) == '<NULL-object>') then {_unit = player;};
				if (getPlayerUID _unit == '') then {_unit = player;};
				
				
				_veh = vehicle _unit;
				if (str _veh != str cameraOn) then {_veh switchCamera cameraView;for '_i' from 3025 to 3045 do {['',0,0,1,0,0,_i] spawn bis_fnc_dynamicText;};};
				
				
				_log = format['%1 (%2) @%3 SPD %4',name _unit,getPlayerUID _unit,mapGridPosition _veh,abs(speed _veh)];
				['<t align=''left'' size=''0.5'' color=''#238701''>'+_log+'</t>',safezoneX+0.2,safezoneY+0.405,0.3,0,0,3033] spawn bis_fnc_dynamicText;
				
				_log2 = format['Health: %1',(1-(damage _unit))*100];
				['<t align=''left'' size=''0.5'' color=''#238701''>'+_log2+'</t>',safezoneX+0.2,safezoneY+0.435,0.3,0,0,3034] spawn bis_fnc_dynamicText;
				
				_cwep = '';
				_cammo = '';
				_cmags = '';
				_wpnstate = weaponState _unit;
				if (!isNil '_wpnstate') then
				{
					if (str _wpnstate != '[]') then
					{
						_cwep = _wpnstate select 0;
						_cmags = {_wpnstate select 3 == _x} count magazines _unit;
						_cammo = _wpnstate select 4;
					};
				};
				if (_cwep == '') then
				{
					_log3 = 'Bare Fists';
					['<t align=''left'' size=''0.5'' color=''#238701''>'+_log3+'</t>',safezoneX+0.2,safezoneY+0.465,0.3,0,0,3035] spawn bis_fnc_dynamicText;
				}
				else
				{
					_type = _cwep;
					_cfg = _type call fnc_getConfig;
					_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
					_pic = getText (configFile >> _cfg >> _type >> 'picture');
					
					_log3 = format[' %1 [%2] (%3/%4)',_displayName,_cwep,_cammo,_cmags];
					['
					<img size=''0.75'' image='''+_pic+''' align=''left''/>
					<t align=''left'' size=''0.5'' color=''#238701''>'+_log3+'</t>
					',
					safezoneX+0.2,safezoneY+0.465,0.3,0,0,3035] spawn bis_fnc_dynamicText;
					
					if (_veh != _unit) then
					{
						_cwepsV = weapons _veh;
						_cwepsV = _cwepsV - ['CarHorn'];
						_cwepsV = _cwepsV - ['MiniCarHorn'];
						_cwepsV = _cwepsV - ['SportCarHorn'];
						_cwepsV = _cwepsV - ['TruckHorn'];
						if (count _cwepsV > 0) then
						{
							_id = 3032;
							_YPOS = safezoneY+0.355;
							
							{
								_cwep = _x;
								_cammo = _veh ammo _cwep;
								_cmags = {currentMagazine _veh == _x} count magazines _veh;
								
								_type = _cwep;
								_cfg = _type call fnc_getConfig;
								_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
								
								_log3a = format[' %1 [%2] (%3/%4)',_displayName,_cwep,_cammo,_cmags];
								['<t align=''left'' size=''0.5'' color=''#A90F68''>'+_log3a+'</t>',safezoneX+0.2,_YPOS,0.3,0,0,_id] spawn bis_fnc_dynamicText;
								
								_id = _id - 1;
								_YPOS = _YPOS - 0.03;
							} forEach _cwepsV;
						};
					};
				};
				
				
				_ct = cursorTarget;
				if (!isNull _ct) then
				{
					if (getPlayerUID _ct != '') then
					{
						_cwep_ct = currentWeapon _ct;
						_cammo_ct = _ct ammo _cwep_ct;
						_cmags_ct = {currentMagazine _ct == _x} count magazines _ct;
						
						_log4 = format['%1 (%2) @%3 SPD %4',name _ct,getPlayerUID _ct,mapGridPosition _ct,abs(speed _ct)];
						['<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log4+'</t>',safezoneX+0.2,safezoneY+0.545,0.3,0,0,3036] spawn bis_fnc_dynamicText;
						
						_log5 = format['Health: %1  Distance: %2m',(1-(damage _ct))*100,round(cameraOn distance _ct)];
						['<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log5+'</t>',safezoneX+0.2,safezoneY+0.575,0.3,0,0,3037] spawn bis_fnc_dynamicText;
						
						_type = _cwep_ct;
						_cfg = _type call fnc_getConfig;
						_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
						_pic = getText (configFile >> _cfg >> _type >> 'picture');
						_log6 = format[' %1 [%2] (%3/%4)',_displayName,_cwep_ct,_cammo_ct,_cmags_ct];
						['
						<img size=''0.75'' image='''+_pic+''' align=''left''/>
						<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log6+'</t>
						',
						safezoneX+0.2,safezoneY+0.605,0.3,0,0,3038] spawn bis_fnc_dynamicText;
					}
					else
					{
						_type = typeOf _ct;
						_cfg = _type call fnc_getConfig;
						_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
						_log4 = format['%1 [%2] @%3',_displayName,_type,mapGridPosition _ct];
						['<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log4+'</t>',safezoneX+0.2,safezoneY+0.545,0.3,0,0,3036] spawn bis_fnc_dynamicText;
						
						_log5 = format['Health: %1 - Distance: %2m',(1-(damage _ct))*100,round(cameraOn distance _ct)];
						['<t align=''left'' size=''0.5'' color=''#B80B36''>'+_log5+'</t>',safezoneX+0.2,safezoneY+0.575,0.3,0,0,3037] spawn bis_fnc_dynamicText;
						
						['',0,0,1,0,0,3038] spawn bis_fnc_dynamicText;
					};
					
					_vehCT = vehicle _ct;
					if ((_vehCT isKindOf 'LandVehicle') || (_vehCT isKindOf 'Air') || (_vehCT isKindOf 'Ship') || (_vehCT isKindOf 'Static')) then
					{
						_cwepsV = weapons _vehCT;
						_cwepsV = _cwepsV - ['CarHorn'];
						_cwepsV = _cwepsV - ['MiniCarHorn'];
						_cwepsV = _cwepsV - ['SportCarHorn'];
						_cwepsV = _cwepsV - ['TruckHorn'];
						if (count _cwepsV > 0) then
						{
							_id = 3039;
							_YPOS = safezoneY+0.655;
							
							{
								_cwep = _x;
								_cammo = _vehCT ammo _cwep;
								_cmags = {currentMagazine _vehCT == _x} count magazines _vehCT;
								
								_type = _cwep;
								_cfg = _type call fnc_getConfig;
								_displayName = getText (configFile >> _cfg >> _type >> 'displayName');
								
								_log6a = format[' %1 [%2] (%3/%4)',_displayName,_cwep,_cammo,_cmags];
								['<t align=''left'' size=''0.5'' color=''#A90F68''>'+_log6a+'</t>',safezoneX+0.2,_YPOS,0.3,0,0,_id] spawn bis_fnc_dynamicText;
								
								_id = _id + 1;
								_YPOS = _YPOS + 0.03;
							} forEach _cwepsV;
						};
					};
				};
			};
			[] spawn remove_spec_000;
		};
	};
	fnc_TP2ME =
	{
		_unit = _this select 0;
		_pos = player modelToWorld [0,5,0];
		PVAH_AdminReq = [1,player,_unit,_pos];
		publicVariableServer 'PVAH_AdminReq';
	};
	fnc_TPME2 =
	{
		_unit = _this select 0;
		_pos = _unit modelToWorld [0,-5,0];
		(vehicle player) setPos _pos;
	};
	fnc_MoveInMyVehicle =
	{
		_unit = _this select 0;
		_unit moveInAny (vehicle player);
	};
	fnc_MoveInTargetVehicle =
	{
		_unit = _this select 0;
		player moveInAny (vehicle _unit);
	};
	fnc_EjectTargetVeh =
	{
		_unit = _this select 0;
		_unit action ['eject',(vehicle _unit)];
	};
	fnc_EjectCrewTargetVeh =
	{
		_unit = _this select 0;
		_veh = (vehicle _unit);
		{_x action ['eject',_veh];} forEach (crew _veh);
	};
	fnc_add_loadout =
	{
		_select = _this select 0;
		_wset = player;
		removeAllWeapons _wset;
		removeAllItems _wset;
		removebackpack _wset;
		removeAllAssignedItems _wset;
		switch (_select) do
		{
			case 0: {
				_wset = player;
				_wset addBackpack 'B_Carryall_ocamo';
				_wset forceAddUniform 'O_G_Soldier_M_F';
				_wset addItemToBackpack 'V_PlateCarrierIA1_dgtl';
				_wset addItemToBackpack 'Heal_EPOCH';
				_wset addItemToBackpack 'Defib_EPOCH';
				_wset addItemToBackpack 'Repair_EPOCH';
				_wset addItemToBackpack 'EnergyPackLg';
				_wset addItemToBackpack 'MultiGun';
				_wset addItemToBackpack 'ItemWatch';
				_wset addItemToBackpack 'ItemCompass';
				_wset addItemToBackpack 'ItemGPS';
				_wset addItemToBackpack 'ItemMap';
				_wset addItemToBackpack 'Rangefinder';
				_wset addItemToBackpack 'NVGoggles';
				_wset addItemToBackpack 'Hatchet';
				_wset addItemToBackpack 'hatchet_swing';
				_wset addItemToBackpack 'MeleeSledge';
				_wset addItemToBackpack 'sledge_swing';
				_wset addItemToBackpack 'srifle_EBR_F';
				_wset addItemToBackpack '20Rnd_762x51_Mag';
				_wset addItemToBackpack 'optic_DMS';
				_wset addItemToBackpack 'optic_SOS';
				_wset addItemToBackpack 'optic_MRCO';
				_wset addItemToBackpack 'muzzle_snds_B';
			};
			case 1: {
				_wset = player;
				_wset addBackpack 'B_Carryall_ocamo';
				_wset forceAddUniform 'U_B_GhillieSuit';
				_wset addItemToBackpack 'V_PlateCarrierIA1_dgtl';
				_wset addItemToBackpack 'Heal_EPOCH';
				_wset addItemToBackpack 'Defib_EPOCH';
				_wset addItemToBackpack 'Repair_EPOCH';
				_wset addItemToBackpack 'EnergyPackLg';
				_wset addItemToBackpack 'MultiGun';
				_wset addItemToBackpack 'ItemWatch';
				_wset addItemToBackpack 'ItemCompass';
				_wset addItemToBackpack 'ItemGPS';
				_wset addItemToBackpack 'ItemMap';
				_wset addItemToBackpack 'Rangefinder';
				_wset addItemToBackpack 'NVGoggles';
				_wset addItemToBackpack 'Hatchet';
				_wset addItemToBackpack 'hatchet_swing';
				_wset addItemToBackpack 'MeleeSledge';
				_wset addItemToBackpack 'sledge_swing';
				_wset addItemToBackpack 'srifle_EBR_F';
				_wset addItemToBackpack '20Rnd_762x51_Mag';
				_wset addItemToBackpack 'optic_DMS';
				_wset addItemToBackpack 'optic_SOS';
				_wset addItemToBackpack 'optic_MRCO';
				_wset addItemToBackpack 'muzzle_snds_B';
				_wset addVest 'V_BandollierB_cbr';
				_wset addWeapon 'NVGoggles';
				_wset addWeapon 'Rangefinder';
				_wset addPrimaryWeaponItem 'optic_Aco';
				_wset addPrimaryWeaponItem 'muzzle_snds_M';
				(unitBackpack _wset) additemCargo ['FirstAidKit',2];
				(unitBackpack _wset) additemCargo ['30Rnd_556x45_Stanag', 9];
				(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
				(unitBackpack _wset) additemCargo ['handGrenade', 2];
				_wset addWeapon 'srifle_LRR_F';
				[] call Bob_A3addAmmo;
				[] call Bob_A3addAmmo;
				[] call Bob_A3addAmmo;
			};
			case 2: {
				_wset = player;
				_wset addHeadgear 'H_Beret_02';
				_wset addGoggles 'G_Sport_Blackred';
				_wset addUniform 'U_OrestesBody';
				_wset addVest 'V_BandollierB_cbr';
				_wset addBackpack 'B_Carryall_ocamo';
				_wset addWeapon 'NVGoggles';
				_wset addWeapon 'Rangefinder';
				_wset addMagazine '30Rnd_9x21_Mag';
				_wset addweapon 'hgun_PDW2000_Holo_snds_F';
				_wset addMagazine '6Rnd_45ACP_Cylinder';
				_wset addweapon 'hgun_Pistol_heavy_02_Yorris_F';
				_wset addPrimaryWeaponItem 'muzzle_snds_B';
				_wset addPrimaryWeaponItem 'acc_pointer_IR';
				_wset addWeaponGlobal 'ItemCompass';
				_wset addWeaponGlobal 'ItemMap';
				_wset addWeaponGlobal 'Itemgps';
				_wset addWeaponGlobal 'ItemWatch';
				_wset addWeaponGlobal 'itemradio';
				(unitBackpack _wset) additemCargo ['FirstAidKit',2];
				(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
				(unitBackpack _wset) additemCargo ['6Rnd_45ACP_Cylinder', 9];
			};
			case 3: {
				_wset = player;
				_wset addHeadgear 'H_Beret_02';
				_wset addGoggles 'G_Sport_Blackred';
				_wset addUniform 'U_IG_Guerilla3_1';
				_wset addVest 'V_BandollierB_cbr';
				_wset addBackpack 'B_Carryall_ocamo';
				_wset addWeapon 'NVGoggles';
				_wset addWeapon 'Rangefinder';
				_wset addMagazine '30Rnd_556x45_Stanag';
				_wset addweapon 'arifle_TRG21_ACO_pointer_F';
				_wset addMagazine '30Rnd_9x21_Mag';
				_wset addweapon 'hgun_P07_F';
				_wset addPrimaryWeaponItem 'optic_Aco';
				_wset addPrimaryWeaponItem 'muzzle_snds_M';
				_wset addHandgunItem 'muzzle_snds_L';
				_wset addWeaponGlobal 'ItemCompass';
				_wset addWeaponGlobal 'ItemMap';
				_wset addWeaponGlobal 'Itemgps';
				_wset addWeaponGlobal 'ItemWatch';
				_wset addWeaponGlobal 'itemradio';
				(unitBackpack _wset) additemCargo ['FirstAidKit',2];
				(unitBackpack _wset) additemCargo ['30Rnd_556x45_Stanag', 9];
				(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
				(unitBackpack _wset) additemCargo ['handGrenade', 2];
			};
			case 4: {
				_wset = player;
				_wset addHeadgear 'H_Beret_02';
				_wset addGoggles 'G_Sport_Blackred';
				_wset addUniform 'U_OG_leader';
				_wset addVest 'V_BandollierB_cbr';
				_wset addBackpack 'B_Carryall_ocamo';
				_wset addWeapon 'NVGoggles';
				_wset addWeapon 'Rangefinder';
				_wset addMagazine '150Rnd_762x51_Box_Tracer';
				_wset addweapon 'LMG_Zafir_pointer_F';
				_wset addMagazine '30Rnd_9x21_Mag';
				_wset addweapon 'hgun_P07_F';
				_wset addPrimaryWeaponItem 'optic_Nightstalker';
				_wset addPrimaryWeaponItem 'acc_pointer_IR';
				_wset addHandgunItem 'muzzle_snds_L';
				_wset addWeaponGlobal 'ItemCompass';
				_wset addWeaponGlobal 'ItemMap';
				_wset addWeaponGlobal 'Itemgps';
				_wset addWeaponGlobal 'ItemWatch';
				_wset addWeaponGlobal 'itemradio';
				(unitBackpack _wset) additemCargo ['FirstAidKit',2];
				(unitBackpack _wset) additemCargo ['150Rnd_762x51_Box_Tracer', 9];
				(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
				(unitBackpack _wset) additemCargo ['handGrenade', 2];
			};
			case 5: {
				_wset = player;
				_wset addHeadgear 'H_Beret_02';
				_wset addGoggles 'G_Sport_Blackred';
				_wset addUniform 'U_O_GhillieSuit';
				_wset addVest 'V_BandollierB_cbr';
				_wset addBackpack 'B_Carryall_ocamo';
				_wset addWeapon 'NVGoggles';
				_wset addWeapon 'Rangefinder';
				_wset addMagazine '10Rnd_762x51_Mag';
				_wset addweapon 'srifle_DMR_01_DMS_F';
				_wset addMagazine '30Rnd_9x21_Mag';
				_wset addweapon 'hgun_P07_F';
				_wset addPrimaryWeaponItem 'acc_pointer_IR';
				_wset addHandgunItem 'muzzle_snds_L';
				_wset addWeaponGlobal 'ItemCompass';
				_wset addWeaponGlobal 'ItemMap';
				_wset addWeaponGlobal 'Itemgps';
				_wset addWeaponGlobal 'ItemWatch';
				_wset addWeaponGlobal 'itemradio';
				(unitBackpack _wset) additemCargo ['FirstAidKit',2];
				(unitBackpack _wset) additemCargo ['10Rnd_762x51_Mag', 9];
				(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
				(unitBackpack _wset) additemCargo ['handGrenade', 2];
			};
			case 6: {
				_wset = player;
				_wset addGoggles 'G_Sport_Blackred';
				_wset addUniform 'U_O_CombatUniform_oucamo';
				_wset addVest 'V_BandollierB_cbr';
				_wset addBackpack 'B_Carryall_oucamo';
				_wset addWeapon 'NVGoggles';
				_wset addWeapon 'Rangefinder';
				_wset addMagazine '7Rnd_408_Mag';
				_wset addweapon 'srifle_LRR_LRPS_F';
				_wset addMagazine '30Rnd_9x21_Mag';
				_wset addweapon 'hgun_P07_F';
				_wset addPrimaryWeaponItem 'acc_pointer_IR';
				_wset addHandgunItem 'muzzle_snds_L';
				_wset addWeaponGlobal 'ItemCompass';
				_wset addWeaponGlobal 'ItemMap';
				_wset addWeaponGlobal 'Itemgps';
				_wset addWeaponGlobal 'ItemWatch';
				_wset addWeaponGlobal 'itemradio';
				(unitBackpack _wset) additemCargo ['FirstAidKit',2];
				(unitBackpack _wset) additemCargo ['7Rnd_408_Mag', 9];
				(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
				(unitBackpack _wset) additemCargo ['handGrenade', 2];
			};
			case 7: {
				_wset = player;
				_wset addHeadgear 'H_Beret_02';
				_wset addGoggles 'G_Sport_Blackred';
				_wset addUniform 'U_O_GhillieSuit';
				_wset addVest 'V_BandollierB_cbr';
				_wset addBackpack 'B_Carryall_ocamo';
				_wset addWeapon 'NVGoggles';
				_wset addWeapon 'Rangefinder';
				_wset addMagazine '20rnd_762x51_mag';
				_wset addweapon 'srifle_ebr_f';
				_wset addMagazine '30Rnd_9x21_Mag';
				_wset addweapon 'hgun_P07_F';
				_wset addPrimaryWeaponItem 'optic_sos';
				_wset addPrimaryWeaponItem 'muzzle_snds_B';
				_wset addPrimaryWeaponItem 'acc_pointer_IR';
				_wset addHandgunItem 'muzzle_snds_L';
				_wset addWeaponGlobal 'ItemCompass';
				_wset addWeaponGlobal 'ItemMap';
				_wset addWeaponGlobal 'Itemgps';
				_wset addWeaponGlobal 'ItemWatch';
				_wset addWeaponGlobal 'itemradio';
				(unitBackpack _wset) additemCargo ['FirstAidKit',2];
				(unitBackpack _wset) additemCargo ['20rnd_762x51_mag', 9];
				(unitBackpack _wset) additemCargo ['30Rnd_9x21_Mag', 9];
				(unitBackpack _wset) additemCargo ['handGrenade', 2];
			};
			default { hint 'no loadout selected' };
		};
	};
	fnc_spawn_timemachine =
	{
		_offset = _this select 0;
		
		PVAH_AdminReq = [6,player,_offset];
		publicVariableServer 'PVAH_AdminReq';
		
		_log = format['diag_tickTime changed to hour %1',_offset];
		cutText [_log, 'PLAIN DOWN'];
		hint _log;
	};
	fnc_mass_message =
	{
		disableSerialization;
		_display = findDisplay 24;
		if (isNull _display) exitWith
		{
			_log = 'open your chat, type a message and start this function again!';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			systemchat _log;
		};
		_chat = _display displayCtrl 101;
		_msg = ctrlText _chat;
		(_display) closeDisplay 0;
		PVAH_AdminReq = [7,player,toArray _msg];
		publicVariableServer 'PVAH_AdminReq';
		
		_log = 'message sent!';
		cutText [_log, 'PLAIN DOWN'];
		hint _log;
	};
	fnc_spawn_Crypto =
	{
		_add = _this select 0;
		EPOCH_playerCrypto = EPOCH_playerCrypto + _add;
		_log = format['%1 Crypto added - now %2 Crypto!',_add,EPOCH_playerCrypto];
		cutText [_log, 'PLAIN DOWN'];
		hint _log;
	};
	fnc_spawn_Box =
	{
		_select = _this select 0;
		_pos = player modelToWorld [0,3,0];
		PVAH_AdminReq = [5000,player,_select,_pos];
		publicVariableServer 'PVAH_AdminReq';
		
		_log = format['Spawning Box %1..',_select];
		cutText [_log, 'PLAIN DOWN'];
		hint _log;
	};
	fnc_AltisLife_cash =
	{
		_state = _this select 0;
		_amount = _this select 1;
		if (typeName _state != 'STRING') exitWith {};
		if (typeName _amount != 'SCALAR') exitWith {};
		if (_amount == 0) exitWith {};
		if (_state == 'cash') then
		{
			life_cash = life_cash + _amount;
			systemChat format['Cash %1K - %2K has been added.',life_cash/1000,_amount/1000];
		};
		if (_state == 'bank') then
		{
			life_atmcash = life_atmcash + _amount;
			systemChat format['Bank %1K - %2K has been added.',life_atmcash/1000,_amount/1000];
		};
	};
	fnc_Bob_A3cargod = {
		if (isNil 'A3carGodRun') then {A3carGodRun = 0;};
		if (A3carGodRun == 1) then
		{
			A3carGodRun = 0;
			
			_log = 'Vehicle God Mode - Disabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		}
		else
		{
			A3carGodRun = 1;
			
			_log = 'Vehicle God Mode - Enabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			while {A3carGodRun == 1} do
			{
				_veh = vehicle player;
				_added = false;
				if (_veh != player) then
				{
					_veh addEventHandler['HandleDamage',{false}];
					_added = true;
					if (damage _veh < 0.2) then {_veh setFuel 1;};
				};
				uiSleep 0.1;
				if (_added) then {_veh removeAllEventhandlers 'HandleDamage';};
			};
		};
	};
	fnc_LowerTerrain = {
		if (isNil 'admin_terrain') then {admin_terrain = true;} else {admin_terrain = !admin_terrain};
		if (admin_terrain) then {
			setTerrainGrid 50;
			_txt = 'Terrain Low';
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		}
		else
		{
			setTerrainGrid 25;
			_txt = 'Terrain Normal';
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		};
	};
	fnc_Bob_A3UnlAmmo = {
		if (isNil 'unlimAmmRun') then {unlimAmmRun = 0;};
		if (unlimAmmRun==0) then
		{
			unlimAmmRun=1;
			_log = 'Unlimited Ammo ON';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		}
		else
		{
			unlimAmmRun=0;
			_log = 'Unlimited Ammo OFF';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		};
		while {unlimAmmRun==1} do 
		{
			if (local vehicle player) then {
				vehicle player setAmmo [currentWeapon vehicle player, 1000000];
			};
			player setAmmo [primaryWeapon player, 1000000];
			(vehicle player) setVehicleAmmo 1;
			player setFatigue 0;
			uiSleep 0.1;
		};
	};
	fnc_Bob_A3noRecoil = {
		if (isNil 'noRecoilRun') then {noRecoilRun = 0;};
		if (noRecoilRun==0) then
		{
			noRecoilRun=1;
			_log = 'No Recoil ON';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		}
		else
		{
			noRecoilRun=0;
			_log = 'No Recoil OFF';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		};
		while {noRecoilRun==1} do 
		{
			(vehicle player) setUnitRecoilCoefficient 0;
			player setUnitRecoilCoefficient 0;
			player setFatigue 0;
			uiSleep 2;
		};
	};
	fnc_Bob_A3FF = {
		if (isNil 'A3FFrun') then {A3FFrun = 0;};
		if (A3FFrun==0) then
		{
			A3FFrun=1;
			_log = 'FastFire ON';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		}
		else
		{
			A3FFrun=0;
			_log = 'FastFire OFF';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		};
		while {A3FFrun==1} do
		{
			(vehicle player) setWeaponReloadingTime [(vehicle player),currentWeapon (vehicle player),0];
			player setWeaponReloadingTime [player,currentWeapon player,0];
			player setFatigue 0;
		};
	};
	fnc_BobHIDE = {
		if (isNil 'A3HIDErun') then {A3HIDErun = 0;};
		if (A3HIDErun==0) then
		{
			A3HIDErun=1;
			PVAH_AdminReq = [2,player,A3HIDErun];
			publicVariableServer 'PVAH_AdminReq';
			
			_log = 'Stealth / Invisible ON';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		}
		else
		{
			A3HIDErun=0;
			PVAH_AdminReq = [2,player,A3HIDErun];
			publicVariableServer 'PVAH_AdminReq';
			
			_log = 'Stealth / Invisible OFF';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		};
	};
	fnc_DisableAnnouncements = {
		if (isNil 'A3DANNrun') then {A3DANNrun = 0;};
		if (A3DANNrun==0) then
		{
			A3DANNrun=1;
			AdminAnnounceDisabled = true;
			
			_log = 'Disable Announces - ON';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		}
		else
		{
			A3DANNrun=0;
			AdminAnnounceDisabled = nil;
			
			_log = 'Disable Announces - OFF';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		};
	};
	Bob_A3showfps = {
		if (isNil 'Bob_A3ShowFpsRun') then {Bob_A3ShowFpsRun = 0;};
		if (Bob_A3ShowFpsRun == 0) then
		{
			Bob_A3ShowFpsRun = 1;
			Bob_A3showfpsLoop = [] spawn {
				while {1==1} do
				{
					_fps = diag_fps;
					_clr = '#FFFFFF';
					if (_fps <= 20) then {_clr = '#D10823'};
					if (_fps > 20) then {_clr = '#E65100'};
					if (_fps > 30) then {_clr = '#FCB458'};
					if (_fps > 40) then {_clr = '#BFFD67'};
					if (_fps > 50) then {_clr = '#02EC32'};
					['<t size=''0.6'' align=''left'' color='+str _clr+' font=''TahomaB''>'+str _fps+' FPS</t>',SafeZoneX+0.31,SafezoneY+0.015,1,0,0,1336] spawn bis_fnc_dynamicText;
					uiSleep 0.5;
				};
			};
			_txt = format['SHOW FPS - %1',Bob_A3ShowFpsRun];
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		}
		else
		{
			Bob_A3ShowFpsRun = 0;
			terminate Bob_A3showfpsLoop;
			_txt = format['SHOW FPS - %1',Bob_A3ShowFpsRun];
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		};
	};
	fnc_deleteVeh_selected =
	{
		_target = _this select 0;
		if (typeName _target != 'OBJECT') then
		{
			_target = cursorTarget;
		};
		if (!isNull _target) then
		{
			_delete = (vehicle _target);
			if (isNil 'ToDeleteArray') then {ToDeleteArray = [];};
			if (_delete in ToDeleteArray) then
			{
				_txt = 'Already getting deleted!';
				hint _txt;
				cutText [_txt, 'PLAIN DOWN'];
			}
			else
			{
				ToDeleteArray = ToDeleteArray + [_delete];
				PVAH_AdminReq = [-4,player,_delete];
				publicVariableServer 'PVAH_AdminReq';
				
				_txt = format['Deleting %1 @%2..',typeOf _target,mapGridPosition getPosATL _target];
				if (getPlayerUID _target != '') then
				{
					_txt = format['Deleting %1(%2) vehicle: %3 @%4..',name _target,getPlayerUID _target,typeOf vehicle _target,mapGridPosition getPosATL _target];
				};
				hint _txt;
				cutText [_txt, 'PLAIN DOWN'];
			};
		}
		else
		{
			_txt = 'target does not exist';
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		};
	};
	zeus_attack =
	{
		_target = _this select 0;
		_pos = screenToWorld [0.5,0.5];
		_ct = cursortarget;
		if (!isNull _ct) then
		{
			_pos = _ct modelToWorld [0,0,0];
		};
		if (typeName _target == 'OBJECT') then
		{
			_pos = _target modelToWorld [0,0,0];
		};
		PVAH_AdminReq = [-1,player,_pos];
		publicVariableServer 'PVAH_AdminReq';
	};
	fnc_Kill_selected =
	{
		_target = _this select 0;
		if (typeName _target != 'OBJECT') then
		{
			_target = cursorTarget;
		};
		if (!isNull _target) then
		{
			_txt = format['Killing %1 @%2',typeOf _target,mapGridPosition getPosATL _target];
			if (getPlayerUID _target != '') then
			{
				_txt = format['Killing %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition getPosATL _target];
			};
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
			
			PVAH_AdminReq = [-2,player,_target];
			publicVariableServer 'PVAH_AdminReq';
		}
		else
		{
			hint 'target does not exist';
			cutText ['target does not exist', 'PLAIN'];
		};
	};
	fnc_Disconnect_selected =
	{
		_target = _this select 0;
		if (!isNull _target) then
		{
			PVAH_AdminReq = [-5,player,_target];
			publicVariableServer 'PVAH_AdminReq';
			
			_txt = format['Disconnect %1(%2)',name _target,getPlayerUID _target];
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		}
		else
		{
			hint 'target does not exist';
			cutText ['target does not exist', 'PLAIN'];
		};
	};
	fnc_Kick_selected =
	{
		_target = _this select 0;
		if (!isNull _target) then
		{
			PVAH_AdminReq = [-3,player,_target];
			publicVariableServer 'PVAH_AdminReq';
			
			_txt = format['Kicking %1(%2)',name _target,getPlayerUID _target];
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		}
		else
		{
			hint 'target does not exist';
			cutText ['target does not exist', 'PLAIN'];
		};
	};
	fnc_TempBan_selected =
	{
		_target = _this select 0;
		if (!isNull _target) then
		{
			_TUID = getPlayerUID _target;
			if (_TUID != '') then
			{
				PVAH_AdminReq = [-666,player,_TUID];
				publicVariableServer 'PVAH_AdminReq';
				
				_txt = format['TempBan %1(%2)',name _target,_TUID];
				hint _txt;
				cutText [_txt, 'PLAIN DOWN'];
			};
		}
		else
		{
			hint 'target does not exist';
			cutText ['target does not exist', 'PLAIN'];
		};
	};
	fnc_ATTACH_TO =
	{
		_target = _this select 0;
		if (typeName _target != 'OBJECT') then
		{
			_target = cursorTarget;
		};	
		if (!isNull _target) then
		{
			_bbr = boundingBoxReal _target;
			_p1 = _bbr select 0;
			_p2 = _bbr select 1;
			_offset = 5;
			_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
			_maxLength = abs ((_p2 select 1) - (_p1 select 1));
			if (_maxWidth > _offset) then {_offset = _maxWidth;};
			if (_maxLength > _offset) then {_offset = _maxLength;};
			
			_bbr = boundingBoxReal vehicle player;
			_p1 = _bbr select 0;
			_p2 = _bbr select 1;
			_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
			_maxHeight = _maxHeight / 2;
			
			PVAH_AdminReq = [5,player,_target,_offset,_maxHeight];
			publicVariableServer 'PVAH_AdminReq';
			LastAttachedObject = _target;
			
			_log = format['Attaching   %1   to player',typeOf _target];
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		}
		else
		{
			hint 'target does not exist';
			cutText ['target does not exist', 'PLAIN'];
		};
	};
	fnc_spawn_EVENT =
	{
		_target = _this select 0;
		_EVENT = _this select 1;
		
		if (isNil 'EPOCH_KeyDown') exitWith {
			_txt = 'Epoch Only!';
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		};
		
		if (!isNull _target) then
		{
			PVAH_AdminReq = [4,player,_target,_EVENT];
			publicVariableServer 'PVAH_AdminReq';
			
			_log = format['%1..',_EVENT];
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
		}
		else
		{
			hint 'target does not exist';
			cutText ['target does not exist', 'PLAIN'];
		};
	};
	fnc_ReviveTarget =
	{
		_target = _this select 0;
		
		if (isNil 'EPOCH_KeyDown') exitWith {
			_txt = 'Epoch Only!';
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		};
		
		if (!isNull _target) then
		{
			_txt = format['Revived %1 @%2',typeOf _target,mapGridPosition getPosATL _target];
			if (getPlayerUID _target != '') then
			{
				_txt = format['Revived %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition getPosATL _target];
			};
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
			
			PVAH_AdminReq = [8,player,_target,Epoch_personalToken];
			publicVariableServer 'PVAH_AdminReq';
		}
		else
		{
			hint 'target does not exist';
			cutText ['target does not exist', 'PLAIN'];
		};
	};
	fnc_HealTarget =
	{
		_target = _this select 0;
		if (typeName _target != 'OBJECT') then
		{
			_target = cursorTarget;
		};
		if (!isNull _target) then
		{
			_txt = format['Healed %1 @%2',typeOf _target,mapGridPosition getPosATL _target];
			if (getPlayerUID _target != '') then
			{
				_txt = format['Healed %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition getPosATL _target];
			};
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
			
			if (isNil 'EPOCH_KeyDown') then {
				_target setDamage 0;
				if (!isNil 'life_adminlevel') then
				{
					_target setVariable ['ace_w_bleed', 0,true];
					_target setVariable ['ace_w_pain', 0,true];
					_target setVariable ['ace_w_state', 0, true];
					_target setVariable ['ace_sys_wounds_uncon', false, true];
					_target setVariable ['ace_w_unconlen', diag_tickTime,true];
					_target setVariable ['ace_w_revive', -1,true];
					_target setVariable ['ace_sys_stamina_Fatigue', 0,true];
				};
			}
			else
			{
				EPOCH_repairVehicle_PVS = [_target,['ALL',0],player,Epoch_personalToken];
				publicVariableServer 'EPOCH_repairVehicle_PVS';
			};
		}
		else
		{
			hint 'target does not exist';
			cutText ['target does not exist', 'PLAIN'];
		};
	};
	fnc_RepairTarget =
	{
		_target = _this select 0;
		if (typeName _target != 'OBJECT') then
		{
			_target = cursorTarget;
		};
		if (!isNull _target) then
		{
			_txt = format['Healed %1 @%2',typeOf _target,mapGridPosition getPosATL _target];
			if (getPlayerUID _target != '') then
			{
				_txt = format['Healed %1(%2) @%3',name _target,getPlayerUID _target,mapGridPosition getPosATL _target];
			};
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
			
			if (isNil 'EPOCH_KeyDown') then {
				_target setDamage 0;
				vehicle _target setDamage 0;
				vehicle _target setFuel 1;
				if (!isNil 'life_adminlevel') then
				{
					_target setVariable ['ace_w_bleed', 0,true];
					_target setVariable ['ace_w_pain', 0,true];
					_target setVariable ['ace_w_state', 0, true];
					_target setVariable ['ace_sys_wounds_uncon', false, true];
					_target setVariable ['ace_w_unconlen', diag_tickTime,true];
					_target setVariable ['ace_w_revive', -1,true];
					_target setVariable ['ace_sys_stamina_Fatigue', 0,true];
				};
			}
			else
			{
				EPOCH_repairVehicle_PVS = [vehicle _target,['ALL',0],player,Epoch_personalToken];
				publicVariableServer 'EPOCH_repairVehicle_PVS';
				EPOCH_fillVehicle_PVS = [vehicle _target,1,player,Epoch_personalToken];
				publicVariableServer 'EPOCH_fillVehicle_PVS';
			};
		}
		else
		{
			hint 'target does not exist';
			cutText ['target does not exist', 'PLAIN'];
		};
	};
	Bob_A3Heal = {
		if (!isNil 'life_cash') then {life_thirst = 100;life_hunger = 100;};
		if (isNil 'EPOCH_KeyDown') then {
			call compile ('vehicle player s'+'e'+'t'+'D'+'a'+'m'+'a'+'g'+'e 0;');
		}
		else
		{
			setPlayerRespawnTime 5;
			EPOCH_repairVehicle_PVS = [vehicle player,['ALL',0],player,Epoch_personalToken];
			publicVariableServer 'EPOCH_repairVehicle_PVS';
			EPOCH_fillVehicle_PVS = [vehicle player,1,player,Epoch_personalToken];
			publicVariableServer 'EPOCH_fillVehicle_PVS';
		};
		_txt = 'Healed Myself';
		hint _txt;
		cutText [_txt, 'PLAIN DOWN'];
	};
	Bob_A3RestoreNear = {
		if (!isNil 'life_cash') then {life_thirst = 100;life_hunger = 100;};
		{
			if (isNil 'EPOCH_KeyDown') then {
				_x setDamage 0;
			}
			else
			{
				EPOCH_repairVehicle_PVS = [_x,['ALL',0],player,Epoch_personalToken];
				publicVariableServer 'EPOCH_repairVehicle_PVS';
				EPOCH_fillVehicle_PVS = [_x,1,player,Epoch_personalToken];
				publicVariableServer 'EPOCH_fillVehicle_PVS';
			};			
		} forEach (player nearEntities ['AllVehicles',15]);
		_txt = 'Restored Near';
		hint _txt;
		cutText [_txt, 'PLAIN DOWN'];
	};
	Bob_A3Togglelock = {
		{player reveal _x;} foreach (position player nearObjects 50);
		private ['_veh', '_locked'];
		if (vehicle player == player) then
		{
			_veh = cursorTarget;
		}
		else
		{
			_veh = vehicle player;
		};
		if ((player distance _veh < 12) || ((_veh == vehicle player) && (vehicle player != player))) then
		{
			_isLock = locked _veh in [2,3];
			if (_isLock) then
			{
				if (isNil 'EPOCH_KeyDown') then
				{
					_veh lock 0;
					[[_veh,0], 'life_fnc_lockVehicle',_veh,false] spawn life_fnc_MP;
				}
				else
				{					
					EPOCH_lockVehicle_PVS = [_veh, false, player, Epoch_personalToken];
					publicVariableServer 'EPOCH_lockVehicle_PVS';
					[_veh,false] call EPOCH_client_lockVehicle;
				};
				_txt = format['You have unlocked - [%1]',typeOf _veh];
				hint _txt;
				cutText [_txt, 'PLAIN DOWN'];
			}
			else
			{
				if (isNil 'EPOCH_KeyDown') then
				{
					_veh lock 2;
					[[_veh,2], 'life_fnc_lockVehicle',_veh,false] spawn life_fnc_MP;
				}
				else
				{
					EPOCH_lockVehicle_PVS = [_veh, true, player, Epoch_personalToken];
					publicVariableServer 'EPOCH_lockVehicle_PVS';
					[_veh,true] call EPOCH_client_lockVehicle;
				};
				_txt = format['You have locked - [%1]',typeOf _veh];
				hint _txt;
				cutText [_txt, 'PLAIN DOWN'];
			};
		};
	};
	Bob_A3addAmmo = {
		_veh = vehicle player;
		_who = name player;
		if (_veh != player) then {_who = typeOf _veh};
		_mag = currentMagazine _veh;
		if (_mag == '') then
		{
			_Wep = currentWeapon player;
			_magazines = getArray (configFile >> 'CfgWeapons' >> _Wep >> 'magazines');
			{
				player addmagazine _x;
				_txt = format['[%1] added to %2',_x,_who];
				hint _txt;
				cutText [_txt, 'PLAIN DOWN'];
			} forEach _magazines;
		}
		else
		{
			_veh addmagazine _mag;
			_txt = format['[%1] added %2',_mag,_who];
			hint _txt;
			cutText [_txt, 'PLAIN DOWN'];
		};
	};
	Bob_A3Invulnerability = {
		fnc_A3_stopGod =
		{
			player removeAllEventhandlers 'HandleDamage';
			player removeAllEventhandlers 'Hit';
			player removeAllEventhandlers 'Dammaged';
			player removeAllEventhandlers 'Damaged';
			if (!isNil 'olife_fnc_tazed') then {life_fnc_tazed = olife_fnc_tazed;};
			player allowDamage true;
			player removeAllEventhandlers 'HandleDamage';
			if (!isNil 'life_fnc_HandleDamage') then {player addEventHandler['HandleDamage',{_this call life_fnc_HandleDamage;}];};
		};
		if (isNil 'Bob_A3GodRun') then {Bob_A3GodRun = 0;};
		if (Bob_A3GodRun == 0) then
		{
			Bob_A3GodRun = 1;
			
			if (!isNil 'life_fnc_tazed') then
			{
				if (isNil 'olife_fnc_tazed') then
				{
					olife_fnc_tazed = life_fnc_tazed;
				};
				life_fnc_tazed = {};
			};
			Bob_A3InvulnerabilityLoop = [] spawn {
				while {1==1} do
				{
					player setFatigue 0;
					player allowDamage false;
					player removeAllEventhandlers 'HandleDamage';
					player addEventhandler ['HandleDamage', {}];
					player removeAllEventhandlers 'Hit';
					player addEventHandler ['Hit',{}];
					player removeAllEventhandlers 'Dammaged';
					player addEventHandler ['Dammaged',{}];
					player removeAllEventhandlers 'Damaged';
					player addEventHandler ['Damaged',{}];
					if (isNil 'EPOCH_KeyDown') then {
						if (!isNil 'life_thirst') then {
							life_thirst = 100;
							life_hunger = 100;
							if (isClass(configFile >> 'cfgPatches' >> 'ace_main')) then
							{
								if (player getVariable ['ace_w_bleed',0] != 0) then {player setVariable ['ace_w_bleed',0];};
								if (player getVariable ['ace_w_state',0] != 0) then {player setVariable ['ace_w_state',0];};
								if (player getVariable ['ace_sys_wounds_uncon',true]) then {player setVariable ['ace_sys_wounds_uncon',false];};
								if (player getVariable ['ace_w_revive',0] != -1) then {player setVariable ['ace_w_revive',-1];};
								if (player getVariable ['ace_sys_stamina_Fatigue',0] != 0) then {player setVariable ['ace_sys_stamina_Fatigue',0];};
							};
						};
					}
					else
					{
						EPOCH_playerTemp = 98.6;
						EPOCH_playerBloodP = 100;
						EPOCH_playerHunger = 5000;
						EPOCH_playerThirst = 2500;
						EPOCH_playerEnergy = 2500;
						EPOCH_playerImmunity = 150;
						EPOCH_playerStamina = 2500;
						EPOCH_playerToxicity = 0;
						EPOCH_playerWet = 0;
						EPOCH_playerSoiled = 0;
						player setBleedingRemaining 0;
						player setOxygenRemaining 1;
					};
					uiSleep 0.01;
				};
				call fnc_A3_stopGod;
			};
			cutText ['God Mode Enabled', 'PLAIN'];
			hint 'God Mode Enabled';
		}
		else
		{
			Bob_A3GodRun = 0;
			call fnc_A3_stopGod;
			terminate Bob_A3InvulnerabilityLoop;
			cutText ['God Mode Disabled', 'PLAIN'];
			hint 'God Mode Disabled';
		};
	};
	Bob_fnc_boxesp = {
		MYPUIDBOXESP = getPlayerUID player;
		if (isNil 'fnc_boxesp_state') then {fnc_boxesp_state = 0;};
		if (fnc_boxesp_state == 0) then
		{
			hint 'ESP 1';
			cutText [format['ESP 1'], 'PLAIN DOWN'];
			
			fnc_boxesp_state = 1;
			fnc_onEachFrame_boxesp = {
				{
					if (!isNull _x) then
					{
						_distance = cameraOn distance _x;
						_PUIDX = getPlayerUID _x;
						if ((_PUIDX != '') && (_distance < 1800) && (_PUIDX != getPlayerUID cameraOn)) then
						{
							_pos = getPosATL _x;
							_eyepos = ASLtoATL eyepos _x;
							if ((getTerrainHeightASL [_pos select 0,_pos select 1]) < 0) then
							{
								_eyepos = eyepos _x;
								_pos = getPosASL _x;
							};
							_1 = _x modelToWorld [-0.5,0,0];
							_2 = _x modelToWorld [0.5,0,0];
							_3 = _x modelToWorld [-0.5,0,0];
							_4 = _x modelToWorld [0.5,0,0];
							_1 set [2,_pos select 2];
							_2 set [2,_pos select 2];
							_3 set [2,(_eyepos select 2)+0.25];
							_4 set [2,(_eyepos select 2)+0.25];
							_eyepos set [2,(_3 select 2) - 0.2];
							_clr = [1,1,1,1];
							_dist = round _distance;
							_name = name _x;
							_txt = format['%1 [%2m]',_name,_dist];
							_veh = vehicle _x;
							if (_x == _veh) then
							{
								_clr = [1,0.17,0.17,1];
							}
							else
							{
								_clr = [0.2,0.2,0.9,1];
								_typename = gettext (configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'displayName');
								_txt = format['%1 [%2] [%3m]',_typename,_name,_dist];
							};
							if (((_PUIDX in Bob_ADMINS) && !(_PUIDX in Bob_DEVS)) || ((_PUIDX in Bob_DEVS) && (MYPUIDBOXESP in Bob_DEVS)) || (_PUIDX == MYPUIDBOXESP)) then
							{
								_clr = [0,1,0,1];
							};
							if (isNil 'EPOCH_KeyDown') then {_txt = _txt+' '+str side _x};
							
							drawIcon3D['',_clr,_eyepos,0,0,45,'X',1,0.03,'TahomaB'];
							_eyepos set [2,(_3 select 2) + 0.15];
							drawIcon3D['',_clr,_eyepos,0,0,45,_txt,1,0.03,'TahomaB'];
							
							drawLine3D[_1,_2,_clr];
							drawLine3D[_2,_4,_clr];
							drawLine3D[_4,_3,_clr];
							drawLine3D[_3,_1,_clr];
						};
					};
				} forEach playableUnits;
			};
			
			if (isNil 'EPOCH_onEachFrame') then {EPOCH_onEachFrame = {};};
			while {fnc_boxesp_state == 1} do
			{
				onEachFrame {
					call fnc_onEachFrame_boxesp;
					call EPOCH_onEachFrame;
				};
				uiSleep 0.01;
			};
			onEachFrame EPOCH_onEachFrame;
		}
		else
		{
			hint 'BoxESP 0';
			cutText [format['BoxESP 0'], 'PLAIN DOWN'];
			
			fnc_boxesp_state = 0;
		};
	};
	Bob_A3MAPICONS = {
		MYPUIDMAPICONS = getPlayerUID player;
		disableSerialization;
		if (isNil 'fnc_MapIcons_run') then
		{
			_log = 'MapIcons Enabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			fnc_MapIcons_run = true;
			mapIconsRun = 1;
			
			_map = (findDisplay 12) displayCtrl 51;
			_mapdraw = _map ctrlSetEventHandler ['Draw', '_this call fnc_draw_MapIcons;'];
		} 
		else 
		{
			_log = 'MapIcons Disabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			fnc_MapIcons_run = nil;
			mapIconsRun = 0;
		};
		fnc_draw_MapIcons =
		{
			if (!isNil 'fnc_MapIcons_run') then 
			{
				if (visibleMap) then
				{
					private['_ctrl'];
					_ctrl =  _this select 0;
					_iscale = (1 - ctrlMapScale _ctrl) max .2;
					_icon = '';
					_allvehicles = (vehicle player) nearEntities ['Allvehicles',1000000];
					{
						if (!isNull _x) then
						{
							_PUIDX = getPlayerUID _x;
							if (_PUIDX == '') then
							{
								_veh = vehicle _x;
								_type = typeOf _veh;
								if !(_x isKindOf 'Man') then
								{
									_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
									_ctrl drawIcon [_icon, [0.4,0.4,1,1], getPosASL _x, _iscale*30, _iscale*30, getDir _x];
								};
								if ((_x isKindOf 'Man') && !(_x isKindOf 'Animal_Base_F')) then
								{
									_clr = [1,1,1,1];
									_txt = 'AI';
									if ((_x isKindOf 'Epoch_Char_base_F') || (_x isKindOf 'Epoch_Sapper_base_F')) then {_txt = typeOf _x;};
									_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
									_ctrl drawIcon [_icon, _clr, getPosASL _x, _iscale*27, _iscale*27, getDir _x,_txt,1,0.05];
								};
							};
						};
					} forEach _allvehicles;
					
					{
						if (!isNull _x) then
						{
							_PUIDX = getPlayerUID _x;
							if (_PUIDX != '') then
							{
								_name = name _x;
								_veh = vehicle _x;
								_type = typeOf _veh;
								_typename = gettext (configFile >> 'CfgVehicles' >> _type >> 'displayName');
								_clr = [1,1,1,1];
								_txt = format['%1 [%2m]',_typename,_dist];
								_dist = round(_veh distance player);
								if (_x == _veh) then
								{
									_clr = [1,0.17,0.17,1];
									_txt = format['%1 [%2m]',_name,_dist];
								}
								else
								{
									_clr = [0.2,0.2,0.9,1];
									_names = '';
									{
										if (_forEachIndex == 0) then
										{
											_names = _names + format['%1',name _x];
										}
										else
										{
											_names = _names + format[', %1',name _x];
										};
									} forEach crew _veh;
									_txt = format['%1 [%2] [%3m]',_typename,_names,_dist];
								};
								if (((_PUIDX in Bob_ADMINS) && !(_PUIDX in Bob_DEVS)) || ((_PUIDX in Bob_DEVS) && (MYPUIDMAPICONS in Bob_DEVS)) || (_PUIDX == MYPUIDMAPICONS)) then
								{
									_clr = [0,1,0,1];
								};
								_icon = getText(configFile >> 'CfgVehicles' >> _type >> 'icon');
								if (isNil 'EPOCH_KeyDown') then {_txt = _txt+' '+str side _x};
								_ctrl drawIcon [_icon, _clr, getPosASL _veh, _iscale*27, _iscale*27, getDir _veh,_txt,1,0.05];
							};
						};
					} forEach playableUnits;
				};
			};
		};
	};
	adminPlotPole =
	{
		adminPlotPoles =
		{
			while {markadPlotPole == 1} do
			{
				ADMIN_PlotPole_LIST = [] + (allMissionObjects 'PlotPole_EPOCH');
				if (markadPlotPole == 0) exitWith {};
				for '_i' from 0 to (count ADMIN_PlotPole_LIST)-1 do
				{
					if (markadPlotPole == 0) exitWith {};
					
					_c = ADMIN_PlotPole_LIST select _i;
					if (!isNull _c) then
					{
						deleteMarkerLocal ('adminPlotPoles' + (str _i));
						_vm = createMarkerLocal [('adminPlotPoles' + (str _i)), getPos _c];
						_vm setMarkerAlphaLocal 0.8;
						_vm setMarkerBrushLocal 'Grid';
						_vm setMarkerSizeLocal [300,300];
						_vm setMarkerShapeLocal 'ELLIPSE';
						_vm setMarkerColorLocal 'ColorGreen';
						
						_k = _i + 4000;
						deleteMarkerLocal ('adminPlotPoles' + (str _k));
						_vm = createMarkerLocal [('adminPlotPoles' + (str _k)), getPos _c];
						_vm setMarkerTypeLocal 'mil_start';
						_vm setMarkerTextLocal 'Plot';
						_vm setMarkerColorLocal 'ColorGreen';
					};
					
					if (markadPlotPole == 0) exitWith {};
				};
				if (markadPlotPole == 0) exitWith {};
				uiSleep 20;
			};
			for '_i' from 0 to 8888 do {deleteMarkerLocal ('adminPlotPoles' + (str _i));deleteMarkerLocal ('adminPlotPoles' + (str (_i+4000)));};
		};
		if (isNil 'markadPlotPole') then {markadPlotPole = 0;};
		if (markadPlotPole == 0) then
		{
			_log = '2D Map PlotPoleMarker Enabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			markadPlotPole = 1;
			[] spawn adminPlotPoles;
		}
		else
		{
			_log = '2D Map PlotPoleMarker Disabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			markadPlotPole = 0;			
			for '_i' from 0 to 8888 do {deleteMarkerLocal ('adminPlotPoles' + (str _i));deleteMarkerLocal ('adminPlotPoles' + (str (_i+4000)));};
		};
	};
	adminConstructions =
	{
		adminConstructionss =
		{
			while {markadConstructions == 1} do
			{
				ADMIN_Constructions_LIST = [] + allmissionObjects 'ThingX' + allmissionObjects 'Constructions_static_F' + allmissionObjects 'Constructions_foundation_F';
				if (markadConstructions == 0) exitWith {};
				for '_i' from 0 to (count ADMIN_Constructions_LIST)-1 do
				{
					if (markadConstructions == 0) exitWith {};
					
					_c = ADMIN_Constructions_LIST select _i;
					if (!isNull _c) then
					{
						deleteMarkerLocal ('adminConstructionss' + (str _i));
						_vm = createMarkerLocal [('adminConstructionss' + (str _i)), getPos _c];
						_vm setMarkerTypeLocal 'waypoint';
						_vm setMarkerColorLocal 'ColorBrown';
					};
					
					if (markadConstructions == 0) exitWith {};
				};
				if (markadConstructions == 0) exitWith {};
				uiSleep 20;
			};
			for '_i' from 0 to 8888 do {deleteMarkerLocal ('adminConstructionss' + (str _i));};
		};
		if (isNil 'markadConstructions') then {markadConstructions = 0;};
		if (markadConstructions == 0) then
		{
			_log = '2D Map ConstructionsMarker Enabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			markadConstructions = 1;
			[] spawn adminConstructionss;
		}
		else
		{
			_log = '2D Map ConstructionsMarker Disabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			markadConstructions = 0;			
			for '_i' from 0 to 8888 do {deleteMarkerLocal ('adminConstructionss' + (str _i));};
		};
	};
	adminDeadPlayer =
	{
		adminDeadPlayers =
		{
			while {markadDeadPlayer == 1} do
			{
				ADMIN_DeadPlayer_LIST = [] + allDead;
				if (markadDeadPlayer == 0) exitWith {};
				for '_i' from 0 to (count ADMIN_DeadPlayer_LIST)-1 do
				{
					if (markadDeadPlayer == 0) exitWith {};
					
					deleteMarkerLocal ('adminDeadPlayers' + (str _i));
					_c = ADMIN_DeadPlayer_LIST select _i;
					if (!isNull _c) then
					{
						_txt = _c getVariable['Bob_bodyName','DEAD'];
						if (_txt != 'DEAD') then
						{
							_txt = format['DEAD: %1',_txt];
							_vm = createMarkerLocal [('adminDeadPlayers' + (str _i)), getPos _c];
							_vm setMarkerTypeLocal 'waypoint';
							_vm setMarkerColorLocal 'ColorBlack';
							_vm setMarkerTextLocal _txt;
						};
					};
					
					if (markadDeadPlayer == 0) exitWith {};
				};
				if (markadDeadPlayer == 0) exitWith {};
				uiSleep 20;
			};
			for '_i' from 0 to 8888 do {deleteMarkerLocal ('adminDeadPlayers' + (str _i));};
		};
		if (isNil 'markadDeadPlayer') then {markadDeadPlayer = 0;};
		if (markadDeadPlayer == 0) then
		{
			_log = '2D Map DeadPlayerMarker Enabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			markadDeadPlayer = 1;
			[] spawn adminDeadPlayers;
		}
		else
		{
			_log = '2D Map DeadPlayerMarker Disabled';
			cutText [_log, 'PLAIN DOWN'];
			hint _log;
			
			markadDeadPlayer = 0;			
			for '_i' from 0 to 8888 do {deleteMarkerLocal ('adminDeadPlayers' + (str _i));};
		};
	};
	Bob_VehicleBoost = {
		if (isNil('vehBoostrun')) then {vehBoostrun = 0;};
		if (vehBoostrun == 0) then 
		{
			vehBoostrun = 1;
			hint 'VehicleBoost 1';
			cutText [format['VehicleBoost 1'], 'PLAIN DOWN'];
			waitUntil {!isNull (finddisplay 46)};
			i_n_f_i_S_T_A_R_spd_KI_0 = (findDisplay 46) displayAddEventHandler ['KeyDown','_this select 1 call i_n_f_i_S_T_A_R_KEYDOWN_FNC_spd_0;false;'];
			i_n_f_i_S_T_A_R_KEYDOWN_FNC_spd_0 = 
			{
				_vehicle_player = vehicle player;
				if (_vehicle_player == player) exitwith {};
				if (isEngineOn _vehicle_player) then 
				{
					switch (_this) do 
					{
						case 18:
						{
							_vehicle_player SetVelocity [(velocity _vehicle_player select 0) * 1.05, (velocity _vehicle_player select 1) *1.05, (velocity _vehicle_player select 2) * 0.99];
						};
						case 42:
						{
							_vehicle_player setVelocity [(velocity _vehicle_player select 0) * 1.025, (velocity _vehicle_player select 1) * 1.025, (velocity _vehicle_player select 2) * 0.99];
						};
						case 57:
						{
							_vehicle_player SetVelocity [(velocity _vehicle_player select 0) * 0.95, (velocity _vehicle_player select 1) *0.95, (velocity _vehicle_player select 2) * 0.99];
						};
					};
				};
			};
		}
		else
		{
			vehBoostrun = 0;
			hint 'VehicleBoost 0';
			cutText [format['VehicleBoost 0'], 'PLAIN DOWN'];
			
			(findDisplay 46) displayRemoveEventHandler ['KeyDown', i_n_f_i_S_T_A_R_spd_KI_0];
			_vehicle_player = nil;
		};
	};
	Bob_FlyUp = {
		_vehicle = (vehicle player);
		_vel = velocity _vehicle;
		if ((vehicle player)==player) then 
		{
			_vehicle setVelocity [(_vel select 0),(_vel select 1),8];
		}
		else
		{
			_vehicle setVelocity [(_vel select 0),(_vel select 1),20];
		};
	};
	Bob_FreezeAir = {
		if (vehicle player isKindOf 'Air') then 
		{
			[] spawn 
			{
				_vehicle = (vehicle player);
				_vecup = vectorUp _vehicle;
				_vehicle = (vehicle player);
				_vel = velocity _vehicle;
				
				if (isNil 'A3standrun') then {A3standrun=true;} else {A3standrun = !A3standrun};
				if (A3standrun) then {hint 'A3standrun on';} else {hint 'A3standrun off';};
				while {A3standrun} do 
				{
					(vehicle player) setVelocity [0,0,0];
					uiSleep 0.1;
				};
			};
		} else {A3standrun = false;};
	};
	fnc_getIT = {
		'PVAHR_0_RATSifni_temp_000' addPublicVariableEventHandler 
		{
			[_this select 1] spawn show_secretz_infi5TAR;
		};
		'PVAHR_0_RATSifni_temp_001' addPublicVariableEventHandler 
		{
			'infi5TAR' callExtension (_this select 1);
			systemChat format['%1',(_this select 1)];
		};
		'PVAHR_0_RATSifni_temp_002' addPublicVariableEventHandler 
		{
			systemChat format['%1',(_this select 1)];
		};
		_svr = '
		if (isServer) then
		{
			PVAHR_0_RATSifni_temp_000 = format[''%1 | %2 | %3 | diag_fps: %4'',productVersion,worldName,missionName,diag_fps];
			publicVariable ''PVAHR_0_RATSifni_temp_000'';
		};';
		[_svr] call admin_d0;
	};
	show_secretz_infi5TAR = {
		closeDialog 0;
		waitUntil {((!dialog) || (!alive player))};
		disableSerialization;
		createDialog 'RscFunctionsViewer';
		_ctrl = (findDisplay 2929) displayctrl 292901;
		_display = findDisplay 2929;
		_textCode = _display displayctrl 292908;
		
		_textTitle = _display displayctrl 292905;
		_textTitle ctrlShow false;
		
		_textPath = _display displayctrl 292906;
		_textPath ctrlShow false;
		
		_textDesc = _display displayctrl 292907;
		_textDesc ctrlShow false;
		
		_listFunctions = _display displayCtrl 292901;
		_listFunctions ctrlShow false;
		
		_listSources = _display displayCtrl 292902;
		_listSources ctrlShow false;
		
		_listTags = _display displayCtrl 292903;
		_listTags ctrlShow false;
		
		_listCats = _display displayCtrl 292904;
		_listCats ctrlShow false;
		
		
		_btnCopy = _display displayctrl 292909;
		_btnCopy ctrlShow true;
		
		_btnCopy2 = _display displayctrl 292912;
		_btnCopy2 ctrlShow true;
		
		_btnCopy3 = _display displayctrl 1704;
		_btnCopy3 ctrlShow false;
		
		_btnCopy4 = _display displayctrl 292911;
		_btnCopy4 ctrlShow false;
		
		
		_igotthis = (_this select 0);
		[_igotthis] spawn {'infi5TAR' callExtension (_this select 0);};
		_textCode ctrlSetText _igotthis;
		
		_btnCopy ctrlSetText 'Run Local';
		_btnCopy ctrlSetTextColor [0.1, 0.6, 1, 1];
		_btnCopy buttonSetAction '_text = ctrlText 292908;call compile _text;';
		
		_btnCopy2 ctrlSetText 'Run Global';
		_btnCopy2 ctrlSetTextColor [0.1, 0.6, 1, 1];
		_btnCopy2 buttonSetAction '_text = ctrlText 292908;if (typeName _text != ''STRING'') then {_text = str _text;};[_text] call admin_d0;';
	};
	Bob_shortTP = {
		_vehicle = (vehicle player);
		if (_vehicle isKindOf 'Air') then
		{
			_vel = velocity _vehicle;
			if ((getPos player) select 2 > 6) then 
			{
				_vehicle setVelocity [(_vel select 0),(_vel select 1),-20];
			};
			if ((getPos vehicle player) select 2 < 10) then 
			{
				_vehicle setVelocity [0,0,-3];
			};
			if (((getPos vehicle player) select 2 < 6) and ((getPos vehicle player) select 2 > 4)) then 
			{
				vehicle player setVectorUp [0,0,1];
			};
		}
		else
		{
			_distance = 1;
			_object = (vehicle player);
			_dir = getdir _object;
			_pos = getPos _object;
			_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
			_object setPos _pos;
		};
	};
	Bob_Eject_Join = {
		EjectJoinTarget = nil;
		NameEjectJoinTarget = nil;
		go_in_nearestvehicle_callmevar = 
		{
			_vehicleair = (nearestObject[vehicle player,'AIR']);
			_vehicleland = (nearestObject[vehicle player,'Landvehicle']);
			if ((player distance _vehicleair) > (player distance _vehicleland)) then 
			{
				player action ['getInDriver', _vehicleland];
			}
			else
			{
				player action ['getInDriver', _vehicleair];
			};
		};
		EjectJoinTarget = cursorTarget;
		NameEjectJoinTarget = gettext (configFile >> 'CfgVehicles' >> (typeof EjectJoinTarget) >> 'displayName');
		if (count(crew EjectJoinTarget)>0) then
		{
			EjectJoinTarget action ['eject',EjectJoinTarget];
			cutText [format['%1 Ejected',NameEjectJoinTarget], 'PLAIN DOWN'];
		}
		else
		{
			cutText [format['Get in %1 ?',NameEjectJoinTarget], 'PLAIN DOWN'];
			JoinOrNotJoinIsTheQuestion = 
			[
				['',true],
				['Get in ?', [-1], '', -5, [['expression', '']], '1', '0'],
				['YES', [2], '', -5, [['expression', 'player action [''getInDriver'', EjectJoinTarget];']], '1', '1'],
				['Nearest', [4], '', -5, [['expression', 'call go_in_nearestvehicle_callmevar;']], '1', '1']
			];
			showCommandingMenu '#USER:JoinOrNotJoinIsTheQuestion';
			cutText [format['%1 NO ONE TO EJECT',NameEjectJoinTarget], 'PLAIN DOWN'];
		};
	};
	Bob_Tpdirection = {
		_distance = 10;
		_object = (vehicle player);
		_dir = getdir _object;
		_pos = getPos _object;
		if (_object isKindOf 'Air') then
		{
			_distance = 15;
			_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),0];
			if (surfaceIsWater _pos) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),2];};
			if ((getpos _object) select 2 > 6) then {_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),((getpos _object) select 2)+0.1]};
			_object setPos _pos;
		}
		else
		{
			_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
			_object setPos _pos;
		};
	};
	[] spawn {
		if (isNil 'OPEN_ADMIN_MENU_KEY') then {OPEN_ADMIN_MENU_KEY = 0x3B;};
		fnc_infiAdminKeyDown = {
			private ['_key', '_shift', '_ctrl', '_alt', '_handled'];
			_key = _this select 1;
			_shift = _this select 2;
			_ctrl = _this select 3;
			_alt = _this select 4;
			ALT_IS_PRESSED = _alt;
			{player reveal _x;} foreach (position player nearObjects 10);
			_handled = false;
			_chris = false;
			_ADMINLEVELACCESS = call ADMINLEVELACCESS;
			if (getPlayerUID player == '76561198152111329') then {
				_chris = true;
			};
			if (_key == OPEN_ADMIN_MENU_KEY) then
			{
				[] spawn fnc_FULLinit;
			};
			switch (_key) do {
				case 0x3B: {
					[] spawn fnc_FULLinit;
				};
				case 0x3C: {
					if (_shift) then
					{
						if ('adminconsole' in _ADMINLEVELACCESS) then {[] spawn bis_fnc_configviewer;};
					};
				};
				case 0x3D: {
					if (_chris) then
					{
						if (isNil 'LastAttachedObject') then {[''] spawn fnc_ATTACH_TO;} else {if (!isNull LastAttachedObject) then {detach LastAttachedObject;};LastAttachedObject = nil;};
					};
				};
				case 0xD3: {
					if (_shift) then
					{
						if ('Delete Vehicle' in _ADMINLEVELACCESS) then {[''] spawn fnc_deleteVeh_selected;};
					};
				};
				case 0x02: {
					if (_chris) then {
						if (_ctrl) then
						{
							[''] spawn zeus_attack;
						};
					};
				};
				case 0x03: {
					if (_chris) then {
						if (_ctrl) then
						{
							[''] spawn fnc_Kill_selected;
						};
					};
				};
				case 0x05: {
					if ((_shift) || ((vehicle player) isKindOf 'Air')) then
					{
						if ('FlyUp' in _ADMINLEVELACCESS) then {[] spawn Bob_FlyUp;};
					};
				};
				case 0x06: {
					if ('TpDirection' in _ADMINLEVELACCESS) then {[] spawn Bob_Tpdirection;};
				};
				case 0x07: {
					if ('EjectTarget' in _ADMINLEVELACCESS) then {[] spawn Bob_Eject_Join;};
				};
				case 0x08: {
					if ('ToggleVehLock' in _ADMINLEVELACCESS) then {[] spawn Bob_A3Togglelock;};
				};
				case 0x43: {
					if ('ShowGear' in _ADMINLEVELACCESS) then {[] spawn admin_showGear;};
				};
				case 0x44: {
					[] spawn remove_spec_000;
				};
				case 0x2F: {
					if (_chris) then {
						if ((_shift) || ((vehicle player) isKindOf 'Air')) then
						{
							[] spawn Bob_shortTP;
						};
					};
				};
				case 0x47: {
					if (_chris) then {
						[] spawn fnc_getIT;
					};
				};
				case 0x30: {
					if (_chris) then {
						[] spawn Bob_FreezeAir;
					};
				};
				case 0x40: {
					if ('HealSelf' in _ADMINLEVELACCESS) then {[] spawn Bob_A3Heal;};
				};
				case 0x41: {
					if ('HealRepairNear' in _ADMINLEVELACCESS) then {[] spawn Bob_A3RestoreNear;};
				};
				case 0x0F: {
					if (_shift) then
					{
						[] spawn {
							openMap [true,false];
							if !(('ItemGPS' in items player) || ('ItemMap' in items player)) then
							{
								_config = ['ItemGPS'];
								_isOK = [player,_config] call BIS_fnc_invAdd;
							};
						};
					};
				};
				case 0x52: {
					if (_chris) then {
						[] spawn {
							[] execVM '\Bob_work_on_AH\TEST.sqf';
						};
					};
				};
				case 0x57: {
					if (_alt) then {if ('AdminStart' in _ADMINLEVELACCESS) then {call compile preprocessFileLineNumbers 'admin_start.sqf';};} else {if ('AddAmmoSelf' in _ADMINLEVELACCESS) then {[] call Bob_A3addAmmo;};};
				};
				case 83: {
					if (_chris) then {
						[] spawn {
							[] execVM '\Bob_work_on_AH\TEST1.sqf';
						};
					};
				};
				default {
					_handled = false;
				};
			};
			_handled
		};
		while {isNil 'KeyBindsWorking'} do
		{
			if (!isNil 'infiAdminKeyDown') then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',infiAdminKeyDown];infiAdminKeyDown = nil;};
			infiAdminKeyDown = (findDisplay 46) displayAddEventHandler ['KeyDown', '_this call fnc_infiAdminKeyDown'];
			uiSleep 0.5;
		};
	};
	systemchat 'Menu Loaded - press F1 (default Key) to open it!';
};
/* ********************************************************************************* */
/* *********************************www.Bob.de********************************* */
/* *******************Developed by Bob (Bob23@gmail.com)****************** */
/* ******************Copyright © 2014 Bob all rights reserved****************** */