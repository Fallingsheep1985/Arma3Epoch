/*

Unsure of original author, but edited by Huntah to move the Camera from a random location, fly across the screen and down to the player
Pulled from Darkside Altis Life Server by Brun and customized 20141217
*/
 
private ["_xCord","_yCord","_camera","_welcomeMessage","_camDistance"];

if (!isDedicated) then {
waitUntil { alive player && time > 0 && !isnull (finddisplay 46) && (player distance (getMarkerPos "respawn_west") >= 100) };

_camDistance = 150;
_xCord = random 5000;if(_xCord < 2000) then {_xCord = 2000;};
_yCord = random 5000;if(_yCord < 2000) then {_yCord = 2000;};

showCinemaBorder true;
camUseNVG false;

playSound "introSound";

_camera = "camera" camCreate [(position player select 0)+_xCord, (position player select 1)+_yCord,(position player select 2)+(_camDistance*2)];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget [(position player select 0), (position player select 1)+2,(position player select 2)+(_camDistance/2)];
_camera camSetRelPos [0,0,(_camDistance)];
_camera camCommit 6;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,(_camDistance)];//Did say (/4)
_camera camCommit 2;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit 1;
waitUntil {camCommitted _camera};

vehicle player switchCamera "EXTERNAL";
_camera cameraEffect ["terminate","back"];
camDestroy _camera;

};


