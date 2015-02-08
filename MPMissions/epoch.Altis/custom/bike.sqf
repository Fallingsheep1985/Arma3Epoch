//The script://

 
    //Script created by Bakler2
	//edited by falling sheep to makechopper
  
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
		cutText [format["You built a EBike."], "PLAIN DOWN"];
	} else {
		SystemChat "You need a Toolkit to build a EBike."; 
	}; 
} else {
	SystemChat "You need Scrap to build a EBike."; 
};