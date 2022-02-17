SpawnKorumasi1(playerid)
{
    TogglePlayerControllable(playerid,0);
    SpawnKorumasi[playerid] = 1;
    SetTimerEx("SpawnKorumasi2", 1000, false, "d", playerid);
	return 1;
}

ReturnHealth(playerid)
{
 	static
	Float:amount;

	GetPlayerHealth(playerid, amount);
	return floatround(amount, floatround_round);
}

ArenaCik(playerid)
{
    if (GetPlayerTeam(playerid) == 1 && TDMOda[playerid] == 0)
	{
        new rand = random(sizeof(RandomLobbySpawn));
	    SetPlayerColor(playerid, RandomLobbySpawn[rand]);
	    //GroveTakim--;
	}
	if (GetPlayerTeam(playerid) == 2 && TDMOda[playerid] == 1)
	{
        new rand = random(sizeof(RandomLobbySpawn));
	    SetPlayerColor(playerid, RandomLobbySpawn[rand]);
	    //BallasTakim--;
	}
    if (GetPlayerTeam(playerid) == 3 && TDMOda[playerid] == 2)
	{
        new rand = random(sizeof(RandomLobbySpawn));
	    SetPlayerColor(playerid, RandomLobbySpawn[rand]);
	    //VagosTakim--;
	}
    if (GetPlayerTeam(playerid) == 4 && TDMOda[playerid] == 3)
	{
        new rand = random(sizeof(RandomLobbySpawn));
	    SetPlayerColor(playerid, RandomLobbySpawn[rand]);
	    //AztecasTakim--;
	}
	if (GetPlayerTeam(playerid) == 1 && TDMOda[playerid] == 0)
	if (DMOda[playerid] == 0) return LVPDArena--;
	if (DMOda[playerid] == 1) return JeffersonArena--;
	if (DMOda[playerid] == 2) return RCArena--;
	if (DMOda[playerid] == 3) return GhostArena--;
	if (DMOda[playerid] == 4) return HeadshotArena--;
	SetPlayerTeam(playerid, NO_TEAM);
	SetPlayerSkin(playerid, OyuncuBilgi[playerid][pSkin]);
	DMOda[playerid] = -1;
    TDMOda[playerid] = -1;
    AdminArea[playerid] = 0;
    OyuncuBilgi[playerid][Duelde] = false;
    OyuncuBilgi[playerid][DuelRakip] = INVALID_PLAYER_ID;
    OyuncuBilgi[playerid][DuelSilah1] = 0;
    OyuncuBilgi[playerid][DuelSilah2] = 0;
    OyuncuBilgi[playerid][DuelMap] = 0;
    SetPlayerInterior(playerid, 18);
    SetPlayerVirtualWorld(playerid, 10);
    SilahSifirla(playerid);
    GiveWeapon(playerid, 24, 500);
    if (OyuncuBilgi[playerid][pSuclu] == 1)
	{
	    Suclu--;
	    ToplamPursuitPlayer--;
	    OyuncuBilgi[playerid][pSuclu] = 0;
    }
	else if (OyuncuBilgi[playerid][pPolis] == 1)
	{
        Polis--;
        ToplamPursuitPlayer--;
        OyuncuBilgi[playerid][pPolis] = 0;
	}
	return 1;
}

IsNumeric(const str[])
{
	for (new i = 0, l = strlen(str); i != l; i ++)
	{
	    if (i == 0 && str[0] == '-')
			continue;

	    else if (str[i] < '0' || str[i] > '9')
			return 0;
	}
	return 1;
}
ReturnDate()
{
	static
	    date[36];

	getdate(date[2], date[1], date[0]);
	gettime(date[3], date[4], date[5]);

	format(date, sizeof(date), "%02d/%02d/%d, %02d:%02d", date[0], date[1], date[2], date[3], date[4]);
	return date;
}

ReturnName(playerid, underscore = 1)
{
	static
	    name[MAX_PLAYER_NAME + 1];

	GetPlayerName(playerid, name, sizeof(name));

	if (underscore != 1)
	{
	    for (new i = 0, len = strlen(name); i < len; i ++)
		{
	        if (name[i] == '_')
				name[i] = ' ';
		}
	}
	return name;
}

TimestampToDate(time, &year, &month, &day, &hour, &minute, &second) {

        new remain = time, leapYear = 1, sub, yearCounter;

        for(new i = 0; i < time - sub;) {
                sub = (leapYear > 0 && leapYear < 4) ? 31622400 : 31536000;
                if(i == 0) {
                        i += 31536000;
                        remain -= 31536000;
                } else {
                        if(leapYear > 0 && leapYear < 4) {
                                i += 31536000;
                                leapYear++;
                                remain -= 31536000;
                        } else {
                                i += 31622400;
                                leapYear = 1;
                                remain -= 31622400;
                        }
                }
                if(time > 31536000) yearCounter++;
        }
        year = 1970 + yearCounter;

        sub = (leapYear > 0 && leapYear < 4) ? 86400 : 0;
        if(remain <= 2678400) { month = 1; remain -= 0; }
        else if(remain <= 5097600 + sub) { month = 2; remain -= 2678400; }
        else if(remain <= 7776000 + sub) { month = 3; remain -= 5097600; }
        else if(remain <= 10368000 + sub) { month = 4; remain -= 7776000; }
        else if(remain <= 13046400 + sub) { month = 5; remain -= 10368000; }
        else if(remain <= 15638400 + sub) { month = 6; remain -= 13046400; }
        else if(remain <= 18316800 + sub) { month = 7; remain -= 15638400; }
        else if(remain <= 20995200 + sub) { month = 8; remain -= 18316800; }
        else if(remain <= 23587200 + sub) { month = 9; remain -= 20995200; }
        else if(remain <= 26265600 + sub) { month = 10; remain -= 23587200; }
        else if(remain <= 28857600 + sub) { month = 11; remain -= 26265600; }
        else if(remain <= 31536000 + sub) { month = 12; remain -= 28857600; }

        day = floatround( floatdiv(float(remain), float(86400)), floatround_floor );
        remain -= (day * 86400);

        hour = floatround( floatdiv(float(remain), float(3600)), floatround_floor );
        remain -= (hour * 3600);

        minute = floatround( floatdiv(float(remain), float(60)), floatround_floor );
        remain -= (minute * 60);

		hour += 2;
        second = remain;
        day++;
        return 1;
}

AddBan(bannedip[], bannedname[], hddserial[], bannedby[], gun, sebep[])
{
	new query[600];
	format(query, sizeof(query), "INSERT INTO `bans` (`IP`, `Ad`, `hddserial`, `Banlayan`, `Sure`, `Sebep`, `BanlanmaTarihi`) VALUES ('%s', '%s', '%s', '%s', '%d', '%s', '%s')", bannedip, bannedname, hddserial, bannedby, gun, sebep, ReturnDate());
	mysql_query(g_SQL, query, false);
	return 1;
}

KickEx(playerid)
{
    SetTimerEx("DelayedKick", 100, false, "d", playerid);
	return 1;
}

RemoveBan(ad[])
{
	new query[150];
	format(query, sizeof(query), "DELETE FROM `bans` WHERE `Ad` = '%s'", ad);
	mysql_query(g_SQL, query, false);
	return 1;
}

GetVehicleModelByName(const name[])
{
	if (IsNumeric(name) && (strval(name) >= 400 && strval(name) <= 611))
	    return strval(name);

	for (new i = 0; i < sizeof(g_arrVehicleNames); i ++)
	{
	    if (strfind(g_arrVehicleNames[i], name, true) != -1)
	    {
	        return i + 400;
		}
	}
	return 0;
}

SendPlayerToPlayer(playerid, targetid)
{
    new
        Float:px,
        Float:py,
        Float:pz;

    GetPlayerPos(targetid, px, py, pz);

    if (IsPlayerInAnyVehicle(playerid))
    {
        OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
        SetVehiclePos(GetPlayerVehicleID(playerid), px, py + 2, pz);
        LinkVehicleToInterior(GetPlayerVehicleID(playerid), GetPlayerInterior(targetid));
    }
    else
    {
        OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
        SetPlayerPos(playerid, px+1, py, pz);
	}

    SetPlayerInterior(playerid, GetPlayerInterior(targetid));
    SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(targetid));
    return 1;
}

RGBAToARGB(rgba)
    return rgba >>> 8 | rgba << 24;

AntiDeAMX()
{
    new sawyer[][] =
    {
        "Unarmed (Fist)",
        "Brass K"
    };
    #pragma unused sawyer
}
WasteDeAMXersTime()
{
    new
		sawyer;
    #emit load.pri sawyer
    #emit stor.pri sawyer
}