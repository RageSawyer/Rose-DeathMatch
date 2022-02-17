stock IpCek(playerid) {
	static dongu[16];
	GetPlayerIp(playerid, dongu, sizeof(dongu));
	return dongu;
}

stock IpKontroll(ip[])
{
    new dongu = 0;
    for(new i = 0; i < MAX_PLAYERS; i++) if(IsPlayerConnected(i) && !strcmp(IpCek(i),ip)) dongu++;
    return dongu;
}

stock GetIP(playerid)
{
	new pip[16];
	GetPlayerIp(playerid, pip, sizeof(pip));
	return pip;
}

stock randomEx(min, max)
{
	return random(max-min+1)+min;
}

stock GetVehicleSpeed(vehicleid,UseMPH = 0)
{
	new Float:speed_x,Float:speed_y,Float:speed_z,Float:temp_speed;
	GetVehicleVelocity(vehicleid,speed_x,speed_y,speed_z);
	if(UseMPH == 0)
	{
	    temp_speed = floatsqroot(((speed_x*speed_x)+(speed_y*speed_y))+(speed_z*speed_z))*136.666667;
	} else {
	    temp_speed = floatsqroot(((speed_x*speed_x)+(speed_y*speed_y))+(speed_z*speed_z))*85.4166672;
	}
	new hiz = floatround(temp_speed,floatround_round);return hiz;
}

stock ReturnMapName(mapid)
{
	new mapstr[56];
	switch(mapid)
	{
	    case 0: mapstr = "LVPD";
	    case 1: mapstr = "Ghost Town";
        case 2: mapstr = "RC Battlefield";
	}
	return mapstr;
}

stock IsVehicleBike(vehicleid)
{
	new Bike[] = { 509, 481, 510, 462, 448,522, 581, 521, 523, 463, 586, 468, 471 };

	for (new i = 0; i < sizeof(Bike); i++)
    {
        if (GetVehicleModel(vehicleid) == Bike[i]) return 1;
    }
	return 0;
}

stock GetEngineStatus(vehicleid)
{
	static
	    engine,
	    lights,
	    alarm,
	    doors,
	    bonnet,
	    boot,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);

	if (engine != 1)
		return 0;

	return 1;
}

stock SetEngineStatus(vehicleid, status)
{
	static
	    engine,
	    lights,
	    alarm,
	    doors,
	    bonnet,
	    boot,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	return SetVehicleParamsEx(vehicleid, status, lights, alarm, doors, bonnet, boot, objective);
}

stock Log_Write(const path[], const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    File:file,
	    string[1024]
	;
	if ((start = strfind(path, "/")) != -1) {
	    strmid(string, path, 0, start + 1);

	    if (!fexist(string))
	        return printf("** Uyari: Dosya \"%s\" bulunmuyor.", string);
	}
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	file = fopen(path, io_append);

	if (!file)
	    return 0;

	if (args > 8)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 8); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 1024
		#emit PUSH.C string
		#emit PUSH.C args
		#emit SYSREQ.C format

		fwrite(file, string);
		fwrite(file, "\r\n");
		fclose(file);

		#emit LCTRL 5
		#emit SCTRL 4
		#emit RETN
	}
	fwrite(file, str);
	fwrite(file, "\r\n");
	fclose(file);

	return 1;
}
stock GetWeapon(playerid)
{
	new weaponid = GetPlayerWeapon(playerid);
	if (1 <= weaponid <= 46 && OyuncuBilgi[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
 		return weaponid;
	return 0;
}

stock GetWeaponModel(weaponid) {
    new const g_aWeaponModels[] = {
		0, 331, 333, 334, 335, 336, 337, 338, 339, 341, 321, 322, 323, 324,
		325, 326, 342, 343, 344, 0, 0, 0, 346, 347, 348, 349, 350, 351, 352,
		353, 355, 356, 372, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366,
		367, 368, 368, 371
    };
    if (1 <= weaponid <= 46)
        return g_aWeaponModels[weaponid];

	return 0;
}

stock IsWeaponWithAmmo(weaponid)
{
	switch(weaponid)
	{

		case 16..18, 22..39, 41..42: return 1;
		default: return 0;
	}
	return 0;

}

stock GetPlayerWeaponAmmo(playerid,weaponid)
{	
	for(new i; i<13; i++) GetPlayerWeaponData(playerid,i,OyuncuBilgi[playerid][pGuns][i],OyuncuBilgi[playerid][pAmmo][i]);
	for(new i; i<13; i++)
	{

		if(weaponid == OyuncuBilgi[playerid][pGuns][i]) return OyuncuBilgi[playerid][pAmmo][i];
	}
	return 0;
}

stock SilahSifirla(playerid)
{
	for(new i = 0; i < 13; i++)
	{
		OyuncuBilgi[playerid][pGuns][i] = 0;
		OyuncuBilgi[playerid][pAmmo][i] = 0;
	}
	ResetPlayerWeapons(playerid);
	return 1;
}

stock GiveWeapon(playerid, weaponid, ammo)
{
	if (weaponid < 0 || weaponid > 46)
	    return 0;
	OyuncuBilgi[playerid][pGuns][g_aWeaponSlots[weaponid]] = weaponid;
	OyuncuBilgi[playerid][pAmmo][g_aWeaponSlots[weaponid]] += ammo;
	GivePlayerWeapon(playerid, weaponid, ammo);
	return 1;
}

stock ParaVer(playerid,miktar,bildirim = 1)
{
	OyuncuBilgi[playerid][pPara] += miktar;
	GivePlayerMoney(playerid,miktar);
	new str[50];
	if (bildirim == 1 && miktar > -1)
	{
	    format(str,sizeof(str), "~g~+%s",FormatNumber(miktar));
	    GameTextForPlayer(playerid,str,1000,1);
	}
 	if (bildirim == 1 && miktar < 0)
 	{
 	    format(str,sizeof(str), "~r~%s",FormatNumber(miktar));
	    GameTextForPlayer(playerid,str,1000,1);
 	}
	return 1;
}

stock FormatNumber(number, prefix[] = "$")
{
	static
		value[32],
		length;

	format(value, sizeof(value), "%d", (number < 0) ? (-number) : (number));

	if ((length = strlen(value)) > 3)
	{
		for (new i = length, l = 0; --i >= 0; l ++) {
		    if ((l > 0) && (l % 3 == 0)) strins(value, ",", i + 1);
		}
	}
	if (prefix[0] != 0)
	    strins(value, prefix, 0);

	if (number < 0)
		strins(value, "-", 0);

	return value;
}

stock AdminMessage(color, const str[], {Float,_}:...)
{
	static
	    args,
	    start,
	    end,
	    string[144]
	;
	#emit LOAD.S.pri 8
	#emit STOR.pri args

	if (args > 8)
	{
		#emit ADDR.pri str
		#emit STOR.pri start

	    for (end = start + (args - 8); end > start; end -= 4)
		{
	        #emit LREF.pri end
	        #emit PUSH.pri
		}
		#emit PUSH.S str
		#emit PUSH.C 144
		#emit PUSH.C string

		#emit LOAD.S.pri 8
		#emit ADD.C 4
		#emit PUSH.pri

		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

        foreach (new i : Player)
		{
			if (OyuncuBilgi[i][pAdmin] >= 1) {
  				SendClientMessage(i, color, string);
			}
		}
		return 1;
	}
    foreach (new i : Player)
	{
		if (OyuncuBilgi[i][pAdmin] >= 1) {
			SendClientMessage(i, color, str);
		}
	}
	return 1;
}

stock SendClientMessageToAllEx(color, const text[], {Float, _}:...)
{
    static
        args,
        str[512];
    if ((args = numargs()) == 2)
    {
        SendClientMessageToAll(color, text);
    }
    else
    {
        while (--args >= 2)
        {
            #emit LCTRL 5
            #emit LOAD.alt args
            #emit SHL.C.alt 2
            #emit ADD.C 12
            #emit ADD
            #emit LOAD.I
            #emit PUSH.pri
        }
        #emit PUSH.S text
        #emit PUSH.C 144
        #emit PUSH.C str
        #emit LOAD.S.pri 8
        #emit ADD.C 4
        #emit PUSH.pri
        #emit SYSREQ.C format
        #emit LCTRL 5
        #emit SCTRL 4

        SendClientMessageToAll(color, str);

        #emit RETN
    }
    return 1;
}

stock GetPlayerSpeed(playerid)
{
    new Float:ST[4];
    if(IsPlayerInAnyVehicle(playerid))
    GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
    else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
    ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 179.28625;
    return floatround(ST[3]);
}

stock ArenaSpawn(playerid)
{
    new id = DMOda[playerid];
    SpawnKorumasi1(playerid);
    if (OyuncuBilgi[playerid][pVip] == 1)
    {
        GiveWeapon(playerid, 34, 1000);
        SetPlayerArmour(playerid, 100);
    }
    if(DMOda[playerid] != 4 && OyuncuBilgi[playerid][pVip] == 0)
    {
		SetPlayerArmour(playerid, 0);
	}
    if (OyuncuBilgi[playerid][pSniper] == 1)
    {
        GiveWeapon(playerid, 34, 1000);
    }
    if (id == 0)
    {
	    new rand = random(21);
        switch(rand)
        {
            case 0:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 288.9128,167.5972,1007.1719);
                SetPlayerFacingAngle(playerid, 352.6157);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 1:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 300.4109,174.6213,1007.1719);
                SetPlayerFacingAngle(playerid, 86.4076);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 2:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 301.0039,191.1532,1007.1719);
                SetPlayerFacingAngle(playerid, 89.7904);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 3:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 267.7315,186.6658,1008.1719);
                SetPlayerFacingAngle(playerid, 0.1762);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 4:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 257.6199,185.4793,1008.1719);
                SetPlayerFacingAngle(playerid, 2.1607);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 5:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 252.0519,186.1540,1008.1719);
                SetPlayerFacingAngle(playerid, 356.2478);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 6:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 238.2363,195.8101,1008.1719);
                SetPlayerFacingAngle(playerid, 181.8474);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 7:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 242.0517,166.6752,1003.0300);
                SetPlayerFacingAngle(playerid, 87.9510);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 8:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 242.0214,148.3530,1003.0234);
                SetPlayerFacingAngle(playerid, 359.7179);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 9:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 238.6016,139.1020,1003.0234);
                SetPlayerFacingAngle(playerid, 0.9074);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 10:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 230.2658,147.0368,1003.0234);
                SetPlayerFacingAngle(playerid, 271.7110);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 11:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 231.6093,161.5845,1003.0234);
                SetPlayerFacingAngle(playerid, 270.0805);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 12:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 226.2087,141.3884,1003.0234);
                SetPlayerFacingAngle(playerid, 359.4452);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 13:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 216.7773,168.6511,1003.0234);
                SetPlayerFacingAngle(playerid, 89.3088);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 14:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 210.8166,186.5771,1003.0313);
                SetPlayerFacingAngle(playerid, 177.7508);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 15:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 189.5872,179.3067,1003.0234);
                SetPlayerFacingAngle(playerid, 268.7633);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 16:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 197.4069,168.7875,1003.0234);
                SetPlayerFacingAngle(playerid, 266.5294);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 17:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 189.1085,158.0906,1003.0234);
                SetPlayerFacingAngle(playerid, 268.0322);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 18:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 206.9133,157.2887,1003.0234);
                SetPlayerFacingAngle(playerid, 0.0253);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 19:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 206.9498,179.8804,1003.0313);
                SetPlayerFacingAngle(playerid, 180.5070);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 20:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 228.6821,182.6817,1003.0313);
                SetPlayerFacingAngle(playerid, 180.9247);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
            case 21:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 231.8010,171.3473,1003.0234);
                SetPlayerFacingAngle(playerid, 85.1077);
                SetPlayerInterior(playerid, 3);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 0;
            }
        }
    }
    else if (id == 1)
    {
        new rand = random(6);
        switch(rand)
        {
            case 0:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2216.1829,-1149.5088,1025.7969);
           	    SetPlayerFacingAngle(playerid, 300.7219);
                SetPlayerInterior(playerid, 15);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 33, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 1;
            }
            case 1:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2240.9519,-1193.5115,1029.7969);
               	SetPlayerFacingAngle(playerid, 3.6791);
                SetPlayerInterior(playerid, 15);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 33, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 1;
            }
            case 2:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2234.7319,-1159.3888,1029.7969);
               	SetPlayerFacingAngle(playerid, 270.6182);
                SetPlayerInterior(playerid, 15);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 33, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 1;
            }
            case 3:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2234.0752,-1170.9261,1029.7969);
               	SetPlayerFacingAngle(playerid, 270.6182);
                SetPlayerInterior(playerid, 15);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 33, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 1;
            }
            case 4:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2239.8977,-1188.0165,1033.7969);
                SetPlayerFacingAngle(playerid, 258.4217);
                SetPlayerInterior(playerid, 15);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 33, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 1;
            }
            case 5:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2225.8901,-1182.4353,1029.7969);
               	SetPlayerFacingAngle(playerid, 166.6141);
                SetPlayerInterior(playerid, 15);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 33, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 1;
            }
            case 6:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2186.6885,-1182.1509,1033.7969);
               	SetPlayerFacingAngle(playerid, 201.6845);
                SetPlayerInterior(playerid, 15);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 33, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 1;
            }
        }
    }
    else if (id == 2)
    {
	    new rand = random(5);
        switch(rand)
        {
            case 0:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -975.1069,1061.2255,1345.6719);
                SetPlayerFacingAngle(playerid, 93.5594);
                SetPlayerInterior(playerid, 10);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 34, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 2;
            }
            case 1:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -1130.9933,1057.7678,1346.4141);
                SetPlayerFacingAngle(playerid, 269.3412);
                SetPlayerInterior(playerid, 10);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 34, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 2;
            }
            case 2:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -1084.8049,1042.5554,1343.4354);
                SetPlayerFacingAngle(playerid, 301.9282);
                SetPlayerInterior(playerid, 10);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 34, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 2;
            }
            case 3:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -1038.9807,1049.7030,1342.1497);
                SetPlayerFacingAngle(playerid, 294.7213);
                SetPlayerInterior(playerid, 10);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 34, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 2;
            }
            case 4:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -973.8306,1027.6724,1345.0436);
                SetPlayerFacingAngle(playerid, 355.1951);
                SetPlayerInterior(playerid, 10);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 34, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 2;
            }
            case 5:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -973.0900,1088.9197,1344.9883);
                SetPlayerFacingAngle(playerid, 86.3523);
                SetPlayerInterior(playerid, 10);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 25, 1000);
                GiveWeapon(playerid, 34, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 2;
            }
        }
    }
    else if (id == 3)
    {
	    new rand = random(5);
        switch(rand)
        {
            case 0:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -334.6820,2219.2334,42.4877);
                SetPlayerFacingAngle(playerid, 103.0763);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 3;
            }
            case 1:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -377.4261,2190.9717,42.4873);
                SetPlayerFacingAngle(playerid, 6.3598);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 3;
            }
            case 2:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -406.3052,2200.4971,42.4873);
                SetPlayerFacingAngle(playerid, 6.4643);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 3;
            }
            case 3:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -418.1255,2252.5798,42.4297);
                SetPlayerFacingAngle(playerid, 282.3857);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 3;
            }
            case 4:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -379.3675,2271.5833,42.0037);
                SetPlayerFacingAngle(playerid, 165.7202);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 3;
            }
        }
    }
    else if (id == 4)
    {
	    new rand = random(5);
        switch(rand)
        {
            case 0:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -334.6820,2219.2334,42.4877);
                SetPlayerFacingAngle(playerid, 103.0763);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 4;
            }
            case 1:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -377.4261,2190.9717,42.4873);
                SetPlayerFacingAngle(playerid, 6.3598);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 4;
            }
            case 2:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -406.3052,2200.4971,42.4873);
                SetPlayerFacingAngle(playerid, 6.4643);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 4;
            }
            case 3:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -418.1255,2252.5798,42.4297);
                SetPlayerFacingAngle(playerid, 282.3857);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 4;
            }
            case 4:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, -379.3675,2271.5833,42.0037);
                SetPlayerFacingAngle(playerid, 165.7202);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, id+10);
                SetPlayerTeam(playerid, NO_TEAM);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 24, 1000);
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = 4;
            }
        }
    }
    return 1;
}

stock TDMArenaSpawn(playerid)
{
    new id = TDMOda[playerid];
    SpawnKorumasi1(playerid);
    if (id == 0)
    {
	    new rand = random(2);
        switch(rand)
        {
            case 0:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2304.6807,-1649.2137,14.5667);
           	    SetPlayerFacingAngle(playerid, 177.0397);
           	    SetPlayerColor(playerid, COLOR_GROVE);
                SetPlayerInterior(playerid, 0);
                SetPlayerArmour(playerid, 50);
                SetPlayerVirtualWorld(playerid, 10);
                new skin = random(3);
                switch(skin)
                {
				    case 0:
				    {
					    SetPlayerSkin(playerid, 105);
				    }
				    case 1:
				    {
					    SetPlayerSkin(playerid, 106);
				    }
				    case 2:
				    {
					    SetPlayerSkin(playerid, 107);
				    }
				}
                SetPlayerTeam(playerid, 1);
                SetPlayerHealth(playerid, 100);
                SetPlayerArmour(playerid, 50);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                if (OyuncuBilgi[playerid][pVip] == 1)
                {
					GiveWeapon(playerid, 34, 1000);
					SetPlayerArmour(playerid, 100);
				}
				if (OyuncuBilgi[playerid][pSniper] == 1)
                {
                    GiveWeapon(playerid, 34, 1000);
                }
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = -1;
                TDMOda[playerid] = 0;
            }
            case 1:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2287.8521,-1669.5283,15.0146);
                SetPlayerColor(playerid, COLOR_GROVE);
                SetPlayerArmour(playerid, 50);
               	SetPlayerFacingAngle(playerid, 356.6625);
                SetPlayerInterior(playerid, 0);
                SetPlayerVirtualWorld(playerid, 10);
                new skin = random(3);
				switch(skin)
                {
				    case 0:
				    {
					    SetPlayerSkin(playerid, 105);
				    }
				    case 1:
				    {
					    SetPlayerSkin(playerid, 106);
				    }
				    case 2:
				    {
					    SetPlayerSkin(playerid, 107);
				    }
				}
                SetPlayerTeam(playerid, 1);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                if (OyuncuBilgi[playerid][pVip] == 1)
                {
					GiveWeapon(playerid, 34, 1000);
					SetPlayerArmour(playerid, 100);
				}
				if (OyuncuBilgi[playerid][pSniper] == 1)
                {
                    GiveWeapon(playerid, 34, 1000);
                }
                SetPlayerArmedWeapon(playerid, 0);
                DMOda[playerid] = -1;
                TDMOda[playerid] = 0;
            }
        }
    }
    if (id == 1)
    {
	    new rand = random(2);
        switch(rand)
        {
            case 0:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 2138.9136,-1431.2008,23.9886);
                SetPlayerColor(playerid, COLOR_BALLAS);
           	    SetPlayerFacingAngle(playerid, 90.1411);
           	    SetPlayerArmour(playerid, 50);
                SetPlayerInterior(playerid, 0);
                new skin = random(3);
				switch(skin)
                {
				    case 0:
				    {
					    SetPlayerSkin(playerid, 102);
				    }
				    case 1:
				    {
					    SetPlayerSkin(playerid, 103);
				    }
				    case 2:
				    {
					    SetPlayerSkin(playerid, 104);
				    }
				}
                SetPlayerVirtualWorld(playerid, 10);
                SetPlayerTeam(playerid, 2);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                if (OyuncuBilgi[playerid][pVip] == 1)
                {
					GiveWeapon(playerid, 34, 1000);
					SetPlayerArmour(playerid, 100);
				}
				if (OyuncuBilgi[playerid][pSniper] == 1)
                {
                    GiveWeapon(playerid, 34, 1000);
                }
                SetPlayerArmedWeapon(playerid, 0);
                TDMOda[playerid] = 1;
            }
            case 1:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerColor(playerid, COLOR_BALLAS);
                SetPlayerPos(playerid, 2138.8542,-1418.6515,23.9886);
               	SetPlayerFacingAngle(playerid, 94.0056);
               	SetPlayerArmour(playerid, 50);
                SetPlayerInterior(playerid, 0);
                new skin = random(3);
				switch(skin)
                {
				    case 0:
				    {
					    SetPlayerSkin(playerid, 102);
				    }
				    case 1:
				    {
					    SetPlayerSkin(playerid, 103);
				    }
				    case 2:
				    {
					    SetPlayerSkin(playerid, 104);
				    }
				}
                SetPlayerVirtualWorld(playerid, 10);
                SetPlayerTeam(playerid, 2);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                if (OyuncuBilgi[playerid][pVip] == 1)
                {
					GiveWeapon(playerid, 34, 1000);
					SetPlayerArmour(playerid, 100);
				}
				if (OyuncuBilgi[playerid][pSniper] == 1)
                {
                    GiveWeapon(playerid, 34, 1000);
                }
                SetPlayerArmedWeapon(playerid, 0);
                TDMOda[playerid] = 1;
            }
        }
    }
    if (id == 2)
    {
	    new rand = random(2);
        switch(rand)
        {
            case 0:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 1729.9923,-1862.2068,13.5766);
                SetPlayerColor(playerid, COLOR_VAGOS);
           	    SetPlayerFacingAngle(playerid, 90.1411);
           	    SetPlayerArmour(playerid, 50);
                SetPlayerInterior(playerid, 0);
                new skin = random(3);
				switch(skin)
                {
				    case 0:
				    {
					    SetPlayerSkin(playerid, 108);
				    }
				    case 1:
				    {
					    SetPlayerSkin(playerid, 109);
				    }
				    case 2:
				    {
					    SetPlayerSkin(playerid, 110);
				    }
				}
                SetPlayerVirtualWorld(playerid, 10);
                SetPlayerTeam(playerid, 3);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                if (OyuncuBilgi[playerid][pVip] == 1)
                {
					GiveWeapon(playerid, 34, 1000);
					SetPlayerArmour(playerid, 100);
				}
				if (OyuncuBilgi[playerid][pSniper] == 1)
                {
                    GiveWeapon(playerid, 34, 1000);
                }
                SetPlayerArmedWeapon(playerid, 0);
                TDMOda[playerid] = 2;
            }
            case 1:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerColor(playerid, COLOR_VAGOS);
                SetPlayerPos(playerid, 1722.9708,-1880.6815,13.5646);
               	SetPlayerFacingAngle(playerid, 359.6401);
               	SetPlayerArmour(playerid, 50);
                SetPlayerInterior(playerid, 0);
                new skin = random(3);
				switch(skin)
                {
				    case 0:
				    {
					    SetPlayerSkin(playerid, 108);
				    }
				    case 1:
				    {
					    SetPlayerSkin(playerid, 109);
				    }
				    case 2:
				    {
					    SetPlayerSkin(playerid, 110);
				    }
				}
                SetPlayerVirtualWorld(playerid, 10);
                SetPlayerTeam(playerid, 3);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                if (OyuncuBilgi[playerid][pVip] == 1)
                {
					GiveWeapon(playerid, 34, 1000);
					SetPlayerArmour(playerid, 100);
				}
				if (OyuncuBilgi[playerid][pSniper] == 1)
                {
                    GiveWeapon(playerid, 34, 1000);
                }
                SetPlayerArmedWeapon(playerid, 0);
                TDMOda[playerid] = 2;
            }
        }
    }
    if (id == 3)// Aztecas Spawn
    {
	    new rand = random(2);
        switch(rand)
        {
            case 0:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerPos(playerid, 1883.1622,-2009.0851,13.5469);
                SetPlayerColor(playerid, COLOR_AZTECAS);
           	    SetPlayerFacingAngle(playerid, 90.1411);
           	    SetPlayerArmour(playerid, 50);
                SetPlayerInterior(playerid, 0);
                new skin = random(3);
				switch(skin)
                {
				    case 0:
				    {
					    SetPlayerSkin(playerid, 114);
				    }
				    case 1:
				    {
					    SetPlayerSkin(playerid, 115);
				    }
				    case 2:
				    {
					    SetPlayerSkin(playerid, 116);
				    }
				}
                SetPlayerVirtualWorld(playerid, 10);
                SetPlayerTeam(playerid, 4);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                if (OyuncuBilgi[playerid][pVip] == 1)
                {
					GiveWeapon(playerid, 34, 1000);
					SetPlayerArmour(playerid, 100);
				}
				if (OyuncuBilgi[playerid][pSniper] == 1)
                {
                    GiveWeapon(playerid, 34, 1000);
                }
                SetPlayerArmedWeapon(playerid, 0);
                TDMOda[playerid] = 3;
            }
            case 1:
            {
                OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                SetPlayerColor(playerid, COLOR_VAGOS);
                SetPlayerPos(playerid, 1867.8344,-2007.7863,13.5469);
               	SetPlayerFacingAngle(playerid, 268.6210);
               	SetPlayerArmour(playerid, 50);
                SetPlayerInterior(playerid, 0);
                new skin = random(3);
				switch(skin)
                {
				    case 0:
				    {
					    SetPlayerSkin(playerid, 114);
				    }
				    case 1:
				    {
					    SetPlayerSkin(playerid, 115);
				    }
				    case 2:
				    {
					    SetPlayerSkin(playerid, 116);
				    }
				}
                SetPlayerVirtualWorld(playerid, 10);
                SetPlayerTeam(playerid, 4);
                SetPlayerHealth(playerid, 100);
                ResetPlayerWeapons(playerid);
                GiveWeapon(playerid, 31, 1000);
                GiveWeapon(playerid, 24, 1000);
                if (OyuncuBilgi[playerid][pVip] == 1)
                {
					GiveWeapon(playerid, 34, 1000);
					SetPlayerArmour(playerid, 100);
				}
				if (OyuncuBilgi[playerid][pSniper] == 1)
                {
                    GiveWeapon(playerid, 34, 1000);
                }
                SetPlayerArmedWeapon(playerid, 0);
                TDMOda[playerid] = 3;
            }
        }
    }
    return 1;
}

stock ChatSil(playerid)
{
	for (new i; i < 25; i++)
	{
	    SendClientMessage(playerid, 0xFFFFFFFF, "");
	}
	return 1;
}

stock SendClientMessageEx(playerid, color, const text[], {Float, _}:...)
{
	static
	    args,
	    str[144];

	if ((args = numargs()) == 3)
	{
	    SendClientMessage(playerid, color, text);
	}
	else
	{
		while (--args >= 3)
		{
			#emit LCTRL 5
			#emit LOAD.alt args
			#emit SHL.C.alt 2
			#emit ADD.C 12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S text
		#emit PUSH.C 144
		#emit PUSH.C str
		#emit PUSH.S 8
		#emit SYSREQ.C format
		#emit LCTRL 5
		#emit SCTRL 4

		SendClientMessage(playerid, color, str);

		#emit RETN
	}
	return 1;
}

stock RandomEx(min, max)
	return random(max - min) + min;


stock VeriSifirla(playerid)
{
	OyuncuBilgi[playerid][pArena] = 0;
	OyuncuBilgi[playerid][pAdmin] = 0;
	OyuncuBilgi[playerid][pAdminDuty] = 0;
	OyuncuBilgi[playerid][pOlme] = 0;
	OyuncuBilgi[playerid][pOldurme] = 0;
	OyuncuBilgi[playerid][pOynamaSaati] = 0;
	OyuncuBilgi[playerid][pEXP] = 0;
	OyuncuBilgi[playerid][pDakikaTimer] = 0;
	OyuncuBilgi[playerid][pPolis] = 0;
	OyuncuBilgi[playerid][pSuclu] = 0;
	OyuncuBilgi[playerid][pJetpack] = 0;
	OyuncuBilgi[playerid][pMute] = 0;
	OyuncuBilgi[playerid][pSniper] = 0;
	OyuncuBilgi[playerid][pVip] = 0;
	OyuncuBilgi[playerid][pSpecPM] = -1;
	OyuncuBilgi[playerid][pVipSure] = 0;
	OyuncuBilgi[playerid][pPara] = 2000;
	OyuncuBilgi[playerid][pSkin] = 60;
	OyuncuBilgi[playerid][pCan] = 100;
	OyuncuBilgi[playerid][pRcoin] = 0;
	OyuncuBilgi[playerid][pLevelExp] = 0;
	DMOda[playerid] = -1;
	TDMOda[playerid] = -1;
	Logged[playerid] = 0;
	BindigiArac[playerid] = -1;
	cbug[playerid] = 0;
	AdminArea[playerid] = 0;
	Airbreak[playerid] = 0;
	AnimSpec[playerid] = -1;
	OyuncuBilgi[playerid][Duelde] = false;
 	OyuncuBilgi[playerid][DuelRakip] = INVALID_PLAYER_ID;
	OyuncuBilgi[playerid][DuelSilah1] = 0;
	OyuncuBilgi[playerid][DuelSilah2] = 0;
	OyuncuBilgi[playerid][pSandikHakki] = 0;
	OyuncuBilgi[playerid][DuelMap] = 0;
	OyuncuBilgi[playerid][pKD] = 0;
	HeadAimbot[playerid] = 0;
	SetPlayerTeam(playerid, NO_TEAM);
	SetPVarInt(playerid,"killed",0);
	SetPVarInt(playerid, "LegalSpeed", 0);
    for (new j = 0; j < 10; j ++) 
    {
		OyuncuBilgi[playerid][pARenk][j] = 0;
	    AksesuarData[playerid][j][j] = 0.0;
	    OyuncuBilgi[playerid][pASlot][j] = 0;
	    OyuncuBilgi[playerid][pTSlot][j] = 0;
	    OyuncuBilgi[playerid][pABone][j] = 0;
    }
 	DeletePVar(playerid, "AksesuarEdit");
	return 1;
}

stock ResetStats(playerid)
{
	OyuncuBilgi[playerid][pArena] = 0;
	OyuncuBilgi[playerid][pAdmin] = 0;
	OyuncuBilgi[playerid][pAdminDuty] = 0;
	OyuncuBilgi[playerid][pOlme] = 0;
	OyuncuBilgi[playerid][pOldurme] = 0;
	OyuncuBilgi[playerid][pOynamaSaati] = 0;
	OyuncuBilgi[playerid][pEXP] = 0;
	OyuncuBilgi[playerid][pDakikaTimer] = 0;
	OyuncuBilgi[playerid][pPolis] = 0;
	OyuncuBilgi[playerid][pSuclu] = 0;
	OyuncuBilgi[playerid][pJetpack] = 0;
	OyuncuBilgi[playerid][pMute] = 0;
	OyuncuBilgi[playerid][pSniper] = 0;
	OyuncuBilgi[playerid][pVip] = 0;
	OyuncuBilgi[playerid][pSpecPM] = -1;
	OyuncuBilgi[playerid][pVipSure] = 0;
	OyuncuBilgi[playerid][pPara] = 2000;
	OyuncuBilgi[playerid][pSkin] = 60;
	OyuncuBilgi[playerid][pCan] = 100;
	OyuncuBilgi[playerid][pRcoin] = 0;
	OyuncuBilgi[playerid][pLevelExp] = 0;
	DMOda[playerid] = -1;
	TDMOda[playerid] = -1;
	cbug[playerid] = 0;
	AdminArea[playerid] = 0;
	Airbreak[playerid] = 0;
	AnimSpec[playerid] = -1;
	OyuncuBilgi[playerid][Duelde] = false;
 	OyuncuBilgi[playerid][DuelRakip] = INVALID_PLAYER_ID;
	OyuncuBilgi[playerid][DuelSilah1] = 0;
	OyuncuBilgi[playerid][DuelSilah2] = 0;
	OyuncuBilgi[playerid][pSandikHakki] = 0;
	OyuncuBilgi[playerid][DuelMap] = 0;
	OyuncuBilgi[playerid][pKD] = 0;
	HeadAimbot[playerid] = 0;
	SetPlayerTeam(playerid, NO_TEAM);
	SetPVarInt(playerid,"killed",0);
	PlayerTextDrawHide(playerid, AdminDuty[playerid]);
	return 1;
}

stock OyuncuGuncelle(playerid, disconnect=1)
{
	new query[2048];
	format(query, sizeof(query), "UPDATE `oyuncular` SET `Admin` = %d, `Dakika` = %d, `OynamaSaati` = %d, `Olme` = %d, `Oldurme` = %d, `EXP` = %d, `Skin` = %d, `Mute` = %d, `VIP` = %d, `VipSure` = %d, `Para` = %d, `Sniper` = %d, `SandikHakki` = %d, `Jail` = %d, `RCoin` = %d, `LevelExp` = %d  WHERE `ID` = %d",
	OyuncuBilgi[playerid][pAdmin],
	OyuncuBilgi[playerid][pDakikaTimer],
	OyuncuBilgi[playerid][pOynamaSaati],
	OyuncuBilgi[playerid][pOlme],
	OyuncuBilgi[playerid][pOldurme],
	OyuncuBilgi[playerid][pEXP],
	OyuncuBilgi[playerid][pSkin],
	OyuncuBilgi[playerid][pMute],
	OyuncuBilgi[playerid][pVip],
	OyuncuBilgi[playerid][pVipSure],
	OyuncuBilgi[playerid][pPara],
	OyuncuBilgi[playerid][pSniper],
	OyuncuBilgi[playerid][pSandikHakki],
	OyuncuBilgi[playerid][pJailTime],
	OyuncuBilgi[playerid][pRcoin],
	OyuncuBilgi[playerid][pLevelExp],
	OyuncuBilgi[playerid][ID]);

    mysql_query(g_SQL, query, false);
	return 1;
}

stock IzlemeBitir(playerid)
{
	TogglePlayerSpectating(playerid, false);
	OyuncuBilgi[playerid][pSpecID] = -1;
    callcmd::lobby(playerid);
    return 1;
}

stock GetWeaponCount(playerid)
{
	new
		count,
	    weapon,
	    ammo;

	for (new i = 0; i < 13; i ++)
	{
	    GetPlayerWeaponData(playerid, i, weapon, ammo);

	    if (weapon > 0 && ammo > 0) count++;
	}
	return count;
}

stock GetRank(playerid)
{
	new rank[20];
	switch (OyuncuBilgi[playerid][pAdmin])
	{
	    case 1: rank = "Game Admin";
	    case 2: rank = "Management";
	    default: rank = "Player";
	}
	return rank;
}

stock AksesuarTak(playerid, index)
{
	if(OyuncuBilgi[playerid][pARenk][index] == 0) return SetPlayerAttachedObject(playerid,index,OyuncuBilgi[playerid][pASlot][index],OyuncuBilgi[playerid][pABone][index],AksesuarData[playerid][index][0],AksesuarData[playerid][index][1],AksesuarData[playerid][index][2],AksesuarData[playerid][index][3],AksesuarData[playerid][index][4],AksesuarData[playerid][index][5],AksesuarData[playerid][index][6],AksesuarData[playerid][index][7],AksesuarData[playerid][index][8]);
	switch(OyuncuBilgi[playerid][pARenk][index])
	{
	    case 1: SetPlayerAttachedObject(playerid,index,OyuncuBilgi[playerid][pASlot][index],OyuncuBilgi[playerid][pABone][index],AksesuarData[playerid][index][0],AksesuarData[playerid][index][1],AksesuarData[playerid][index][2],AksesuarData[playerid][index][3],AksesuarData[playerid][index][4],AksesuarData[playerid][index][5],AksesuarData[playerid][index][6],AksesuarData[playerid][index][7],AksesuarData[playerid][index][8], RGBAToARGB(0x000000FF), RGBAToARGB(0x000000FF));
	    case 2: SetPlayerAttachedObject(playerid,index,OyuncuBilgi[playerid][pASlot][index],OyuncuBilgi[playerid][pABone][index],AksesuarData[playerid][index][0],AksesuarData[playerid][index][1],AksesuarData[playerid][index][2],AksesuarData[playerid][index][3],AksesuarData[playerid][index][4],AksesuarData[playerid][index][5],AksesuarData[playerid][index][6],AksesuarData[playerid][index][7],AksesuarData[playerid][index][8], RGBAToARGB(0xFF0000FF), RGBAToARGB(0xFF0000FF));
	    case 3: SetPlayerAttachedObject(playerid,index,OyuncuBilgi[playerid][pASlot][index],OyuncuBilgi[playerid][pABone][index],AksesuarData[playerid][index][0],AksesuarData[playerid][index][1],AksesuarData[playerid][index][2],AksesuarData[playerid][index][3],AksesuarData[playerid][index][4],AksesuarData[playerid][index][5],AksesuarData[playerid][index][6],AksesuarData[playerid][index][7],AksesuarData[playerid][index][8], RGBAToARGB(0x0000BBFF), RGBAToARGB(0x0000BBFF));
	    case 4: SetPlayerAttachedObject(playerid,index,OyuncuBilgi[playerid][pASlot][index],OyuncuBilgi[playerid][pABone][index],AksesuarData[playerid][index][0],AksesuarData[playerid][index][1],AksesuarData[playerid][index][2],AksesuarData[playerid][index][3],AksesuarData[playerid][index][4],AksesuarData[playerid][index][5],AksesuarData[playerid][index][6],AksesuarData[playerid][index][7],AksesuarData[playerid][index][8], RGBAToARGB(0xFF9900FF), RGBAToARGB(0xFF9900FF));
	    case 5: SetPlayerAttachedObject(playerid,index,OyuncuBilgi[playerid][pASlot][index],OyuncuBilgi[playerid][pABone][index],AksesuarData[playerid][index][0],AksesuarData[playerid][index][1],AksesuarData[playerid][index][2],AksesuarData[playerid][index][3],AksesuarData[playerid][index][4],AksesuarData[playerid][index][5],AksesuarData[playerid][index][6],AksesuarData[playerid][index][7],AksesuarData[playerid][index][8], RGBAToARGB(0xa126edFF), RGBAToARGB(0xa126edFF));
	    case 6: SetPlayerAttachedObject(playerid,index,OyuncuBilgi[playerid][pASlot][index],OyuncuBilgi[playerid][pABone][index],AksesuarData[playerid][index][0],AksesuarData[playerid][index][1],AksesuarData[playerid][index][2],AksesuarData[playerid][index][3],AksesuarData[playerid][index][4],AksesuarData[playerid][index][5],AksesuarData[playerid][index][6],AksesuarData[playerid][index][7],AksesuarData[playerid][index][8], RGBAToARGB(0xffff00FF), RGBAToARGB(0xffff00FF));
	    case 7: SetPlayerAttachedObject(playerid,index,OyuncuBilgi[playerid][pASlot][index],OyuncuBilgi[playerid][pABone][index],AksesuarData[playerid][index][0],AksesuarData[playerid][index][1],AksesuarData[playerid][index][2],AksesuarData[playerid][index][3],AksesuarData[playerid][index][4],AksesuarData[playerid][index][5],AksesuarData[playerid][index][6],AksesuarData[playerid][index][7],AksesuarData[playerid][index][8], RGBAToARGB(0x33AA33FF), RGBAToARGB(0x33AA33FF));
	}
	return 1;
}

stock AksesuarlariGoster(playerid,satinal=0)
{
    new str[1000],string[300];
    strcat(str,"Slot ID\tDurum\tModel ID\n");
	for(new i; i < 5; i++)
	{
		if(OyuncuBilgi[playerid][pASlot][i] != 0)
	    {
	        format(string,sizeof(string),"{FFFFFF}%d\t{FF0000}Kullan�l�yor\t{FFFFFF}%d\n",i,OyuncuBilgi[playerid][pASlot][i]);
	    }
	    else
	    {
	        format(string,sizeof(string),"{FFFFFF}%d\t{2ECC71}Kullan�lm�yor\t{FFFFFF}-\n",i);
	    }
	    strcat(str,string);
	}
	if(satinal == 1) ShowPlayerDialog(playerid, 53, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Aksesuar Slotlar�", str, "Se�", "{FF6347}Iptal");
	if(satinal == 0) ShowPlayerDialog(playerid, 56, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Aksesuar Slotlar�", str, "Se�", "{FF6347}Iptal");
	if(satinal == 2) ShowPlayerDialog(playerid, 62, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Aksesuar Slotlar�", str, "Se�", "{FF6347}Iptal");
    return 1;
}

stock SQL_AksesuarKaydet(playerid)
{
	if(GetPVarInt(playerid,"Logged") == 0) return 0;
	new
	    query[2224];
    	format(query, sizeof(query), "UPDATE `oyuncular` SET `ASlot1` = '%d|%d|%d|%d'",
        OyuncuBilgi[playerid][pASlot][0],
		OyuncuBilgi[playerid][pABone][0],
		OyuncuBilgi[playerid][pTSlot][0],
		OyuncuBilgi[playerid][pARenk][0]
	);
	format(query, sizeof(query), "%s, `ASlot2` = '%d|%d|%d|%d'",
		query,
        OyuncuBilgi[playerid][pASlot][1],
		OyuncuBilgi[playerid][pABone][1],
		OyuncuBilgi[playerid][pTSlot][1],
		OyuncuBilgi[playerid][pARenk][1]
	);
	format(query, sizeof(query), "%s, `ASlot3` = '%d|%d|%d|%d'",
		query,
        OyuncuBilgi[playerid][pASlot][2],
		OyuncuBilgi[playerid][pABone][2],
		OyuncuBilgi[playerid][pTSlot][2],
		OyuncuBilgi[playerid][pARenk][2]
	);
	format(query, sizeof(query), "%s, `ASlot4` = '%d|%d|%d|%d'",
		query,
        OyuncuBilgi[playerid][pASlot][3],
		OyuncuBilgi[playerid][pABone][3],
		OyuncuBilgi[playerid][pTSlot][3],
		OyuncuBilgi[playerid][pARenk][3]
	);
	format(query, sizeof(query), "%s, `ASlot5` = '%d|%d|%d|%d'",
		query,
        OyuncuBilgi[playerid][pASlot][4],
		OyuncuBilgi[playerid][pABone][4],
		OyuncuBilgi[playerid][pTSlot][4],
		OyuncuBilgi[playerid][pARenk][4]
	);
	format(query, sizeof(query), "%s, `ASlot6` = '%d|%d|%d|%d'",
		query,
        OyuncuBilgi[playerid][pASlot][5],
		OyuncuBilgi[playerid][pABone][5],
		OyuncuBilgi[playerid][pTSlot][5],
		OyuncuBilgi[playerid][pARenk][5]
	);
	format(query, sizeof(query), "%s, `ASlot7` = '%d|%d|%d|%d'",
		query,
        OyuncuBilgi[playerid][pASlot][6],
		OyuncuBilgi[playerid][pABone][6],
		OyuncuBilgi[playerid][pTSlot][6],
		OyuncuBilgi[playerid][pARenk][6]
	);
	format(query, sizeof(query), "%s, `ASlot8` = '%d|%d|%d|%d'",
		query,
        OyuncuBilgi[playerid][pASlot][7],
		OyuncuBilgi[playerid][pABone][7],
		OyuncuBilgi[playerid][pTSlot][7],
		OyuncuBilgi[playerid][pARenk][7]
	);
	format(query, sizeof(query), "%s, `ASlot9` = '%d|%d|%d|%d'",
		query,
        OyuncuBilgi[playerid][pASlot][8],
		OyuncuBilgi[playerid][pABone][8],
		OyuncuBilgi[playerid][pTSlot][8],
		OyuncuBilgi[playerid][pARenk][8]
	);
	format(query, sizeof(query), "%s, `ASlot10` = '%d|%d|%d|%d'",
		query,
        OyuncuBilgi[playerid][pASlot][9],
		OyuncuBilgi[playerid][pABone][9],
		OyuncuBilgi[playerid][pTSlot][9],
		OyuncuBilgi[playerid][pARenk][9]
	);
    format(query, sizeof(query), "%s, `ASlot1Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f'",
		query,
		AksesuarData[playerid][0][0],
		AksesuarData[playerid][0][1],
        AksesuarData[playerid][0][2],
        AksesuarData[playerid][0][3],
        AksesuarData[playerid][0][4],
        AksesuarData[playerid][0][5],
        AksesuarData[playerid][0][6],
        AksesuarData[playerid][0][7],
		AksesuarData[playerid][0][8]
	);
    format(query, sizeof(query), "%s, `ASlot2Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f'",
        query,
		AksesuarData[playerid][1][0],
        AksesuarData[playerid][1][1],
        AksesuarData[playerid][1][2],
        AksesuarData[playerid][1][3],
        AksesuarData[playerid][1][4],
        AksesuarData[playerid][1][5],
        AksesuarData[playerid][1][6],
        AksesuarData[playerid][1][7],
        AksesuarData[playerid][1][8]
	);
	format(query, sizeof(query), "%s, `ASlot3Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f'",
	    query,
		AksesuarData[playerid][2][0],
        AksesuarData[playerid][2][1],
        AksesuarData[playerid][2][2],
        AksesuarData[playerid][2][3],
        AksesuarData[playerid][2][4],
        AksesuarData[playerid][2][5],
        AksesuarData[playerid][2][6],
        AksesuarData[playerid][2][7],
        AksesuarData[playerid][2][8]
	);
	format(query, sizeof(query), "%s, `ASlot4Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f'",
	    query,
		AksesuarData[playerid][3][0],
        AksesuarData[playerid][3][1],
        AksesuarData[playerid][3][2],
        AksesuarData[playerid][3][3],
        AksesuarData[playerid][3][4],
        AksesuarData[playerid][3][5],
        AksesuarData[playerid][3][6],
        AksesuarData[playerid][3][7],
        AksesuarData[playerid][3][8],
        AksesuarData[playerid][3][9]
	);
	format(query, sizeof(query), "%s, `ASlot5Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f'",
	    query,
		AksesuarData[playerid][4][0],
        AksesuarData[playerid][4][1],
        AksesuarData[playerid][4][2],
        AksesuarData[playerid][4][3],
        AksesuarData[playerid][4][4],
        AksesuarData[playerid][4][5],
        AksesuarData[playerid][4][6],
        AksesuarData[playerid][4][7],
        AksesuarData[playerid][4][8]
	);
	format(query, sizeof(query), "%s, `ASlot6Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f'",
	    query,
		AksesuarData[playerid][5][0],
        AksesuarData[playerid][5][1],
        AksesuarData[playerid][5][2],
        AksesuarData[playerid][5][3],
        AksesuarData[playerid][5][4],
        AksesuarData[playerid][5][5],
        AksesuarData[playerid][5][6],
        AksesuarData[playerid][5][7],
        AksesuarData[playerid][5][8]
	);
	format(query, sizeof(query), "%s, `ASlot7Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f'",
	    query,
		AksesuarData[playerid][6][0],
        AksesuarData[playerid][6][1],
        AksesuarData[playerid][6][2],
        AksesuarData[playerid][6][3],
        AksesuarData[playerid][6][4],
        AksesuarData[playerid][6][5],
        AksesuarData[playerid][6][6],
        AksesuarData[playerid][6][7],
        AksesuarData[playerid][6][8]
	);
	format(query, sizeof(query), "%s, `ASlot8Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f'",
	    query,
		AksesuarData[playerid][7][0],
        AksesuarData[playerid][7][1],
        AksesuarData[playerid][7][2],
        AksesuarData[playerid][7][3],
        AksesuarData[playerid][7][4],
        AksesuarData[playerid][7][5],
        AksesuarData[playerid][7][6],
        AksesuarData[playerid][7][7],
        AksesuarData[playerid][7][8]
	);
	format(query, sizeof(query), "%s, `ASlot9Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f'",
	    query,
		AksesuarData[playerid][8][0],
        AksesuarData[playerid][8][1],
        AksesuarData[playerid][8][2],
        AksesuarData[playerid][8][3],
        AksesuarData[playerid][8][4],
        AksesuarData[playerid][8][5],
        AksesuarData[playerid][8][6],
        AksesuarData[playerid][8][7],
        AksesuarData[playerid][8][8]
	);
	format(query, sizeof(query), "%s, `ASlot10Pos` = '%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f|%.4f' WHERE `ID` = '%d'",
	    query,
		AksesuarData[playerid][9][0],
        AksesuarData[playerid][9][1],
        AksesuarData[playerid][9][2],
        AksesuarData[playerid][9][3],
        AksesuarData[playerid][9][4],
        AksesuarData[playerid][9][5],
        AksesuarData[playerid][9][6],
        AksesuarData[playerid][9][7],
        AksesuarData[playerid][9][8],
        OyuncuBilgi[playerid][ID]
	);
	mysql_query(g_SQL,query, false);
	return 1;
}

stock AksesuarAyarla(playerid)
{
    for (new i = 0; i < 5; i ++) {
		if(!OyuncuBilgi[playerid][pTSlot][i])
		{
			RemovePlayerAttachedObject(playerid, i);
		}
		else
		{
		    AksesuarTak(playerid, i);
		}
	}
	return 1;
}

stock VipMenu(playerid)
{
    if(OyuncuBilgi[playerid][pVip] < 1 || OyuncuBilgi[playerid][pVipSure] < gettime()) return 1;
    Dialog_Show(playerid, VipMenu, DIALOG_STYLE_LIST, "{FFFFFF}VIP Menu", "{E74C3C}V.I.P Accessory\t{2ECC71}$100\n{E74C3C}V.I.P Costom Tag (It isn't working)\t{2ECC71}$2000\n{E74C3C}V.I.P Skin's (It isn't working)", "Se�", "Kapat");
    return 1;
}