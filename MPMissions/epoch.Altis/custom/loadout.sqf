if (!isServer) then {
	waitUntil {!isNull player};
	waitUntil {player == player};
	
	while {true} do {
		_player = player;
		player addEventHandler ["Respawn", {
			if (getPlayerUID player in ["0"]) then {
				player addWeapon "srifle_EBR_F";
				player addWeapon "hgun_Pistol_heavy_01_F";
				player addWeapon "RPG32_F";
				player addMagazine "20Rnd_762x51_Mag";
				player addMagazine "11Rnd_45ACP_Mag";
				player addMagazine "launch_RPG32_F";
				player addWeapon "NVG_EPOCH";
				player addWeapon "EpochRadio0";
				player addWeapon "ItemMap";
				player addWeapon "optic_tws_mg";
				player addWeapon "muzzle_snds_B";
				player addWeapon "ItemGPS";
				player addWeapon "ItemWatch";
				player addWeapon "ItemCompass";
				player addWeapon "RangeFinder";
				player addWeapon "hgun_Pistol_heavy_01_F";
				player addBackpack "B_Carryall_cbr";
				player addVest "V_TacVest_camo";
				player addItemToBackpack "FirstAidKit";
				player addItemToVest "10Rnd_762x51_Mag";
				player addItemToVest "10Rnd_762x51_Mag";
				player addItemToVest "11Rnd_45ACP_Mag";
				player addItemToVest "WhiskeyNoodle";
				player addItemToVest "ItemSodaOrangeSherbet";
				player addItemToVest "meatballs_epoch";
				player addItemToVest "sweetcorn_epoch";
				player addItemToVest "scam_epoch";
				player addItemToVest "ItemSodaRbull";
				player addItemToVest "ItemSodaRbull";
				player addItemToBackpack "ItemLockbox";
				player addItemToBackpack "20Rnd_762x51_Mag";
				player addItemToBackpack "20Rnd_762x51_Mag";
				player addItemToBackpack "11Rnd_45ACP_Mag";
				player addItemToBackpack "11Rnd_45ACP_Mag";
				player addItemToBackpack "CinderBlocks";
				player addItemToBackpack "CinderBlocks";
				player addItemToBackpack "CinderBlocks";
				player addItemToBackpack "CinderBlocks";
				player addItemToBackpack "CinderBlocks";
				player addItemToBackpack "ItemCorrugated";
				player addItemToBackpack "MortarBucket";
				player addItemToBackpack "launch_NLAW_F";
				player addItemToBackpack "launch_NLAW_F";
				player addItemToBackpack "HeatPack";
				player addItemToBackpack "ColdPack";
				player addItemToBackpack "FirstAidKit";
				player addItemToBackpack "MeleeSledge";
				player addItemToBackpack "Hatchet";
				player forceAddUniform "U_O_GhillieSuit";
				EPOCH_playerCrypto = 30000;
			} else {
				player addWeapon "EpochRadio0"; 
				player addWeapon "ItemMap";
				player addWeapon "hgun_Pistol_heavy_01_F";
				player addMagazine "11Rnd_45ACP_Mag";
				EPOCH_playerCrypto = 100;
			};
		}];
		waitUntil {_player != player};
	};
};