//The script://

 
    //Script created by Bakler2
  
 if ("ItemScraps" in magazines player) then{
	if ("ToolKit" in magazines player) then{
		player removeMagazine "ItemScraps";
	
		_spawn = "ebike_epoch";
		_posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];
		_saveVehicle call EPOCH_server_save_vehicle;
		_dirplr = getDir player;
		_spwnveh = _spawn createVehicle (_posplr);
		_spwnveh setVariable ["Sarge",1,true];
		_vehObj call EPOCH_server_save_vehicle;
		
		_vehObj call EPOCH_server_setVToken;
		
 
		player playActionNow "Medic";
		 
		sleep 3;
		cutText [format["You built a Bike."], "PLAIN DOWN"];
	} else {
		SystemChat "You need a Toolkit to build a bike Bike."; 
	}; 
} else {
	SystemChat "You need one Scrap to build a Bike."; 
};