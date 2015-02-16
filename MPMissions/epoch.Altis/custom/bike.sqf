
	//Created by - Fallingsheep
	//Special thanks - infistar
  
  //check if player has scrap
 if ("ItemScraps" in magazines player) then{
	//check if player has toolkit
	if ("ToolKit" in magazines player) then{
		player playActionNow "Medic"; // play build animation
		sleep 3; //wait 3 seconds
		//remove scrap from inventory
		player removeMagazine "ItemScraps";
		//set vehcile tokens
		if (!isNil 'EPOCH_server_setVToken') then {_vehObj call EPOCH_server_setVToken;};
		if (!isNil 'EPX_server_setVToken') then {_vehObj call EPX_server_setVToken; }; 
		
		_vehClass = "ebike_epoch"; // vehicle class to spawn
		_position = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0]; // get player pos for spawning
		_dir = getDir player;
		//spawn the vehicle at players postion
		_vehObj = _vehClass createVehicle (_position);
		//set vehicle slots
		 if (!isNil 'EPX_server_vehicleInit') then {_vehObj call EPX_server_vehicleInit}; 
        EPOCH_VehicleSlotsLimit = EPOCH_VehicleSlotsLimit + 1; 
        EPOCH_VehicleSlots pushBack str(EPOCH_VehicleSlotsLimit); 
        _slot = EPOCH_VehicleSlots select 0; 
        _vehObj setVariable ['VEHICLE_SLOT',_slot,true]; 
        EPOCH_VehicleSlots = EPOCH_VehicleSlots - [_slot]; 
        EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots; 
        publicVariable 'EPOCH_VehicleSlotCount';
		//remove any items from vehicle
		clearWeaponCargoGlobal    _vehObj; 
		clearMagazineCargoGlobal  _vehObj; 
		clearBackpackCargoGlobal  _vehObj; 
		clearItemCargoGlobal      _vehObj;
		//randomize colour if more than 1 available
		_config = (configFile >> 'CfgVehicles' >> _vehClass >> 'availableColors'); 
		if (isArray(_config)) then{_textureSelectionIndex = configFile >> 'CfgVehicles' >> _vehClass >> 'textureSelectionIndex'; 
			_selections = if (isArray(_textureSelectionIndex)) then {getArray(_textureSelectionIndex)} else { [0] }; 
			_colors = getArray(_config); 
			_textures = _colors select 0; 
			_color = floor (random (count _textures)); 
			_count = (count _colors)-1; 
			{
				if (_count >= _forEachIndex) then{_textures = _colors select _forEachIndex;}; 
				_vehObj setObjectTextureGlobal [_x, (_textures select _color)]; 
			} forEach _selections; 
			_vehObj setVariable ['VEHICLE_TEXTURE',_color]; 
		};
		//Save vehicle		
		if (!isNil 'EPOCH_server_save_vehicle') then {_vehObj call EPOCH_server_save_vehicle}; 
		if (!isNil 'EPX_server_save_vehicle') then {_vehObj call EPX_server_save_vehicle;};

		cutText [format["You built a EBike."], "PLAIN DOWN"];
	} else {
		SystemChat "You need a Toolkit to build a EBike."; 
	}; 
} else {
	SystemChat "You need Scrap to build a EBike."; 
};