//The script://

 
    //Script created by Bakler2
	//edited by falling sheep to makechopper
  
 if ("ItemScraps" in magazines player) then{
	if ("ToolKit" in magazines player) then{
		player removeMagazine "ItemScraps";
		if (!isNil 'EPOCH_server_setVToken') then {_vehObj call EPOCH_server_setVToken;};
		if (!isNil 'EPX_server_setVToken') then {_vehObj call EPX_server_setVToken; }; 
		
		_vehClass = "ebike_epoch";
		_position = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];
		_saveVehicle call EPOCH_server_save_vehicle;
		_dir = getDir player;
		_vehObj = _vehClass createVehicle (_position);
		 if (!isNil 'EPX_server_vehicleInit') then {_vehObj call EPX_server_vehicleInit}; 
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
		clearItemCargoGlobal      _vehObj; 
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
		if (!isNil 'EPOCH_server_save_vehicle') then {_vehObj call EPOCH_server_save_vehicle}; 
		if (!isNil 'EPX_server_save_vehicle') then {_vehObj call EPX_server_save_vehicle;};
		
		
 
		player playActionNow "Medic";
		 
		sleep 3;
		cutText [format["You built a EBike."], "PLAIN DOWN"];
	} else {
		SystemChat "You need a Toolkit to build a EBike."; 
	}; 
} else {
	SystemChat "You need Scrap to build a EBike."; 
};