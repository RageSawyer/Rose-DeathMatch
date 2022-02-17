
CMD:bakim(playerid)
{
	if (OyuncuBilgi[playerid][pAdmin] < 2) return ErrorMessage(playerid, "You have no authorization!");
	if (Bakim == 0)
	{
		AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, sunucuyu bak�m moduna ald�.", GetRank(playerid), ReturnName(playerid));
		Bakim = 1;
	}
	else if (Bakim == 1)
	{
		AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, sunucuyu bak�m modundan ��kartt�.", GetRank(playerid), ReturnName(playerid));
		Bakim = 0;
	}
	return 1;
}

CMD:jetpack(playerid, params[])
{
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
	
    OyuncuBilgi[playerid][pJetpack] = 1;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
	AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, kendine jetpack verdi.", GetRank(playerid), ReturnName(playerid));
	Log_Write("logs/Jetpack.log", "[%s] %s %s, kendine jetpack verdi.", ReturnDate(), GetRank(playerid), ReturnName(playerid));
	return 1;
}

CMD:spawn(playerid, params[])
{
	new userid;
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "u", userid))
        return UsageMessage(playerid, "/spawn [ID/Name]");
        
    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to spawn is not in the game.");

	if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to spawn is not in the game.");

    ArenaCik(userid);
    SetPlayerTeam(userid, NO_TEAM);
    if (DMOda[userid] == 0) return LVPDArena--;
	if (DMOda[userid] == 1) return JeffersonArena--;
	if (DMOda[userid] == 2) return RCArena--;
	if (DMOda[userid] == 3) return GhostArena--;
	if (DMOda[userid] == 4) return HeadshotArena--;
    OyuncuBilgi[userid][pLegalTeleport] = gettime() + 2;
    SetPlayerPos(userid, 1728.5088, -1668.0836, 22.6094);
    SetPlayerFacingAngle(userid, 49.5617);
    SetPlayerInterior(userid, 18);
    SetPlayerVirtualWorld(userid, 10);
    ResetPlayerWeapons(userid);
    GiveWeapon(playerid, 24, 1000);
    OyuncuGuncelle(userid);
	SendMessage(userid, "%s spawned you.", ReturnName(playerid));
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuyu lobiye spawnlad�.",GetRank(playerid), ReturnName(playerid), ReturnName(userid));
    Log_Write("logs/Spawnla.log", "[%s] %s %s, %s adl� oyuncuyu lobiye spawnlad�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid));
    return 1;
}

CMD:setskin(playerid, params[])
{
	new userid, skinid;
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "ud", userid, skinid))
        return UsageMessage(playerid, "/setskin [ID/Name] [Skin ID]");
        
    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player whose skin you want to change is not in the game.");

	if (Logged[userid] != 1) return ErrorMessage(playerid, "The player whose skin you want to change is not in the game.");

	SetPlayerSkin(userid, skinid);
	OyuncuBilgi[userid][pSkin] = skinid;
    OyuncuGuncelle(userid);
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncunun skinini %d olarak de�i�tirdi.", GetRank(playerid), ReturnName(playerid), ReturnName(userid), skinid);
    Log_Write("logs/SetSkin.log", "[%s] %s %s, %s adl� oyuncunun skinini %d olarak de�i�tirdi.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid), skinid);
    return 1;
}

CMD:kick(playerid, params[])
{
	new userid, reason[128];
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "us[128]", userid, reason))
        return UsageMessage(playerid, "/kick [ID/Name] [Sebep]");
        
    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to kick is not in the game.");

    ArenaCik(userid);
    if (DMOda[userid] == 0) return LVPDArena--;
	if (DMOda[userid] == 1) return JeffersonArena--;
	if (DMOda[userid] == 2) return RCArena--;
	if (DMOda[userid] == 3) return GhostArena--;
	if (DMOda[userid] == 4) return HeadshotArena--;
    OyuncuGuncelle(userid);
    SendClientMessageToAllEx(COLOR_LIGHTRED, "ADM: %s has been kicked out from the server by %s with reason %s.",ReturnName(userid), ReturnName(playerid), reason);
    Log_Write("logs/Kick.log", "[%s] %s, %s taraf�ndan %s sebebiyle sunucudan at�ld�.", ReturnDate(), ReturnName(userid), ReturnName(playerid), reason);
    KickEx(userid);
    return 1;
}

CMD:ban(playerid, params[])
{
    new id, gun, sebep[50];
    if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
    if (sscanf(params, "uis[50]", id, gun, sebep)) return UsageMessage(playerid, "/ban [ID/Name] [Day (0 = endless)] [Reason]");
    if (!IsPlayerConnected(id)) return ErrorMessage(playerid, "The player you want to ban is not in the game.");
	if (Logged[id] != 1) return ErrorMessage(playerid, "The player you want to ban is not in the game.");

    new pip[20];
    GetPlayerIp(id, pip, sizeof(pip));
    new sure[10];
    if (gun < 0) return ErrorMessage(playerid, "You can ban at least 0 days (endless).");
    if (gun == 0) sure = "Endless";
    else format(sure, sizeof(sure), "%d g�n", gun);
    foreach (new i:Player)
    {
    	SendClientMessageEx(i, COLOR_LIGHTRED, "ADM: %s has been banned from the server by %s with reason %s.", ReturnName(id),  ReturnName(playerid), sebep);
    }
    Log_Write("logs/Ban.log", "[%s] %s, %s tarafindan %d gun yasaklandi. sebep: %s.", ReturnDate(), ReturnName(id), ReturnName(playerid), gun, sebep);
    new suree = 0;
    if (gun > 0)
    {
        suree = gettime()+gun*86400;
	}
    AddBan(pip, ReturnName(id), "", ReturnName(playerid), suree, sebep);
    Kick(id);
	return 1;
}

CMD:unban(playerid, params[])
{
	new ad[30];
    if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
    if (sscanf(params, "s[30]", ad)) return UsageMessage(playerid, "/unban [Hesap Ad�]");
    new query[124];
    format(query, sizeof(query), "SELECT null FROM `bans` WHERE `Ad` = '%s'", ad);
    mysql_tquery(g_SQL, query, "UnBan", "is", playerid, ad);
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncunun ban�n� kald�rd�.",GetRank(playerid), ReturnName(playerid), ad);
    Log_Write("logs/UnBan.log", "[%s] %s %s, %s adl� oyuncunun ban�n� kald�rd�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ad);
	return 1;
}

CMD:mute(playerid, params[])
{
	new userid, sure, reason[128];
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "uis[128]", userid, sure, reason))
        return UsageMessage(playerid, "/mute [ID/Name] [Minute] [Reason]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to mute with is not in the game.");
	if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to mute with is not in the game.");

    OyuncuBilgi[userid][pMute] = sure*1000;
    OyuncuGuncelle(userid);
    SendMessage(userid, "You are muted by %s, reason: %s, time: %d minutes.", ReturnName(playerid), reason, sure);
    Log_Write("logs/Mute.log", "[%s] %s, %s taraf�ndan %s sebebiyle %d dakika mutelendi.", ReturnDate(), ReturnName(userid), ReturnName(playerid), reason, sure);
    return 1;
}

CMD:unmute(playerid, params[])
{
	new userid;
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "u", userid))
        return UsageMessage(playerid, "/unmute [ID/Name]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to unmute with is not in the game.");
	if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to unmute with is not in the game.");

    OyuncuBilgi[userid][pMute] = 0;
    OyuncuGuncelle(userid);
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncunun mutesini kald�rd�.",GetRank(playerid), ReturnName(playerid), ReturnName(userid));
    Log_Write("logs/UnMute.log", "[%s] %s %s, %s adl� oyuncunun mutesini kald�rd�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid));
    return 1;
}

CMD:jail(playerid, params[])
{
	new userid, sure, reason[128];
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "uis[128]", userid, sure, reason))
        return UsageMessage(playerid, "/jail [ID/Name] [Minute] [Reason]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to jail with is not in the game.");
	if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to jail with is not in the game.");

    OyuncuBilgi[userid][pJailTime] = sure;
    OyuncuBilgi[userid][pJail] = 1;
	OyuncuBilgi[userid][pLegalTeleport] = gettime() + 2;
	SetPlayerPos(userid, 215.4054,109.8750,999.0156);
	SetPlayerFacingAngle(userid,356.9411);
	SetPlayerInterior(userid, 10);
	SpawnKorumasi1(userid);
	SendMessage(playerid, "%s jailed you, to find out the remaining jail time, you can type /jailcontrol.", ReturnName(playerid), sure);
    OyuncuGuncelle(userid);
    SendClientMessageToAllEx(COLOR_LIGHTRED, "ADM: %s was jailed for %d minutes by %s due to %s.",ReturnName(userid), sure, ReturnName(playerid), reason);
    Log_Write("logs/Jail.log", "[%s] %s, %s taraf�ndan %s sebebiyle %d dakika jaile at�ld�.", ReturnDate(), ReturnName(userid), ReturnName(playerid), reason, sure);
    return 1;
}

CMD:jailkontrol(playerid)
{
	if (OyuncuBilgi[playerid][pJail] == 1 && OyuncuBilgi[playerid][pJailTime] > 0)
	{
		SendMessage(playerid, "Your remaining jail time is %d minutes.", OyuncuBilgi[playerid][pJailTime]);
	}
	else
	{
		ErrorMessage(playerid, "You are not in jail.");
	}
	return 1;
}

CMD:unjail(playerid, params[])
{
	new userid;
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "u", userid))
        return UsageMessage(playerid, "/unjail [ID/Name]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to unjail with is not in the game.");
	if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to unjail with is not in the game.");

    OyuncuBilgi[userid][pJailTime] = 0;
    SpawnKorumasi1(userid);
    OyuncuBilgi[userid][pLegalTeleport] = gettime() + 2;
    SetPlayerPos(userid, 1728.5088, -1668.0836, 22.6094);
    SetPlayerFacingAngle(userid, 49.5617);
    SetPlayerInterior(userid, 18);
    SetPlayerVirtualWorld(userid, 10);
    SetPlayerSkin(userid, OyuncuBilgi[userid][pSkin]);
    ResetPlayerWeapons(userid);
    GivePlayerWeapon(userid, 24, 999);
    OyuncuGuncelle(userid);
	SendMessage(playerid, "%s got you out of jail.", ReturnName(playerid));
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuyu jailden ��kartt�.",GetRank(playerid), ReturnName(playerid), ReturnName(userid));
    Log_Write("logs/UnJail.log", "[%s] %s %s, %s adl� oyuncuyu jailden ��kartt�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid));
    return 1;
}

CMD:makeadmin(playerid, params[])
{
    new userid, level;
    if (OyuncuBilgi[playerid][pAdmin] < 2 && !IsPlayerAdmin(playerid)) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "ui", userid, level))
        return UsageMessage(playerid, "/makeadmin [ID/Name] [Level]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to change the admin level is not in the game.");

    if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to change the admin level is not in the game.");
    
    OyuncuBilgi[userid][pAdmin] = level;
    if (level > 0)
    {
        Log_Write("logs/MakeAdmin.log", "[%s] %s %s, %s adl� oyuncuyu %s yapt�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid), GetRank(userid));
        SendMessage(playerid, "%s adl� oyuncuyu %s yapt�n�z.", ReturnName(userid), GetRank(userid));
        SendMessage(userid, "%s adl� yetkili seni %s yapt�.", ReturnName(playerid), GetRank(userid));
	}
    else if (OyuncuBilgi[userid][pAdmin] == 0)
	{
	    OyuncuBilgi[userid][pAdminDuty] = 0;
        Log_Write("logs/MakeAdmin.log", "[%s] %s %s, %s adl� oyuncuyu %s yapt�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid));
        SendMessage(playerid, "You fired the %s from the admin team.", ReturnName(userid));
        SendMessage(userid, "You have been fired from the admin team by %s.", ReturnName(playerid));
        PlayerTextDrawHide(playerid, AdminDuty[playerid]);
	}
    OyuncuGuncelle(userid);
    return 1;
}

CMD:givemoney(playerid, params[])
{
    new userid, para;
    if (OyuncuBilgi[playerid][pAdmin] < 2 && !IsPlayerAdmin(playerid)) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "ui", userid, para))
        return UsageMessage(playerid, "/givemoney [ID/Name] [Money]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to give money to is not in the game.");
    
    if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to give money to is not in the game.");
    
    ParaVer(userid, para);
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuya $%d verdi.", GetRank(playerid), ReturnName(playerid), ReturnName(userid), para);
    Log_Write("logs/GiveMoney.log", "[%s] %s %s, %s adl� oyuncuya $%d verdi.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid), para);
    SendMessage(playerid, "You gave %s $%d.", ReturnName(userid), para);
    SendMessage(userid, "%s gave you $%d.", ReturnName(playerid), para);
    OyuncuGuncelle(userid);
    return 1;
}

CMD:giversc(playerid, params[])
{
    new userid, bakiye;
    if (OyuncuBilgi[playerid][pAdmin] < 2 && !IsPlayerAdmin(playerid)) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "ui", userid, bakiye))
        return UsageMessage(playerid, "/giversc [ID/Name] [De�er]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to give money to is not in the game.");

    if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to give money to is not in the game.");

    OyuncuBilgi[playerid][pRcoin] += bakiye;
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuya %d verdi.", GetRank(playerid), ReturnName(playerid), ReturnName(userid), bakiye);
    OyuncuGuncelle(userid);
    return 1;
}

CMD:giveskor(playerid, params[])
{
    new userid, skor;
    if (OyuncuBilgi[playerid][pAdmin] < 2 && !IsPlayerAdmin(playerid)) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "ui", userid, skor))
        return UsageMessage(playerid, "/giveskor [ID/Name] [Skor]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to give skor to is not in the game.");

    if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to give skor to is not in the game.");

    OyuncuBilgi[playerid][pEXP] += skor;
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuya %d verdi.", GetRank(playerid), ReturnName(playerid), ReturnName(userid), skor);
    Log_Write("logs/GiveSkor.log", "[%s] %s %s, %s adl� oyuncuya %d verdi.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid), skor);
    SendMessage(playerid, "You gave %s %d.", ReturnName(userid), skor);
    SendMessage(userid, "%s admin gave you score %d.", ReturnName(playerid), skor);
    OyuncuGuncelle(userid);
    return 1;
}

CMD:olumayarla(playerid, params[])
{
    new userid, olumdeger;
    if (OyuncuBilgi[playerid][pAdmin] < 2 && !IsPlayerAdmin(playerid)) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "ui", userid, olumdeger))
        return UsageMessage(playerid, "/olumayarla [ID/Name] [De�er]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "Your death value has been changed.");

    if (Logged[userid] != 1) return ErrorMessage(playerid, "There is no such player!");

    OyuncuBilgi[playerid][pOlme] = olumdeger;
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuya %d verdi.", GetRank(playerid), ReturnName(playerid), ReturnName(userid), olumdeger);
    Log_Write("logs/GiveSkor.log", "[%s] %s %s, %s adl� oyuncuya %d verdi.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid), olumdeger);
    SendMessage(playerid, "Your death value has been changed %s %d.", ReturnName(userid), olumdeger);
    SendMessage(userid, "%s admin named changed your death value %d.", ReturnName(playerid), olumdeger);
    OyuncuGuncelle(userid);
    return 1;
}

CMD:oldurmeayarla(playerid, params[])
{
    new userid, oldurme;
    if (OyuncuBilgi[playerid][pAdmin] < 2 && !IsPlayerAdmin(playerid)) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "ui", userid, oldurme))
        return UsageMessage(playerid, "/oldurmeayarla [ID/Name] [De�er]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "Your kill value has been changed.");

    if (Logged[userid] != 1) return ErrorMessage(playerid, "There is no such player!");

    OyuncuBilgi[playerid][pOldurme] = oldurme;
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuya %d verdi.", GetRank(playerid), ReturnName(playerid), ReturnName(userid), oldurme);
    Log_Write("logs/GiveSkor.log", "[%s] %s %s, %s adl� oyuncuya %d verdi.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid), oldurme);
    SendMessage(playerid, "Your kill value has been changed %s %d.", ReturnName(userid), oldurme);
    SendMessage(userid, "%s the administrator named changed your kill value %d.", ReturnName(playerid), oldurme);
    OyuncuGuncelle(userid);
    return 1;
}


CMD:pmspec(playerid, params[])
{
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
    new id;
    if (sscanf(params, "u", id)) return UsageMessage(playerid, "/pmspec [ID/Name]");
    if (id == -1) return SendMessage(playerid, "Turn off PM monitoring mode.");
    if (!IsPlayerConnected(id)) return ErrorMessage(playerid, "The player whose PMs you want to spectating is not in the game.");
	if (Logged[id] != 1) return ErrorMessage(playerid, "The player whose PMs you want to spectating is not in the game.");
    if (id == playerid) return ErrorMessage(playerid, "You cannot spectating your own PMs.");
	OyuncuBilgi[playerid][pSpecPM] = id;
    SendMessage(playerid, "You've started spectating %s's PMs.", ReturnName(id));
	Log_Write("logs/PMSpec.log", "[%s] %s %s, %s adl� oyuncunun PM'lerini izlemeye ba�lad�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(id));
	return 1;
}

CMD:pmspecoff(playerid)
{
	new id = OyuncuBilgi[playerid][pSpecPM];
    Log_Write("logs/PMSpec.log", "[%s] %s %s, %s adl� oyuncunun PM'lerini izlemeyi b�rakt�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(id));
    SendMessage(playerid, "You stopped spectating %s's PMs.");
    OyuncuBilgi[playerid][pSpecPM] = -1;
	return 1;
}

CMD:spec(playerid, params[])
	return callcmd::spectate(playerid, params);
	
CMD:spectate(playerid, params[])
{
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
    new id;
    if (sscanf(params, "u", id)) return UsageMessage(playerid, "/spectate [ID/Name]");
    if (!IsPlayerConnected(id)) return ErrorMessage(playerid, "The player you want to spectating is not in the game.");
	if (Logged[id] != 1) return ErrorMessage(playerid, "The player you want to spectating is not in the game.");
    if (id == playerid) return ErrorMessage(playerid, "You can't spectating yourself.");
    OyuncuBilgi[playerid][pSpec] = 1;
    SetPlayerInterior(playerid, GetPlayerInterior(id));
    SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(id));
    TogglePlayerSpectating(playerid, true);
    if (IsPlayerInAnyVehicle(id))
        PlayerSpectateVehicle(playerid, GetPlayerVehicleID(id));
    if (!IsPlayerInAnyVehicle(id))
        PlayerSpectatePlayer(playerid, id);
    new pip[64];
	GetPlayerIp(id, pip, sizeof pip);
	OyuncuBilgi[playerid][pSpecID] = id;
	AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuyu izlemeye ba�lad�.", GetRank(playerid), ReturnName(playerid), ReturnName(id));
	Log_Write("logs/Spectate.log", "[%s] %s %s, %s adl� oyuncuyu izlemeye ba�lad�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(id));
	SendMessage(playerid, "%s (Money: %s, IP: %s, Weapon: %s, EXP: %d, Admin Rank: %s)", ReturnName(id), FormatNumber(OyuncuBilgi[id][pPara]), pip, ReturnWeaponName(GetPlayerWeapon(id)), OyuncuBilgi[id][pEXP], GetRank(id));
	return 1;
}

CMD:specoff(playerid, params[])
{
    new id = OyuncuBilgi[playerid][pSpecID];
    if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
    if (OyuncuBilgi[playerid][pSpec] == 0) return ErrorMessage(playerid, "You are not spectating someone already.");
    OyuncuBilgi[playerid][pSpec] = 0;
    if (DMOda[playerid] == 0) return LVPDArena--;
	if (DMOda[playerid] == 1) return JeffersonArena--;
	if (DMOda[playerid] == 2) return RCArena--;
	if (DMOda[playerid] == 3) return GhostArena--;
	if (DMOda[playerid] == 4) return HeadshotArena--;
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuyu izlemeyi b�rakt�.", GetRank(playerid), ReturnName(playerid), ReturnName(id));
	Log_Write("logs/SpecOff.log", "[%s] %s %s, %s adl� oyuncuyu izlemeyi b�rakt�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(id));
	TogglePlayerSpectating(playerid, false);
	OyuncuBilgi[playerid][pSpecID] = -1;
	callcmd::lobby(playerid);
	return 1;
}

CMD:go(playerid, params[])
{
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
    new id;
    if (sscanf(params, "u", id)) return UsageMessage(playerid, "/go [ID/Name]");
    if (!IsPlayerConnected(id)) return ErrorMessage(playerid, "The player you want to go to is not in the game.");
	if (Logged[id] != 1) return ErrorMessage(playerid, "The player you want to go to is not in the game.");
    if (id == playerid) return ErrorMessage(playerid, "You cannot teleport to yourself.");
    SendPlayerToPlayer(playerid, id);
	SendMessage(playerid, "You are teleported to %s.", ReturnName(id));
	AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncunun yan�na ���nland�.", GetRank(playerid), ReturnName(playerid), ReturnName(id));
	Log_Write("logs/Go.log", "[%s] %s %s, %s adl� oyuncunun yan�na ���nland�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(id));
	return 1;
}

CMD:get(playerid, params[])
{
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
    new id;
    if (sscanf(params, "u", id)) return UsageMessage(playerid, "/get [ID/Name]");
    if (!IsPlayerConnected(id)) return ErrorMessage(playerid, "The player you want to get with you is not in the game.");
	if (Logged[id] != 1) return ErrorMessage(playerid, "The player you want to get with you is not in the game.");
    if (id == playerid) return ErrorMessage(playerid, "You cannot get to yourself.");
    SendPlayerToPlayer(id, playerid);
	SendMessage(playerid, "You took %s with you.", ReturnName(id));
	SendMessage(playerid, "You are pulled to %s.", ReturnName(playerid));
	AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuyu yan�na �ekti.", GetRank(playerid), ReturnName(playerid), ReturnName(id));
	Log_Write("logs/Get.log", "[%s] %s %s, %s adl� oyuncuyu yan�na �ekti.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(id));
	return 1;
}

CMD:animwatch(playerid, params[])
{
	new userid;
	if (OyuncuBilgi[playerid][pAdmin] < 2) return ErrorMessage(playerid, "You have no authorization!");
	
    if (sscanf(params, "u", userid))
        return UsageMessage(playerid, "/animizle [ID/Name] (Kapatmak istersen -1 yaz.)");

    AnimSpec[playerid] = userid;
    
	if (AnimSpec[playerid] != -1)
	{
        SetTimerEx("AnimIzle", 200, true, "d", playerid);
        AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncunun animasyonunu izlemeye ba�lad�.", GetRank(playerid), ReturnName(playerid), ReturnName(userid));
    }
    return 1;
}

CMD:ahelp(playerid)
{
    if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
    SendClientMessageEx(playerid, 0x18FF00FF, "[Game Admin]: {FFFFFF}/spawn, /ban, /unban, /kick, /mute, /setskin, /unmute, /spectate, /specoff, /go, /get");
    SendClientMessageEx(playerid, 0x18FF00FF, "[Game Admin]: {FFFFFF}/stats, /jetpack, /listguns, /pmspec, /pmspecoff, /giveweapon, /recepivedik, /jail, /unjail");
    if (OyuncuBilgi[playerid][pAdmin] >= 2)
	{
	    SendClientMessageEx(playerid, 0xFF0000FF, "[Management]: {FFFFFF}/makeadmin, /givemoney, /bakim, /animizle, /resetstats");
	}
	return 1;
}

CMD:listguns(playerid, params[])
{
	new userid;
    if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

	if (sscanf(params, "u", userid))
	    return UsageMessage(playerid, "/listguns [ID/Name]");

	if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player whose weapons you want to see is not in the game.");

	if (Logged[userid] != 1) return ErrorMessage(playerid, "The player whose weapons you want to see is not in the game.");

    SendClientMessage(playerid, COLOR_GREY, "-----------------------------------------------------------");
    SendClientMessageEx(playerid, COLOR_LIGHTRED, "%s's weapons;", ReturnName(userid, 0));

	new weaponid, ammo;
	for (new i = 0; i < 13; i ++)
	{
		GetPlayerWeaponData(userid, i, weaponid, ammo);

		if (GetWeaponCount(userid) > 0 && weaponid > 0)
		    SendMessage(playerid, "%s - %d Mermi", ReturnWeaponName(weaponid), ammo);
	}
	SendClientMessage(playerid, COLOR_GREY, "-----------------------------------------------------------");
	return 1;
}

CMD:giveweapon(playerid, params[])
{
	static
	    userid,
	    weaponid,
	    ammo;
	    
    if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

	if (sscanf(params, "udI(500)", userid, weaponid, ammo))
	    return UsageMessage(playerid, "/giveweapon [id/Name] [weapon] [mermi]");

	if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to give a weapon to is not in the game.");
	
	if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to give a weapon to is not in the game.");
	
	if (weaponid <= 0 || weaponid > 46 || (weaponid >= 19 && weaponid <= 21))
		return ErrorMessage(playerid, "Invalid weapon ID.");

    GiveWeapon(userid, weaponid, ammo);
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuya %s model silah verdi.",GetRank(playerid), ReturnName(playerid), ReturnName(userid), ReturnWeaponName(weaponid));
    Log_Write("logs/GiveWeapon.log", "[%s] %s %s, %s adl� oyuncuya %s model silah verdi.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid), ReturnWeaponName(weaponid));
	return 1;
}

CMD:aduty(playerid)
{
    if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
	if (OyuncuBilgi[playerid][pAdminDuty])
	{
	    OyuncuBilgi[playerid][pAdminDuty] = 0;
	    SendMessage(playerid, "You are closed your admin duty.");
	    PlayerTextDrawHide(playerid, AdminDuty[playerid]);
        Log_Write("logs/AdminDuty.log", "[%s] %s %s, admin dutysini kapatt�.", ReturnDate(), GetRank(playerid), ReturnName(playerid));
	}
	else
	{
        OyuncuBilgi[playerid][pAdminDuty] = 1;
        SendMessage(playerid, "You are opened your admin duty.");
        PlayerTextDrawShow(playerid, AdminDuty[playerid]);
        Log_Write("logs/AdminDuty.log", "[%s] %s %s, admin duty a�t�.", ReturnDate(), GetRank(playerid), ReturnName(playerid));
	}
	return 1;
}

CMD:giveexp(playerid, params[])
{
    new userid, exp;
    if (OyuncuBilgi[playerid][pAdmin] < 2 && !IsPlayerAdmin(playerid)) return ErrorMessage(playerid, "You have no authorization!");

    if (sscanf(params, "ui", userid, exp))
        return UsageMessage(playerid, "/giveexp [ID/Name] [Amount]");

    if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to give EXP to is not in the game.");

    if (Logged[userid] != 1) return ErrorMessage(playerid, "The player you want to give EXP to is not in the game.");

    OyuncuBilgi[userid][pEXP] += exp;
    AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncuya %d EXP verdi.", GetRank(playerid), ReturnName(playerid), exp, ReturnName(userid));
    Log_Write("logs/GiveEXP.log", "[%s] %s %s, %s adl� oyuncuya %d EXP verdi.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid), exp);
    SendMessage(playerid, "You have given %d EXP to player %s.", exp, ReturnName(userid));
    SendMessage(userid, "%s gave you %d EXP.", ReturnName(playerid), exp);
    OyuncuGuncelle(userid);
    return 1;
}

CMD:resetstats(playerid, params[])
{
	new userid;
	if (OyuncuBilgi[playerid][pAdmin] < 2) return ErrorMessage(playerid, "You have no authorization!");
	if (sscanf(params, "u", userid)) return UsageMessage(playerid, "/resetstats [ID/Name]");
	SendMessage(playerid, "You reset your %s's data.", ReturnName(userid));
	SendMessage(playerid, "%s reset your data.", ReturnName(playerid));
	AdminMessage(COLOR_LIGHTRED, "ADM: %s %s, %s adl� oyuncunun b�t�n verilerini s�f�rlad�.", GetRank(playerid), ReturnName(playerid), ReturnName(userid));
	Log_Write("logs/ResetStats.log", "[%s] %s %s, %s adl� oyuncunun b�t�n verilerini s�f�rlad�.", ReturnDate(), GetRank(playerid), ReturnName(playerid), ReturnName(userid));
	SpawnKorumasi1(userid);
    OyuncuBilgi[userid][pLegalTeleport] = gettime() + 2;
    SetPlayerPos(userid, 1728.5088, -1668.0836, 22.6094);
    SetPlayerFacingAngle(userid, 49.5617);
    SetPlayerInterior(userid, 18);
    SetPlayerVirtualWorld(userid, 10);
    SetPlayerSkin(userid, OyuncuBilgi[userid][pSkin]);
    ResetPlayerWeapons(userid);
    if (DMOda[userid] == 0) return LVPDArena--;
	if (DMOda[userid] == 1) return JeffersonArena--;
	if (DMOda[userid] == 2) return RCArena--;
	if (DMOda[userid] == 3) return GhostArena--;
	if (DMOda[userid] == 4) return HeadshotArena--;
	SetPlayerTeam(userid, NO_TEAM);
	ResetStats(userid);
    GiveWeapon(userid, 24, 1000);
	OyuncuGuncelle(userid);
	return 1;
}

CMD:createcar(playerid, params[])
{
	static
		model[32],
		color1,
		color2,
		id = -1;

    if (OyuncuBilgi[playerid][pAdmin] < 1)
	    return ErrorMessage(playerid, "You have no authorization!");

	if (sscanf(params, "s[32]I(-1)I(-1)", model, color1, color2))
 	{
	 	UsageMessage(playerid, "/createcar [model id/name] [color 1] [color 2]");
	 	return 1;
	}
	if ((model[0] = GetVehicleModelByName(model)) == 0)
	    return ErrorMessage(playerid, "Invalid model ID.");

	new
	    Float:x,
		Float:y,
		Float:z,
		Float:angle;

    GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);

	id = CreateVehicle(model[0], x, y + 2, z, angle, color1, color2, 0);
	SetVehicleHealth(id, 900);
	SetEngineStatus(id, true);
	LinkVehicleToInterior(id, GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(id, GetPlayerVirtualWorld(playerid));
	SendMessage(playerid, "Temporary vehicle has been created, ID: %d.", id);
	return 1;
}

CMD:destroycar(playerid, params[])
{
	new id;
    if (OyuncuBilgi[playerid][pAdmin] < 1)
	    return ErrorMessage(playerid, "You have no authorization!");
	    
    if (sscanf(params, "d", id))
 	{
	 	if (IsPlayerInAnyVehicle(playerid) && id > 12)
		 	id = GetPlayerVehicleID(playerid);

		else return UsageMessage(playerid, "/destroycar [Vehicle ID]");
	}

    DestroyVehicle(id);
	SendMessage(playerid, "Temporary vehicle with ID %d has been deleted.", id);
	return 1;
}