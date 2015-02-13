/*
	A3EAI Configuration File
	
	Description: Contains all configurable settings of A3EAI. Contains settings for debugging, customization of AI units, spawning, and loot.
	

*/

diag_log "[A3EAI] Reading A3EAI configuration file.";

/*	A3EAI Settings
--------------------------------------------------------------------------------------------------------------------*/	

//Enable or disable event logging to arma2oaserver.rpt. Debug level setting. 0: No debug output, 1: Basic Debug output, 2: Detailed Debug output. (Default: 0)
//Debug output may help finding additional information about A3EAI's background behavior. This output is helpful when asking for help regarding bugs or unexpected behaviors.
A3EAI_debugLevel = 0;

//Frequency of server monitor update to RPT log in seconds. The monitor periodically reports number of max/current AI units and dynamically spawned triggers into RPT log. (Default: 300, 0 = Disable reporting)										
A3EAI_monitorRate = 300;

//Enable or disable verification and error-correction of classname tables used by A3EAI. If invalid entries are found, they are removed and logged into the RPT log.
//If disabled, any invalid classnames will not be removed and clients may crash if AI bodies with invalid items are looted. Only disable if a previous scan shows no invalid classnames (Default: true).										
A3EAI_verifyClassnames = true;

//Enables checking of all A3EAI config settings. (Default: true)
A3EAI_verifySettings = true;

//Minimum seconds to pass until each dead AI body or destroyed vehicle can be cleaned up by A3EAI's task scheduler. A3EAI will not clean up a body/vehicle if there is a player close by (Default: 900).									
A3EAI_cleanupDelay = 900;									

//Enabled: A3EAI will load custom spawn/blacklist definitions file on startup (A3EAI_custom_defs.sqf) (Default: false)
A3EAI_loadCustomFile = false;


/*	Dynamic Classname Settings

	If a setting is disabled, A3EAI will use the corresponding classname table further below. See "AI skin, weapon, loot, and equipment settings" section.
--------------------------------------------------------------------------------------------------------------------*/	

//Enable to generate AI uniform types from Epoch loot tables (Default: true)
A3EAI_dynamicUniformList = true;

//Enable to generate AI skin types from Epoch loot tables (Default: true)
A3EAI_dynamicWeaponList = true;

//Enable to generate AI backpack types from Epoch loot tables (Default: true)
A3EAI_dynamicBackpackList = true;

//Enable to generate AI backpack types from Epoch loot tables (Default: true)
A3EAI_dynamicVestList = true;

//Enable to generate AI headgear types from Epoch loot tables (Default: true)
A3EAI_dynamicHeadgearList = true;

//Enable to generate AI food types from Epoch loot tables (Default: true)
A3EAI_dynamicFoodList = true;

//Enable to generate AI generic loot types from Epoch loot tables (Default: true)
A3EAI_dynamicLootList = true;

//Enable to generate AI generic loot (large) types from Epoch loot tables (Default: true)
A3EAI_dynamicLootLargeList = true;

//Classnames of weapons to ignore from Epoch loot tables
A3EAI_dynamicWeaponBlacklist = [];


/*	Shared AI Unit Settings. These settings affect all AI spawned unless noted otherwise.
--------------------------------------------------------------------------------------------------------------------*/		

//(For auto-generated spawns only) minAI: Minimum number of units. addAI: maximum number of additional units. unitLevel: Unit level (0-3)
A3EAI_minAI_capitalCity = 2; //2
A3EAI_addAI_capitalCity = 1; //1
A3EAI_unitLevel_capitalCity = 1; //1

//(For auto-generated spawns only) minAI: Minimum number of units. addAI: maximum number of additional units. unitLevel: Unit level (0-3)
A3EAI_minAI_city = 1; //1
A3EAI_addAI_city = 2; //2
A3EAI_unitLevel_city = 1; //1

//(For auto-generated spawns only) minAI: Minimum number of units. addAI: maximum number of additional units. unitLevel: Unit level (0-3)
A3EAI_minAI_village = 1; //1
A3EAI_addAI_village = 1; //1
A3EAI_unitLevel_village = 0; //0

//(For auto-generated spawns only) minAI: Minimum number of units. addAI: maximum number of additional units. unitLevel: Unit level (0-3)
A3EAI_minAI_remoteArea = 1; //1
A3EAI_addAI_remoteArea = 1; //1
A3EAI_unitLevel_remoteArea = 2; //2

//(For dynamic and random spawns only) Defines amount of time to wait in seconds until cleaning up temporary blacklist area after dynamic/random spawn is deactivated (Default: 600)
A3EAI_tempBlacklistTime = 600;

//If enabled, AI group will attempt to track down player responsible for killing a group member. (Default: true)
A3EAI_findKiller = true;	

//If normal probability check for spawning NVGs fails, then give AI temporary NVGs during night hours. Temporary NVGs are unlootable and will be removed at death (Default: false).									
A3EAI_tempNVGs = false;	

//List of launcher-type weapons that AI can use.
A3EAI_launcherTypes = [];	

//List of AI unit levels that can access launcher weapons. (Acceptable value range: 0-3)
A3EAI_launcherLevels = [];	

//Maximum number of launcher weapons allowed per group (Default: 1)
A3EAI_launchersPerGroup = 1;


/*	A3EAI Client Addon features. These features require the A3EAI client addon to be installed in order to work.
--------------------------------------------------------------------------------------------------------------------*/	

//Enable or disable radio message receiving. Players with radios (Radio Quartz) will be able to intercept some AI communications. (Default: false)
A3EAI_radioMsgs = false;

//Enable or disable AI death messages. Messages will be sent only to player responsible for killing the unit. Messages will be sent in System chat in the format "(Unit name) was killed." (Default: false)
A3EAI_deathMessages = false;	


/*	Static AI Spawning Settings
--------------------------------------------------------------------------------------------------------------------*/	

//Enable or disable static AI spawns. If enabled, AI spawn points will be generated in cities, towns, and other named areas.
//Enabled: A3EAI automatically generates static spawns at named locations on map. Disabled: No static spawns will be generated. (Default: true)
A3EAI_autoGenerateStatic = true;

//Probability to increase unit level by 1 upon respawning an AI group.
//Format: Probability to increase for [towns,cities,remote areas].
A3EAI_promoteChances = [0.20,0.10,0.10];

//Set minimum and maximum wait time in seconds to respawn an AI group after all units have been killed. Applies to both static AI and custom spawned AI (Default: Min 300, Max 600).									
A3EAI_respawnTimeMin = 300;
A3EAI_respawnTimeMax = 600;

//Time to allow spawned AI units to exist in seconds before being despawned when no players are present in a trigger area. Applies to both static AI and custom spawned AI (Default: 120)										
A3EAI_despawnWait = 120;										

//Spawn probabilities
A3EAI_spawnChance0 = 0.40;	//Spawn chance for level 0 units - typically spawn in villages (Default: 0.40)
A3EAI_spawnChance1 = 0.60;	//Spawn chance for level 1 units - typically spawn in cities and capital cities (Default: 0.60)
A3EAI_spawnChance2 = 0.80;	//Spawn chance for level 2 units - typically spawn in remote areas (ie: factories, military bases) (Default: 0.80)
A3EAI_spawnChance3 = 0.90;	//Spawn chance for level 3 units (Default: 0.90)

//Respawn limits. Set to -1 for unlimited respawns. (Default: -1 for each).
A3EAI_respawnLimit0 = -1; 	//Respawn limit for level 0 units - AI found in villages (Default: -1)
A3EAI_respawnLimit1 = -1; 	//Respawn limit for level 1 units - AI found in cities and capital cities (Default: -1)
A3EAI_respawnLimit2 = -1; 	//Respawn limit for level 2 units - AI found in remote areas (ie: factories, military bases) (Default: -1)
A3EAI_respawnLimit3 = -1;	//Respawn limit for level 3 units (Default: -1)


/*	Dynamic AI Spawning Settings. Probabilities should add up to 1.00	
--------------------------------------------------------------------------------------------------------------------*/		

//Enable or disable dynamic AI spawns. If enabled, AI spawn locations will be generated for randomly selected players at randomized intervals (Default: true)									
A3EAI_dynAISpawns = true;

//Chance for spawn for each selected player (Default: 0.50)
A3EAI_dynSpawnChance = 0.50;

//Upper limit of dynamic spawns on map at once (Default: 15)
A3EAI_dynMaxSpawns = 15;

//Minimum time (in seconds) that must pass between dynamic spawns for each player (Default: 900)
A3EAI_dynCooldownTime = 900;

//Players offline for this amount of time (seconds) will have their last spawn timestamp reset (Default: 3600)
A3EAI_dynResetLastSpawn = 3600;

//Probability for dynamic AI to actively hunt a targeted player. If probability check fails, dynamic AI will patrol the area instead of hunting (Default: 0.60)
A3EAI_huntingChance = 0.60;

//Probability to send first available AI helicopter to reinforce dynamic AI group. No effect if A3EAI_maxHeliPatrols is set to zero. (Default: 0.30)
A3EAI_heliReinforceChance = 0.30;

//Time to wait before despawning all AI units in dynamic spawn area when no players are present. (Default: 120)
A3EAI_dynDespawnWait = 120;


/*	Random AI Spawning Settings (Feature in development)
--------------------------------------------------------------------------------------------------------------------*/		

//Maximum number of placed random spawns on map (Default: 15)
A3EAI_maxRandomSpawns = 15;

//Time to wait before despawning all AI units in random spawn area when no players are present. (Default: 120)
A3EAI_randDespawnWait = 120;

//Minimum distance between a random spawn location and other random spawns. (Default: 0)
A3EAI_minRandSpawnDist = 0;


/*	AI Air vehicle patrol settings. These AI vehicles will randomly travel between different cities and towns.
--------------------------------------------------------------------------------------------------------------------*/		

//Global maximum number of active AI air vehicle patrols. Set at 0 to disable (Default: 0).							
A3EAI_maxHeliPatrols = 0;

//Probability of spawning Level 0/1/2/3 AI air vehicle patrol spawns. Probabilities should add up to 1.00		
A3EAI_levelChancesAir = [0.00,0.50,0.35,0.15];	

//Set minimum and maximum wait time in seconds to respawn an AI vehicle patrol after vehicle is destroyed or disabled. (Default: Min 600, Max 900).
A3EAI_respawnTMinA = 600;
A3EAI_respawnTMaxA = 900;

//Classnames of air vehicle types to use, with the maximum amount of each type to spawn.
A3EAI_heliList = [
	["B_Heli_Light_01_armed_F",5],
	["B_Heli_Transport_01_F",5],
	["B_Heli_Attack_01_F",2]
];

//Maximum number of gunner units per air vehicle. Limited by actual number of available gunner positions. (Default: 2)
A3EAI_heliGunnerUnits = 2;

//If enabled, A3EAI will remove all missile/rocket-type weaponry from spawned air vehicles. Affects both map-wide patrols and custom-spawned air vehicles. (Default: true)
A3EAI_removeMissileWeapons = true;


/*AI Land vehicle patrol settings. These AI vehicles will randomly travel between different cities and towns.
--------------------------------------------------------------------------------------------------------------------*/	

//Global maximum number of active AI land vehicle patrols. Set at 0 to disable (Default: 0).	
A3EAI_maxLandPatrols = 0;

//Probability of spawning Level 0/1/2/3 AI land vehicle spawns. Probabilities should add up to 1.00		
A3EAI_levelChancesLand = [0.00,0.50,0.35,0.15];	

//Set minimum and maximum wait time in seconds to respawn an AI vehicle patrol after vehicle is destroyed or disabled. (Default: Min 600, Max 900).
A3EAI_respawnTMinL = 600;
A3EAI_respawnTMaxL = 900;

//Classnames of land vehicle types to use, with the maximum amount of each type to spawn.
A3EAI_vehList = [
	["C_Van_01_transport_EPOCH",5],
	["C_Offroad_01_EPOCH",5],
	["C_Hatchback_02_EPOCH",5],
	["C_Hatchback_01_EPOCH",5],
	["B_Truck_01_transport_EPOCH",5],
	["B_Truck_01_mover_EPOCH",5],
	["B_Truck_01_covered_EPOCH",5],
	["B_Truck_01_box_EPOCH",5]
];

//Maximum number of gunner units per land vehicle. Limited by actual number of available gunner positions. (Default: 2)
A3EAI_vehGunnerUnits = 2;

//Maximum number of cargo units per land vehicle. Limited by actual number of available cargo positions. (Default: 3)
A3EAI_vehCargoUnits = 3;


/*	Shared AI Vehicle (Air & Land) Settings
--------------------------------------------------------------------------------------------------------------------*/

//Add name of location as displayed on Map prevent AI vehicle patrols from travelling to these locations. Consult CfgWorlds through Editor if needed (Example: ["Aggelochori","Panochori","Zaros"])
//Note: Vehicles may still pass through these areas but will not make stops unless enemies are encountered.
A3EAI_waypointBlacklist = [];


/*
	AI skill settings
	Skill Level: Description
	0: Low-level AI found in villages
	1: Medium-level AI found in cities and capital cities
	2: High-level AI found in remote areas such as factories and military bases
	3: Expert-level AI. AI with level 2 have a chance to be promoted to level 3 when respawning. Promotion probabilities defined by A3EAI_promoteChances.
	Hint: For all skill types, higher number = better skill. For skill sub-type explanation, see: https://community.bistudio.com/wiki/AI_Sub-skills
*/

//AI skill settings level 0 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.50
A3EAI_skill0 = [	
	["aimingAccuracy",0.10,0.15],
	["aimingShake",0.50,0.59],
	["aimingSpeed",0.50,0.59],
	["spotDistance",0.50,0.59],
	["spotTime",0.50,0.59],
	["courage",0.50,0.59],
	["reloadSpeed",0.50,0.59],
	["commanding",0.50,0.59],
	["general",0.50,0.59]
];

//AI skill settings level 1 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.60
A3EAI_skill1 = [	
	["aimingAccuracy",0.15,0.20],
	["aimingShake",0.60,0.69],
	["aimingSpeed",0.60,0.69],
	["spotDistance",0.60,0.69],
	["spotTime",0.60,0.69],
	["courage",0.60,0.69],
	["reloadSpeed",0.60,0.69],
	["commanding",0.60,0.69],
	["general",0.60,0.69]
];

//AI skill settings level 2 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.70
A3EAI_skill2 = [	
	["aimingAccuracy",0.20,0.25],
	["aimingShake",0.70,0.85],
	["aimingSpeed",0.70,0.85],
	["spotDistance",0.70,0.85],
	["spotTime",0.70,0.85],
	["courage",0.70,0.85],
	["reloadSpeed",0.70,0.85],
	["commanding",0.70,0.85],
	["general",0.70,0.85]
];

//AI skill settings level 3 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.80
A3EAI_skill3 = [	
	["aimingAccuracy",0.25,0.30],
	["aimingShake",0.85,0.95],
	["aimingSpeed",0.85,0.95],
	["spotDistance",0.85,0.95],
	["spotTime",0.85,0.95],
	["courage",0.85,0.95],
	["reloadSpeed",0.85,0.95],
	["commanding",0.85,0.95],
	["general",0.85,0.95]
];


/*AI weapon type probabilities
--------------------------------------------------------------------------------------------------------------------*/

//Probabilities to equip level 0-3 AI with each weapon type. Order: [pistols, rifles, machineguns, sniper rifles]. Probabilities must add up to 1.00.
A3EAI_useWeaponChance0 = [0.20,0.80,0.00,0.00];
A3EAI_useWeaponChance1 = [0.00,0.90,0.05,0.05];
A3EAI_useWeaponChance2 = [0.00,0.80,0.10,0.10];
A3EAI_useWeaponChance3 = [0.00,0.70,0.15,0.15];


/*AI Weapon attachment settings
--------------------------------------------------------------------------------------------------------------------*/

//Probability to select a random optics attachment (ie: scopes) for level 0-3 AI
A3EAI_opticsChance0 = 0.00;
A3EAI_opticsChance1 = 0.25;
A3EAI_opticsChance2 = 0.50;
A3EAI_opticsChance3 = 0.75;

//Probability to select a random pointer attachment (ie: flashlights) for level 0-3 AI
A3EAI_pointerChance0 = 0.00;
A3EAI_pointerChance1 = 0.25;
A3EAI_pointerChance2 = 0.50;
A3EAI_pointerChance3 = 0.75;

//Probability to select a random muzzle attachment (ie: suppressors) for level 0-3 AI
A3EAI_muzzleChance0 = 0.00;
A3EAI_muzzleChance1 = 0.25;
A3EAI_muzzleChance2 = 0.50;
A3EAI_muzzleChance3 = 0.75;


/*	AI loot quantity settings
--------------------------------------------------------------------------------------------------------------------*/

//Maximum amount of Krypto generated for level 0-3 AI. Actual amount will be randomized up to the specified amount.
A3EAI_kryptoAmount0 = 25; 	//Default for level 0 AI: 25
A3EAI_kryptoAmount1 = 50; 	//Default for level 1 AI: 50
A3EAI_kryptoAmount2 = 100; 	//Default for level 2 AI: 100
A3EAI_kryptoAmount3 = 200; 	//Default for level 3 AI: 200

//Maximum number of food loot items found on AI. (Default: 1)								
A3EAI_foodLootCount = 1;

//Maximum number of items to select from A3EAI_MiscLoot1 (generic loot) table. (Default: 1)											
A3EAI_miscLootCount1 = 1;						

//Maximum number of items to select from A3EAI_MiscLoot2 (large generic loot) table. (Default: 1)					
A3EAI_miscLootCount2 = 1;	


/*	AI loot probability settings. AI loot is pre-generated into a pool for each unit and randomly pulled to units as time passes.
--------------------------------------------------------------------------------------------------------------------*/

//Chance to add a single First Aid Kit to group loot pool per unit (Default: 0.20)
A3EAI_chanceFirstAidKit = 0.20;

//Chance to add each edible item to group loot pool per unit (Default: 0.40)								
A3EAI_chanceFoodLoot = 0.40;

//Chance to add each generic loot item to group loot pool per unit (Default: 0.40)									
A3EAI_chanceMiscLoot1 = 0.40;

//Chance to add each large generic loot item to group loot pool per unit (Default: 0.30)								
A3EAI_chanceMiscLoot2 = 0.30;

//Probability to successfully pull a random item from loot pool for level 0-3 AI. Influences the rate at which loot items are added to units.
A3EAI_lootPullChance0 = 0.30; //Default for level 0 AI: 0.30
A3EAI_lootPullChance1 = 0.40; //Default for level 1 AI: 0.40
A3EAI_lootPullChance2 = 0.50; //Default for level 2 AI: 0.50
A3EAI_lootPullChance3 = 0.60; //Default for level 3 AI: 0.60


/*
	AI skin, weapon, loot, and equipment settings

	Note: Some of the below tables may not be used by A3EAI if a dynamic classname setting is enabled. Check each section below for details.
*/


//AI uniform classnames. Note: A3EAI_uniformTypes will not be read if A3EAI_dynamicUniformList is enabled.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
A3EAI_uniformTypes = ["U_O_CombatUniform_ocamo", "U_O_GhillieSuit", "U_O_PilotCoveralls", "U_O_Wetsuit", "U_OG_Guerilla1_1", "U_OG_Guerilla2_1", "U_OG_Guerilla2_3", "U_OG_Guerilla3_1", "U_OG_Guerilla3_2", "U_OG_leader", "U_C_Poloshirt_stripped", "U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite", "U_C_Poor_1", "U_C_WorkerCoveralls", "U_C_Journalist", "U_C_Scientist", "U_OrestesBody", "U_Wetsuit_uniform", "U_Wetsuit_White", "U_Wetsuit_Blue", "U_Wetsuit_Purp", "U_Wetsuit_Camo", "U_CamoRed_uniform", "U_CamoBrn_uniform", "U_CamoBlue_uniform", "U_Camo_uniform", "U_ghillie1_uniform", "U_ghillie2_uniform", "U_ghillie3_uniform", "U_C_Driver_1", "U_C_Driver_2", "U_C_Driver_3", "U_C_Driver_4", "U_C_Driver_1_black", "U_C_Driver_1_blue", "U_C_Driver_1_green", "U_C_Driver_1_red", "U_C_Driver_1_white", "U_C_Driver_1_yellow", "U_C_Driver_1_orange", "U_C_Driver_1_red"];


//AI weapon classnames. Note: A3EAI_pistolList, A3EAI_rifleList, A3EAI_machinegunList, A3EAI_sniperList will not be read if A3EAI_dynamicWeaponList is enabled.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
A3EAI_pistolList = ["hgun_ACPC2_F", "hgun_ACPC2_F", "hgun_Rook40_F", "hgun_Rook40_F", "hgun_Rook40_F", "hgun_P07_F", "hgun_P07_F", "hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_02_F", "ruger_pistol_epoch", "ruger_pistol_epoch", "1911_pistol_epoch", "1911_pistol_epoch"];
A3EAI_rifleList = ["arifle_Katiba_F", "arifle_Katiba_F", "arifle_Katiba_C_F", "arifle_Katiba_GL_F", "arifle_MXC_F", "arifle_MX_F", "arifle_MX_F", "arifle_MX_GL_F", "arifle_MXM_F", "arifle_SDAR_F", "arifle_TRG21_F", "arifle_TRG20_F", "arifle_TRG21_GL_F", "arifle_Mk20_F", "arifle_Mk20C_F", "arifle_Mk20_GL_F", "arifle_Mk20_plain_F", "arifle_Mk20_plain_F", "arifle_Mk20C_plain_F", "arifle_Mk20_GL_plain_F", "SMG_01_F", "SMG_02_F", "SMG_01_F", "SMG_02_F", "hgun_PDW2000_F", "hgun_PDW2000_F", "arifle_MXM_Black_F", "arifle_MX_GL_Black_F", "arifle_MX_Black_F", "arifle_MXC_Black_F", "Rollins_F", "Rollins_F", "Rollins_F", "Rollins_F", "AKM_EPOCH", "m4a3_EPOCH", "m16_EPOCH", "m16Red_EPOCH"];
A3EAI_machinegunList = ["LMG_Mk200_F", "arifle_MX_SW_F", "LMG_Zafir_F", "arifle_MX_SW_Black_F", "m249_EPOCH", "m249Tan_EPOCH"];
A3EAI_sniperList = ["srifle_EBR_F", "srifle_EBR_F", "srifle_GM6_F", "srifle_GM6_F", "srifle_LRR_F", "srifle_DMR_01_F", "M14_EPOCH", "M14Grn_EPOCH", "m107_EPOCH", "m107Tan_EPOCH"];


//AI backpack types (for AI levels 0-3). Note: A3EAI_backpackTypes0-3 will not be read if A3EAI_dynamicBackpackList is enabled.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
A3EAI_backpackTypes0 = ["B_AssaultPack_cbr", "B_AssaultPack_dgtl", "B_AssaultPack_khk", "B_AssaultPack_mcamo", "B_AssaultPack_ocamo", "B_AssaultPack_rgr", "B_AssaultPack_sgg", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_ocamo", "B_Carryall_oli", "B_Carryall_oucamo", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_ocamo", "B_FieldPack_oli", "B_FieldPack_oucamo", "B_Kitbag_cbr", "B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_sgg", "B_Parachute", "B_TacticalPack_blk", "B_TacticalPack_mcamo", "B_TacticalPack_ocamo", "B_TacticalPack_oli", "B_TacticalPack_rgr", "smallbackpack_red_epoch", "smallbackpack_green_epoch", "smallbackpack_teal_epoch", "smallbackpack_pink_epoch"];
A3EAI_backpackTypes1 = ["B_AssaultPack_cbr", "B_AssaultPack_dgtl", "B_AssaultPack_khk", "B_AssaultPack_mcamo", "B_AssaultPack_ocamo", "B_AssaultPack_rgr", "B_AssaultPack_sgg", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_ocamo", "B_Carryall_oli", "B_Carryall_oucamo", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_ocamo", "B_FieldPack_oli", "B_FieldPack_oucamo", "B_Kitbag_cbr", "B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_sgg", "B_Parachute", "B_TacticalPack_blk", "B_TacticalPack_mcamo", "B_TacticalPack_ocamo", "B_TacticalPack_oli", "B_TacticalPack_rgr", "smallbackpack_red_epoch", "smallbackpack_green_epoch", "smallbackpack_teal_epoch", "smallbackpack_pink_epoch"];
A3EAI_backpackTypes2 = ["B_AssaultPack_cbr", "B_AssaultPack_dgtl", "B_AssaultPack_khk", "B_AssaultPack_mcamo", "B_AssaultPack_ocamo", "B_AssaultPack_rgr", "B_AssaultPack_sgg", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_ocamo", "B_Carryall_oli", "B_Carryall_oucamo", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_ocamo", "B_FieldPack_oli", "B_FieldPack_oucamo", "B_Kitbag_cbr", "B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_sgg", "B_Parachute", "B_TacticalPack_blk", "B_TacticalPack_mcamo", "B_TacticalPack_ocamo", "B_TacticalPack_oli", "B_TacticalPack_rgr", "smallbackpack_red_epoch", "smallbackpack_green_epoch", "smallbackpack_teal_epoch", "smallbackpack_pink_epoch"];
A3EAI_backpackTypes3 = ["B_AssaultPack_cbr", "B_AssaultPack_dgtl", "B_AssaultPack_khk", "B_AssaultPack_mcamo", "B_AssaultPack_ocamo", "B_AssaultPack_rgr", "B_AssaultPack_sgg", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_ocamo", "B_Carryall_oli", "B_Carryall_oucamo", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_ocamo", "B_FieldPack_oli", "B_FieldPack_oucamo", "B_Kitbag_cbr", "B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_sgg", "B_Parachute", "B_TacticalPack_blk", "B_TacticalPack_mcamo", "B_TacticalPack_ocamo", "B_TacticalPack_oli", "B_TacticalPack_rgr", "smallbackpack_red_epoch", "smallbackpack_green_epoch", "smallbackpack_teal_epoch", "smallbackpack_pink_epoch"];


//AI vest types (for AI levels 0-3). Note: A3EAI_vestTypes0-3 will not be read if A3EAI_dynamicVestList is enabled.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
A3EAI_vestTypes0 = ["V_1_EPOCH", "V_2_EPOCH", "V_3_EPOCH", "V_4_EPOCH", "V_5_EPOCH", "V_6_EPOCH", "V_7_EPOCH", "V_8_EPOCH", "V_9_EPOCH", "V_10_EPOCH", "V_11_EPOCH", "V_12_EPOCH", "V_13_EPOCH", "V_14_EPOCH", "V_15_EPOCH", "V_16_EPOCH", "V_17_EPOCH", "V_18_EPOCH", "V_19_EPOCH", "V_20_EPOCH", "V_21_EPOCH", "V_22_EPOCH", "V_23_EPOCH", "V_24_EPOCH", "V_25_EPOCH", "V_26_EPOCH", "V_27_EPOCH", "V_28_EPOCH", "V_29_EPOCH", "V_30_EPOCH", "V_31_EPOCH", "V_32_EPOCH", "V_33_EPOCH", "V_34_EPOCH", "V_35_EPOCH", "V_36_EPOCH", "V_37_EPOCH", "V_38_EPOCH", "V_39_EPOCH", "V_40_EPOCH"];
A3EAI_vestTypes1 = ["V_1_EPOCH", "V_2_EPOCH", "V_3_EPOCH", "V_4_EPOCH", "V_5_EPOCH", "V_6_EPOCH", "V_7_EPOCH", "V_8_EPOCH", "V_9_EPOCH", "V_10_EPOCH", "V_11_EPOCH", "V_12_EPOCH", "V_13_EPOCH", "V_14_EPOCH", "V_15_EPOCH", "V_16_EPOCH", "V_17_EPOCH", "V_18_EPOCH", "V_19_EPOCH", "V_20_EPOCH", "V_21_EPOCH", "V_22_EPOCH", "V_23_EPOCH", "V_24_EPOCH", "V_25_EPOCH", "V_26_EPOCH", "V_27_EPOCH", "V_28_EPOCH", "V_29_EPOCH", "V_30_EPOCH", "V_31_EPOCH", "V_32_EPOCH", "V_33_EPOCH", "V_34_EPOCH", "V_35_EPOCH", "V_36_EPOCH", "V_37_EPOCH", "V_38_EPOCH", "V_39_EPOCH", "V_40_EPOCH"];
A3EAI_vestTypes2 = ["V_1_EPOCH", "V_2_EPOCH", "V_3_EPOCH", "V_4_EPOCH", "V_5_EPOCH", "V_6_EPOCH", "V_7_EPOCH", "V_8_EPOCH", "V_9_EPOCH", "V_10_EPOCH", "V_11_EPOCH", "V_12_EPOCH", "V_13_EPOCH", "V_14_EPOCH", "V_15_EPOCH", "V_16_EPOCH", "V_17_EPOCH", "V_18_EPOCH", "V_19_EPOCH", "V_20_EPOCH", "V_21_EPOCH", "V_22_EPOCH", "V_23_EPOCH", "V_24_EPOCH", "V_25_EPOCH", "V_26_EPOCH", "V_27_EPOCH", "V_28_EPOCH", "V_29_EPOCH", "V_30_EPOCH", "V_31_EPOCH", "V_32_EPOCH", "V_33_EPOCH", "V_34_EPOCH", "V_35_EPOCH", "V_36_EPOCH", "V_37_EPOCH", "V_38_EPOCH", "V_39_EPOCH", "V_40_EPOCH"];
A3EAI_vestTypes3 = ["V_1_EPOCH", "V_2_EPOCH", "V_3_EPOCH", "V_4_EPOCH", "V_5_EPOCH", "V_6_EPOCH", "V_7_EPOCH", "V_8_EPOCH", "V_9_EPOCH", "V_10_EPOCH", "V_11_EPOCH", "V_12_EPOCH", "V_13_EPOCH", "V_14_EPOCH", "V_15_EPOCH", "V_16_EPOCH", "V_17_EPOCH", "V_18_EPOCH", "V_19_EPOCH", "V_20_EPOCH", "V_21_EPOCH", "V_22_EPOCH", "V_23_EPOCH", "V_24_EPOCH", "V_25_EPOCH", "V_26_EPOCH", "V_27_EPOCH", "V_28_EPOCH", "V_29_EPOCH", "V_30_EPOCH", "V_31_EPOCH", "V_32_EPOCH", "V_33_EPOCH", "V_34_EPOCH", "V_35_EPOCH", "V_36_EPOCH", "V_37_EPOCH", "V_38_EPOCH", "V_39_EPOCH", "V_40_EPOCH"];


//AI head gear types. Note: A3EAI_headgearTypes will not be read if A3EAI_dynamicHeadgearList is enabled.
A3EAI_headgearTypes = ["H_1_EPOCH","H_2_EPOCH","H_3_EPOCH","H_4_EPOCH","H_5_EPOCH","H_6_EPOCH","H_7_EPOCH","H_8_EPOCH","H_9_EPOCH","H_10_EPOCH","H_11_EPOCH","H_12_EPOCH","H_13_EPOCH","H_14_EPOCH","H_15_EPOCH","H_16_EPOCH","H_17_EPOCH","H_18_EPOCH","H_19_EPOCH","H_20_EPOCH","H_21_EPOCH","H_22_EPOCH","H_23_EPOCH","H_24_EPOCH","H_25_EPOCH","H_26_EPOCH","H_27_EPOCH","H_28_EPOCH","H_29_EPOCH","H_30_EPOCH","H_31_EPOCH","H_32_EPOCH","H_33_EPOCH","H_34_EPOCH","H_35_EPOCH","H_36_EPOCH","H_37_EPOCH","H_38_EPOCH","H_39_EPOCH","H_40_EPOCH","H_41_EPOCH","H_42_EPOCH","H_43_EPOCH","H_44_EPOCH","H_45_EPOCH","H_46_EPOCH","H_47_EPOCH","H_48_EPOCH","H_49_EPOCH","H_50_EPOCH","H_51_EPOCH","H_52_EPOCH","H_53_EPOCH","H_54_EPOCH","H_55_EPOCH","H_56_EPOCH","H_57_EPOCH","H_58_EPOCH","H_59_EPOCH","H_60_EPOCH","H_61_EPOCH","H_62_EPOCH","H_63_EPOCH","H_64_EPOCH","H_65_EPOCH","H_66_EPOCH","H_67_EPOCH","H_68_EPOCH","H_69_EPOCH","H_70_EPOCH","H_71_EPOCH","H_72_EPOCH","H_73_EPOCH","H_74_EPOCH","H_75_EPOCH","H_76_EPOCH","H_77_EPOCH","H_78_EPOCH","H_79_EPOCH","H_80_EPOCH","H_81_EPOCH","H_82_EPOCH","H_83_EPOCH","H_84_EPOCH","H_85_EPOCH","H_86_EPOCH","H_87_EPOCH","H_88_EPOCH","H_89_EPOCH","H_90_EPOCH","H_91_EPOCH","H_92_EPOCH","H_93_EPOCH","H_94_EPOCH","H_95_EPOCH","H_96_EPOCH","H_97_EPOCH","H_98_EPOCH","H_99_EPOCH","H_100_EPOCH","H_101_EPOCH","H_102_EPOCH","H_103_EPOCH","H_104_EPOCH"];


//AI Food/Loot item types. 
// Note: A3EAI_foodLoot will not be read if A3EAI_dynamicFoodList is enabled.
// Note: A3EAI_MiscLoot1 will not be read if A3EAI_dynamicLootList is enabled.
// Note: A3EAI_MiscLoot2 will not be read if A3EAI_dynamicLootLargeList is enabled.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
A3EAI_foodLoot = ["FoodSnooter","FoodWalkNSons","FoodBioMeat","ItemSodaOrangeSherbet","ItemSodaPurple","ItemSodaMocha","ItemSodaBurst","ItemSodaRbull","honey_epoch","emptyjar_epoch","sardines_epoch","meatballs_epoch","scam_epoch","sweetcorn_epoch","WhiskeyNoodle","ItemCoolerE"];
A3EAI_MiscLoot1 = ["PaintCanClear","PaintCanBlk","PaintCanBlu","PaintCanBrn","PaintCanGrn","PaintCanOra","PaintCanPur","PaintCanRed","PaintCanTeal","PaintCanYel","ItemDocument","ItemMixOil","emptyjar_epoch","emptyjar_epoch","FoodBioMeat","ItemSodaOrangeSherbet","ItemSodaPurple","ItemSodaMocha","ItemSodaBurst","ItemSodaRbull","sardines_epoch","meatballs_epoch","scam_epoch","sweetcorn_epoch","Towelette","Towelette","Towelette","Towelette","Towelette","HeatPack","HeatPack","HeatPack","ColdPack","ColdPack","VehicleRepair","CircuitParts","ItemCoolerE","ItemScraps","ItemScraps"];
A3EAI_MiscLoot2 = ["MortarBucket","MortarBucket","ItemCorrugated","CinderBlocks","jerrycan_epoch","jerrycan_epoch","VehicleRepair","VehicleRepair","CircuitParts"];


//AI toolbelt item types. Toolbelt items are added to AI inventory upon death. Format: [item classname, item probability]
//unitLevel level 0-1 AI will use A3EAI_tools0 table, unitLevel level 2-3 AI will use A3EAI_tools1 table. Custom-spawned AI will use A3EAI_tools1 table.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

A3EAI_tools0 = [
	["ItemWatch",0.70],["ItemCompass",0.50],["ItemMap",0.40],["ItemGPS",0.05],["EpochRadio0",0.10]
];
A3EAI_tools1 = [
	["ItemWatch",0.80],["ItemCompass",0.75],["ItemMap",0.70],["ItemGPS",0.15],["EpochRadio0",0.20]
];


//AI-useable toolbelt item types. These items are added to AI inventory at unit creation and may be used by AI. Format: [item classname, item probability]
//unitLevel level 0-1 AI will use A3EAI_gadgets0 table, unitLevel level 2-3 AI will use A3EAI_gadgets1 table. Custom-spawned AI will use A3EAI_gadgets1 table.
//Note: NVGoggles will be replaced with NVG_EPOCH on AI death
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

A3EAI_gadgets0 = [
	["binocular",0.40],["NVG_EPOCH",0.10]
];
A3EAI_gadgets1 = [
	["binocular",0.70],["NVG_EPOCH",0.25]
];


//NOTHING TO EDIT BEYOND THIS POINT
diag_log "[A3EAI] A3EAI configuration file loaded.";
