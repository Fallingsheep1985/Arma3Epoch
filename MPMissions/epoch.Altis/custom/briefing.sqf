/*

This was pulled from Darkside Altis Life Server by Brun and Modified for [Z] EPOCH, 20141217
Credits to for controls to http://epochmod.gamepedia.com/A3Epoch:Arma_3_Epoch#Building_.26_Crafting
*/

if (!isDedicated) then {

waitUntil { alive player && time > 0 && !isnull (finddisplay 46)};	

sleep 5;

player createDiarySubject ["serverrules","General Rules"];


		player createDiaryRecord ["serverrules",
		[
			"General Rules", 
				"
<br/><font color = '#E4E00C'>If you break the rules you will not be kicked and/or banned.</font color><br/>

<font color = '#E4E00C'>----------------------------------------------------------------------------------------</font color><br/>
<font color = '#E4E00C'>1. </font color>No Spawn Killing.<br/>
<font color = '#E4E00C'>2. </font color>No Hacking/Glitching.<br/>
<font color = '#E4E00C'>3. </font color>No Duping.<br/>
<font color = '#E4E00C'>4. </font color>No Base Griefing includes helilifting out of buildings.<br/>
<font color = '#E4E00C'>5. </font color>No Excessive Swearing.<br/>
<font color = '#E4E00C'>6. </font color>No Talking In Radio Chat.<br/>
<font color = '#E4E00C'>7. </font color>No Racism.<br/>
<font color = '#E4E00C'>8. </font color>EpochMod is currently Alpha, as such we do not compensate vehicles etc due to game glitches!<br/>
				"
		]
	];

};