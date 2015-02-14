/*

This was pulled from Darkside Altis Life Server by Brun and Modified for [Z] EPOCH, 20141217
Credits to for controls to http://epochmod.gamepedia.com/A3Epoch:Arma_3_Epoch#Building_.26_Crafting
*/

if (!isDedicated) then {

waitUntil { alive player && time > 0 && !isnull (finddisplay 46)};	

sleep 5;

player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["donations","Donation Info"];
player createDiarySubject ["controls","Controls"];

	player createDiaryRecord ["donations",
		[
			"How To?", 
				"
<br/><font color = '#E4E00C'>How to donate?</font color><br/><br/>
				
We do Accept Donations<br/>
See the Website for Details<br/>
All Donations Received help to keep the Servers and Teamspeak Online.<br/><br/>
Zenithovmen.com
<br/>43.245.163.15:10099

				"
		]
	];

		player createDiaryRecord ["serverrules",
		[
			"General Rules", 
				"
<br/><font color = '#E4E00C'>If you break the rules you will not be kicked, but banned.</font color><br/>

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
	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"Controls",
				"
	<br/><font color = '#E4E00C'>General Controls	</font color><br/><br/>
	<font color = '#E4E00C'>I: </font color>Main Interaction key which is used for picking up items/money, interacting with cars, interact with traders and looting trash.<br/><br/>
	<font color = '#E4E00C'>Mouse Wheel: </font color>Shows option to Search items<br/>
	<font color = '#E4E00C'>~: </font color>Shows Debug Menu<br/>
	<font color = '#E4E00C'>Ctrl + T: </font color>Opens Player Trade window<br/><br/><br/>
	
	<font color = '#0CE413'>----------------------------------------------------------------------------------------</font color><br/>			
	<font color = '#0CE413'>Building Controls	</font color><br/>									
	<font color = '#0CE413'>----------------------------------------------------------------------------------------</font color><br/>									
	<font color = '#0CE413'>Special Instructions</font color><br/><br/>
	Before a player can start building, they must first gain some energy. This can be done in three ways...<br/><br/>

	Vehicles - While in any vehicle with the engine running, the player will gain approximately 5 energy every 10 seconds.<br/><br/>
	Solar/Wind Power - If the player is within 75 meters of a solar farm tower or wind turbine they will gain approximately 5 energy every 10 seconds.<br/><br/>
	Energy Packs - By double clicking an energy pack in your inventory, there is an option to use. This will give the player energy instantly, but will use up the energy pack (small energy pack = 100 energy. large energy pack = 1000 energy).<br/>
	<font color = '#0CE413'>----------------------------------------------------------------------------------------</font color><br/><br/>
				
	<font color = '#0CE413'>1: </font color>Toggle Fixed snap building mode and place object<br/>
	<font color = '#0CE413'>2: </font color>Toggle Free building mode and place object<br/>
	<font color = '#0CE413'>3: </font color>Snap type<br/>
	<font color = '#0CE413'>4: </font color>Build object (Used for building Storage Devices Tipi and Shelf Kit)<br/>
	<font color = '#0CE413'>Space: </font color>Grab objects<br/>
	<font color = '#0CE413'>Q: </font color>Center object in front of players view<br/>
	<font color = '#0CE413'>E: </font color>Free Rotate<br/>
	<font color = '#0CE413'>Page Up: </font color>Lift object<br/>
	<font color = '#0CE413'>Page Down: </font color>Lower object<br/>	
	<font color = '#0CE413'>Home: </font color>Push object away from you<br/>	
	<font color = '#0CE413'>End: </font color>Move object towards you<br/>			
	<font color = '#0CE413'>Ctrl + I: </font color>Upgrade an existing structure<br/><br/><br/><br/>	"	
	
	
		]
	];	

};