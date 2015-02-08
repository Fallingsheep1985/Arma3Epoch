//The script://

 
    //Script created by Bakler2
 
cutText [format["You created the Ebike"], "PLAIN DOWN"];
 
player playActionNow "Medic";
 
sleep 3;
 
    if ("ItemCorrugated" in magazines player) then{
player removeMagazine "ItemCorrugated";
 
_spawn = "ebike_epoch";
    _posplr = [((getPos player) select 0) + 2, ((getPos player) select 1) + 2, 0];
_saveVehicle call EPOCH_server_save_vehicle;
    _dirplr = getDir player;
    _spwnveh = _spawn createVehicle (_posplr);
    _spwnveh setVariable ["Sarge",1,true];
_vehObj call EPOCH_server_save_vehicle;
 
    _vehObj call EPOCH_server_setVToken;
    
sleep 3;
 
cutText [format["You've used your Corrugated to build a Ebike."], "PLAIN DOWN"];
} else {
SystemChat "You need one Corrugated to Ebike"; 
};