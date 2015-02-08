while {true} do
{
  waitUntil {alive vehicle player};
 [] execVM "adminmenu\activate.sqf";


  waitUntil {!alive player};
};