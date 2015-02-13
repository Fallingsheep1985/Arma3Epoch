while {true} do
{
  waitUntil {alive vehicle player};
 [] execVM "admintools\run.sqf";


  waitUntil {!alive player};
};