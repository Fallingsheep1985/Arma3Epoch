/*
Author: Fallingsheep
Credits: Osef, [piX] for there status bar script
Description: Shows a debug monitor similar to dayZ mod from arma2
*/

diag_log format ["DEBUG MONITOR: Loading...", player];
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
[] spawn {
sleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do{
			sleep 1;
			_counter = _counter - 1;
			_time = (round(180-(serverTime)/60));  //edit the '240' (60*4=240) to change the countdown timer if your server restarts are shorter or longer than 4 hour intervals
			_hours = (floor(_time/60));
			_minutes = (_time - (_hours * 60));
			
			switch(_minutes) do
		{
			case 9: {_minutes = "09"};
			case 8: {_minutes = "08"};
			case 7: {_minutes = "07"};
			case 6: {_minutes = "06"};
			case 5: {_minutes = "05"};
			case 4: {_minutes = "04"};
			case 3: {_minutes = "03"};
			case 2: {_minutes = "02"};
			case 1: {_minutes = "01"};
			case 0: {_minutes = "00"};
		};
	};
	while {alive _this} do{
	
		_pic = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'picture'));
		if (player == vehicle player) then {
			_pic = (getText (configFile >> 'CfgWeapons' >> (currentWeapon player) >> 'picture'));
		}else{
		_pic = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'picture'));
		};
					
		_txt = '';
		_txt = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'displayName'));
		
	
		hintSilent parseText format["
		<t color='#ffff00' font='Zeppelin33' align='Center' >%10</t><br/>
		<img size='4.75' image='%11'/><br/>
		<t color='#ffff00' font='Zeppelin33' align='left'>Player Online:</t> %3 <br/>
		<t color='#CC0000' font='Zeppelin33' align='left'>Health:</t> %1 <br/>
				<t color='#ffff00' font='Zeppelin33' align='left'>Thirst:</t> %5 <br/>
		<t color='#ffff00' font='Zeppelin33' align='left'>Hunger:</t> %4 <br/>
		<t color='#ffff00' font='Zeppelin33' align='left'>Krypto:</t> %2 <br/>
		<t color='#ffff00' font='Zeppelin33' align='left'>Speed:</t> %11 <br/>
		<t color='#ffff00' font='Zeppelin33' align='left'>Altitude:</t> %12 <br/>
		<t color='#ffff00' font='Zeppelin33' align='left'>FPS:</t> %6 <br/>
		<t color='#ffff00' font='Zeppelin33' align='left'>RESTART IN:</t> %8:%9 <br/>
		",
		damage player, //%1
		EPOCH_playerCrypto,//%2
		count playableUnits,//%3
		EPOCH_playerHunger, //%4
		EPOCH_playerThirst,//%5
		round diag_fps,//%6
		_hours, //%7
		_minutes,//%8
		_txt,//%9
		_pic,//%10
		round(speed (vehicle player)),//%11
		round(getPos player select 2) //%12
		];
		sleep 0.01;
	};
};
diag_log format ["DEBUG MONITOR: Loaded.", player];

