//The script://

 
    //Script created by Bakler2
	//edited by falling sheep to makechopper
  
 if (("ItemScraps" in magazines player)&&("jerrycan_epoch" in magazines player)&&("CircuitParts" in magazines player)&&("VehicleRepair" in magazines player)) then {
		if ("ToolKit" in magazines player) then{
			player removeMagazine "ItemScraps";
			player removeMagazine "CircuitParts";
			player removeMagazine "VehicleRepair";
			player removeMagazine "jerrycan_epoch";
		
			_spawn = "B_Heli_Light_01_EPOCH";
			_posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];
			_saveVehicle call EPOCH_server_save_vehicle;
			_dirplr = getDir player;
			_spwnveh = _spawn createVehicle (_posplr);
			_spwnveh setVariable ["Sarge",1,true];
			_vehObj call EPOCH_server_save_vehicle;
			
			_vehObj call EPOCH_server_setVToken;
			
	 
			player playActionNow "Medic";
			 
			sleep 3;
			cutText [format["You built a Chopper."], "PLAIN DOWN"];
	} else {
		SystemChat "You need a Toolkit to build a Chopper."; 
	};	
} else {
	SystemChat "You need Scrap,CircutParts,Jerrycan and Vehicle Repair items to build a Chopper."; 
};