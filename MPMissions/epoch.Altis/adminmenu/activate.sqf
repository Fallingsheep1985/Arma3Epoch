waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in [ADMIN_LIST]) then {
;
act = player addaction [("<t color=""#0074E8"">" + ("Admin Menu") +"</t>"),"adminmenu\tools.sqf","",5,false,true,"",""];

};
