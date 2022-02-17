//DEATHMATCH
new DMOda[MAX_PLAYERS];
new TDMOda[MAX_PLAYERS];
new GroveTakim;
new BallasTakim;
new VagosTakim;
new AztecasTakim;
new LVPDArena;
new RCArena;
new GhostArena;
new HeadshotArena;
new JeffersonArena;
//GENEL SUNUCU
new Logged[MAX_PLAYERS];
new actors[4];
new aracid[25];
new AdminArea[MAX_PLAYERS];
//new PursuitCar[9];
new Float:LastPosition[MAX_PLAYERS][3];
new Float:LastCarPos[MAX_PLAYERS][3];
new OyuncuBilgi[MAX_PLAYERS][OyuncuVerileri];
new MySQL: g_SQL;
new Reconnect[MAX_PLAYERS] = 0;
//SUNUCU SİSTEM
//new RaporSebep[MAX_PLAYERS];
//new RaporID[MAX_PLAYERS];
new SpawnKorumasi[MAX_PLAYERS];
new Bakim;
new PlayerText:Textdraw0[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
new PlayerText:AdminDuty[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
new AnimSpec[MAX_PLAYERS];
new Polis;
new baseurl[] = "http://185.132.124.21/nightdm/";
new Suclu;
new ToplamPursuitPlayer;
//ANTİ HİLE
new BindigiArac[MAX_PLAYERS];
new cbug[MAX_PLAYERS];
new Airbreak[MAX_PLAYERS];
new HeadAimbot[MAX_PLAYERS];
new Aimbot[MAX_PLAYERS];
new Float:HitPos[MAX_PLAYERS][3];
new SilentWarning[MAX_PLAYERS];
new SilentTimer[MAX_PLAYERS];
new Kill[MAX_PLAYERS];
new NoReloading[MAX_PLAYERS];
new NoReloading2[MAX_PLAYERS];
new HasarAlanBolge[MAX_PLAYERS];
new OldSpeed[MAX_PLAYERS];
new Float:Hasar[MAX_PLAYERS];
new CurrentWeapon[MAX_PLAYERS];
new CurrentAmmo[MAX_PLAYERS];
//TEXDRAWS
new PlayerText:Hud[MAX_PLAYERS][8];

new const g_aWeaponSlots[] =
{
	0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 10, 10, 10, 10, 10, 10, 8, 8, 8, 0, 0, 0, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 4, 6, 6, 7, 7, 7, 7, 8, 12, 9, 9, 9, 11, 11, 11
};

new stock g_arrVehicleNames[][] = {
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster",
    "Stretch", "Manana", "Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer",
    "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach",
    "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", "Seasparrow",
    "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
    "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic",
    "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton",
    "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher",
    "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick",
    "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher",
    "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt", "Tanker", "Roadtrain",
    "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck",
    "Fortune", "Cadrona", "SWAT Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan",
    "Blade", "Streak", "Freight", "Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder",
    "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite", "Windsor", "Monster", "Monster",
    "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30",
    "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
    "Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "LSPD Car", "SFPD Car", "LVPD Car",
    "Police Rancher", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs",
    "Boxville", "Tiller", "Utility Trailer"
};
new Skins[256] =
{
	2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
	30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
	61, 62, 63, 64, 65, 66, 68, 69, 72, 73, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102,
	103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120,
	121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 140, 141, 142, 143, 144, 145, 146,
	147, 148, 150, 151, 152, 153, 154, 155, 156, 158, 159, 160, 161, 162, 167, 168, 169, 170, 171, 173, 174, 175, 176,
	177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207,
	208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 219, 220, 221, 222, 223, 224, 225, 226, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240,
	241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 268, 272, 273, 289,
	290, 291, 292, 293, 294, 295, 296, 297, 298, 299
};

new RandomLobbySpawn[5] =
{
    0xFF0000FF, 0x0000FFFF, 0xFFFF00FF, 0x008000FF, 0x800080FF
};
new VipSkin[6] =
{
	20001, 20002, 20003, 20004, 20005, 20006
};

new Float:AksesuarData[MAX_PLAYERS][10][10];