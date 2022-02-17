CMD:opencrate(playerid, params[])
{
	if (OyuncuBilgi[playerid][pSandikHakki] < 1) return ErrorMessage(playerid, "You haven't any crate rights!");
	new exp = RandomEx(10, 50);
	new para = RandomEx(1000, 10000);
	ParaVer(playerid, para);
	OyuncuBilgi[playerid][pEXP] += exp;
	OyuncuBilgi[playerid][pSandikHakki] --;
	SendMessage(playerid, "You opened a chest and earned $%d money and %d exp from the chest.", para, exp);
	Log_Write("logs/OpenCrate.log","[%s] %s bir sand�k a�t� ve sand�ktan $%d para ve %d exp kazand�.",ReturnDate(), ReturnName(playerid), para, exp);
	OyuncuGuncelle(playerid);
	return 1;
}

CMD:vipchat(playerid, params[]) return callcmd::v(playerid, params);
CMD:v(playerid, params[])
{
	if (OyuncuBilgi[playerid][pVip] < 1 && OyuncuBilgi[playerid][pAdminDuty] < 1) return ErrorMessage(playerid, "You have no authorization!");
	
	if (OyuncuBilgi[playerid][pMute] > 0) return ErrorMessage(playerid, "You have been muted for %d seconds.", OyuncuBilgi[playerid][pMute]);

    if (isnull(params))
       return UsageMessage(playerid, "/v(ipchat) [mesaj]");

    foreach(new i:Player) if(OyuncuBilgi[i][pVip] == 1 || OyuncuBilgi[i][pAdminDuty] == 1)
	{
	    if(strlen(params) > 64 && OyuncuBilgi[playerid][pVip] == 1 && OyuncuBilgi[playerid][pAdminDuty] == 0)
	    {
	        SendClientMessageEx(i, COLOR_GOLD, "[V.I.P Chat] %s: {FFFFFF}%.64s", ReturnName(playerid), params);
	        SendClientMessageEx(i, COLOR_GOLD, "{FFFFFF}...%s", params[64]);
	    }
	    else if (strlen(params) <= 64 && OyuncuBilgi[playerid][pVip] == 1 && OyuncuBilgi[playerid][pAdminDuty] == 0)
	    {
	        SendClientMessageEx(i, COLOR_GOLD, "[V.I.P Chat] %s: {FFFFFF}%s", ReturnName(playerid), params);
	    }
	    else if (strlen(params) > 64 && OyuncuBilgi[playerid][pAdminDuty] == 1)
	    {
	        SendClientMessageEx(i, COLOR_GOLD, "[V.I.P Chat] {AA3333}[ADMIN]{B8860B} %s: {FFFFFF}%.64s", ReturnName(playerid), params);
	        SendClientMessageEx(i, COLOR_GOLD, "{FFFFFF}...%s", params[64]);
	    }
	    else if (strlen(params) <= 64 && OyuncuBilgi[playerid][pAdminDuty] == 1)
	    {
	        SendClientMessageEx(i, COLOR_GOLD, "[V.I.P Chat] {AA3333}[ADMIN]{B8860B} %s: {FFFFFF}%s", ReturnName(playerid), params);
	    }
	}
 	Log_Write("logs/VIPChat.log","[%s] [V.I.P Chat] %s: %s",ReturnDate(), ReturnName(playerid), params);
	return 1;
}

CMD:teamchat(playerid, params[]) return callcmd::t(playerid, params);
CMD:t(playerid, params[])
{
	if (TDMOda[playerid] == -1) return ErrorMessage(playerid, "You must be in the TDM arena to use this command.");
	
	if (OyuncuBilgi[playerid][pMute] > 0) return ErrorMessage(playerid, "You have been muted for %d seconds.", OyuncuBilgi[playerid][pMute]);
	
    if (isnull(params))
       return UsageMessage(playerid, "/t(eamchat) [mesaj]");

    foreach(new i:Player) if(TDMOda[i] != -1 && TDMOda[playerid] != -1)
	{
	    if(strlen(params) > 64 && TDMOda[i] == TDMOda[playerid])
	    {
	        SendClientMessageEx(i, COLOR_BLUE, "[Team Chat] %s: {FFFFFF}%.64s", ReturnName(playerid), params);
	        SendClientMessageEx(i, COLOR_BLUE, "{FFFFFF}...%s", params[64]);
	    }
	    else if (strlen(params) <= 64 && TDMOda[i] == TDMOda[playerid])
	    {
	        SendClientMessageEx(i, COLOR_BLUE, "[Team Chat] %s: {FFFFFF}%s", ReturnName(playerid), params);
	    }
	}
 	Log_Write("logs/TeamChat.log","[%s] [Team Chat] %s: %s",ReturnDate(), ReturnName(playerid), params);
	return 1;
}

CMD:adminchat(playerid, params[]) return callcmd::a(playerid, params);
CMD:a(playerid, params[])
{
	if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");

    if (isnull(params))
       return UsageMessage(playerid, "/a(dminchat) [mesaj]");

    foreach(new i:Player) if(OyuncuBilgi[i][pAdmin] >= 1)
	{
	    if(strlen(params) > 64 && OyuncuBilgi[i][pAdmin] >= 1)
	    {
	        SendClientMessageEx(i, COLOR_RED, "[Admin Chat] %s: {FFFFFF}%.64s", ReturnName(playerid), params);
	        SendClientMessageEx(i, COLOR_RED, "{FFFFFF}...%s", params[64]);
	    }
	    else if (strlen(params) <= 64 && OyuncuBilgi[i][pAdmin] >= 1)
	    {
	        SendClientMessageEx(i, COLOR_RED, "[Admin Chat] %s: {FFFFFF}%s", ReturnName(playerid), params);
	    }
	}
 	Log_Write("logs/AdminChat.log","[%s] [Admin Chat] %s: %s",ReturnDate(), ReturnName(playerid), params);
	return 1;
}

CMD:id(playerid, params[])
{
    if (isnull(params))
        return UsageMessage(playerid, "/id [ID/Name]");

    if (strlen(params) < 3)
        return ErrorMessage(playerid, "You must enter at least 3 characters.");

    new count;
 	foreach (new i : Player)
 	{
        if (strfind(ReturnName(i), params, true) != -1)
        {
            SendMessage(playerid, "%s - ID: %d", ReturnName(i), i);
            count++;
        }
    }
    if (!count)
        return ErrorMessage(playerid, "No such player found: \"%s\".", params);
    return 1;
}

CMD:vipmenu(playerid)
{
    //if(OyuncuBilgi[playerid][pVip] < 1) return ErrorMessage(playerid, "You are not V.�.P (/rscmarket)");   //TEST ���N G�ZLEND� GER� A�ILACAK
    VipMenu(playerid);
	return 1;
}

CMD:vipskin(playerid)
{
    new yazi[1000];
    if (GetPlayerMoney(playerid) < 1000) return ErrorMessage(playerid, "You don't have enough money to buy skins ($1.000).");

    for (new i; i<sizeof(VipSkin); i++)
    {
        if (VipSkin[i] == 0) continue;
        format(yazi,sizeof(yazi), "%s%d\n",yazi,VipSkin[i]);
    }
    ShowPlayerDialog(playerid, DIALOG_VIPSKIN, DIALOG_STYLE_PREVMODEL, ">> V.I.P Skins",yazi, "{FFFFFF}Select", "{FFFFFF}Cancel");
	return 1;
}

CMD:rapor(playerid, params[]) return callcmd::report(playerid);
CMD:report(playerid)
{
	if (OyuncuBilgi[playerid][pMute] > 0)
	    return ErrorMessage(playerid, "You have been muted for %d seconds.", OyuncuBilgi[playerid][pMute]);
	    
	Dialog_Show(playerid, Report, DIALOG_STYLE_INPUT, "{FFFFFF}>> Report", "{FFFFFF}> Please enter the ID of the player you want to report:", "{FFFFFF}Enter", "{FFFFFF}Cancel");
	return 1;
}

CMD:rscmarket(playerid)
{
    new string[500], toplamoyuncu[1024];
    strcat(string, " \n");
   	format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} Armor 2.000 RCoin\n", LVPDArena);
    strcat(string, toplamoyuncu);
    format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} V.I.P 500.000 RCoin\n", JeffersonArena);
    strcat(string, toplamoyuncu);
    format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} Sniper 25.000 RCoin\n", RCArena);
    strcat(string, toplamoyuncu);
   	Dialog_Show(playerid, rosecionmarket, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}>> Rose Coin Market", string, "{FFFFFF}Buy", "{FFFFFF}Cancel");
	return 1;
}

CMD:duel(playerid, params[])
{
    new target;
    if (sscanf(params, "u", target))
       return UsageMessage(playerid, "/duel [ID/Name]");
       
    if(DMOda[playerid] != -1 || TDMOda[playerid] != -1 || AdminArea[playerid] != 0) return ErrorMessage(playerid, "You must be in the lobby to use this command.");
	if(OyuncuBilgi[playerid][Duelde]) return ErrorMessage(playerid, "You are already in a duel.");
	if (!IsPlayerConnected(target)) return ErrorMessage(playerid, "The player you want to send a duel request to is not in the game.");
    if (Logged[target] != 1) return ErrorMessage(playerid, "The player you want to send a duel request to is not in the game.");
	if (DMOda[target] != -1 || TDMOda[target] != -1 || AdminArea[target] != 0) return ErrorMessage(playerid, "This player is not in the lobby.");
	if(target == playerid) return ErrorMessage(playerid, "You can't ask yourself to duel.");
	OyuncuBilgi[playerid][DuelRakip] = target;
	OyuncuBilgi[target][DuelRakip] = playerid;
   	new str[512];
   	format(str, 512, "{FFFFFF}> {FFFFFF}Saw\n{FFFFFF}> {FFFFFF}Grenade\n{FFFFFF}>{FFFFFF}Molotov\n{FFFFFF}> {FFFFFF}Colt-45\n{FFFFFF}> {FFFFFF}Silenced\n{FFFFFF}> {FFFFFF}Deagle\n{FFFFFF}> {FFFFFF}Shotgun\n{FFFFFF}> {FFFFFF}Sawn Off\n{FFFFFF}> {FFFFFF}Combat\n{FFFFFF}> {FFFFFF}Uzi\n{FFFFFF}> {FFFFFF}MP5\n{FFFFFF}> {FFFFFF}AK-47\n{FFFFFF}> {FFFFFF}M4\n{FFFFFF}> {FFFFFF}Tec-9\n{FFFFFF}> {FFFFFF}Rifle\n{FFFFFF}> {FFFFFF}Sniper");
   	ShowPlayerDialog(playerid, DIALOG_DUEL_WEAPON, DIALOG_STYLE_LIST, "{FFFFFF}>> Rose Deathmatch - {FFFFFF}1. Duel Weapon", str, "{FFFFFF}Select", "{FFFFFF}Cancel");
    return 1;
}

CMD:stats(playerid, params[])
{
	new userid;
    if (sscanf(params, "u", userid))
    {
        if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player whose stats you want to see is not in the game.");
	    if (Logged[userid] != 1) return ErrorMessage(playerid, "The player whose stats you want to see is not in the game.");
	    
	    SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------");
	    SendClientMessageEx(playerid, COLOR_GREY, "Money: %s, Level: %d, EXP: %d/%d, Admin Rank: %s",  FormatNumber(OyuncuBilgi[playerid][pPara]), OyuncuBilgi[playerid][pEXP], OyuncuBilgi[playerid][pLevelExp], OyuncuBilgi[playerid][pEXP]*10, GetRank(playerid));
        SendClientMessageEx(playerid, COLOR_GREY, "Playing Hours: %d, K/D: %0.2f, Kill: %d, Die: %d", OyuncuBilgi[playerid][pOynamaSaati], OyuncuBilgi[playerid][pKD], OyuncuBilgi[userid][pOldurme], OyuncuBilgi[userid][pOlme]);
		SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------");
	}
	else
	{
		if (OyuncuBilgi[playerid][pAdmin] < 1) return ErrorMessage(playerid, "You have no authorization!");
        SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------");
	    SendClientMessageEx(playerid, COLOR_GREY, "Money: %s, Level: %d, EXP: %d/%d, Admin Rank: %s", FormatNumber(OyuncuBilgi[userid][pPara]), OyuncuBilgi[playerid][pEXP], OyuncuBilgi[playerid][pLevelExp], OyuncuBilgi[playerid][pEXP]*10, GetRank(userid));
        SendClientMessageEx(playerid, COLOR_GREY, "Playing Hours: %d, K/D: %0.2f, Kill: %d, Die: %d", OyuncuBilgi[userid][pOynamaSaati], OyuncuBilgi[userid][pKD], OyuncuBilgi[userid][pOldurme], OyuncuBilgi[userid][pOlme]);
		SendClientMessageEx(playerid, COLOR_WHITE, "-------------------------------------------------------------------");
	}
	return 1;
}

CMD:skin(playerid, params[])
{
    static
        skinid;
        
    new yazi[1000];
    if (GetPlayerMoney(playerid) < 2000) return ErrorMessage(playerid, "You don't have enough money to buy skins ($2.000).");
    if (sscanf(params, "i", skinid))
    {
        for (new i; i<sizeof(Skins); i++)
        {
            if (Skins[i] == 0) continue;
            format(yazi,sizeof(yazi), "%s%d\n",yazi,Skins[i]);
        }
        ShowPlayerDialog(playerid, DIALOG_SKIN, DIALOG_STYLE_PREVMODEL, ">> Skins",yazi, "{FFFFFF}Select", "{FFFFFF}Cancel");
    }
	else
	{
	    if (skinid < 2 || skinid > 311) return ErrorMessage(playerid, "The skin ID you choose cannot be smaller than 2 and greater than 311.");
	    SetPlayerSkin(playerid, skinid);
	    ParaVer(playerid, -1000);
	    OyuncuBilgi[playerid][pSkin] = GetPlayerSkin(playerid);
    	OyuncuGuncelle(playerid);
	}
	return 1;
}

CMD:cc(playerid, params[])return callcmd::chatlogclear(playerid);
CMD:chatlogclear(playerid)
{
    ChatSil(playerid);
    return 1;
}
CMD:cmds(playerid) return callcmd::help(playerid);
CMD:help(playerid)
{
	SendMessage(playerid, "/lobby, /skin, /pm, /clearchat & /cc, /report, /market, /teamchat & /t, /opencrate, /jailcontrol.");
	return 1;
}

CMD:pm(playerid, params[])
{
	static
	    userid,
	    text[128];

    if (OyuncuBilgi[playerid][pMute] > 0)
	    return ErrorMessage(playerid, "You have been muted for %d seconds.", OyuncuBilgi[playerid][pMute]);

	if (sscanf(params, "us[128]", userid, text))
	    return UsageMessage(playerid, "/pm [ID/Name] [Mesaj]");

	if (!IsPlayerConnected(userid)) return ErrorMessage(playerid, "The player you want to PM is not in the game.");

    if (Logged[playerid] == 0)
	    return ErrorMessage(playerid, "You cannot use this command right now.");

	if (userid == playerid)
	    return ErrorMessage(playerid, "You can't send PM to yourself.");

    if (IsPlayerPause(userid)) SendMessage(playerid, "This player AFK may not be able to reply to your message.");
	foreach (new i: Player)
	{
        if (OyuncuBilgi[i][pSpecPM] == playerid || OyuncuBilgi[i][pSpecPM] == userid)
        {
            SendClientMessageEx(i, COLOR_LIGHTBLUE, "[PM SPEC] %s (%d) �� %s (%d): %s", ReturnName(playerid), playerid, ReturnName(userid), userid, text);
	    }
	}
    if (OyuncuBilgi[playerid][pAdmin] < 1)
    {
        SendClientMessageEx(userid, COLOR_YELLOW, "[PM] �� %s (%d): %s", ReturnName(playerid), playerid, text);
        SendClientMessageEx(playerid, 0xdede02FF, "[PM] �� %s (%d): %s", ReturnName(userid), userid, text);
	}
	else
	{
        SendClientMessageEx(userid, COLOR_YELLOW, "[STAFF] �� {FF6347}%s {FFE700}(%d): %s", ReturnName(playerid), playerid, text);
        SendClientMessageEx(playerid, 0xdede02FF, "[PM] �� %s (%d): %s", ReturnName(userid), userid, text);
	}
    Log_Write("logs/PM.log", "[%s] %s >>> %s Mesaj: %s",ReturnDate(),ReturnName(playerid),ReturnName(userid), text);
    return 1;
}

CMD:lobby(playerid)
{
	if (OyuncuBilgi[playerid][pJail] == 1) return ErrorMessage(playerid, "You cannot use this command in jail.");
    ArenaCik(playerid);
    SpawnKorumasi1(playerid);
    OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
    SetPlayerColor(playerid, 0xFFFFFFFF);
    if (OyuncuBilgi[playerid][pVip] == 1)
    {
	    SetPlayerColor(playerid, 0xFFC0CBFF);
    }
    SetPlayerPos(playerid, 1728.5088, -1668.0836, 22.6094);
    SetPlayerFacingAngle(playerid, 49.5617);
    SetPlayerInterior(playerid, 18);
    SetPlayerVirtualWorld(playerid, 10);
    SetPlayerSkin(playerid, OyuncuBilgi[playerid][pSkin]);
    ResetPlayerWeapons(playerid);
	SetPlayerTeam(playerid, NO_TEAM);
    OyuncuGuncelle(playerid);
    GiveWeapon(playerid, 24, 1000);
	SendMessage(playerid, "You were sent to the lobby.");
    Log_Write("logs/Lobby.log", "[%s] %s, lobiye spawnland�.",ReturnDate(),ReturnName(playerid));
    return 1;
}

CMD:aksesuar(playerid)
{
	AksesuarlariGoster(playerid,1);
	return 1;
}

