//	Lootspawner junction lists for classes to spawn-/lootable items
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//here place Weapons an usable items (ex.: Binocular, ...)
//used with addWeaponCargoGlobal
//"lootWeapon_list" array of [class, [weaponlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								weaponlist	: list of weapon class names
lootWeapon_list = [
[ 0, [							// CIVIL
"ItemLockBox",
"arifle_MK20C_F",
"arifle_MK20_F",
"arifle_TRG20_F",
"arifle_TRG21_F",

"Binocular",
"hgun_ACPC2_F",
"hgun_P07_F",
"hgun_PDW2000_F",
"hgun_Rook40_F",
"SMG_01_F",							// Vermin .45 ACP
"SMG_02_F",							// Sting 9mm
"srifle_EBR_F",
"m16_EPOCH",
"m16Red_EPOCH",
"M14_EPOCH",
"M14Grn_EPOCH",
"m4a3_EPOCH",
"AKM_EPOCH",
"Rollins_F",
"speargun_epoch",
"ruger_pistol_epoch",
"1911_pistol_epoch",
"Hatchet",
"MultiGun",
"MeleeSledge",
"ChainSaw"
//"arifle_SDAR_F",
]],[ 1, [						// MILITARY
"ItemLockBox",
"arifle_Katiba_C_F",
"arifle_Katiba_F",
"arifle_Katiba_GL_F",
"arifle_Mk20C_F",
"arifle_Mk20_F",
"arifle_Mk20_GL_F",
"arifle_MXC_F",
"arifle_MXM_F",
"arifle_MX_F",
"arifle_MX_GL_F",
"arifle_MX_SW_F",
"arifle_SDAR_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"arifle_TRG21_GL_F",
"Binocular",
"hgun_ACPC2_snds_F",
"hgun_P07_snds_F",
"hgun_PDW2000_F",
"hgun_Rook40_snds_F",




"LMG_Mk200_F",
"LMG_Zafir_F",
"Rangefinder",
"SMG_01_F",							// Vermin .45 ACP
"SMG_02_F",							// Sting 9mm
"srifle_EBR_F",
"srifle_GM6_F",
"srifle_LRR_F",
"m16_EPOCH",
"m16Red_EPOCH",
"M14_EPOCH",
"M14Grn_EPOCH",
"m4a3_EPOCH",
"AKM_EPOCH",
"m249_EPOCH",
"m249Tan_EPOCH",
"m107Tan_EPOCH",
"m107_EPOCH"
]],[ 2, [						// INDUSTRIAL
"ItemLockBox",
"arifle_Katiba_C_F",
"arifle_Mk20C_F",
"arifle_Mk20_F",
"arifle_MXC_F",
"arifle_SDAR_F",
"arifle_TRG20_F",
"arifle_TRG21_F",
"Binocular",
"SMG_01_F",							// Vermin .45 ACP
"SMG_02_F",							// Sting 9m
"m16_EPOCH",
"m16Red_EPOCH",
"M14_EPOCH",
"M14Grn_EPOCH",
"m4a3_EPOCH",
"AKM_EPOCH",
"ruger_pistol_epoch",
"1911_pistol_epoch",
"Hatchet",
"MultiGun",
"MeleeSledge",
"ChainSaw"
]],[ 3, [						// RESEARCH


"arifle_Katiba_GL_F",
"arifle_MXC_F",
"arifle_MXM_F",
"arifle_MX_GL_F",

"Rangefinder",
"srifle_GM6_F",
"srifle_LRR_F",
"m16_EPOCH",
"m16Red_EPOCH",
"M14_EPOCH",
"M14Grn_EPOCH",
"m4a3_EPOCH",
"AKM_EPOCH",
"m249_EPOCH",
"m249Tan_EPOCH",
"m107Tan_EPOCH",
"m107_EPOCH"
]]];


//here place magazines, bodyitems(ex.: ItemGPS, ItemMap, Medikit, FirstAidKit, Binoculars, ...)
//used with addMagazineCargoGlobal
//"lootMagazine_list" array of [class, [magazinelist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								magazinelist: list of magazine class names
lootMagazine_list = [
[ 0, [							// CIVIL


"ItemLockBox",
"EnergyPack",
"EnergyPackLg",
"20Rnd_762x51_Mag",










"10Rnd_762x51_Mag",
"30Rnd_762x39_Mag",
"150Rnd_762x51_Box",
"150Rnd_762x51_Box_Tracer",
"5Rnd_127x108_Mag",








"5Rnd_127x108_APDS_Mag",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag",
"30Rnd_65x39_caseless_mag_Tracer",
"200Rnd_65x39_cased_Box",
"100Rnd_65x39_caseless_mag",
"200Rnd_65x39_cased_Box_Tracer",
"100Rnd_65x39_caseless_mag_Tracer",
"20Rnd_556x45_UW_mag",


"30Rnd_556x45_Stanag",

"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"200Rnd_556x45_M249",
"7Rnd_408_Mag",
"spear_magazine",
"5Rnd_rollins_mag",
"30Rnd_45ACP_Mag_SMG_01",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
"9Rnd_45ACP_Mag",
"11Rnd_45ACP_Mag",
"6Rnd_45ACP_Cylinder",
"16Rnd_9x21_Mag",
"30Rnd_9x21_Mag",
"10rnd_22X44_magazine",
"9rnd_45X88_magazine",
"hgun_PDW2000_F",
"hgun_ACPC2_F",
"hgun_Rook40_F",
"hgun_P07_F",
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_02_F",
"ruger_pistol_epoch",
"1911_pistol_epoch",
"hgun_Pistol_Signal_F",
"srifle_EBR_F",
"srifle_GM6_F",
"srifle_LRR_F",
"srifle_DMR_01_F",
"m107Tan_EPOCH",
"m107_EPOCH",
"arifle_Katiba_F",
"arifle_Katiba_C_F",
"arifle_Katiba_GL_F",
"arifle_MXC_F",
"arifle_MX_F",
"arifle_MX_GL_F",
"arifle_MXM_F",
"arifle_SDAR_F",
"arifle_TRG21_F",
"arifle_TRG20_F",
"arifle_TRG21_GL_F",
"arifle_Mk20_F",
"arifle_Mk20C_F",
"arifle_Mk20_GL_F",
"arifle_Mk20_plain_F",
"arifle_Mk20C_plain_F",
"arifle_Mk20_GL_plain_F",
"arifle_MXM_Black_F",
"arifle_MX_GL_Black_F",
"arifle_MX_Black_F",
"arifle_MXC_Black_F",
"arifle_MX_SW_F",
"arifle_MX_SW_Black_F",
"m16_EPOCH",
"m16Red_EPOCH",
"M14_EPOCH",
"M14Grn_EPOCH",
"m4a3_EPOCH",
"AKM_EPOCH",
"LMG_Mk200_F",
"LMG_Zafir_F",
"m249_EPOCH",
"m249Tan_EPOCH",
"SMG_01_F",
"SMG_02_F",
"Rollins_F",
"speargun_epoch",
"UGL_FlareWhite_F",
"UGL_FlareGreen_F",
"UGL_FlareRed_F",
"UGL_FlareYellow_F",
"UGL_FlareCIR_F",
"3Rnd_UGL_FlareWhite_F",
"3Rnd_UGL_FlareGreen_F",
"3Rnd_UGL_FlareRed_F",
"3Rnd_UGL_FlareYellow_F",
"3Rnd_UGL_FlareCIR_F",
"6Rnd_GreenSignal_F",
"6Rnd_RedSignal_F",
"Chemlight_green",
"Chemlight_red",
"Chemlight_yellow",
"Chemlight_blue"
]],[ 1, [						// MILITARY
"EnergyPack",
"EnergyPackLg",
"20Rnd_762x51_Mag",
"10Rnd_762x51_Mag",
"30Rnd_762x39_Mag",
"150Rnd_762x51_Box",
"150Rnd_762x51_Box_Tracer",
"5Rnd_127x108_Mag",
"5Rnd_127x108_APDS_Mag",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag",
"30Rnd_65x39_caseless_mag_Tracer",










"200Rnd_65x39_cased_Box",
"100Rnd_65x39_caseless_mag",
"200Rnd_65x39_cased_Box_Tracer",
"100Rnd_65x39_caseless_mag_Tracer",
"20Rnd_556x45_UW_mag",
"30Rnd_556x45_Stanag",
"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"200Rnd_556x45_M249",
"7Rnd_408_Mag",
"spear_magazine",
"5Rnd_rollins_mag",
"30Rnd_45ACP_Mag_SMG_01",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
"9Rnd_45ACP_Mag",



"11Rnd_45ACP_Mag",
"6Rnd_45ACP_Cylinder",
"16Rnd_9x21_Mag",
"30Rnd_9x21_Mag",



"10rnd_22X44_magazine",
"9rnd_45X88_magazine",
"hgun_PDW2000_F",
"hgun_ACPC2_F",
"hgun_Rook40_F",
"hgun_P07_F",


"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_02_F",
"ruger_pistol_epoch",
"1911_pistol_epoch",

"hgun_Pistol_Signal_F",
"srifle_EBR_F",
"srifle_GM6_F",
"srifle_LRR_F",
"srifle_DMR_01_F",
"m107Tan_EPOCH",
"m107_EPOCH",
"arifle_Katiba_F",
"arifle_Katiba_C_F",
"arifle_Katiba_GL_F",
"arifle_MXC_F",
"arifle_MX_F",
"arifle_MX_GL_F",
"arifle_MXM_F",
"arifle_SDAR_F",
"arifle_TRG21_F",
"arifle_TRG20_F",
"arifle_TRG21_GL_F",
"arifle_Mk20_F",
"arifle_Mk20C_F",
"arifle_Mk20_GL_F",
"arifle_Mk20_plain_F",
"arifle_Mk20C_plain_F",
"arifle_Mk20_GL_plain_F",
"arifle_MXM_Black_F",
"arifle_MX_GL_Black_F",
"arifle_MX_Black_F",
"arifle_MXC_Black_F",
"arifle_MX_SW_F",
"arifle_MX_SW_Black_F",
"m16_EPOCH",
"m16Red_EPOCH",
"M14_EPOCH",
"M14Grn_EPOCH",
"m4a3_EPOCH",
"AKM_EPOCH",
"LMG_Mk200_F",
"LMG_Zafir_F",
"m249_EPOCH",
"m249Tan_EPOCH",
"SMG_01_F",
"SMG_02_F",
"Rollins_F",
"speargun_epoch",
"UGL_FlareWhite_F",
"UGL_FlareGreen_F",
"UGL_FlareRed_F",
"UGL_FlareYellow_F",
"UGL_FlareCIR_F",
"3Rnd_UGL_FlareWhite_F",
"3Rnd_UGL_FlareGreen_F",
"3Rnd_UGL_FlareRed_F",
"3Rnd_UGL_FlareYellow_F",
"3Rnd_UGL_FlareCIR_F",
"6Rnd_GreenSignal_F",
"6Rnd_RedSignal_F",
"Chemlight_green",
"Chemlight_red",
"Chemlight_yellow",
"Chemlight_blue"
]],[ 2, [						// INDUSTRIAL
"ItemLockBox",
"EnergyPack",
"EnergyPackLg",
"20Rnd_762x51_Mag",
"10Rnd_762x51_Mag",
"30Rnd_762x39_Mag",
"150Rnd_762x51_Box",
"150Rnd_762x51_Box_Tracer",
"5Rnd_127x108_Mag",
"5Rnd_127x108_APDS_Mag",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag",
"30Rnd_65x39_caseless_mag_Tracer",
"200Rnd_65x39_cased_Box",
"100Rnd_65x39_caseless_mag",
"200Rnd_65x39_cased_Box_Tracer",
"100Rnd_65x39_caseless_mag_Tracer",
"20Rnd_556x45_UW_mag",

"30Rnd_556x45_Stanag",

"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"200Rnd_556x45_M249",
"7Rnd_408_Mag",
"spear_magazine",
"5Rnd_rollins_mag",
"30Rnd_45ACP_Mag_SMG_01",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
"9Rnd_45ACP_Mag",
"11Rnd_45ACP_Mag",
"6Rnd_45ACP_Cylinder",
"16Rnd_9x21_Mag",
"30Rnd_9x21_Mag",
"10rnd_22X44_magazine",
"9rnd_45X88_magazine",
"hgun_PDW2000_F",
"hgun_ACPC2_F",
"hgun_Rook40_F",
"hgun_P07_F",
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_02_F",
"ruger_pistol_epoch",
"1911_pistol_epoch",
"hgun_Pistol_Signal_F",
"srifle_EBR_F",
"srifle_GM6_F",
"srifle_LRR_F",
"srifle_DMR_01_F",
"m107Tan_EPOCH",
"m107_EPOCH",
"arifle_Katiba_F",
"arifle_Katiba_C_F",
"arifle_Katiba_GL_F",
"arifle_MXC_F",
"arifle_MX_F",
"arifle_MX_GL_F",
"arifle_MXM_F",
"arifle_SDAR_F",
"arifle_TRG21_F",
"arifle_TRG20_F",
"arifle_TRG21_GL_F",
"arifle_Mk20_F",
"arifle_Mk20C_F",
"arifle_Mk20_GL_F",
"arifle_Mk20_plain_F",
"arifle_Mk20C_plain_F",
"arifle_Mk20_GL_plain_F",
"arifle_MXM_Black_F",
"arifle_MX_GL_Black_F",
"arifle_MX_Black_F",
"arifle_MXC_Black_F",
"arifle_MX_SW_F",
"arifle_MX_SW_Black_F",
"m16_EPOCH",
"m16Red_EPOCH",
"M14_EPOCH",
"M14Grn_EPOCH",
"m4a3_EPOCH",
"AKM_EPOCH",
"LMG_Mk200_F",
"LMG_Zafir_F",
"m249_EPOCH",
"m249Tan_EPOCH",
"SMG_01_F",
"SMG_02_F",
"Rollins_F",
"speargun_epoch",
"UGL_FlareWhite_F",
"UGL_FlareGreen_F",
"UGL_FlareRed_F",
"UGL_FlareYellow_F",
"UGL_FlareCIR_F",
"3Rnd_UGL_FlareWhite_F",
"3Rnd_UGL_FlareGreen_F",
"3Rnd_UGL_FlareRed_F",
"3Rnd_UGL_FlareYellow_F",
"3Rnd_UGL_FlareCIR_F",
"6Rnd_GreenSignal_F",
"6Rnd_RedSignal_F",
"Chemlight_green",
"Chemlight_red",
"Chemlight_yellow",
"Chemlight_blue"
]],[ 3, [						// RESEARCH
"EnergyPack",
"EnergyPackLg",
"20Rnd_762x51_Mag",
"10Rnd_762x51_Mag",
"30Rnd_762x39_Mag",
"150Rnd_762x51_Box",
"150Rnd_762x51_Box_Tracer",
"5Rnd_127x108_Mag",
"5Rnd_127x108_APDS_Mag",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"30Rnd_65x39_caseless_mag",
"30Rnd_65x39_caseless_mag_Tracer",
"200Rnd_65x39_cased_Box",
"100Rnd_65x39_caseless_mag",
"200Rnd_65x39_cased_Box_Tracer",
"100Rnd_65x39_caseless_mag_Tracer",
"20Rnd_556x45_UW_mag",
"30Rnd_556x45_Stanag",


"ItemLockBox",
"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"200Rnd_556x45_M249",
"7Rnd_408_Mag",
"spear_magazine",
"5Rnd_rollins_mag",
"30Rnd_45ACP_Mag_SMG_01",
"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
"9Rnd_45ACP_Mag",
"11Rnd_45ACP_Mag",
"6Rnd_45ACP_Cylinder",
"16Rnd_9x21_Mag",
"30Rnd_9x21_Mag",
"10rnd_22X44_magazine",
"9rnd_45X88_magazine",
"hgun_PDW2000_F",
"hgun_ACPC2_F",
"hgun_Rook40_F",
"hgun_P07_F",
"hgun_Pistol_heavy_01_F",

"hgun_Pistol_heavy_02_F",
"ruger_pistol_epoch",
"1911_pistol_epoch",
"hgun_Pistol_Signal_F",
"srifle_EBR_F",
"srifle_GM6_F",
"srifle_LRR_F",
"srifle_DMR_01_F",
"m107Tan_EPOCH",
"m107_EPOCH",
"arifle_Katiba_F",
"arifle_Katiba_C_F",
"arifle_Katiba_GL_F",
"arifle_MXC_F",
"arifle_MX_F",
"arifle_MX_GL_F",
"arifle_MXM_F",
"arifle_SDAR_F",
"arifle_TRG21_F",
"arifle_TRG20_F",
"arifle_TRG21_GL_F",
"arifle_Mk20_F",
"arifle_Mk20C_F",
"arifle_Mk20_GL_F",
"arifle_Mk20_plain_F",
"arifle_Mk20C_plain_F",
"arifle_Mk20_GL_plain_F",
"arifle_MXM_Black_F",
"arifle_MX_GL_Black_F",
"arifle_MX_Black_F",
"arifle_MXC_Black_F",
"arifle_MX_SW_F",
"arifle_MX_SW_Black_F",
"m16_EPOCH",
"m16Red_EPOCH",
"M14_EPOCH",
"M14Grn_EPOCH",
"m4a3_EPOCH",
"AKM_EPOCH",
"LMG_Mk200_F",
"LMG_Zafir_F",
"m249_EPOCH",
"m249Tan_EPOCH",
"SMG_01_F",
"SMG_02_F",
"Rollins_F",
"speargun_epoch",
"UGL_FlareWhite_F",
"UGL_FlareGreen_F",
"UGL_FlareRed_F",
"UGL_FlareYellow_F",
"UGL_FlareCIR_F",
"3Rnd_UGL_FlareWhite_F",
"3Rnd_UGL_FlareGreen_F",
"3Rnd_UGL_FlareRed_F",
"3Rnd_UGL_FlareYellow_F",
"3Rnd_UGL_FlareCIR_F",
"6Rnd_GreenSignal_F",
"6Rnd_RedSignal_F",
"Chemlight_green",
"Chemlight_red",
"Chemlight_yellow",
"Chemlight_blue"
]]];


//here place hats, glasses, clothes, uniforms, vests, weaponattachments
//used with addItemCargoGlobal
//"lootItem_list" array of [class, [itemlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								itemlist	: list of item class names
lootItem_list = [
[ 0, [							// CIVIL
"ItemLockBox",
"ChainSaw",
"ItemCoolerE",
"VehicleRepairLg",
"Hatchet",
"MultiGun",
"MeleeSledge",
"Pelt_EPOCH",
"Venom_EPOCH",
"EnergyPack",
"EnergyPackLg",
"SnakeCarcass_EPOCH",
"RabbitCarcass_EPOCH",
"ChickenCarcass_EPOCH",
"GoatCarcass_EPOCH",
"SheepCarcass_EPOCH",
"ItemCompass",
"ItemGPS",
"ItemWatch",
"NVG_EPOCH",
"EpochRadio0",
"EpochRadio1",
"EpochRadio2",
"EpochRadio3",
"EpochRadio4",
"EpochRadio5",
"EpochRadio6",
"EpochRadio7",
"EpochRadio8",
"EpochRadio9",


"Heal_EPOCH",
"Defib_EPOCH",
"Repair_EPOCH",

"WhiskeyNoodle",
"ItemSodaOrangeSherbet",
"ItemSodaPurple",
"ItemSodaMocha",
"ItemSodaBurst",
"ItemSodaRbull",
"FoodBioMeat",
"FoodMeeps",
"FoodSnooter",
"FoodWalkNSons",
"sardines_epoch",
"meatballs_epoch",
"scam_epoch",
"sweetcorn_epoch",
"honey_epoch",
"PartOre",
"ItemKiloHemp",
"CookedSheep_EPOCH",
"CookedGoat_EPOCH",
"SnakeMeat_EPOCH",
"CookedRabbit_EPOCH",
"CookedChicken_EPOCH",
"ItemTrout",
"ItemSeaBass",
"ItemTuna",
"WhiskeyNoodle",
"ItemSodaOrangeSherbet",
"ItemSodaPurple",
"ItemSodaMocha",
"ItemSodaBurst",
"ItemSodaRbull",
"FoodBioMeat",
"FoodMeeps",
"FoodSnooter",
"FoodWalkNSons",
"sardines_epoch",
"meatballs_epoch",
"scam_epoch",
"sweetcorn_epoch",
"honey_epoch",
"FAK",
"Towelette",
"HeatPack",
"ColdPack",
"ItemTopaz",
"ItemOnyx",
"ItemSapphire",
"ItemAmethyst",
"ItemEmerald",
"ItemCitrine",
"ItemRuby",
"ItemQuartz",
"ItemJade",
"ItemGarnet",







"FAK",
"Towelette",
"HeatPack",
"ColdPack",










"acc_flashlight",
"acc_pointer_IR",
"optic_Arco",
"optic_Hamr",
"optic_Aco",
"optic_ACO_grn",
"optic_Aco_smg",
"optic_ACO_grn_smg",
"optic_Holosight",
"optic_Holosight_smg",
"optic_SOS",
"optic_MRCO",
"optic_DMS",
"optic_Yorris",
"optic_MRD",
"optic_LRPS",
"optic_NVS",
"optic_Nightstalker",
"optic_tws",
"optic_tws_mg",
"muzzle_snds_H",
"muzzle_snds_L",
"muzzle_snds_M",
"muzzle_snds_B",
"muzzle_snds_H_MG",
"muzzle_snds_acp",
"V_1_EPOCH","V_2_EPOCH","V_3_EPOCH","V_4_EPOCH","V_5_EPOCH","V_6_EPOCH","V_7_EPOCH","V_8_EPOCH","V_9_EPOCH","V_10_EPOCH","V_11_EPOCH","V_12_EPOCH","V_13_EPOCH","V_14_EPOCH","V_15_EPOCH","V_16_EPOCH","V_17_EPOCH","V_18_EPOCH","V_19_EPOCH","V_20_EPOCH","V_21_EPOCH","V_22_EPOCH","V_23_EPOCH","V_24_EPOCH","V_25_EPOCH","V_26_EPOCH","V_27_EPOCH","V_28_EPOCH","V_29_EPOCH","V_30_EPOCH","V_31_EPOCH","V_32_EPOCH","V_33_EPOCH","V_34_EPOCH","V_35_EPOCH","V_36_EPOCH","V_37_EPOCH","V_38_EPOCH","V_39_EPOCH","V_40_EPOCH",
"H_1_EPOCH","H_2_EPOCH","H_3_EPOCH","H_4_EPOCH","H_5_EPOCH","H_6_EPOCH","H_7_EPOCH","H_8_EPOCH","H_9_EPOCH","H_10_EPOCH","H_11_EPOCH","H_12_EPOCH","H_13_EPOCH","H_14_EPOCH","H_15_EPOCH","H_16_EPOCH","H_17_EPOCH","H_18_EPOCH","H_19_EPOCH","H_20_EPOCH","H_21_EPOCH","H_22_EPOCH","H_23_EPOCH","H_24_EPOCH","H_25_EPOCH","H_26_EPOCH","H_27_EPOCH","H_28_EPOCH","H_29_EPOCH","H_30_EPOCH","H_31_EPOCH","H_32_EPOCH","H_33_EPOCH","H_34_EPOCH","H_35_EPOCH","H_36_EPOCH","H_37_EPOCH","H_38_EPOCH","H_39_EPOCH","H_40_EPOCH","H_41_EPOCH","H_42_EPOCH","H_43_EPOCH","H_44_EPOCH","H_45_EPOCH","H_46_EPOCH","H_47_EPOCH","H_48_EPOCH","H_49_EPOCH","H_50_EPOCH","H_51_EPOCH","H_52_EPOCH","H_53_EPOCH","H_54_EPOCH","H_55_EPOCH","H_56_EPOCH","H_57_EPOCH","H_58_EPOCH","H_59_EPOCH","H_60_EPOCH","H_61_EPOCH","H_62_EPOCH","H_63_EPOCH","H_64_EPOCH","H_65_EPOCH","H_66_EPOCH","H_67_EPOCH","H_68_EPOCH","H_69_EPOCH","H_70_EPOCH","H_71_EPOCH","H_72_EPOCH","H_73_EPOCH","H_74_EPOCH","H_75_EPOCH","H_76_EPOCH","H_77_EPOCH","H_78_EPOCH","H_79_EPOCH","H_80_EPOCH","H_81_EPOCH","H_82_EPOCH","H_83_EPOCH","H_84_EPOCH","H_85_EPOCH","H_86_EPOCH","H_87_EPOCH","H_88_EPOCH","H_89_EPOCH","H_90_EPOCH","H_91_EPOCH","H_92_EPOCH","H_93_EPOCH","H_94_EPOCH","H_95_EPOCH","H_96_EPOCH","H_97_EPOCH","H_98_EPOCH","H_99_EPOCH","H_100_EPOCH","H_101_EPOCH","H_102_EPOCH","H_103_EPOCH","H_104_EPOCH","wolf_mask_epoch","pkin_mask_epoch"
]],[ 1, [						// MILITARY
"Heal_EPOCH",
"Defib_EPOCH",
"Repair_EPOCH",
"PartOre",
"ItemKiloHemp",
"WhiskeyNoodle",
"ItemSodaOrangeSherbet",
"ItemSodaPurple",
"ItemSodaMocha",
"ItemSodaBurst",
"ItemSodaRbull",
"FoodBioMeat",
"FoodMeeps",
"FoodSnooter",
"FoodWalkNSons",
"sardines_epoch",
"meatballs_epoch",
"scam_epoch",
"sweetcorn_epoch",
"honey_epoch",
"FAK",
"Towelette",
"HeatPack",
"ColdPack",
"acc_flashlight",
"acc_pointer_IR",
"optic_Arco",
"optic_Hamr",
"optic_Aco",
"optic_ACO_grn",
"optic_Aco_smg",
"optic_ACO_grn_smg",
"optic_Holosight",
"optic_Holosight_smg",
"optic_SOS",
"optic_MRCO",
"optic_DMS",
"optic_Yorris",
"optic_MRD",
"optic_LRPS",
"optic_NVS",
"optic_Nightstalker",
"optic_tws",
"optic_tws_mg",
"muzzle_snds_H",
"muzzle_snds_L",
"muzzle_snds_M",
"muzzle_snds_B",
"muzzle_snds_H_MG",
"muzzle_snds_acp",
"V_1_EPOCH","V_2_EPOCH","V_3_EPOCH","V_4_EPOCH","V_5_EPOCH","V_6_EPOCH","V_7_EPOCH","V_8_EPOCH","V_9_EPOCH","V_10_EPOCH","V_11_EPOCH","V_12_EPOCH","V_13_EPOCH","V_14_EPOCH","V_15_EPOCH","V_16_EPOCH","V_17_EPOCH","V_18_EPOCH","V_19_EPOCH","V_20_EPOCH","V_21_EPOCH","V_22_EPOCH","V_23_EPOCH","V_24_EPOCH","V_25_EPOCH","V_26_EPOCH","V_27_EPOCH","V_28_EPOCH","V_29_EPOCH","V_30_EPOCH","V_31_EPOCH","V_32_EPOCH","V_33_EPOCH","V_34_EPOCH","V_35_EPOCH","V_36_EPOCH","V_37_EPOCH","V_38_EPOCH","V_39_EPOCH","V_40_EPOCH",
"H_1_EPOCH","H_2_EPOCH","H_3_EPOCH","H_4_EPOCH","H_5_EPOCH","H_6_EPOCH","H_7_EPOCH","H_8_EPOCH","H_9_EPOCH","H_10_EPOCH","H_11_EPOCH","H_12_EPOCH","H_13_EPOCH","H_14_EPOCH","H_15_EPOCH","H_16_EPOCH","H_17_EPOCH","H_18_EPOCH","H_19_EPOCH","H_20_EPOCH","H_21_EPOCH","H_22_EPOCH","H_23_EPOCH","H_24_EPOCH","H_25_EPOCH","H_26_EPOCH","H_27_EPOCH","H_28_EPOCH","H_29_EPOCH","H_30_EPOCH","H_31_EPOCH","H_32_EPOCH","H_33_EPOCH","H_34_EPOCH","H_35_EPOCH","H_36_EPOCH","H_37_EPOCH","H_38_EPOCH","H_39_EPOCH","H_40_EPOCH","H_41_EPOCH","H_42_EPOCH","H_43_EPOCH","H_44_EPOCH","H_45_EPOCH","H_46_EPOCH","H_47_EPOCH","H_48_EPOCH","H_49_EPOCH","H_50_EPOCH","H_51_EPOCH","H_52_EPOCH","H_53_EPOCH","H_54_EPOCH","H_55_EPOCH","H_56_EPOCH","H_57_EPOCH","H_58_EPOCH","H_59_EPOCH","H_60_EPOCH","H_61_EPOCH","H_62_EPOCH","H_63_EPOCH","H_64_EPOCH","H_65_EPOCH","H_66_EPOCH","H_67_EPOCH","H_68_EPOCH","H_69_EPOCH","H_70_EPOCH","H_71_EPOCH","H_72_EPOCH","H_73_EPOCH","H_74_EPOCH","H_75_EPOCH","H_76_EPOCH","H_77_EPOCH","H_78_EPOCH","H_79_EPOCH","H_80_EPOCH","H_81_EPOCH","H_82_EPOCH","H_83_EPOCH","H_84_EPOCH","H_85_EPOCH","H_86_EPOCH","H_87_EPOCH","H_88_EPOCH","H_89_EPOCH","H_90_EPOCH","H_91_EPOCH","H_92_EPOCH","H_93_EPOCH","H_94_EPOCH","H_95_EPOCH","H_96_EPOCH","H_97_EPOCH","H_98_EPOCH","H_99_EPOCH","H_100_EPOCH","H_101_EPOCH","H_102_EPOCH","H_103_EPOCH","H_104_EPOCH","wolf_mask_epoch","pkin_mask_epoch"
]],[ 2, [						// INDUSTRIAL
"PaintCanBlk",
"PaintCanBlu",
"PaintCanBrn",
"PaintCanGrn",
"PaintCanOra",
"PaintCanPur",
"PaintCanRed",
"PaintCanTeal",
"PaintCanYel",
"WoodLog_EPOCH",
"KitStudWall",
"KitWoodFloor",
"KitWoodStairs",
"KitWoodRamp",
"KitFirePlace",
"KitTiPi",
"KitShelf",
"KitFoundation",
"JackKit",
"KitPlotPole",
"KitCinderWall",
"CinderBlocks",
"MortarBucket",
"ItemScraps",
"ItemCorrugated",
"ItemCorrugatedLg",
"PartPlankPack",
"CircuitParts",
"VehicleRepair",
"ItemMixOil",
"emptyjar_epoch",
"jerrycan_epoch",
"Heal_EPOCH",











"Defib_EPOCH",
"Repair_EPOCH",
"PartOre",
"ItemKiloHemp",
"WhiskeyNoodle",
"ItemSodaOrangeSherbet",
"ItemSodaPurple",
"ItemSodaMocha",
"ItemSodaBurst",
"ItemSodaRbull",
"FoodBioMeat",
"FoodMeeps",
"FoodSnooter",
"FoodWalkNSons",
"sardines_epoch",
"meatballs_epoch",
"scam_epoch",
"sweetcorn_epoch",
"honey_epoch",
"FAK",
"Towelette",
"HeatPack",
"ColdPack",
"acc_flashlight",
"ItemMap",
"ItemRadio",
"ItemCompass",
"ItemWatch"	
"acc_pointer_IR",
"optic_Arco",
"optic_Hamr",
"optic_Aco",
"optic_ACO_grn",
"optic_Aco_smg",
"optic_ACO_grn_smg",
"optic_Holosight",
"optic_Holosight_smg",
































"optic_SOS",
"optic_MRCO",
"optic_DMS",
"optic_Yorris",
"optic_MRD",
"optic_LRPS",
"optic_NVS",
"optic_Nightstalker",
"optic_tws",
"optic_tws_mg",
"muzzle_snds_H",

"muzzle_snds_L",
"muzzle_snds_M",






"muzzle_snds_B",
"muzzle_snds_H_MG",
"muzzle_snds_acp"
]],[ 3, [						// RESEARCH
"Heal_EPOCH",
"Defib_EPOCH",
"Repair_EPOCH",
"PartOre",
"ItemKiloHemp",
"WhiskeyNoodle",
"ItemSodaOrangeSherbet",
"ItemSodaPurple",
"ItemSodaMocha",
"ItemSodaBurst",
"ItemSodaRbull",
"FoodBioMeat",
"FoodMeeps",
"FoodSnooter",
"FoodWalkNSons",
"sardines_epoch",
"meatballs_epoch",
"scam_epoch",
"sweetcorn_epoch",
"honey_epoch",
"FAK",
"Towelette",
"HeatPack",
"ColdPack",
"acc_flashlight",
"acc_pointer_IR",
"optic_Arco",
"optic_Hamr",
"optic_Aco",
"optic_ACO_grn",
"optic_Aco_smg",
"optic_ACO_grn_smg",
"optic_Holosight",
"optic_Holosight_smg",
"ToolKit",
"ItemLockBox",

"optic_SOS",















































"optic_MRCO",
"optic_DMS",
"optic_Yorris",
"optic_MRD",
"optic_LRPS",
"optic_NVS",
"optic_Nightstalker",

"optic_tws",
"optic_tws_mg",
"muzzle_snds_H",
"muzzle_snds_L",
"muzzle_snds_M",
"muzzle_snds_B",
"muzzle_snds_H_MG",
"muzzle_snds_acp",
"V_1_EPOCH","V_2_EPOCH","V_3_EPOCH","V_4_EPOCH","V_5_EPOCH","V_6_EPOCH","V_7_EPOCH","V_8_EPOCH","V_9_EPOCH","V_10_EPOCH","V_11_EPOCH","V_12_EPOCH","V_13_EPOCH","V_14_EPOCH","V_15_EPOCH","V_16_EPOCH","V_17_EPOCH","V_18_EPOCH","V_19_EPOCH","V_20_EPOCH","V_21_EPOCH","V_22_EPOCH","V_23_EPOCH","V_24_EPOCH","V_25_EPOCH","V_26_EPOCH","V_27_EPOCH","V_28_EPOCH","V_29_EPOCH","V_30_EPOCH","V_31_EPOCH","V_32_EPOCH","V_33_EPOCH","V_34_EPOCH","V_35_EPOCH","V_36_EPOCH","V_37_EPOCH","V_38_EPOCH","V_39_EPOCH","V_40_EPOCH",
"H_1_EPOCH","H_2_EPOCH","H_3_EPOCH","H_4_EPOCH","H_5_EPOCH","H_6_EPOCH","H_7_EPOCH","H_8_EPOCH","H_9_EPOCH","H_10_EPOCH","H_11_EPOCH","H_12_EPOCH","H_13_EPOCH","H_14_EPOCH","H_15_EPOCH","H_16_EPOCH","H_17_EPOCH","H_18_EPOCH","H_19_EPOCH","H_20_EPOCH","H_21_EPOCH","H_22_EPOCH","H_23_EPOCH","H_24_EPOCH","H_25_EPOCH","H_26_EPOCH","H_27_EPOCH","H_28_EPOCH","H_29_EPOCH","H_30_EPOCH","H_31_EPOCH","H_32_EPOCH","H_33_EPOCH","H_34_EPOCH","H_35_EPOCH","H_36_EPOCH","H_37_EPOCH","H_38_EPOCH","H_39_EPOCH","H_40_EPOCH","H_41_EPOCH","H_42_EPOCH","H_43_EPOCH","H_44_EPOCH","H_45_EPOCH","H_46_EPOCH","H_47_EPOCH","H_48_EPOCH","H_49_EPOCH","H_50_EPOCH","H_51_EPOCH","H_52_EPOCH","H_53_EPOCH","H_54_EPOCH","H_55_EPOCH","H_56_EPOCH","H_57_EPOCH","H_58_EPOCH","H_59_EPOCH","H_60_EPOCH","H_61_EPOCH","H_62_EPOCH","H_63_EPOCH","H_64_EPOCH","H_65_EPOCH","H_66_EPOCH","H_67_EPOCH","H_68_EPOCH","H_69_EPOCH","H_70_EPOCH","H_71_EPOCH","H_72_EPOCH","H_73_EPOCH","H_74_EPOCH","H_75_EPOCH","H_76_EPOCH","H_77_EPOCH","H_78_EPOCH","H_79_EPOCH","H_80_EPOCH","H_81_EPOCH","H_82_EPOCH","H_83_EPOCH","H_84_EPOCH","H_85_EPOCH","H_86_EPOCH","H_87_EPOCH","H_88_EPOCH","H_89_EPOCH","H_90_EPOCH","H_91_EPOCH","H_92_EPOCH","H_93_EPOCH","H_94_EPOCH","H_95_EPOCH","H_96_EPOCH","H_97_EPOCH","H_98_EPOCH","H_99_EPOCH","H_100_EPOCH","H_101_EPOCH","H_102_EPOCH","H_103_EPOCH","H_104_EPOCH","wolf_mask_epoch","pkin_mask_epoch"
]]];


//here place backpacks, parachutes and packed drones/stationary
//used with addBackpackCargoGlobal
//"lootBackpack_list" array of [class, [backpacklist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								backpacklist: list of backpack class names
lootBackpack_list = [
[ 0, [							// CIVIL

"B_AssaultPack_cbr",
"B_AssaultPack_dgtl",
"B_AssaultPack_khk",
"B_AssaultPack_mcamo",
"B_AssaultPack_ocamo",
"B_AssaultPack_rgr",
"B_AssaultPack_sgg",
"B_Carryall_cbr",
"B_Carryall_khk",
"B_Carryall_mcamo",
"B_Carryall_ocamo",
"B_Carryall_oli",
"B_Carryall_oucamo",
"B_FieldPack_blk",
"B_FieldPack_cbr",
"B_FieldPack_khk",
"B_FieldPack_ocamo",
"B_FieldPack_oli",
"B_FieldPack_oucamo",
"B_Kitbag_cbr",
"B_Kitbag_mcamo",
"B_Kitbag_rgr",
"B_Kitbag_sgg",
"B_Parachute",
"B_TacticalPack_blk",
"B_TacticalPack_mcamo",
"B_TacticalPack_ocamo",
"B_TacticalPack_oli",
"B_TacticalPack_rgr",
"smallbackpack_red_epoch",
"smallbackpack_green_epoch",
"smallbackpack_teal_epoch",
"smallbackpack_pink_epoch"
"V_1_EPOCH","V_2_EPOCH","V_3_EPOCH","V_4_EPOCH","V_5_EPOCH","V_6_EPOCH","V_7_EPOCH","V_8_EPOCH","V_9_EPOCH","V_10_EPOCH","V_11_EPOCH","V_12_EPOCH","V_13_EPOCH","V_14_EPOCH","V_15_EPOCH","V_16_EPOCH","V_17_EPOCH","V_18_EPOCH","V_19_EPOCH","V_20_EPOCH","V_21_EPOCH","V_22_EPOCH","V_23_EPOCH","V_24_EPOCH","V_25_EPOCH","V_26_EPOCH","V_27_EPOCH","V_28_EPOCH","V_29_EPOCH","V_30_EPOCH","V_31_EPOCH","V_32_EPOCH","V_33_EPOCH","V_34_EPOCH","V_35_EPOCH","V_36_EPOCH","V_37_EPOCH","V_38_EPOCH","V_39_EPOCH","V_40_EPOCH",
"H_1_EPOCH","H_2_EPOCH","H_3_EPOCH","H_4_EPOCH","H_5_EPOCH","H_6_EPOCH","H_7_EPOCH","H_8_EPOCH","H_9_EPOCH","H_10_EPOCH","H_11_EPOCH","H_12_EPOCH","H_13_EPOCH","H_14_EPOCH","H_15_EPOCH","H_16_EPOCH","H_17_EPOCH","H_18_EPOCH","H_19_EPOCH","H_20_EPOCH","H_21_EPOCH","H_22_EPOCH","H_23_EPOCH","H_24_EPOCH","H_25_EPOCH","H_26_EPOCH","H_27_EPOCH","H_28_EPOCH","H_29_EPOCH","H_30_EPOCH","H_31_EPOCH","H_32_EPOCH","H_33_EPOCH","H_34_EPOCH","H_35_EPOCH","H_36_EPOCH","H_37_EPOCH","H_38_EPOCH","H_39_EPOCH","H_40_EPOCH","H_41_EPOCH","H_42_EPOCH","H_43_EPOCH","H_44_EPOCH","H_45_EPOCH","H_46_EPOCH","H_47_EPOCH","H_48_EPOCH","H_49_EPOCH","H_50_EPOCH","H_51_EPOCH","H_52_EPOCH","H_53_EPOCH","H_54_EPOCH","H_55_EPOCH","H_56_EPOCH","H_57_EPOCH","H_58_EPOCH","H_59_EPOCH","H_60_EPOCH","H_61_EPOCH","H_62_EPOCH","H_63_EPOCH","H_64_EPOCH","H_65_EPOCH","H_66_EPOCH","H_67_EPOCH","H_68_EPOCH","H_69_EPOCH","H_70_EPOCH","H_71_EPOCH","H_72_EPOCH","H_73_EPOCH","H_74_EPOCH","H_75_EPOCH","H_76_EPOCH","H_77_EPOCH","H_78_EPOCH","H_79_EPOCH","H_80_EPOCH","H_81_EPOCH","H_82_EPOCH","H_83_EPOCH","H_84_EPOCH","H_85_EPOCH","H_86_EPOCH","H_87_EPOCH","H_88_EPOCH","H_89_EPOCH","H_90_EPOCH","H_91_EPOCH","H_92_EPOCH","H_93_EPOCH","H_94_EPOCH","H_95_EPOCH","H_96_EPOCH","H_97_EPOCH","H_98_EPOCH","H_99_EPOCH","H_100_EPOCH","H_101_EPOCH","H_102_EPOCH","H_103_EPOCH","H_104_EPOCH","wolf_mask_epoch","pkin_mask_epoch",
"C_Offroad_01_EPOCH",
"C_Quadbike_01_EPOCH",
"C_Hatchback_01_EPOCH",
"C_Hatchback_02_EPOCH",
"C_SUV_01_EPOCH",
"C_Van_01_box_EPOCH",
"C_Van_01_transport_EPOCH",
"B_SDV_01_EPOCH",
"B_MRAP_01_EPOCH",
"B_Truck_01_transport_EPOCH",
"B_Truck_01_covered_EPOCH",
"B_Truck_01_mover_EPOCH",
"B_Truck_01_box_EPOCH",
"O_Truck_02_covered_EPOCH",
"O_Truck_02_transport_EPOCH",
"O_Truck_03_covered_EPOCH",
"O_Truck_02_box_EPOCH",
"ebike_epoch",
"C_Rubberboat_EPOCH",
"C_Rubberboat_02_EPOCH",
"C_Rubberboat_03_EPOCH",
"C_Rubberboat_04_EPOCH",
"C_Boat_Civil_01_EPOCH",
"C_Boat_Civil_01_police_EPOCH",
"C_Boat_Civil_01_rescue_EPOCH",
"jetski_epoch",
"B_Heli_Light_01_EPOCH",
"O_Heli_Light_02_unarmed_EPOCH",
"I_Heli_Transport_02_EPOCH",
"I_Heli_light_03_unarmed_EPOCH",
"O_Heli_Transport_04_EPOCH",
"O_Heli_Transport_04_bench_EPOCH",
"O_Heli_Transport_04_box_EPOCH",
"O_Heli_Transport_04_covered_EPOCH",
"B_Heli_Transport_03_unarmed_EPOCH",









































]],[ 1, [						// MILITARY
"B_AssaultPack_cbr",
"B_AssaultPack_dgtl",
"B_AssaultPack_khk",
"B_AssaultPack_mcamo",
"B_AssaultPack_ocamo",
"B_AssaultPack_rgr",
"B_AssaultPack_sgg",











"B_Carryall_cbr",
"B_Carryall_khk",
"B_Carryall_mcamo",
"B_Carryall_ocamo",
"B_Carryall_oli",
"B_Carryall_oucamo",
"B_FieldPack_blk",
"B_FieldPack_cbr",
"B_FieldPack_khk",
"B_FieldPack_ocamo",
"B_FieldPack_oli",
"B_FieldPack_oucamo",







"B_Kitbag_cbr",
"B_Kitbag_mcamo",
"B_Kitbag_rgr",
"B_Kitbag_sgg",
"B_Parachute",
"B_TacticalPack_blk",
"B_TacticalPack_mcamo",
"B_TacticalPack_ocamo",
"B_TacticalPack_oli",
"B_TacticalPack_rgr",



"smallbackpack_red_epoch",
"smallbackpack_green_epoch",
"smallbackpack_teal_epoch",
"smallbackpack_pink_epoch"
]],[ 2, [						// INDUSTRIAL

"B_AssaultPack_cbr",
"B_AssaultPack_dgtl",
"B_AssaultPack_khk",
"B_AssaultPack_mcamo",
"B_AssaultPack_ocamo",
"B_AssaultPack_rgr",
"B_AssaultPack_sgg",
"B_Carryall_cbr",
"B_Carryall_khk",
"B_Carryall_mcamo",
"B_Carryall_ocamo",
"B_Carryall_oli",
"B_Carryall_oucamo",
"B_FieldPack_blk",
"B_FieldPack_cbr",
"B_FieldPack_khk",
"B_FieldPack_ocamo",
"B_FieldPack_oli",
"B_FieldPack_oucamo",
"B_Kitbag_cbr",
"B_Kitbag_mcamo",
"B_Kitbag_rgr",
"B_Kitbag_sgg",
"B_Parachute",
"B_TacticalPack_blk",
"B_TacticalPack_mcamo",
"B_TacticalPack_ocamo",
"B_TacticalPack_oli",
"B_TacticalPack_rgr",



"smallbackpack_red_epoch",
"smallbackpack_green_epoch",
"smallbackpack_teal_epoch",
"smallbackpack_pink_epoch"
]],[ 3, [						// RESEARCH








"B_AssaultPack_cbr",
"B_AssaultPack_dgtl",
"B_AssaultPack_khk",
"B_AssaultPack_mcamo",
"B_AssaultPack_ocamo",
"B_AssaultPack_rgr",
"B_AssaultPack_sgg",
"B_Carryall_cbr",
"B_Carryall_khk",
"B_Carryall_mcamo",
"B_Carryall_ocamo",
"B_Carryall_oli",
"B_Carryall_oucamo",
"B_FieldPack_blk",
"B_FieldPack_cbr",
"B_FieldPack_khk",
"B_FieldPack_ocamo",
"B_FieldPack_oli",
"B_FieldPack_oucamo",
"B_Kitbag_cbr",
"B_Kitbag_mcamo",
"B_Kitbag_rgr",
"B_Kitbag_sgg",
"B_Parachute",
"B_TacticalPack_blk",
"B_TacticalPack_mcamo",
"B_TacticalPack_ocamo",
"B_TacticalPack_oli",
"B_TacticalPack_rgr",
"smallbackpack_red_epoch",
"smallbackpack_green_epoch",
"smallbackpack_teal_epoch",
"smallbackpack_pink_epoch"
]]];


//here place any other objects(ex.: Land_Basket_F, Box_East_Wps_F, Land_Can_V3_F, ...)
//used with createVehicle directly
//"lootworldObject_list" array of [class, [objectlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								objectlist	: list of worldobject class names
lootworldObject_list = [
[ 0, [							// CIVIL






]],[ 1, [						// MILITARY






]],[ 2, [						// INDUSTRIAL








]],[ 3, [						// RESEARCH






]]];
