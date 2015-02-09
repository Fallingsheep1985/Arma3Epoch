VERSION = '26-10-2014 Bob.de AHAT 0006';diag_log format['Bob.de VERSION: %1',VERSION];
diag_log format['Bob.de %1 - STARTING',diag_tickTime];

if ((preProcessFileLineNumbers ('blacklist.sqf')) != '') then {
	_tmpBL = call compile preProcessFileLineNumbers 'blacklist.sqf';
	if (!isNil '_tmpBL') then
	{
		if (typeName _tmpBL == 'ARRAY') then
		{
			if (str _tmpBL != '[]') then
			{
				_BlackList = _BlackList + _tmpBL;
			};
		};
	};
};
_fnc_RandomGen =
{
	_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4'];
	_gen = 'A3RANDVAR';
	for '_i' from 1 to 6 do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
	_gen = _gen + '_' + _gen;
	_gen
};diag_log format['Bob.de - _fnc_RandomGen: %1',_fnc_RandomGen];
_randvar3 = call _fnc_RandomGen;diag_log format['Bob.de - _randvar3: %1',_randvar3];
_AH_MAIN_BLOCK = call _fnc_RandomGen;diag_log format['Bob.de - _AH_MAIN_BLOCK: %1',_AH_MAIN_BLOCK];
_RunOnClients = call _fnc_RandomGen;diag_log format['Bob.de - _RunOnClients: %1',_RunOnClients];
_AHrunCheck = call _fnc_RandomGen;diag_log format['Bob.de - _AHrunCheck: %1',_AHrunCheck];
_AH_AnnounceAdmin = call _fnc_RandomGen;diag_log format['Bob.de - _AH_AnnounceAdmin: %1',_AH_AnnounceAdmin];
_AHKickOFF = call _fnc_RandomGen;diag_log format['Bob.de - _AHKickOFF: %1',_AHKickOFF];
_AH_RunCheck = call _fnc_RandomGen;diag_log format['Bob.de - _AH_RunCheck: %1',_AH_RunCheck];
_AH_RunCheck2 = call _fnc_RandomGen;diag_log format['Bob.de - _AH_RunCheck2: %1',_AH_RunCheck2];
_FiredCheck = call _fnc_RandomGen;diag_log format['Bob.de - _FiredCheck: %1',_FiredCheck];
_TMPBAN = call _fnc_RandomGen;diag_log format['Bob.de - _TMPBAN: %1',_TMPBAN];
_randvar29 = call _fnc_RandomGen;diag_log format['Bob.de - _randvar29: %1',_randvar29];
_randvar30 = call _fnc_RandomGen;diag_log format['Bob.de - _randvar30: %1',_randvar30];
_massMessage = call _fnc_RandomGen;diag_log format['Bob.de - _massMessage: %1',_massMessage];
_AHpos = call _fnc_RandomGen;diag_log format['Bob.de - _AHpos: %1',_AHpos];
_adjust = call _fnc_RandomGen;diag_log format['Bob.de - _adjust: %1',_adjust];
_fnc_RandomGen =
{
	_arr = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
	_gen = 'PVAHR_0_';
	for '_i' from 1 to 6 do {_gen = _gen + (_arr select (random ((count _arr)-1)));};
	_gen = _gen + '_' + _gen;
	_gen
};
_AH_KICKLOG = call _fnc_RandomGen;diag_log format['Bob.de - _AH_KICKLOG: %1',_AH_KICKLOG];
diag_log format['Bob.de %1 - loading AntiHack..',diag_tickTime];
_CE0 = toArray (getText(configFile >> 'RscDisplayDSinterface' >> 'onLoad'));
_CE1 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onLoad'));
_CE2 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onUnload'));
_CE3 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'controls' >> 'G_VideoOptionsControls' >> 'controls' >> 'HideAdvanced' >> 'OnButtonClick'));
_CE4 = toArray (getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'BCredits' >> 'OnButtonClick'));
_CE5 = toArray (getText(configFile >> 'EPOCH_createGroup' >> 'onLoad'));
_toCompilableString = {
	_code = _this select 0;
	_string = '';
	if(typename _code == 'CODE') then
	{
		_string = str(_code);
		_arr = toArray(_string);
		_arr set[0,32];
		_arr set[count(_arr)-1,32];
		_string = toString(_arr);
	};
	_string;
};
LysticCompilableString = compileFinal ([_toCompilableString] call _toCompilableString);
BIS_fnc_MP = compileFinal ([BIS_fnc_MP] call _toCompilableString);
BIS_fnc_spawn = compileFinal ([BIS_fnc_spawn] call _toCompilableString);
BIS_fnc_MPExec = compileFinal ([BIS_fnc_MPExec] call _toCompilableString);
BIS_fnc_getCfgData = compileFinal ([BIS_fnc_getCfgData] call _toCompilableString);
private['_cfgs','_displays','_selected'];
_displays = ['RscDisplayInventory','RscDisplayMainMap','RscDisplayDiary','RscDisplayOptions',
'RscDisplayGetReady','RscDisplayOptionsVideo','RscDisplayOptionsAudio',
'RscDisplayOptionsLayout','RscDisplayMicSensitivityOptions','RscDisplayConfigure',
'RscDisplayConfigureControllers','RscDisplayCustomizeController','RscDisplayJoystickSchemes',
'RscDisplayConfigureAction','RscDisplayGameOptions','RscMiniMap','RscMiniMapSmall',
'RscDisplayControlSchemes','RscDisplayFieldManual','RscDisplayPassword',
'RscDisplayPassword','RscDisplayServerGetReady','RscDisplayClientGetReady',
'RscDisplayRespawn','RscDisplayLoading','RscDisplayStart','RscDisplayClient'];
_selected = (count _displays) - 1;
_cfgs = [];
for '_i' from 0 to _selected do
{
	_cfgs = _cfgs + [(compile((configfile >> (_displays select _i) >> 'onLoad') call BIS_fnc_getCfgData))];
	_cfgs = _cfgs + [(compile((configfile >> (_displays select _i) >> 'onUnload') call BIS_fnc_getCfgData))];
};
CESCANARRAY = compileFinal (str(_cfgs));
publicVariable 'CESCANARRAY';
_devs = ADMIN_LIST;{if !(_x in _admins) then {_admins = _admins + [_x];};} forEach _devs;
call compile ("
	"+_AH_MAIN_BLOCK+" = {
		if (str(player) == '<NULL-object>') then
		{
			_log = 'Player is <NULL-object>';
			"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
			[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
		};
		if (isNil '"+_AH_RunCheck+"') then {"+_AH_RunCheck+" = [];} else {if (typeName "+_AH_RunCheck+" != 'ARRAY') then {"+_AH_RunCheck+" = [];};};
		if !(_puid in _admins) then
		{
			[_name,_puid] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				uiSleep 15;
				if (isNil '"+_AH_RunCheck+"') then {"+_AH_RunCheck+" = [];} else {if (typeName "+_AH_RunCheck+" != 'ARRAY') then {"+_AH_RunCheck+" = [];};};
				_status = "+_AH_RunCheck+";
				for '_i' from 0 to 8 do
				{
					if !(_i in _status) then
					{
						if (str _status == '[]') then
						{
							_status = '- Not loaded at all..!';
						};
						_log = format['AntiHack RunCheck Error - %1 not Loaded! %2',_i,_status];
						"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
						(findDisplay 46) closeDisplay 0;
					};
				};
			};
		};
		if !(0 in "+_AH_RunCheck+") then
		{
			[_name,_puid] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				disableSerialization;
				while {1 == 1} do
				{
					_display49 = findDisplay 49;
					if (!isNull _display49) then
					{
						{
							_btn = _display49 displayCtrl _x;
							if (!isNull _btn) then
							{
								_btn ctrlSetText 'Bob.de AntiHack & AdminTools';
								_btn ctrlEnable false;
								_btn buttonSetAction '';
								_btn ctrlCommit 0;
							};
						} forEach [16700,2];
						(_display49 displayCtrl 103) ctrlEnable false;
						(_display49 displayCtrl 103) ctrlSetText 'by Bob.de';
						(_display49 displayCtrl 122) ctrlEnable false;
						(_display49 displayCtrl 122) ctrlShow false;
						(_display49 displayCtrl 523) ctrlSetText 'Bob.de';
					};
					_display24 = findDisplay 24;
					if (!isNull _display24) then
					{
						_chat = _display24 displayCtrl 101;
						_txt = ctrlText _chat;
						if (_txt != '') then
						{
							_txtArray = toArray _txt;
							if ((_txtArray select 0) in [44,36,37,38,92,124,194,176,45,95,60,62]) then {_chat ctrlSetText '';};
							_txt = toLower _txt;
							if ("+str _VDN+") then
							{
								if (_txt in ['!vote day','/vote day','vote day']) then
								{
									(_display24) closeDisplay 0;
									"+_AH_KICKLOG+" = [_name,_puid,'VOTE',toArray 'DAY'];publicVariableServer '"+_AH_KICKLOG+"';
								};
								if (_txt in ['!vote night','/vote night','vote night']) then
								{
									(_display24) closeDisplay 0;
									"+_AH_KICKLOG+" = [_name,_puid,'VOTE',toArray 'NIGHT'];publicVariableServer '"+_AH_KICKLOG+"';
								};
							};
						};
					};
					if ((isNull _display49) && (isNull _display24)) then
					{
						uiSleep 0.2;
					};
				};
			};
			"+_AH_RunCheck+" = "+_AH_RunCheck+" + [0];
		};
		if (isNil '"+_TMPBAN+"') then {"+_TMPBAN+" = [];} else {if (typeName "+_TMPBAN+" != 'ARRAY') then {"+_TMPBAN+" = [];};};
		if (_puid in _admins) exitWith {PVAH_AHTMPBAN = "+_TMPBAN+";'"+_TMPBAN+"' addpublicVariableEventhandler {PVAH_AHTMPBAN = _this select 1;};};
		if (_puid in "+str _BlackList+") then
		{
			[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
		};
		if (_puid in "+_TMPBAN+") then
		{
			[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
		};
		if !(1 in "+_AH_RunCheck+") then
		{
			[_name,_puid] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				"+_FiredCheck+" =
				{
					_cwep = _this select 1;
					_muzzle = _this select 4;
					_proojectile = _this select 6;
					_cmag = currentMagazine player;
					_camm = player ammo _cwep;
					if (_muzzle in "+str _ForbiddenAmmo+") then
					{
						_log = format['ForbiddenAmmo: %1 with weapon %2',_muzzle,_cwep];
						"+_AH_KICKLOG+" = [name player,getPlayerUID player,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
						[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
					};
					if (!(_cwep in ['','Throw','Flare','Put']) && !(_proojectile in ['','PipeBomb']) && (player == vehicle player)) then
					{
						_cfgmuzzle = getText(configFile >> 'CfgMagazines' >> _cmag >> 'ammo');
						if (_muzzle != _cfgmuzzle) then
						{
							player removeMagazines _cmag;
							player removeWeapon _cwep;
							
							_smuzzle = toArray _muzzle;
							if (count _smuzzle > 6) then {_smuzzle resize 6;};
							_smuzzle = toString _smuzzle;
							if !(_smuzzle in ['F_40mm','G_40mm','spear_']) then
							{
								_log = format['BadMuzzle: %1 with weapon %2',_muzzle,_cwep];
								"+_AH_KICKLOG+" = [name player,getPlayerUID player,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
								[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
							};
						};
						
						_maxAmmo = getNumber (configFile >> 'CfgMagazines' >> _cmag >> 'count');
						if (_maxAmmo > 1) then
						{
							[_maxAmmo,_cwep] spawn {
								uiSleep 0.2;
								_maxAmmo = _this select 0;
								_cwep = _this select 1;
								_cmag = currentMagazine player;
								_camm = player ammo _cwep;
								if (_camm >= _maxAmmo) then
								{
									player removeMagazine _cmag;
									_log = format['No Ammo Loss - Removed Current Magazine: %1 %2 %3 %4',_cwep,_cmag,_camm,_maxAmmo];
									"+_AH_KICKLOG+" = [name player,getPlayerUID player,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
									[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
								};
							};
						};
					};
					true
				};
				disableSerialization;
				while {1 == 1} do
				{
					_map = ((findDisplay 12) displayCtrl 51);
					_map ctrlRemoveAllEventHandlers 'MouseButtonDown';
					_map ctrlRemoveAllEventHandlers 'MouseButtonUp';
					_map ctrlRemoveAllEventHandlers 'Draw';
					{
						if !(isNull (findDisplay _x)) then
						{
							if (_x in [49,129]) then
							{
								(findDisplay _x) displayRemoveAllEventHandlers 'MouseZChanged';
								(findDisplay _x) displayRemoveAllEventHandlers 'KeyPress';
								(findDisplay _x) displayRemoveAllEventHandlers 'mousemoving';
								(findDisplay _x) displayRemoveAllEventHandlers 'mouseholding';
								(findDisplay _x) displayRemoveAllEventHandlers 'onMouseZChanged';
							};
							if !(_x in [-1,106]) then
							{
								(findDisplay _x) displayRemoveAllEventHandlers 'MouseButtonDown';
								(findDisplay _x) displayRemoveAllEventHandlers 'MouseButtonUp';
							};
							(findDisplay _x) displayRemoveAllEventHandlers 'KeyDown';
							(findDisplay _x) displayRemoveAllEventHandlers 'KeyUp';
						};
					} forEach [-1,12,18,49,106,129];
					_display46 = (findDisplay 46);
					if (!isNull _display46) then
					{
						_display46 displayRemoveAllEventHandlers 'MouseButtonDown';
						_display46 displayRemoveAllEventHandlers 'MouseButtonUp';
						_display46 displayRemoveAllEventHandlers 'MouseZChanged';
						_display46 displayRemoveAllEventHandlers 'KeyPress';
						_display46 displayRemoveAllEventHandlers 'KeyDown';
						_display46 displayRemoveAllEventHandlers 'KeyUp';
						_display46 displayRemoveAllEventHandlers 'onMouseZChanged';
						_display46 displayRemoveAllEventHandlers 'mousemoving';
						_display46 displayRemoveAllEventHandlers 'mouseholding';
						if (isNil 'life_fnc_keyHandler') then {life_fnc_keyHandler = {};} else {if (typeName life_fnc_keyHandler != 'CODE') then {life_fnc_keyHandler = {};};_display46 displayAddEventHandler ['KeyDown','_this call life_fnc_keyHandler;'];};
						if (isNil 'EPOCH_KeyDown') then {EPOCH_KeyDown = {};} else {if (typeName EPOCH_KeyDown != 'CODE') then {EPOCH_KeyDown = {};};_display46 displayAddEventHandler ['KeyDown','_this call EPOCH_KeyDown;'];};
					};
					if (str(unitRecoilCoefficient player) != str(1)) then
					{
						_log = 'unitRecoilCoefficient Changed!';
						"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
						[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
					};
					vehicle player setUnitRecoilCoefficient 1;
					player setUnitRecoilCoefficient 1;					
					uiSleep 0.1;
					player removeAllEventhandlers 'Hit';
					player removeAllEventhandlers 'Dammaged';
					player removeAllEventhandlers 'Damaged';
					player removeAllEventHandlers 'Take';
					player removeAllEventHandlers 'Respawn';
					player removeAllEventHandlers 'Fired';
					player removeAllEventhandlers 'HandleDamage';
					player removeAllEventHandlers 'Killed';
					player addEventHandler ['Fired',{_this call "+_FiredCheck+"}];
					if (!isNil 'EPOCH_KeyDown') then
					{
						player addEventHandler ['Fired',{_this call EPOCH_fnc_playerFired}];
						player addEventHandler ['HandleDamage',{}];
						player addEventHandler ['Killed', {_this call EPOCH_fnc_playerDeath}];
						player removeAllEventHandlers 'Put';
						player addEventHandler ['Respawn', { (_this select 0) call EPOCH_clientRespawn }];
						player addEventHandler ['Put', {(_this select 1) call EPOCH_interact; _this call EPOCH_PutHandler}];
						player addEventHandler ['Take', {(_this select 1) call EPOCH_interact; _this call EPOCH_UnisexCheck}];
						_addCase = addMissionEventHandler ['Draw3D', {}];
						removeMissionEventHandler ['Draw3D',0];
						if (_addCase > 0) then
						{
							_log = format['MEH Draw3D: %1',_addCase];
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
						};
					};
					if (!isNil 'life_adminlevel') then
					{
						player removeAllEventhandlers 'InventoryClosed';
						player removeAllEventhandlers 'InventoryOpened';
						player addEventHandler['HandleDamage',{_this call life_fnc_HandleDamage;}];
						player addEventHandler['Killed', {_this spawn life_fnc_onPlayerKilled}];
						player addEventHandler['Respawn', {_this call life_fnc_onPlayerRespawn}];
						player addEventHandler['Take',{_this call life_fnc_onTakeItem}];
						player addEventHandler['Fired',{_this call life_fnc_onFired}];
						player addEventHandler['InventoryClosed', {_this call life_fnc_inventoryClosed}];
						player addEventHandler['InventoryOpened', {_this call life_fnc_inventoryOpened}];
					};
				};
			};
			"+_AH_RunCheck+" = "+_AH_RunCheck+" + [1];
		};
		if !(2 in "+_AH_RunCheck+") then
		{
			[_name,_puid] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				_badDialogsClose = "+str _badDialogsClose+";
				_badDialogsBAN = "+str _badDialogsBAN+";
				_allowedDialogs = "+str _allowedDialogs+";
				while {1 == 1} do
				{
					{
						if (!isNull (_x select 0)) then
						{
							_log = _x select 1;
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
							closeDialog 0;
						};
					} forEach [
						[(findDisplay 64) displayCtrl 101,'MenuBasedHack_DISPLAY_64_C_101'],
						[(findDisplay 64) displayCtrl 1002,'MenuBasedHack_DISPLAY_64_C_1002'],
						[(findDisplay 49) displayCtrl 0,'MenuBasedHack_DISPLAY_49_C_0'],
						[uiNamespace getVariable 'RscDisplayDebugPublic','MenuBasedHack_RscDisplayDebugPublic'],
						[uiNamespace getVariable 'RscDisplayRemoteMissions','MenuBasedHack_RscDisplayRemoteMissions'],
						[uiNamespace getVariable 'RscDisplayArsenal','MenuBasedHack_RscDisplayArsenal'],
						[missionnamespace getvariable 'BIS_fnc_showNotification_queue','MenuBasedHack_showNotification']
					];
					if (!isNull (findDisplay 148)) then
					{
						if ((lbSize 104)-1 > 3) then
						{
							_log = 'MenuBasedHack_MenuBasedHack_RscDisplayConfigureControllers';
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
							closeDialog 0;
						};
					};
					if (!isNull (uiNamespace getVariable 'RscDisplayInsertMarker')) then
					{
						_action = buttonAction 1;
						_action2 = buttonAction 2;
						_title = ctrlText 1001;
						if(_action != '' OR _title != localize '$STR_A3_RscDisplayInsertMarker_Title' OR _action2 != '') then
						{
							_log = 'MenuBasedHack_RscDisplayInsertMarker';
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
							closeDialog 0;
						};
					};
					if (!isNull (uiNamespace getVariable 'RscDisplayConfigureAction')) then
					{
						(findDisplay 131) displayCtrl 102 ctrlRemoveallEVenthandlers 'LBDblClick';
						(findDisplay 131) displayCtrl 102 ctrlRemoveallEVenthandlers 'LBSelChanged';
						_actions = [buttonAction 1, buttonAction 107, buttonAction 104, buttonAction 106, buttonAction 109, buttonAction 105, buttonAction 108];
						_title = ctrlText 1000;
						if(_title != localize '$STR_A3_RscDisplayConfigureAction_Title') exitWith {
							_log = 'MenuBasedHack_RscDisplayConfigureAction';
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
							closeDialog 0;
						};
						{
							if(_x != '') exitWith {
								_log = 'MenuBasedHack_RscDisplayConfigureAction';
								"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
								[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
								closeDialog 0;
							};
						} foreach _actions;
					};
					_fbd = 'no';{if (!isNull (findDisplay _x)) exitWith {_fbd = str _x;};} forEach _badDialogsBAN;
					if (_fbd != 'no') then
					{
						_log = format['MenuBasedHack_DISPLAY_%1',_fbd];
						"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
						[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
						closeDialog 0;
					};
					{if (!isNull (findDisplay _x)) then {(findDisplay _x) closeDisplay 0;closeDialog 0;};} forEach _badDialogsClose;
					if ("+str _UDW+") then
					{
						_checkAllowed = _allowedDialogs;
						if (!isNil 'EPOCH_KeyDown') then
						{
							_checkAllowed = _allowedDialogs + [300,303,-666,-1200,-1300,-1400,419999,420001,420002,420003,420004,420005,420006];
						};
						if (!isNil 'life_adminlevel') then
						{
							_checkAllowed = _allowedDialogs + [2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2300,2400,2520,2600,2620,2650,2700,2800,2900,3000,3100,3500,7300,37400,38200,38300,38400,38500,39400];
						};
						_break = true;
						{if (!isNull (findDisplay _x)) exitWith {_break = false;};} forEach _checkAllowed;
						if (_break) then {closeDialog 0;closeDialog 0;closeDialog 0;};
					};
					uiSleep 0.25;
				};
			};
			[_name,_puid,_admins] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				_admins = _this select 2;
				if (isNil 'life_cash') then {life_cash = 0;};_life_cash = 0;
				if (isNil 'life_atmcash') then {life_atmcash = 0;};_life_atmcash = 0;
				while {1 == 1} do
				{
					if (!isNil 'life_adminlevel') then
					{
						if (typeName life_adminlevel == 'SCALAR') then
						{
							if (life_adminlevel > 0) then
							{
								_log = format['life_adminlevel: %1',life_adminlevel];
								"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
								[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
								closeDialog 0;
							};
						};
					};
					_life_cash = life_cash;
					_life_atmcash = life_atmcash;
					
					uiSleep 2;
					
					_one = life_cash+life_atmcash;
					_two = _life_cash+_life_atmcash;
					if (_one > (_two + 100000)) then
					{
						_log = format['life_cash+life_atmcash increased from %1 to %2 within 2seconds..',_one,_two];
						"+_AH_KICKLOG+" = [_name,_puid,'HLOG',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
					};
					
					{
						if (!isNull _x) then {(vehicle player) enableCollisionWith _x;removeAllActions _x;};
						true;
					} count ((vehicle player) nearObjects 30);
					
					{
						if (!isNull _x) then {if (isPlayer _x) then {if !(getPlayerUID _x in _admins) then {_x hideObject false;};};};
						true;
					} count (vehicle player nearEntities ['AllVehicles',150]);
				};
			};
			"+_AH_RunCheck+" = "+_AH_RunCheck+" + [2];
		};
		if !(3 in "+_AH_RunCheck+") then
		{
			[_name,_puid] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				_badVariables =
				[
					'typeName','lbClear','closedialog','startloadingscreen','endLoadingScreen','findDisplay','setposATL','getPos','to',
					'closeDisplay','getPlayerUID','publicVariableServer','setPos','toArray','setposASL','getPosASL','allowDamage',
					'endMission','str','isNil','diag_log','format','removeMagazines','getPosATL','from','ctrlEnabled','uiNameSpace',
					'removeMagazine','failMission','diag_ticktime','publicvariable','profileNamespace','for','toString','resize','toLower',
					'displayRemoveAllEventHandlers','ctrlRemoveAllEventHandlers','removeWeapon','&&','||','removeAction','in','spawn',
					'do','displayCtrl','player','select','saveProfileNamespace','exitWith','or','and','visibleMap','uiSleep','alive',
					'isNull','typeOf','distance','true','false','isDedicated','unitRecoilCoefficient','call','setunitRecoilCoefficient',
					'waitUntil','speed','while','if','isServer','then','primaryWeapon','unitBackpack','magazines','weapons','getMagazineCargo',
					'getWeaponCargo','isPlayer','dialog','disableSerialization','count','ctrlSetText','ctrlText','systemChat','commandingMenu',
					'showcommandingMenu','disableUserInput','diag_tickTime','local','forEach','nearEntities','round','onEachFrame','a','imgoingnukeyou',
					'Status_BB','TZ_BB_A3','TZ_BB_KB_Hint','TZ_BB_BindHandler','AH_BRAZZERS_TZ_BB','kamakazi_lystic','fuckfest','LYSTIC_MENU_LOADED','D_AMEZ_COA',
					'Intro','Repair','Heal','Cash','T3le','TNK','I_like_turtles','BIGM','GMod','E3p','Does_Tonic_Like_to_take_Turtle_penis_in_the_ass_LODESTARS',
					'lel','vars','PSwap','toLower_new','BCast','thfile','tlmadminrq','BobBLACK','name','carepkg','scrollAim','BlurExec','sbpc','CALLRE',
					'quake','menu_run','ZedProtect','actid1','vehicles1','MapClicked','MapClickedPosX','MouseUpEvent','scrollPlayerlist','keypress_xxx','D_AMEZ_COA',
					'envi','G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z','isori','tangrowth27','PVAH_AdminRequest','AH_OFF_LOL','b','Bob_fillRE',
					'qwak','infoe','font','title_dialog','sexymenu_adds_Star','boolean_1','initre337','skype_option','bleh','magnetomortal','fnc_allunits','sbp',
					'PV_IAdminMenuCode','PVAH_WriteLogRequest','skype_img','Lhacks','Lpic','LtToTheRacker','Lexstr','take1','Called','epochExec','sdgff4535hfgvcxghn',
					'adadawer24_1337','fsdddInfectLOL','W_O_O_K_I_E_Car_RE','kW_O_O_K_I_E_Go_Fast','epchDeleted','lystobindkeys','lystoKeypress',
					'toggle_1','shiftMenu','dbClicked','b_loop','re_loop','v_bowen','bowen','melee_startAttack','asdasdasd','antihax2','PV_AdminMenuCode','AdminLoadOK',
					'AdminLoadOKAY','PV_TMPBAN','T_o_g_g_l_e_BB','fixMenu','PV_AdminMenuCodee','AdminPlayer','PVAH_AdminRequestVariable','epochBackpack','JME_Red',
					'JME_MENU_Sub','JME_menu_title','JME_Sub','JME_OPTIONS','god','heal','grass','fatguybeingchasedbyalion','night','day','infammo','nvg','thermal',
					'Keybinds','fredtargetkill','loopfredtpyoutome','epochTp','AdminLst','BB_Pr0_Esp','BBProEsp','epochMapMP','CALLRESVR',
					'adminlite','adminlitez','antihacklite','bp','inSub','scroll_m_init_star','markerCount','zombies','startmenu_star','LystoDone','MOD_EPOCH',
					'Admin_Lite_Menu','admingod','adminESPicons','fnc_MapIcons_Bob','BIS_MPF_remoteExecutionServer4','adminadd','shnext','Bob_fill_Weapons',
					'adminZedshld','adminAntiAggro','admin_vehicleboost','admin_low_terrain','admin_debug','admincrate','exstr','nlist','PV_AdminMainCode','TPCOUNTER',
					'PVDZ_Hangender','fn_filter','vehiList','Remexec_Bitch','zeus_star','igodokxtt','tmmenu','AntihackScrollwheel','survcam','infiniteammo','PVAH_AHTEMPBAN',
					'lalf','toggle','iammox','telep','dayzlogin3','dayzlogin4','changeBITCHinstantly','antiAggro_zeds','BigFuckinBullets','abcdefGEH','adminicons',
					'fn_esp','aW5maVNUQVI_re_1','passcheck','isInSub','qodmotmizngoasdommy','ozpswhyx','xdistance','wiglegsuckscock','diz_is_real__i_n_f_i_S_T_A_R',
					'pic','veh','unitList','list_wrecked','addgun','ESP','BIS_fnc_3dCredits_n','dayzforce_save','ViLayer','blackhawk_sex','activeITEMlist','items1',
					'adgnafgnasfnadfgnafgn','Metallica_Bob_hax_toggled','activeITEMlistanzahl','xyzaa','iBeFlying','rem','DAYZ_CA1_Lollipops','HMDIR','vehC',
					'HDIR','carg0d','init_Fncvwr_menu_star','altstate','black1ist','ARGT_JUMP','ARGT_KEYDOWN','ARGT_JUMP_w','ARGT_JUMP_a','bpmenu','color_black',
					'p','fffffffffff','markPos','pos','TentS','VL','MV','monky','qopfkqpofqk','monkytp','pbx','nametagThread','spawnmenu','sceptile15','sandshrew',
					'mk2','i','j','v','fuckmegrandma','mehatingjews','TTT5OptionNR','zombieDistanceScreen','cargodz','R3m0te_RATSifni','wepmenu','admin_d0','RAINBOWREMEXECVEH',
					'omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','testIndex','g0d','spawnvehicles_star','kill_all_star','sCode','dklilawedve','peter_so_fly_CUS',
					'selecteditem','moptions','delaymenu','gluemenu','g0dmode','cargod','Bob_fillHax','itemmenu','gmadmin','fapEsp','mapclick',
					'spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu','godall','theKeyControl','Bob_FILLPLAYER','whitelist','pfEpochTele',
					'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst','DEV_ConsoleOpen','executeglobal','cursoresp','Asdf','planeGroup',
					'teepee','spwnwpn','musekeys','dontAddToTheArray','morphtoanimals','aesp','LOKI_GUI_Key_Color','Monky_initMenu','tMenu','recon','curPos','pilot',
					'playerDistanceScreen','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC','pathtoscrdir','Bowen_RANDSTR','ProDayz','idonteven','walrein820','RandomEx',
					'TAG_onKeyDown','changestats','derp123','heel','rangelol','unitsmenu','xZombieBait','plrshldblckls','ARGT_JUMP_s','ARGT_JUMP_d','globalplaya','ALL_MAGS_TO_SEARCH',
					'shnmenu','xtags','pm','lmzsjgnas','vm','bowonkys','glueallnigga','hotkeymenu','Monky_hax_toggled','espfnc','playeresp','zany','dfgjafafsafccccasd',
					'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami','T','bowonky','aimbott','Admin_Layout','markeresp','allMrk','MakeRandomSpace',
					'helpmenu','godlol','rustlinginit','qofjqpofq','invall','initarr','reinit','byebyezombies','admin_toggled','fn_ProcessDiaryLink','ALexc','DAYZ_CREATEVEHICLE',
					'Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt','hangender','slag','jizz','kkk','ebay_har','sceptile279','TargetPlayer',
					'tell_me_more_Bob','airborne_spawn_vehicle_Bob','sxy_list_stored','advert_SSH','antiantiantiantih4x','Flare8','Flare7','SuperAdmin_MENU',
					'bl4ck1ist','keybinds','actualunit','mark_player','unitList_vec','yo2','actualunit_vec','typeVec','mark','r_menu','hfghfg','vhnlist','work','Intro',
					'yo3','q','yo4','k','cTargetPos','cpbLoops','cpLoopsDelay','Flare','Flare1','Flare2','Flare3','Flare4','Flare5','Flare6','kanghaskhan','palkia',
					'eExec_commmand','cockasdashdioh','fsdandposanpsdaon','antiloop','anti','spawn_explosion_target_ebay','whatisthis4','ratingloop_star','epochRemoteNukeAll',
					'PVAH_admin_rq','PVAH_writelog_rq','sandslash','muk','pidgeotto','charmeleon','pidgey','lapras','LYST1C_UB3R_L33T_Item','MathItem','fapLayer','cooldown',
					'raichu','Bob_chewSTAR_dayz_1','infi_STAR_output','infi_STAR_code_stored','keybindings','keypress','menu_toggle_on','dayz_godmode','aiUnit',
					'MENUTITLE','wierdo','runHack','Dwarden','poalmgoasmzxuhnotx','ealxogmniaxhj','firstrun','ohhpz','fn_genStrFront','shazbot1','cip','Armor1','GMod',
					'kickable','stop','possible','friendlies','hacks','main','mapscanrad','maphalf','DelaySelected','SelectDelay','GlobalSleep','isAdmin','vehD','ALL_WEPS_TO_SEARCH',
					'jopamenu','ggggg','tlm','Listw','toggle_keyEH','infammoON','pu','chute','dayzforce_savex','PVDZ_AdminMenuCode','PVDZ_SUPER_AdminList','DarkwrathBackpack',
					'PVDZ_hackerLog','BP_OnPlayerLogin','material','mapEnabled','markerThread','addedPlayers','playershield','spawnitems1','sceptile27','Proceed_BB',
					'ESPEnabled','wpnbox','fnc_temp','MMYmenu_stored','VMmenu_stored','LVMmenu_stored','BIS_MPF_ServerPersistentCallsArray','PV_CHECK','admin_animate1',
					'patharray','diag_tickTime','ZobieDistanceStat','BobBOTxxx','keyspressed','fT','tpTarget','HumanityVal','yanma','absol','SimpleMapHackCount','keyp',
					'aggron','magazines_spawn','weapons_spawn','backpack_spawn','backpackitem_spawn','keybindings_exec','keypress_exec','MajorHageAssFuckinfBulletsDude',
					'Wannahaveexplosivesforbullets','TheTargetedFuckingPlayerDude','haHaFuckAntiHakcsManIbypasDatShit','aintNoAntiHackCatchMyVars','objMYPlayer',
					'Awwwinvisibilty','vehiclebro','wtfyisthisshithere','terrainchangintime','Stats','menu','ssdfsdhsdfh','onisinfiniteammobra','youwantgodmodebro',
					'yothefuckingplayerishere','Namey','sendmsg12','jkh','DELETE_THIS','move_forward','leftAndRight','forwardAndBackward','upAndDown','distanceFromGround',
					'hoverPos','hovering','bulletcamon','cheatlist','espOn','removegrass','timeday','infammo','norekoil','nocollide','esp2ez','fastwalk','entupautowalk',
					'BensWalker','dropnear','executer','killme','magnetmenu','loadmain','magnet','A11','loadMenu','refreshPlayers','ALREADYRAN','players','BigBenBackpack',
					'sendMessage','newMessage','W34p0ns','amm0','Att4chm3nt','F0od_Dr1nk','M3d1c4l','T0ol_it3ms','B4ckp4cks','It3m5','Cl0th1ng','walkloc','nwaf','cherno',
					'cherno_resident','cherno_resident_2','dubky','oaks','swaf','swmb','getX','PlayerShowDistance','M_e_n_u_2','colorme','keybindloop','Tractor_Time',
					'murkrow','noctowl','isExecuted','piloswine','AddPlayersToMap','markers','miltank','GearAdd','GearRemove','Malvsm','Malcars','malfly','keyForward',
					'PermDialogSelected','TempDialogSelected','AdminDialogList','pfKeygen','pfScanUnits','pfPickPlayer','pfshnext','pfnlist','pfselecteditem','pfshnmenu',
					'pfPlayerMonitor','pfPlayersToMonitor','pfShowPlayerMonitor','pfPlayerMonitorMutex','marker','JJJJ_MMMM___EEEEEEE_INIT_MENU','E_X_T_A_S_Y_Init_Menu',
					'monkaiinsalt','monkaiin','part88','adminKeybinds','PV_DevUIDs','fapEspGroup','Repair','RepairIT','rainbowTarget','rainbowTarget1','rainbowTarget2',
					'rainbowTarget3','letmeknow','VehicleMenue','Menue_Vehicle','my_anus_hurtz','life_no_injection','Tonic_has_a_gaping_vagina','teletoplr','telet',
					'ygurv1f2','BIGM','E3p','T3le','fnc_PVAH_AdminReq','Bob_MAIN_CODE','MAIN_CODE_INJECTED','D34DXH34RT_E5P','Arsenal','Jme_Is_God','B0X_CANN0N_T0GGLE',
					'PL4YER_CANN0N_T0GGLE','aim','HOLY_FUCK_FDKFHSDJFHSDKJ_vehicles_m','lazy_ILHA_is_lazy','POOP_Item','die_menu_esp_v1','XXMMWW_main_menu','MM_150',
					'BIS_tracedShooter','JME_HAS_A_GIANT_DONG','nuke_vars','nukepos','fuckfest','fuckfestv2','FAG_NEON'
				];
				while {1 == 1} do
				{
					{
						if !(isNil _x) then 
						{
							_log = format['BadVar: %1',_x];
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
						};
					} forEach _badVariables;
					
					if (isNil 'life_paycheck') then {life_paycheck = 0;};
					if (abs life_paycheck > 1000000) then
					{
						_log = format['Bad Paycheck: %1',life_paycheck];
						"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
						life_paycheck = 0;
					};
					uiSleep 0.5;
				};
			};
			"+_AH_RunCheck+" = "+_AH_RunCheck+" + [3];
		};
		if !(4 in "+_AH_RunCheck+") then
		{
			if ("+str _CMC+") then
			{
				[_name,_puid] spawn {
					_name = _this select 0;
					_puid = _this select 1;
					_validMenus = "+str _cMenu+";
					while {1 == 1} do
					{
						_commandingMenu = commandingMenu;
						if (_commandingMenu in ['#User:BIS_fnc_addCommMenuItem_menu']) then
						{
							showCommandingMenu '';
						};
						_commandingMenu = commandingMenu;
						if (_commandingMenu != '') then
						{
							_A = toArray _commandingMenu;
							_A resize 6;
							_A;
							_short = toString _A;
							if !(_commandingMenu in _validMenus) then
							{
								showCommandingMenu '';
								if (_short in ['#USER:']) then
								{
									_log = format['BadCommandingMenu: %1',_commandingMenu];
									"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
									[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
								};
							};
						};
						uiSleep 0.5;
					};
				};
			};
			"+_AH_RunCheck+" = "+_AH_RunCheck+" + [4];
		};
		if !(5 in "+_AH_RunCheck+") then
		{
			[_name,_puid,_admins] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				_admins = _this select 2;
				uiSleep 1;
				_mPos = getMarkerPos 'respawn_west';
				_oVeh = (vehicle player);
				_oPos = getPos player;
				_time = diag_tickTime;
				_tps = 0;
				if (isNil '"+_AHpos+"') then {"+_AHpos+" = [];};
				while {1 == 1} do
				{
					if ("+str _UVC+") then
					{
						_veh = vehicle player;
						_type = typeOf _veh;
						if (_type in "+str _ForbiddenVehicles+") then
						{
							player action ['GetOut',_veh];
							
							_warn = format['%1 - YOU ARE IN A FORBIDDEN VEHICLE - LEAVE IT!',_name];
							hint _warn;
							1 cutText [_warn,'PLAIN DOWN'];
							2 cutText [_warn,'PLAIN'];
							systemChat ('Bob.de: '+str _warn);
							taskHint [_warn, [1,0,0.1,1], 'taskNew'];
							
							_log = format['Forbidden Vehicle: %1',_type];
							"+_AH_KICKLOG+" = [_name,_puid,'FVEH',toArray _log,_veh];publicVariableServer '"+_AH_KICKLOG+"';
						};
					};
					
					if ("+str _UFI+") then
					{
						_inv = [];
						_inv = _inv + (magazines player);
						_inv = _inv + (weapons player);
						if (!isNull (unitBackpack player)) then
						{
							_BW = (getWeaponCargo unitBackpack player) select 0;
							_BM = (getMagazineCargo unitBackpack player) select 0;
							_inv = _inv + _BW + _BM;
						};
						
						{
							if ((_x in _inv) && (_x != '')) then
							{
								[_x] spawn {
									_y = _this select 0;
									for '_i' from 0 to ({_x == _y} count (weapons player)) do {player removeWeapon _y;};
									player removeMagazines _y;
									for '_w' from 0 to 10 do {uiSleep 0.1;player removeWeapon _y;player removeMagazines _y;};
								};
								_log = format['BadItem: %1',_x];
								"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
								[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
							};
						} forEach ("+str _ForbiddenItems+");
					};
					
					_doit = false;
					if ("+str _UAT+") then
					{
						if (alive player) then
						{
							_oVeh = (vehicle player);
							_oPos = getPos _oVeh;
							_oPos = [_oPos select 0,_oPos select 1,0];
							_time = diag_tickTime;
							_doit = true;
						};
					};
					uiSleep 0.5;
					if ("+str _UAT+") then
					{
						if (_doit) then
						{
							_veh = (vehicle player);
							if (str _oVeh == str _veh) then
							{
								_driver = driver _veh;
								if ((str _driver == str player) || (str _driver == '<NULL-object>')) then
								{
									if (alive player) then
									{
										_maxdist = (getNumber (configFile >> 'CfgVehicles' >> typeOf _veh >> 'maxSpeed')) min 500;
										if (str _veh == str player) then
										{
											_maxdist = _maxdist max 40;
											_speed = abs(speed player);
											if (_speed <= 0.1) then {_maxdist = 12;};
										};
										_cPos = getPos (vehicle player);
										_cPos = [_cPos select 0,_cPos select 1,0];
										_dist = floor(_oPos distance _cPos);
										_dist0 = _dist > _maxDist;
										_dist1 = _mPos distance _oPos > 350;
										_dist2 = _mPos distance _cPos > 350;
										if (_dist0 && _dist1 && _dist2) then
										{
											if (str "+_AHpos+" != '[]') then
											{
												"+_AHpos+" = [];
												_log = format['Admin Teleport: moved from %1(%2) to %3(%4) (%5m in %6s - speed: %7 - MapOpen?: %8 - type: %9)',mapGridPosition _oPos,_oPos,mapGridPosition _cPos,_cPos,_dist,diag_tickTime - _time,abs(floor(speed _veh)),visiblemap,typeOF _veh];
												"+_AH_KICKLOG+" = [_name,_puid,'HLOG',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
											}
											else
											{
												_log = format['Teleport?: moved from %1(%2) to %3(%4) (%5m in %6s - speed: %7 - MapOpen?: %8 - type: %9)',mapGridPosition _oPos,_oPos,mapGridPosition _cPos,_cPos,_dist,diag_tickTime - _time,abs(floor(speed _veh)),visiblemap,typeOF _veh];
												if (visiblemap) then
												{
													"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
													[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
												}
												else
												{
													_tps = _tps + 1;
													if (_tps > 1) then {(findDisplay 46) closeDisplay 0;};
													"+_AH_KICKLOG+" = [_name,_puid,'HLOG',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
			"+_AH_RunCheck+" = "+_AH_RunCheck+" + [5];
		};
		if !(6 in "+_AH_RunCheck+") then
		{
			[_name,_puid] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				_CEA1 = ["+str _CE0+","+str _CE1+","+str _CE2+","+str _CE3+","+str _CE4+","+str _CE5+"];
				while {1 == 1} do
				{
					_CEC0 = (getText(configFile >> 'RscDisplayDSinterface' >> 'onLoad'));
					_CEC1 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onLoad'));
					_CEC2 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onUnload'));
					_CEC3 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'controls' >> 'G_VideoOptionsControls' >> 'controls' >> 'HideAdvanced' >> 'OnButtonClick'));
					_CEC4 = (getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'BCredits' >> 'OnButtonClick'));
					_CEC5 = (getText(configFile >> 'EPOCH_createGroup' >> 'onLoad'));
					_CECA2 = [_CEC0,_CEC1,_CEC2,_CEC3,_CEC4,_CEC5];
					for '_i' from 0 to (count _CEA1)-1 do
					{
						_a = _CEA1 select _i;
						_a = _a - [32];
						_a = _a - [9];
						if (count _a > 120) then {_a resize 120;};
						_bs = _CECA2 select _i;
						_b = toArray _bs;
						_b = _b - [32];
						_b = _b - [9];
						if (count _b > 120) then {_b resize 120;};
						if (str _a != str _b) then
						{
							_log = format['CheatEngine %1: %2',_i,_bs];
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
						};
					};
					
					uiSleep 1;
					private['_cfgs','_displays','_selected'];
					_displays = ['RscDisplayInventory','RscDisplayMainMap','RscDisplayDiary','RscDisplayOptions',
					'RscDisplayGetReady','RscDisplayOptionsVideo','RscDisplayOptionsAudio',
					'RscDisplayOptionsLayout','RscDisplayMicSensitivityOptions','RscDisplayConfigure',
					'RscDisplayConfigureControllers','RscDisplayCustomizeController','RscDisplayJoystickSchemes',
					'RscDisplayConfigureAction','RscDisplayGameOptions','RscMiniMap','RscMiniMapSmall',
					'RscDisplayControlSchemes','RscDisplayFieldManual','RscDisplayPassword','RscDisplayServerGetReady',
					'RscDisplayClientGetReady','RscDisplayRespawn','RscDisplayLoading','RscDisplayStart','RscDisplayClient'];
					_cfgs = (call CESCANARRAY);
					_selected = (count _displays) - 1;
					for '_i' from 0 to _selected do
					{
						if !((compile((configfile >> (_displays select _i) >> 'onLoad') call BIS_fnc_getCfgData)) in _cfgs) exitWith
						{
							_log = format['%1 onLoad changed: %2',_displays select _i,(configfile >> (_displays select _i) >> 'onLoad') call BIS_fnc_getCfgData];
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
						};
						if !((compile((configfile >> (_displays select _i) >> 'onUnload') call BIS_fnc_getCfgData)) in _cfgs) exitWith
						{
							_log = format['%1 onUnload changed: %2',_displays select _i,(configfile >> (_displays select _i) >> 'onUnload') call BIS_fnc_getCfgData];
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
						};
					};
					
					uiSleep 1;
					_children = [configFile >> 'RscDisplayMPInterrupt' >> 'controls',0] call BIS_fnc_returnChildren;
					_allowedChildren = ['Title','MissionTitle','DifficultyTitle','PlayersName','ButtonCancel','ButtonSAVE','ButtonSkip','ButtonRespawn','ButtonOptions',
					'ButtonVideo','ButtonAudio','ButtonControls','ButtonGame','ButtonTutorialHints','ButtonAbort','DebugConsole','Feedback','MessageBox',''];
					{
						_cfgName = configName _x;
						if !(_cfgName in _allowedChildren) exitWith {
							_log = format['Modified MPInterrupt: %1',_cfgName];
							"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
							[] spawn {uiSleep 0.1;['Bob.de',false,false] spawn KickOFF;};[] spawn "+_AHKickOFF+";
						};
					} foreach _children;
				};
			};
			"+_AH_RunCheck+" = "+_AH_RunCheck+" + [6];
		};
		if !(7 in "+_AH_RunCheck+") then
		{
			[_name,_puid] spawn {
				_name = _this select 0;
				_puid = _this select 1;
				while {1 == 1} do
				{
					if (isNil 'EPOCH_KeyDown') then
					{
						onEachFrame {};
					}
					else
					{
						removeAllActions player;
						removeAllActions (vehicle player);
					};
					player allowDamage true;
					(vehicle player) allowDamage true;
					onMapSingleClick '';
					setTerrainGrid 25;
					uiSleep 0.1;
				};
			};
			"+_AH_RunCheck+" = "+_AH_RunCheck+" + [7];
		};
		if !(8 in "+_AH_RunCheck+") then
		{
			if ("+str _VON+") then {
				[] spawn {
					disableSerialization;
					while {1 == 1} do
					{
						if ((!isNull findDisplay 63)&&(!isNull findDisplay 55)) then
						{
							if (ctrlText ((findDisplay 55) displayCtrl 101) == '\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa') then
							{
								if ((ctrlText ((findDisplay 63) displayCtrl 101) in ['Side channel'])) then
								{
									_msg = 'NO VOICE ON SIDE! (BYE)';
									systemChat ('Bob.de: '+str _msg);
									hint _msg;
									1 cutText [format ['%1',_msg],'PLAIN DOWN'];
									2 cutText [format ['%1',_msg],'PLAIN'];
									(findDisplay 46) closeDisplay 0;
								};
							};
						};
						uiSleep 0.5;
					};
				};
			};
			"+_AH_RunCheck+" = "+_AH_RunCheck+" + [8];
		};
		"+_AH_RunCheck2+" = 'k';
	};
	publicVariable '"+_AH_MAIN_BLOCK+"';
	"+_AH_RunCheck2+" = 'k';
	
	
	fnc_VoteTimeServer =
	{
		_clientUID = _this select 0;
		_vote = _this select 1;
		
		if (isNil 'TimeVoteCooldown') then {TimeVoteCooldown = 300;};
		if (isNil 'LastVoteGoneThrough') then {LastVoteGoneThrough = 600;};
		if ((LastVoteGoneThrough == 0) || ((TimeVoteCooldown + LastVoteGoneThrough) < diag_ticktime)) then
		{
			if (isNil 'VoteArray') then {VoteArray = [];};
			if !(_clientUID in VoteArray) then
			{
				VoteArray = VoteArray + [_clientUID,_vote];
				_cntAll = count playableUnits;
				_cntVoted = {getPlayerUID _x in VoteArray} count playableUnits;
				if ((_cntAll > 0) && (_cntVoted > 0)) then
				{
					_cntday = 0;
					_cntnight = 0;
					if ((_cntVoted / _cntAll) > 0.49) then
					{
						_oUIDs = [];
						{
							_xUID = getPlayerUID _x;
							if (_xUID != '') then
							{
								_oUIDs = _oUIDs + [_xUID];
							};
						} forEach playableUnits;
						for '_i' from 0 to (count VoteArray)-1 step 2 do
						{
							_cUID = VoteArray select _i;
							_cVOTE = VoteArray select (_i+1);
							if (_cUID in _oUIDs) then
							{
								if (_cVOTE == 'DAY') then {_cntday = _cntday + 1;};
								if (_cVOTE == 'NIGHT') then {_cntnight = _cntnight + 1;};
							};
						};
						
						_txt = format['%1 of %2 Players voted. %3 for Day and %4 for Night.',_cntVoted,_cntAll,_cntday,_cntnight];
						"+_massMessage+" = ['<t size=''0.55'' color=''#0B6121''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079];
						publicVariable '"+_massMessage+"';
						
						_date = date;
						_date set [3,11];
						if (_cntnight > _cntday) then
						{
							_date set [3,23];
						};
						EPOCH_StaticDateTime = _date;
						setDate _date;
						VoteArray = [];
						LastVoteGoneThrough = diag_ticktime;
					}
					else
					{
						_txt = format['%1 of %2 Players voted (/vote day or /vote night).',_cntVoted,_cntAll];
						"+_massMessage+" = ['<t size=''0.55'' color=''#0B6121''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079];
						publicVariable '"+_massMessage+"';
					};
				};
			};
		}
		else
		{
			_txt = format['Wait %1s more until next diag_tickTime vote can be done!',round((TimeVoteCooldown + LastVoteGoneThrough) - diag_ticktime)];
			"+_massMessage+" = ['<t size=''0.55'' color=''#0B6121''>'+(_txt)+'</t>',safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079];
			publicVariable '"+_massMessage+"';
		};
	};
	fnc_VoteTimeServer = compileFinal ([fnc_VoteTimeServer] call LysticCompilableString);
	
	if (isNil '"+_AH_AnnounceAdmin+"') then {"+_AH_AnnounceAdmin+" = [];};
	'"+_AH_KICKLOG+"' addPublicVariableEventHandler
	{
		_array = _this select 1;
		_name = _array select 0;
		_puid = _array select 1;
		_what = _array select 2;
		_work = toString (_array select 3);
		
		if (_what == 'VOTE') exitWith
		{
			if (_work in ['DAY','NIGHT']) exitWith
			{
				[_puid,_work] call fnc_VoteTimeServer;
			};
		};
		if (_what == 'T') exitWith
		{
			if (isNil 'Epoch_personalTokenARRAY') then {Epoch_personalTokenARRAY = [];};
			if !(_puid in Epoch_personalTokenARRAY) then
			{
				Epoch_personalTokenARRAY pushBack _puid;
				Epoch_personalTokenARRAY pushBack _work;
				publicVariable 'Epoch_personalTokenARRAY';
			};
			diag_log format['Bob.de EpochTokenCheck: %1(%2) Epoch_personalToken %3',_name,_puid,_work];
		};
		if (_what == 'M') exitWith
		{
			_logThose = _array select 4;
			_clientMarker = [];{_clientMarker = _clientMarker + [toString _x];} forEach _logThose;
			
			{
				if !(_x in allMapMarkers) then
				{
					_shortX = toArray _x;
					_shortX resize 13;
					_shortX = toString _shortX;
					if (!(_shortX in ['_USER_DEFINED']) && ((str (mapGridPosition (getMarkerPos _x)) == '@000000') || (str (getMarkerSize _x) == '[0,0]'))) exitWith
					{
						_log = format['Bob.de MarkerCheck: %1(%2) LocalMarker @%3 %4 %5 %6',_name,_puid,mapGridPosition (getMarkerPos _x),markerText _x,getMarkerSize _x,_x];
						"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray(_log)];publicVariableServer '"+_AH_KICKLOG+"';
					};
				};
			} forEach _clientMarker;
		};
		if (_what in ['BAN','HLOG','FVEH']) then
		{
			_stime = 0;
			if(serverTime > 36000)then{_stime = diag_tickTime;}else{_stime = serverTime;};
			_hours = (_stime/60/60);
			_hours = toArray (str _hours);
			_hours resize 1;
			_hours = toString _hours;
			_hours = compile _hours;
			_hours = call  _hours;
			_minutes = floor(_stime/60);
			_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format['0%1',_minutes2];};
			
			_log = format['%1h %2min| %3(%4): %5',_hours,_minutes2,_name,_puid,_work];
			diag_log ('Bob.de '+_log);
			'A3_HACKLOG' callExtension _log;
			
			if (_what in ['BAN']) then
			{
				if (isNil '"+_TMPBAN+"') then {"+_TMPBAN+" = [];} else {if (typeName "+_TMPBAN+" != 'ARRAY') then {"+_TMPBAN+" = [];};};
				if !(_puid in "+_TMPBAN+") then
				{
					"+_TMPBAN+" = "+_TMPBAN+" + [_puid];
					publicVariable '"+_TMPBAN+"';
					'BobwriteBan' callExtension _puid;
					
					_do = format['
					if ((getPlayerUID player == ''%1'') || (name player == ''%2'')) then
					{
						for ''_i'' from 0 to 101 do {(findDisplay _i) closeDisplay 0;};
						for ''_j'' from 0 to 101 do {disableUserInput true;};
					};',_puid,_name];
					_obj = 'C_man_1' createVehicle [0,0,0];_obj addMPEventHandler ['MPKilled',_do];_obj setDamage 5;deleteVehicle _obj;
				};
			};
			if (_what == 'FVEH') then
			{
				_veh = _array select 4;
				_veh setDamage 5;
			};
			
			"+_AH_AnnounceAdmin+" = "+_AH_AnnounceAdmin+" + [_log];
			publicVariable '"+_AH_AnnounceAdmin+"';
		};
	};
	
	"+_RunOnClients+" =
	{
		if (getPlayerUID player == '') exitWith {};
		_name = name player;
		_puid = getPlayerUID player;
		_rv3 = player getVariable['"+_randvar3+"',_puid];
		if (_rv3 != _puid) then
		{
			_log = format['ClientUID   is not equal to   ServerUID (%1/%2)',_puid,_rv3];
			"+_AH_KICKLOG+" = [_name,_puid,'BAN',toArray (_log)];publicVariableServer '"+_AH_KICKLOG+"';
		};
		if (isNil 'VERSION') then {
			VERSION = '26-10-2014 Bob.de AHAT 0006';
			diag_log format['Bob.de VERSION: %1',VERSION];
		};
		if (isNull (findDisplay 46)) exitWith {};
		_admins = "+str _admins+";
		_devs = "+str _devs+";
		call "+_AH_MAIN_BLOCK+";
		if (_puid in _admins) then
		{
			"+_AH_RunCheck2+" = 'k';
			Bob_ADMINS = _admins;
			Bob_DEVS = _devs;
			if (isNil '"+_adjust+"AdminLoaded') then
			{
				"+_adjust+"AdminLoaded = true;
				[_puid] spawn {
					_puid = _this select 0;
					Bob_MAIN_CODE = nil;
					PVAH_AdminReq = [1234,player,_puid];
					publicVariableServer 'PVAH_AdminReq';
					waitUntil {!isNil 'Bob_MAIN_CODE'};
					_tmpCode = Bob_MAIN_CODE;
					Bob_MAIN_CODE = nil;
					uiSleep 3;
					OPEN_ADMIN_MENU_KEY = "+str _OPEN_ADMIN_MENU_KEY+";
					diag_log format['Bob.de OPEN_ADMIN_MENU_KEY: %1',OPEN_ADMIN_MENU_KEY];
					[] spawn _tmpCode;
					ADMINLEVELACCESS = compileFinal '
						_level = [];
						_PUID = getPlayerUID player;
						if (_PUID in "+str _adminLevel1_UIDs+") then
						{
							_level = "+str _adminLevel1+";
						};
						if (_PUID in "+str _adminLevel2_UIDs+") then
						{
							_level = "+str _adminLevel2+";
						};
						if (_PUID in "+str _adminLevel3_UIDs+") then
						{
							_level = "+str _adminLevel3+";
						};
						if (_PUID in "+str _devs+") then
						{
							{
								if !(_x in _level) then {_level = _level + [_x];};
							} forEach ("+str _adminLevel1+"+"+str _adminLevel2+"+"+str _adminLevel3+");
						};
						_level
					';
				};
			};
			if (isNil '"+_AH_AnnounceAdmin+"') then {"+_AH_AnnounceAdmin+" = [];};
			if (isNil 'AH_HackLogArray') then {AH_HackLogArray = "+_AH_AnnounceAdmin+";};
			'"+_AH_AnnounceAdmin+"' addPublicVariableEventHandler
			{
				_array = _this select 1;
				AH_HackLogArray = _array;
				_log = _array select ((count _array)-1);
				if (isNil 'AdminAnnounceDisabled') then
				{
					taskHint [_log, [1,0,0.1,1], 'taskNew'];
					hint _log;
				};
				diag_log _log;
			};
			'"+_randvar30+"' addPublicVariableEventHandler {player setVariable['"+_randvar29+"',PVAH_AdminReq,true];};
			'NewPlayerAnnounce' addPublicVariableEventHandler {if (isNil 'AdminAnnounceDisabled') then {systemchat (_this select 1);hint (_this select 1);};diag_log (_this select 1);};
		}
		else
		{
			if (isNil '"+_adjust+"LastMarkerCheck') then {"+_adjust+"LastMarkerCheck = 0;};
			if (diag_tickTime > ("+_adjust+"LastMarkerCheck + 120)) then
			{
				"+_adjust+"LastMarkerCheck = diag_tickTime;
				_logThose = [];{_logThose = _logThose + [toArray _x];} forEach allMapMarkers;
				"+_AH_KICKLOG+" = [_name,_puid,'M',toArray ('log'),_logThose];publicVariableServer '"+_AH_KICKLOG+"';
			};
		};
		'"+_massMessage+"' addPublicVariableEventHandler {(_this select 1) spawn bis_fnc_dynamictext;};
		if ((!isNil 'Epoch_personalToken') && (!isNil 'Epoch_personalTokenARRAY')) then
		{
			_token = Epoch_personalToken;
			if !(_puid in Epoch_personalTokenARRAY) then
			{
				"+_AH_KICKLOG+" = [_name,_puid,'T',toArray (_token)];publicVariableServer '"+_AH_KICKLOG+"';
			};
		};
	};
	publicVariable '"+_RunOnClients+"';
	
	
	KickOFF = compileFinal preProcessFileLineNumbers '\a3\functions_f\Misc\fn_endMission.sqf';
	publicVariable 'KickOFF';
	"+_AHKickOFF+" = compileFinal '
		uiSleep 0.1;
		for ''_i'' from 0 to 101 do {(findDisplay _i) closeDisplay 0;};
		for ''_j'' from 0 to 101 do {disableUserInput true;};
	';
	publicVariable '"+_AHKickOFF+"';
	
	
	"+_AHrunCheck+" =
	{
		if (isNil '"+_AH_RunCheck2+"') then
		{
			if ((player == player) && (getPlayerUID player != '')) then
			{
				uiSleep 65;
				if (isNil '"+_AH_RunCheck2+"') then
				{
					if ((player == player) && (getPlayerUID player != '')) then
					{
						if (isNil '"+_adjust+"LOGGED') then
						{
							"+_adjust+"LOGGED = true;
							_log = 'AH Not Running! (Kicked to Lobby)';
							"+_AH_KICKLOG+" = [name player,getPlayerUID player,'HLOG',toArray(_log)];publicVariableServer '"+_AH_KICKLOG+"';
						};
						(findDisplay 46) closeDisplay 0;
					};
				};
			};
		};
	};
	publicVariable '"+_AHrunCheck+"';
	
	
	
	[] spawn {
		diag_log format['Bob.de %1 - STARTING _RunOnClients LOOP',diag_tickTime];
		while {1 == 1} do
		{
			_obj = 'C_man_1' createVehicle [0,0,0];_obj addMPEventHandler ['MPKilled','if (!isServer) then {[] spawn "+_RunOnClients+";};[] spawn "+_AHrunCheck+";'];_obj setDamage 5;deleteVehicle _obj;
			
			uiSleep 15;
			{
				if (!isNull _x) then
				{
					_puid = getPlayerUID _x;
					if (_puid != '') then
					{
						_name = name _x;
						[_puid,_name,_x] call fnc_Bob_PlayerLog;
					};
				};
			} forEach playableUnits;
			uiSleep 15;
		};
		diag_log format['Bob.de %1 - _RunOnClients LOOP - BROKEN!',diag_tickTime];
	};
	
	diag_log format['Bob.de %1 - CHANGING onPlayerConnected',diag_tickTime];
	fnc_Bob_PlayerLog = {
		_uid = _this select 0;_name = _this select 1;
		if ((_uid == '') && (_name == '__SERVER__')) exitWith {};
		_unit = objNull;
		if (count _this > 2) then
		{
			_x = _this select 2;
			if (!isNull _x) then
			{
				_xuid = getPlayerUID _x;
				if (_xuid != '') then
				{
					_unit = _x;
					_rv3 = _x getVariable['"+_randvar3+"','-1'];
					if (_rv3 != _uid) then
					{
						_x setVariable['"+_randvar3+"',_uid,true];
					};
				};
			};
		};
		if (isNil '"+_TMPBAN+"') then {"+_TMPBAN+" = [];} else {if (typeName "+_TMPBAN+" != 'ARRAY') then {"+_TMPBAN+" = [];};};
		if ((_uid in "+_TMPBAN+") || (_uid in "+str _BlackList+")) then
		{
			_do = format['
			if ((getPlayerUID player == ''%1'') || (name player == ''%2'')) then
			{
				for ''_i'' from 0 to 101 do {(findDisplay _i) closeDisplay 0;};
				for ''_j'' from 0 to 101 do {disableUserInput true;};
			};',_uid,_name];
			_obj = 'C_man_1' createVehicle [0,0,0];_obj addMPEventHandler ['MPKilled',_do];_obj setDamage 5;deleteVehicle _obj;
			if (!isNull _unit) then
			{
				_unit setDamage 5;
			};
		};
		if (isNil 'PlayerLogArrayMNS') then {PlayerLogArrayMNS = profileNamespace getVariable ['PlayerLogArrayMNS',[]];};
		if !(_uid in PlayerLogArrayMNS) then
		{
			PlayerLogArrayMNS = PlayerLogArrayMNS + [_uid];
			profileNamespace setVariable ['PlayerLogArrayMNS',PlayerLogArrayMNS];saveProfileNamespace;
			
			NewPlayerAnnounce = format['New Player: %1(%2)',_name,_uid];
			publicVariable 'NewPlayerAnnounce';
			
			diag_log format['Bob.de New Player: %1(%2)',_name,_uid];
		};
		_obj = 'C_man_1' createVehicle [0,0,0];_obj addMPEventHandler ['MPKilled','if (!isDedicated) then {[] spawn "+_RunOnClients+";};[] spawn "+_AHrunCheck+";'];_obj setDamage 5;deleteVehicle _obj;
	};
	fnc_Bob_PlayerLog = compileFinal ([fnc_Bob_PlayerLog] call LysticCompilableString);
	
	server_onPlayerConnect_Bob =
	{
		_log = format['Bob.de PlayerConnected: %1',_this];
		diag_log (_log);
		_this spawn fnc_Bob_PlayerLog;
	};
	server_onPlayerConnect_Bob = compileFinal ([server_onPlayerConnect_Bob] call LysticCompilableString);
	
	onPlayerConnected {[_uid,_name] call server_onPlayerConnect_Bob;};
	diag_log format['Bob.de %1 - onPlayerConnected changed!',diag_tickTime];
	
	
	
	fnc_PVAH_AdminReq = {
		diag_log format['Bob.de fnc_PVAH_AdminReq: %1',_this select 1];
		_playableUnits = "+str _admins+";
		
		_array = _this select 1;
		if (_array in ['']) exitWith {};
		if (typeName _array != 'ARRAY') exitWith {};
		
		_option = _array select 0;
		if (_option in ['']) exitWith {};
		if (typeName _option != 'SCALAR') exitWith {};
		
		_playerObj = _array select 1;
		if (_playerObj in ['']) exitWith {};
		if (typeName _playerObj != 'OBJECT') exitWith {};
		if (isNull _playerObj) exitWith {};
		
		_clientID = (owner _playerObj);
		_clientUID = (getPlayerUID _playerObj);
		_clientName = (name _playerObj);
		
		if ((_clientUID in ['',' ','0']) || (typeName _clientUID != 'STRING')) exitWith
		{
			diag_log format['Bob.de fnc_AdminFirstReq %1(%2): !!!!!!ADMIN-LOGIN-ERROR!!!!!!',_clientName,_clientUID];
		};
		if !(_clientUID in _playableUnits) exitWith
		{
			diag_log format['Bob.de fnc_AdminFirstReq %1(%2): Attempted to Use the AdminMenu',_clientName,_clientUID];
		};
		"+_randvar30+" = '1';
		_clientID publicVariableClient '"+_randvar30+"';
		_var = _playerOb getVariable['"+_randvar29+"','-1'];
		if !(_var in [_array]) exitWith
		{
			diag_log format['Bob.de fnc_AdminFirstReq %1(%2): AdminRequest Failed (Local %3/ Server %4)',_clientName,_clientUID,_var,_array];
		};
		
		if (_option == 1234) then
		{
			_puid = _array select 2;
			diag_log format['Bob.de ******ADMIN-LOGIN******: %1(%2)',_clientName,_clientUID];
			if ((_clientUID in _playableUnits) && (_puid == _clientUID)) then
			{
				_clientID PublicVariableClient 'Bob_MAIN_CODE';
			};
		};
		
		_fncDoGlobal =
		{
			_obj = 'C_man_1' createVehicle [0,0,0];
			_obj addMPEventHandler ['MPKilled',_this select 0];
			_obj setDamage 5;
			deleteVehicle _obj;
		};
		if (_option == 69) then
		{
			if (_clientUID in _playableUnits) then
			{
				_obj = 'C_man_1' createVehicle [0,0,0];
				_obj addMPEventHandler ['MPKilled',MarkerText 'respawn_west'];
				_obj setDamage 5;
				deleteVehicle _obj;
			};
		};
		if (_option == -667) then
		{
			_puid = _array select 2;
			if (isNil '"+_TMPBAN+"') then {"+_TMPBAN+" = [];} else {if (typeName "+_TMPBAN+" != 'ARRAY') then {"+_TMPBAN+" = [];};};
			"+_TMPBAN+" = "+_TMPBAN+" - [_puid];
			publicVariable '"+_TMPBAN+"';
		};
		if (_option == -666) then
		{
			_puid = _array select 2;
			if (isNil '"+_TMPBAN+"') then {"+_TMPBAN+" = [];} else {if (typeName "+_TMPBAN+" != 'ARRAY') then {"+_TMPBAN+" = [];};};
			if !(_puid in "+_TMPBAN+") then
			{
				"+_TMPBAN+" = "+_TMPBAN+" + [_puid];
				publicVariable '"+_TMPBAN+"';
				'BobwriteBan' callExtension _puid;
			};
			_do = format['if (!isServer) then
			{
				if (getPlayerUID player == ''%1'') then
				{
					(finddisplay 46) closeDisplay 0;
				};
			};',_puid];
			[_do] call _fncDoGlobal;
		};
		if (_option == -5) then
		{
			_target = _array select 2;
			_do = format['if (!isServer) then
			{
				if (getPlayerUID player == ''%1'') then
				{
					(finddisplay 46) closeDisplay 0;
				};
			};',getPlayerUID _target];
			[_do] call _fncDoGlobal;
		};
		if (_option == -4) then
		{
			_delete = _array select 2;
			if (typeName _delete != 'ARRAY') then {_delete = [_delete];};
			{
				if (!isNil 'EPOCH_save_killedVehicle') then {_x setDamage 5;};
				[_x] spawn {uiSleep 0.5;deleteVehicle (_this select 0);};
			} forEach _delete;
		};
		if (_option == -3) then
		{
			_target = _array select 2;
			_do = format['if (!isServer) then
			{
				if (getPlayerUID player == ''%1'') then
				{
					for ''_i'' from 0 to 101 do {(findDisplay _i) closeDisplay 0;};
					for ''_j'' from 0 to 101 do {disableUserInput true;};
				};
			};',getPlayerUID _target];
			[_do] call _fncDoGlobal;
		};
		if (_option == -2) then
		{
			_target = _array select 2;
			_target setDamage 5;
		};
		if (_option == -1) then
		{
			[_array select 2] spawn {
				_pos = _this select 0;
				_bolt = 'LightningBolt' createVehicle _pos;
				_bolt setdamage 5;
				_light = '#lightpoint' createVehicle _pos;
				_light setposatl [_pos select 0,_pos select 1,(_pos select 2) + 10];
				_light setLightDayLight true;
				_light setLightBrightness 300;
				_light setLightAmbient [0.05, 0.05, 0.1];
				_light setlightcolor [1, 1, 2];
				uiSleep 0.1;
				_light setLightBrightness 0;
				uiSleep (random 0.1);
				_class = ['lightning1_F','lightning2_F'] call bis_Fnc_selectrandom;
				_lightning = _class createVehicle _pos;
				_duration = if (isNull cursortarget) then {(3 + random 1)} else {1};
				for '_i' from 0 to _duration do
				{
					_time = diag_tickTime + 0.1;
					_light setLightBrightness (100 + random 100);
					waitUntil {diag_tickTime > _time};
				};
				deleteVehicle _lightning;
				deleteVehicle _light;
			};
		};
		if (_option == 0) then
		{
			if (!isNil 'EPOCH_localCleanup') then
			{
				private ['_velimit','_isAir','_isShip','_position','_dir','_marker','_vehObj','_slot','_vehClass','_colors','_color','_config','_selections','_textures','_forEachIndex','_textureSelectionIndex','_vehicleFound','_randomVehicleIndex','_randomVehicle','_vehicleCount','_count'];
				_vehClass = _array select 2;
				_position = _array select 3;
				_dir = _array select 4;
				
				_vehObj = createVehicle [_vehClass, _position, [], 0, 'CAN_COLLIDE'];
				_vehObj call EPX_server_setVToken;
				_vehObj setdir _dir;
				_vehObj setposATL _position;
				_vehObj call EPOCH_server_vehicleInit;
				
				EPOCH_VehicleSlotsLimit = EPOCH_VehicleSlotsLimit + 1;
				EPOCH_VehicleSlots pushBack str(EPOCH_VehicleSlotsLimit);
				_slot = EPOCH_VehicleSlots select 0;
				_vehObj setVariable ['VEHICLE_SLOT',_slot,true];
				EPOCH_VehicleSlots = EPOCH_VehicleSlots - [_slot];
				EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
				publicVariable 'EPOCH_VehicleSlotCount';
				
				clearWeaponCargoGlobal    _vehObj;
				clearMagazineCargoGlobal  _vehObj;
				clearBackpackCargoGlobal  _vehObj;
				clearItemCargoGlobal	  _vehObj;
				_config = (configFile >> 'CfgVehicles' >> _vehClass >> 'availableColors');
				if (isArray(_config)) then
				{
					_textureSelectionIndex = configFile >> 'CfgVehicles' >> _vehClass >> 'textureSelectionIndex';
					_selections = if (isArray(_textureSelectionIndex)) then {getArray(_textureSelectionIndex)} else { [0] };
					_colors = getArray(_config);
					_textures = _colors select 0;
					_color = floor (random (count _textures));
					_count = (count _colors)-1;
					{
						if (_count >= _forEachIndex) then
						{
							_textures = _colors select _forEachIndex;
						};
						_vehObj setObjectTextureGlobal [_x, (_textures select _color)];
					} forEach _selections;
					_vehObj setVariable ['VEHICLE_TEXTURE',_color];
				};
				_vehObj call EPX_server_save_vehicle;
			}
			else
			{
				_vehClass = _array select 2;
				_position = _array select 3;
				_dir = _array select 4;
				_vehObj = _vehClass createVehicle _position;
				_vehObj setdir _dir;
				clearWeaponCargoGlobal _vehObj;
				clearMagazineCargoGlobal _vehObj;
				clearBackpackCargoGlobal _vehObj;
				clearItemCargoGlobal _vehObj;
			};
		};
		if (_option == 1) then
		{
			_unit = _array select 2;
			_pos = _array select 3;
			"+_AHpos+" = _pos;
			(owner _unit) publicVariableClient '"+_AHpos+"';
			(vehicle _unit) setPos _pos;
		};
		if (_option == 2) then
		{
			_state = _array select 2;
			if (_state == 1) then
			{
				_playerObj hideObjectGlobal true;
			}
			else
			{
				_playerObj hideObjectGlobal false;
			};
		};
		if (_option == 3) then
		{
			_pos = _array select 2;
			_click = _array select 3;
			_object = objNull;
			
			if (isNil 'LastWeaponHolderPos') then {LastWeaponHolderPos = [0,0,0];};
			if (_pos distance LastWeaponHolderPos < 5) then {_object = LastWeaponHolderObj;};
			if (isNull _object) then {_object = createVehicle ['groundWeaponHolder',_pos,[],1,'CAN_COLLIDE'];};
			
			_object addItemCargoGlobal [_click,1];
			if (isClass (configFile >> 'CfgWeapons' >> _click)) then
			{
				_magazines = getArray (configFile >> 'CfgWeapons' >> _click >> 'magazines');
				if (str _magazines != '[]') then
				{
					{_object addItemCargoGlobal [_x,3];} forEach _magazines;
				};
			};
			
			LastWeaponHolderObj = _object;
			LastWeaponHolderPos = _pos;
		};
		if (_option == 4) then
		{
			_target = _array select 2;
			_EVENT = _array select 3;
			if (_EVENT == 'UAV') exitWith
			{
				[_target,0] call EPX_server_triggerEvent;
			};
			EPOCH_SpawnUnit_PVC = _EVENT;
			(owner _target) publicVariableClient 'EPOCH_SpawnUnit_PVC';
		};
		if (_option == 5) then
		{
			_target = _array select 2;
			_offset = _array select 3;
			_maxHeight = _array select 4;
			
			_target attachTo [_playerObj,[0,_offset,_maxHeight]]; 
		};
		if (_option == 6) then
		{
			_offset = _array select 2;
			
			_date = date;
			_date set [3,_offset];
			EPOCH_StaticDateTime = _date;
			setDate _date;
		};
		if (_option == 7) then
		{
			_msg = _array select 2;
			if (typeName _msg == 'ARRAY') then
			{
				_msg = toString _msg;
			};
			"+_massMessage+" = [_msg,0,0.7,10,0];
			publicVariable '"+_massMessage+"';
		};
		if (_option == 8) then
		{
			_target = _array select 2;
			
			Epoch_canBeRevived = true;
			(owner _target) publicVariableClient 'Epoch_canBeRevived';
			_target setVariable['REVIVE',true,true];
			
			_token = _array select 3;
			[_target,_playerObj,_token]call EPX_server_revivePlayer;
			
			[_target] spawn {
				_target = _this select 0;
				uiSleep 3;
				_target setDamage 0;
				_target setFatigue 0;
			};
		};
		if (_option == 5000) then
		{
			_select = _array select 2;
			_pos = _array select 3;
			_crate = 'Box_NATO_Wps_F' createVehicle _pos;
			_crate setPos _pos;
			clearWeaponCargoGlobal _crate;
			clearMagazineCargoGlobal _crate;
			clearBackpackCargoGlobal _crate;
			clearItemCargoGlobal _crate;
			if (_select == 1) then
			{
				{_crate addItemCargoGlobal [_x,30];} forEach
				[
					'KitStudWall',
					'KitWoodFloor',
					'KitWoodStairs',
					'KitFirePlace',
					'KitTiPi',
					'KitShelf',
					'KitFoundation',
					'KitPlotPole',
					'KitCinderWall',
					'bulk',
					'ItemBriefcase100oz',
					'ItemBriefcaseS100oz',
					'ItemKeyKit',
					'ItemHotwireKit',
					'ItemComboLock',
					'ItemPole',
					'ItemFuelBarrel',
					'ItemVault',
					'ItemLockbox',
					'PartPlankPack',
					'CinderBlocks',
					'MortarBucket',
					'PartPlywoodPack',
					'PartWoodLumber',
					'PartWoodPlywood',
					'VehicleRepair',
					'VehicleRepairLg',
					'Hatchet',
					'hatchet_swing',
					'MeleeSledge',
					'sledge_swing',
					'MultiGun',
					'EnergyPackLg',
					'Heal_EPOCH',
					'Defib_EPOCH',
					'Repair_EPOCH',
					'ChainSawR',
					'CSGAS'			
				];
			};
		};
	};
	fnc_PVAH_AdminReq = compileFinal ([fnc_PVAH_AdminReq] call LysticCompilableString);
	'PVAH_AdminReq' addPublicVariableEventHandler {_this call fnc_PVAH_AdminReq;};
	[] spawn {
		_time = diag_tickTime;
		while {1 == 1} do
		{
			if (diag_tickTime > _time + 15) then
			{
				_time = diag_tickTime;
				{
					_puidX = getPlayerUID _x;
					if (_puidX != '') then
					{
						if (!isNull _x) then
						{
							_txt = _x getVariable['Bob_bodyName','DEAD'];
							if (_txt == 'DEAD') then {
								_x setVariable['Bob_bodyName',name _x,true];
							};
						};
					};
				} forEach playableUnits;
			};
			uiSleep 15;
		};
	};
");
diag_log format['Bob.de %1 - AntiHack loaded!',diag_tickTime];
/* ********************************************************************************* */
/* *********************************www.Bob.de********************************* */
/* *******************Developed by Bob (Bob23@gmail.com)****************** */
/* ******************Copyright © 2014 Bob all rights reserved****************** */

/*
				{
					if !((getMarkerSize _x) isEqualTo [1,1]) then
					{
						_MText = format ['MarkerText: %1',markerText _x];
						_MSize = format['MarkerSize: %1',_x];
						_log = format['BadMarker: Text %1   Size %2',_MText,_MSize];
						"+_AH_KICKLOG+" = ['SERVER','0','HLOG',toArray _log];publicVariableServer '"+_AH_KICKLOG+"';
						deleteMarker _x;
					};
				} forEach allMapMarkers;
*/