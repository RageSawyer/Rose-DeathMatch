public OnGameModeInit()
{
  	MysqlBaglanti();
    Bakim = 0;
    SetGameModeText("RS:DM v0.1");
    SetNameTagDrawDistance(45.0);
    EnableStuntBonusForAll(0);
    DisableInteriorEnterExits();
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
    
    ///////////////////////////////ARAÇLAR///////////////////////////////
     //GROVE Araçlar
    aracid[0] = CreateVehicle(522, 2306.2949, -1656.7419, 14.3973, 87.8932, 86, 86, 60);
    SetVehicleNumberPlate(aracid[0], "GROVE-01");
    SetVehicleVirtualWorld(aracid[0], 10);
    aracid[1] = CreateVehicle(560, 2306.3733, -1661.5420, 14.3973, 89.6687, 86, 86, 60);
    SetVehicleNumberPlate(aracid[1], "GROVE-02");
    SetVehicleVirtualWorld(aracid[1], 10);
    aracid[2] = CreateVehicle(487, 2295.3391, -1661.4783, 14.3973, 89.6687, 86, 86, 60);
    SetVehicleNumberPlate(aracid[2], "GROVE-03");
    SetVehicleVirtualWorld(aracid[2], 10);
    aracid[3] = CreateVehicle(422, 2298.7148, -1656.5142, 14.6250, 89.9394, 86, 86, 60);
    SetVehicleNumberPlate(aracid[3], "GROVE-04");
    SetVehicleVirtualWorld(aracid[3], 10);
    aracid[4] = CreateVehicle(560, 2289.6030, -1656.5035, 14.3973, 90.1910, 86, 86, 60);
    SetVehicleNumberPlate(aracid[4], "GROVE-05");
    SetVehicleVirtualWorld(aracid[4], 10);
    aracid[5] = CreateVehicle(522, 2289.7178, -1661.4321, 14.3973, 86.6398, 86, 86, 60);
    SetVehicleNumberPlate(aracid[5], "GROVE-06");
    SetVehicleVirtualWorld(aracid[5], 10);
    //BALLAS Araçlar
    aracid[6] = CreateVehicle(487, 2112.3958, -1422.2195, 23.8281, 178.8652, 147, 147, 60);
    SetVehicleNumberPlate(aracid[6], "BALLAS-01");
    SetVehicleVirtualWorld(aracid[6], 10);
    aracid[7] = CreateVehicle(560, 2131.2556, -1423.9420, 23.8281, 179.9096, 147, 147, 60);
    SetVehicleNumberPlate(aracid[7], "BALLAS-02");
    SetVehicleVirtualWorld(aracid[7], 10);
    aracid[8] = CreateVehicle(560, 2131.2700, -1431.3000, 23.8281, 180.1185, 147, 147, 60);
    SetVehicleNumberPlate(aracid[8], "BALLAS-03");
    SetVehicleVirtualWorld(aracid[8], 10);
    aracid[9] = CreateVehicle(560, 2131.2878, -1440.9218, 23.8281, 180.1185, 147, 147, 60);
    SetVehicleNumberPlate(aracid[9], "BALLAS-04");
    SetVehicleVirtualWorld(aracid[9], 10);
    aracid[10] = CreateVehicle(422, 2109.2307, -1440.7805, 23.8281, 177.3304, 147, 147, 60);
    SetVehicleNumberPlate(aracid[10], "BALLAS-05");
    SetVehicleVirtualWorld(aracid[10], 10);
    aracid[11] = CreateVehicle(522, 2114.9207, -1441.2958, 23.8281, 180.9541, 147, 147, 60);
    SetVehicleNumberPlate(aracid[11], "BALLAS-06");
    SetVehicleVirtualWorld(aracid[11], 10);
    //Vagos Araçlar
    aracid[12] = CreateVehicle(487, 1729.1299, -1857.3160, 13.1187, 271.4708, 194, 194, 60);
    SetVehicleNumberPlate(aracid[12], "VAGOS-01");
    SetVehicleVirtualWorld(aracid[12], 10);
    aracid[13] = CreateVehicle(560, 1737.2491, -1857.1069, 13.1182, 271.4709, 194, 194, 60);
    SetVehicleNumberPlate(aracid[13], "VAGOS-02");
    SetVehicleVirtualWorld(aracid[13], 10);
    aracid[14] = CreateVehicle(560, 1747.8888, -1857.0978, 13.1187, 269.8332, 194, 194, 60);
    SetVehicleNumberPlate(aracid[14], "VAGOS-03");
    SetVehicleVirtualWorld(aracid[14], 10);
    aracid[15] = CreateVehicle(560, 1760.7903, -1857.1353, 13.1181, 269.8330, 194, 194, 60);
    SetVehicleNumberPlate(aracid[15], "VAGOS-04");
    SetVehicleVirtualWorld(aracid[15], 10);
    aracid[16] = CreateVehicle(422, 1729.6609, -1852.3564, 13.1198, 269.0177, 194, 194, 60);
    SetVehicleNumberPlate(aracid[16], "VAGOS-05");
    SetVehicleVirtualWorld(aracid[16], 10);
    aracid[17] = CreateVehicle(522, 1742.9091, -1852.5635, 13.1192, 269.5351, 194, 194, 60);
    SetVehicleNumberPlate(aracid[17], "VAGOS-06");
    SetVehicleVirtualWorld(aracid[17], 10);
    //Aztecas Araçlar
    aracid[18] = CreateVehicle(487, 1888.2410, -2020.5837, 13.1676, 179.3266, 184, 184, 60);
    SetVehicleNumberPlate(aracid[18], "ASTECAS-01");
    SetVehicleVirtualWorld(aracid[18], 10);
    aracid[19] = CreateVehicle(560, 1888.1006, -2027.9486, 13.1676, 179.0275, 184, 184, 60);
    SetVehicleNumberPlate(aracid[19], "ASTECAS-02");
    SetVehicleVirtualWorld(aracid[19], 10);
    aracid[20] = CreateVehicle(560, 1887.8684, -2037.3926, 13.1690, 178.7747, 184, 184, 60);
    SetVehicleNumberPlate(aracid[20], "ASTECAS-03");
    SetVehicleVirtualWorld(aracid[20], 10);
    aracid[21] = CreateVehicle(560, 1878.1155, -2020.2897, 13.1677, 179.8751, 184, 184, 60);
    SetVehicleNumberPlate(aracid[21], "ASTECAS-04");
    SetVehicleVirtualWorld(aracid[21], 10);
    aracid[22] = CreateVehicle(422, 1878.1558, -2028.0743, 13.1678, 180.2356, 184, 184, 60);
    SetVehicleNumberPlate(aracid[22], "ASTECAS-05");
    SetVehicleVirtualWorld(aracid[22], 10);
    aracid[23] = CreateVehicle(522, 1878.2770, -2037.5746, 13.1679, 180.6592, 184, 184, 60);
    SetVehicleNumberPlate(aracid[23], "ASTECAS-06");
    SetVehicleVirtualWorld(aracid[23], 10);

    for(new i; i < 12; i++)
	{
		SetVehicleToRespawn(aracid[i]);
	}
	
    actors[0] = CreateActor(291, 1721.5087, -1668.4894, 20.2255, 43.3116);
    CreateDynamic3DTextLabel("{ffb7c5}(Deathmatch - DM)", -1, 1721.5087,-1668.4894,20.2255+1, 20.0);
    CreateDynamic3DTextLabel("{808080}Shot", -1, 1721.5087,-1668.4894,20.2255, 20.0);
    actors[1] = CreateActor(293, 1728.7838, -1661.5387, 20.2380, 41.7356);
    CreateDynamic3DTextLabel("{FF0000}(Team Deathmatch - TDM)", -1, 1728.7838,-1661.5387,20.2380+1, 20.0);
    CreateDynamic3DTextLabel("{808080}Shot", -1, 1728.7838,-1661.5387,20.2380, 20.0);
    actors[2] = CreateActor(281, 1713.8925, -1663.5391, 20.2279, 270.8640);	
	CreateDynamic3DTextLabel("{8ee5ee}(Police Pursit - PP)(YAPIM AÞAMASINDA)", -1, 1713.8925,-1663.5391,20.2279+1, 20.0);
    CreateDynamic3DTextLabel("{808080}Shot", -1, 1713.8925,-1663.5391,20.2279, 20.0);
    SetActorVirtualWorld(actors[2], 10);
    SetActorVirtualWorld(actors[1], 10);
    SetActorVirtualWorld(actors[0], 10);
    SetActorInvulnerable(actors[2], false);	
    SetActorInvulnerable(actors[1], false);
    SetActorInvulnerable(actors[0], false);
    
    ///////////////////////////////ARENALAR///////////////////////////////
	GroveTakim = 0;
	BallasTakim = 0;
    VagosTakim = 0;
    AztecasTakim = 0;
	LVPDArena = 0;
	RCArena = 0;
	GhostArena = 0;
	HeadshotArena = 0;
	JeffersonArena = 0;
	ToplamPursuitPlayer = 0;
	///////////////////////////////TIMERLAR///////////////////////////////
	SetTimer("ActorSpawn", 1000, true);
	SetTimer("PursuitControl", 1000, true);
	SetTimer("SunucuGuncelle", 1000, true);
	SetTimer("MinuteCheck", 60000, true);
	
    print("MySQL baðlantýsý baþarýlý.");
	return 1;
}

public OnPlayerRequestDownload(playerid, type, crc)
{
    if(!IsPlayerConnected(playerid))
        return 0;

   	if(IsPlayerNPC(playerid))
        return 0;

    new filename[64], filefound, final_url[256], str[148], turu[24];

    new INDIRME_ADRESI[4];

    if(type == DOWNLOAD_REQUEST_TEXTURE_FILE)
    {
        filefound = FindTextureFileNameFromCRC(crc, filename, sizeof(filename));
        format(turu, sizeof(turu), "texture dosyasý");
    }
    else if(type == DOWNLOAD_REQUEST_MODEL_FILE)
    {
        filefound = FindModelFileNameFromCRC(crc, filename, sizeof(filename));
        format(turu, sizeof(turu), "model dosyasý");
    }

    if(filefound)
    {
        new server = randomEx(1, 2);

        if(server == 1) format(INDIRME_ADRESI[playerid], 42, "http://54.205.142.123/fastsv1");
        if(server == 2) format(INDIRME_ADRESI[playerid], 42, "http://54.205.142.123/fastsv2");
        format(final_url, sizeof(final_url), "%s/%s", INDIRME_ADRESI[playerid], filename);
        RedirectDownload(playerid, final_url);
        new sayisi = randomEx(1000000, 9999999);
        new numarasi[12];
        format(numarasi, sizeof(numarasi), "%d", sayisi);
        format(str, sizeof(str), "{FF0000}HTTP Download: {E74C3C}-%s {FFFFFF}indirilirken {2ECC71}HTTP Download Server #%d {FFFFFF}tercih edildi.", numarasi, server);
        SendClientMessage(playerid, -1, str);
    }
    return 1;
}  

public OnGameModeExit()
{
    print("[ROSE-DM] MySQL baðlantýsý baþarýsýz olduðu için mysql baðlantýlarý kapatýlýyor.");
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if(IsPlayerConnected(i))
        {
            OnPlayerDisconnect(i, 1);
        }
    }
    mysql_close(g_SQL);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 0;
}

public OnPlayerGiveDamageActor(playerid, damaged_actorid, Float: amount, weaponid, bodypart)
{
    if (damaged_actorid == actors[0])
    {
        new string[500], toplamoyuncu[1024];
        strcat(string, " \n");
       	format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} LVPD Arena\n", LVPDArena);
        strcat(string, toplamoyuncu);
        format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} Jefferson Motel\n", JeffersonArena);
        strcat(string, toplamoyuncu);
        format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} RC Battlefield\n", RCArena);
        strcat(string, toplamoyuncu);
        format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} Ghost Town\n", GhostArena);
        strcat(string, toplamoyuncu);
        format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} Headshot Arena\n", HeadshotArena);
        strcat(string, toplamoyuncu);
       	Dialog_Show(playerid, DMArena, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}>> Deathmatch Arena", string, "{FFFFFF}Join", "{FFFFFF}Cancel");
        SetActorPos(actors[0], 1721.5087, -1668.4894, 20.2255);
        SetActorFacingAngle(actors[0], 43.3116);
	}
	if (damaged_actorid == actors[1])
    {
        new string[500], toplamoyuncu[1024];
        strcat(string, " \n");
       	format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} Grove\n");
        strcat(string, toplamoyuncu);
        format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} Ballas\n");
        strcat(string, toplamoyuncu);
        format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} Vagos\n");
        strcat(string, toplamoyuncu);
        format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} Aztecas\n");
        strcat(string, toplamoyuncu);
       	Dialog_Show(playerid, TDMArena, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}>> Team Deathmatch", string, "{FFFFFF}Join", "{FFFFFF}Cancel");
    	SetActorPos(actors[1], 1728.7838, -1661.5387, 20.2380);
    	SetActorFacingAngle(actors[1], 41.7356);
	}
	if (damaged_actorid == actors[2])
    {
        new string[500], toplamoyuncu[1024];
        strcat(string, " \n");
       	format(toplamoyuncu, sizeof(toplamoyuncu), "{FFFFFF}>{FFFFFF} PP Arena\n", LVPDArena);
        strcat(string, toplamoyuncu);
       	Dialog_Show(playerid, DMArena, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}>> Police Pursit Arena", string, "{FFFFFF}Join", "{FFFFFF}Cancel");
        SetActorPos(actors[2], 1713.8925, -1663.5391, 20.2279);
        SetActorFacingAngle(actors[2], 270.8640);
	}
    return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
    if(IsPlayerConnected(playerid))
    {
        new Float:vDistance = GetVehicleDistanceFromPoint(vehicleid, new_x, new_y, new_z);
        if(vDistance > 5.0 && GetVehicleSpeed(vehicleid) < 1 && OyuncuBilgi[playerid][pAdminDuty] == 0)
        {
            SetTimerEx("AracCekmeHilesiKick", 200, false, "d", playerid);
            SetVehiclePos(vehicleid, new_x, new_y, new_z);
            return 0;
        }
    }
    new Float:vhealth;
    GetVehicleHealth(vehicleid, vhealth);
    if (vhealth < 250)
    {
		SetVehicleToRespawn(vehicleid);
	}
    return 1;
}

public OnPlayerConnect(playerid)
{
    GetPlayerName(playerid, OyuncuBilgi[playerid][pIsim], MAX_PLAYER_NAME);
    VeriSifirla(playerid);
    EnablePlayerCameraTarget(playerid, 1);
    SetPVarInt(playerid, "Shot", 0);
    ChatSil(playerid);
    SilentWarning[playerid] = 0;
    OyuncuBilgi[playerid][pSpec] = 1;
    new sorgu[200];
    mysql_format(g_SQL, sorgu, sizeof(sorgu), "SELECT * FROM `oyuncular` WHERE `Isim` = '%s' LIMIT 1", OyuncuBilgi[playerid][pIsim]);
    mysql_tquery(g_SQL, sorgu, "OyuncuVeriYukle", "d", playerid);
    SetTimerEx("SecondUpdate", 1000, true, "d", playerid);
	SetTimerEx("AntiCheat", 200, true, "d", playerid);
	switch(random(9))
	{
       case 0: PlayAudioStreamForPlayer(playerid, "https://grand-samp.clan.su/13ed17cd7b3e.mp3");
       case 1: PlayAudioStreamForPlayer(playerid, "https://grand-samp.clan.su/8c72c0aa29a1.mp3");
       case 2: PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/562705281621164032/704300854693462076/Rauf__Faik_-_Official_video_192_kbps.mp3");
	   case 3: PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/942163299045355541/942163380674908220/yt1s.com_-_10_No1_Kron1k_feat_Ahiyan_Kron1k.mp3");
	   case 4: PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/942163299045355541/942163414942359702/yt1s.com_-_13_No1_Yarm_Kalan_Sigara_feat_Melek_Mosso_Kron1k.mp3");
	   case 5: PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/942163299045355541/942163458852540496/yt1s.com_-_CAKAL_LUTFEN_Official_Music_Video.mp3");
	   case 6: PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/942163299045355541/942163552628772924/yt1s.com_-_ORGANIZE_BINGO_Official_Music_Video.mp3");
	   case 7: PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/942163299045355541/942163635302715412/yt1s.com_-_Uzi_Umrumda_Degil_Official_Video.mp3");
	   case 8: PlayAudioStreamForPlayer(playerid, "https://cdn.discordapp.com/attachments/942163299045355541/942165750741864539/sevde-demirel-serra-beats-ruyalardasin-slowtrap.mp3");
	}
	new ip[16];
	GetPlayerIp(playerid, ip, sizeof ip);
    format(sorgu, sizeof(sorgu), "SELECT * FROM `bans` WHERE `Ad` = '%s' OR `IP` = '%s'", ReturnName(playerid), GetIP(playerid));
    mysql_tquery(g_SQL, sorgu, "BanKontrol", "d", playerid);
    
    
    //TEXDRAWLAR
	AdminDuty[playerid] = CreatePlayerTextDraw(playerid, 3.666635, 230.651733, "Admin_Duty");
	PlayerTextDrawLetterSize(playerid, AdminDuty[playerid], 0.186999, 0.998518);
	PlayerTextDrawAlignment(playerid, AdminDuty[playerid], 1);
	PlayerTextDrawColor(playerid, AdminDuty[playerid], -2147483393);
	PlayerTextDrawSetShadow(playerid, AdminDuty[playerid], 0);
	PlayerTextDrawSetOutline(playerid, AdminDuty[playerid], 1);
	PlayerTextDrawBackgroundColor(playerid, AdminDuty[playerid], 255);
	PlayerTextDrawFont(playerid, AdminDuty[playerid], 1);
	PlayerTextDrawSetProportional(playerid, AdminDuty[playerid], 1);
	PlayerTextDrawSetShadow(playerid, AdminDuty[playerid], 0);
	
	Textdraw0[playerid] = CreatePlayerTextDraw(playerid, 577.216, 67.082, "100");
	PlayerTextDrawLetterSize(playerid, Textdraw0[playerid], 0.250, 0.810);
	PlayerTextDrawTextSize(playerid, Textdraw0[playerid], -171.007, -56.583);
	PlayerTextDrawAlignment(playerid, Textdraw0[playerid], 2);
	PlayerTextDrawColor(playerid, Textdraw0[playerid], -1);
	PlayerTextDrawUseBox(playerid, Textdraw0[playerid], 1);
	PlayerTextDrawBoxColor(playerid, Textdraw0[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, Textdraw0[playerid], 16711680);
	PlayerTextDrawFont(playerid, Textdraw0[playerid], 1);
	PlayerTextDrawSetProportional(playerid, Textdraw0[playerid], 1);

	Hud[playerid][0] = CreatePlayerTextDraw(playerid, 260.000000, 435.000000, "[Olme: 0 & Oldurme: 1 & K/D: 2 - Rose DM]");
	PlayerTextDrawLetterSize(playerid, Hud[playerid][0], 0.200000, 1.000000);
	PlayerTextDrawTextSize(playerid, Hud[playerid][0], 725.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, Hud[playerid][0], 1);
	PlayerTextDrawColor(playerid, Hud[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, Hud[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, Hud[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, Hud[playerid][0], 255);
	PlayerTextDrawFont(playerid, Hud[playerid][0], 3);
	PlayerTextDrawSetProportional(playerid, Hud[playerid][0], 1);  
	
    return 1;
}

public OnIncomingConnection(playerid, ip_address[], port)
{
    if (Reconnect[playerid] == 1)
    {
		Kick(playerid);
	}
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if (DMOda[playerid] == 0) return LVPDArena--;
	if (DMOda[playerid] == 1) return JeffersonArena--;
	if (DMOda[playerid] == 2) return RCArena--;
	if (DMOda[playerid] == 3) return GhostArena--;
	if (DMOda[playerid] == 4) return HeadshotArena--;
	Logged[playerid] = 0;
	Reconnect[playerid] = 1;
	PlayerTextDrawDestroy(playerid, Textdraw0[playerid]);
	Textdraw0[playerid] = PlayerText:INVALID_TEXT_DRAW;
	SetTimerEx("ReconnectSifirla", 5000, false, "d", playerid);
    OyuncuGuncelle(playerid, 0);
	if (Logged[playerid] == 1)
	{
        SendClientMessageToAllEx(COLOR_GREY, "%s has logged out of the server.", ReturnName(playerid));
	}
    ArenaCik(playerid);
    if(cache_is_valid(OyuncuBilgi[playerid][Cache_ID]))
    {
        cache_delete(OyuncuBilgi[playerid][Cache_ID]);
        OyuncuBilgi[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
    }
    foreach (new i:Player) if (OyuncuBilgi[i][pAdmin] >= 1 && OyuncuBilgi[i][pSpecID] == playerid && OyuncuBilgi[i][pSpec] == 1)
	{
	    IzlemeBitir(i);
	    callcmd::lobby(i);
	    SendMessage(i, "You were automatically removed from the spectate mode because the player you were watching exited the game.");
	}
	foreach (new i:Player) if (OyuncuBilgi[i][pAdmin] >= 1 && OyuncuBilgi[i][pSpecPM] == playerid)
	{
	    OyuncuBilgi[playerid][pSpecPM] = -1;
	    SendMessage(i, "The person you watched PMs of them has left the game.");
	}
	if(OyuncuBilgi[playerid][Duelde])
	{
	    SendClientMessageToAllEx(COLOR_GREEN, "%s, won a prize for killing %s in a duel.", ReturnName(OyuncuBilgi[playerid][DuelRakip]), ReturnName(playerid));
	    new exp = RandomEx(50, 100);
        OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][pEXP] += exp;
        ParaVer(playerid, -2000);
        ParaVer(OyuncuBilgi[playerid][DuelRakip], 2000);
        OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][pOldurme] ++;
        OyuncuBilgi[playerid][pOlme] ++;
        OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][Duelde] = false;
	    OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelRakip] = INVALID_PLAYER_ID;
	    OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelSilah1] = 0;
	    OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelSilah2] = 0;
	    OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelMap] = 0;
        OyuncuBilgi[playerid][Duelde] = false;
        OyuncuBilgi[playerid][DuelRakip] = INVALID_PLAYER_ID;
        OyuncuBilgi[playerid][DuelSilah1] = 0;
        OyuncuBilgi[playerid][DuelSilah2] = 0;
        OyuncuBilgi[playerid][DuelMap] = 0;
        SpawnPlayer(OyuncuBilgi[playerid][DuelRakip]);
        callcmd::lobby(OyuncuBilgi[playerid][DuelRakip]);
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if (IsPlayerPause(playerid)) return 0;
    
    if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
	{
		AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, invisible shot kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
        Log_Write("logs/AntiCheat.log", "[%s] %s, invisible shot kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
        SendMessage(playerid, "Invisible shot detected.");
        KickEx(playerid);
		return 0;
	}
	
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	if (z < 0)
	{
	    AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, invisible shot kullanmaya çalýþýyor.", ReturnName(playerid));
        Log_Write("logs/AntiCheat.log", "[%s] %s, invisible shot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(playerid));
	    SendMessage(playerid, "Invisible shot detected.");
	    return 0;
	}
	if (fX != fX || fY != fY || fZ != fZ)
	{
	    AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, bullet crasher kullanmaya çalýþýyor.", ReturnName(playerid));
		Log_Write("logs/AntiCheat.log", "[%s] %s, %s, bullet crasher kullanmaya çalýþýyor.", ReturnDate(), ReturnName(playerid));
		SendMessage(playerid, "Bullet crasher detected.");
	    return 0;
	}
	if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && GetPlayerSpeed(playerid) > 20 && OyuncuBilgi[playerid][pAdminDuty] == 0 && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID)
    {
   	    /*AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, c-slide kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
   	    Log_Write("logs/AntiCheat.log", "[%s] %s, c-slide kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
   	    SendMessage(playerid, "C-slide detected.");
        KickEx(playerid);*/
   	    return 0;
   	}
    if(GetPlayerState(playerid)  == PLAYER_STATE_DRIVER && OyuncuBilgi[playerid][pAdminDuty] == 0)
	{
        AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, driver shot kullanmaya çalýþýyor.", ReturnName(playerid), playerid);
		Log_Write("logs/AntiCheat.log", "[%s] %s, driver shot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(playerid));
		SendMessage(playerid, "Driver shot detected.");
    	return 0;
	}
	if(IsWeaponWithAmmo(weaponid) && weaponid != 38)
	{
		new count = 0;
		if(weaponid != CurrentWeapon[playerid]) CurrentWeapon[playerid] = weaponid, CurrentAmmo[playerid] = GetPlayerWeaponAmmo(playerid,weaponid), count++;
		if(GetPlayerWeaponAmmo(playerid,weaponid) > CurrentAmmo[playerid] || GetPlayerWeaponAmmo(playerid,weaponid) < CurrentAmmo[playerid])
		{

			CurrentAmmo[playerid] = GetPlayerWeaponAmmo(playerid,weaponid);
			NoReloading[playerid] = 0;
			count++;
		}
		if(GetPlayerWeaponAmmo(playerid,weaponid) != 0 && GetPlayerWeaponAmmo(playerid,weaponid) == CurrentAmmo[playerid] && count == 0 && OyuncuBilgi[playerid][pAdminDuty] == 0)
		{
			NoReloading[playerid] ++;
			NoReloading2[playerid] = gettime()+10;
			if(NoReloading[playerid] > 0)
			{
                return 0;
			}
			if(NoReloading[playerid] >= 5)
			{
				NoReloading[playerid] = 0;
				CurrentWeapon[playerid] = 0;
				CurrentAmmo[playerid] = 0;
				AdminMessage(COLOR_LIGHTRED, "%s (%d), no reload/infinite ammo kullanmaya çalýþýyor.", ReturnName(playerid), playerid);
				Log_Write("logs/AntiCheat.log", "[%s] %s, no reload/infinite ammo kullanmaya çalýþýyor.", ReturnDate(), ReturnName(playerid));
				/*SendMessage(playerid, "Anti hile devrede :p");
				KickEx(playerid);*/
				SendMessage(playerid, "no reload/infinite ammo detected.");
				return 0;
			}
		}
	}
    OyuncuBilgi[playerid][pAmmo][g_aWeaponSlots[weaponid]] --;
    new Float:lSurfOffsets[3];
    if(lSurfOffsets[0] != lSurfOffsets[0] || lSurfOffsets[1] != lSurfOffsets[1] || lSurfOffsets[2] != lSurfOffsets[2] )
    {
        return 0;
    }
	if (hittype == BULLET_HIT_TYPE_PLAYER)
  	{
		new vehicleid = GetPlayerVehicleID(hitid);
		if (!IsVehicleBike(vehicleid) && IsPlayerInAnyVehicle(hitid) && GetPlayerState(hitid) == PLAYER_STATE_DRIVER)
		{
            //AdminMessage(COLOR_LIGHTRED, "CheatLog: %s (%d), silent aimbot kullanmaya çalýþýyor.", ReturnName(playerid), playerid);
            Log_Write("logs/AntiCheat.log", "[%s] %s, silent aimbot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(playerid));
            return 0;
		}
		new Float:xyz[3];
        GetPlayerPos(playerid,xyz[0],xyz[1],xyz[2]);
        new Float:hitdistance = GetPlayerDistanceFromPoint(hitid,xyz[0],xyz[1],xyz[2]);
	    switch(weaponid)
		{
		    case 30: {
				if(hitdistance > 70) return false;
			}
			case 31: {
				if(hitdistance > 90) return false;
			}
			case 33: {
				if(hitdistance > 100) return false;
			}
			case 34: {
				if(hitdistance > 200) return false;
			}
			case 25: {
				if(hitdistance > 30) return false;
			}
			case 29: {
				if(hitdistance > 45) return false;
			}
			case 22: {
				if(hitdistance > 50) return false;
			}
			case 23: {
				if(hitdistance > 50) return false;
			}
			case 24: {
				if(hitdistance > 50) return false;
		    }
		}
	}
	if (hittype == BULLET_HIT_TYPE_NONE)
	{
	   HeadAimbot[playerid] = 0;
	   Aimbot[playerid] = 0;
	   SilentWarning[playerid] = 0;
	}
	SetPVarInt(playerid, "Shot", 1);
	SetTimerEx("ShotReset", 200, false, "d", playerid);
	return 1;
}

public OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart)
{
	if (IsPlayerInRangeOfPoint(playerid, 50.0, 1728.5088, -1668.0836, 22.6094) && GetPlayerInterior(playerid) == 18 && GetPlayerVirtualWorld(playerid) == 10) return 0;
	if (OyuncuBilgi[playerid][pAdminDuty] == 1 || OyuncuBilgi[issuerid][pAdminDuty] == 1) return 0;
	if (SpawnKorumasi[playerid] == 1) return 0;
	
	if (weapon == 4 && amount >= 50 || weapon == 4 && amount == 0)
	{
        AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, knife hack (kill all) kullanmaya çalýþýyor.", ReturnName(issuerid));
		Log_Write("logs/AntiCheat.log", "[%s] %s, knife hack (kill all) kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
		SendMessage(issuerid, "Knife hack detected.");
		return 0;
	}
	
	/*if (IsBulletWeapon(weapon) && GetPVarInt(playerid, "Shot") != 1)
	{
        AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, fake bullet kullanmaya çalýþýyor.", ReturnName(issuerid));
		Log_Write("logs/AntiCheat.log", "[%s] %s, fake bullet kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
		SendMessage(issuerid, "Fake bullet detected.");
		return 0;
	}
	*/
    
	new
        Float:fOriginX, Float:fOriginY, Float:fOriginZ,
        Float:fHitPosX, Float:fHitPosY, Float:fHitPosZ;

    GetPlayerLastShotVectors(issuerid, fOriginX, fOriginY, fOriginZ, fHitPosX, fHitPosY, fHitPosZ);
    new Float:camX, Float:camY, Float:camZ;
    GetPlayerCameraPos(issuerid, camX, camY, camZ);
    new Float:cameradistance = GetPlayerDistanceFromPoint(issuerid, camX, camY, camZ);
    new Float:playerdistance = GetPlayerDistanceFromPoint(issuerid, fHitPosX, fHitPosY, fHitPosZ);
    new Float:hitdistance = GetPlayerDistanceFromPoint(playerid, fHitPosX, fHitPosY, fHitPosZ);
    new Float:cameradistance2 = GetPlayerDistanceFromPoint(playerid, camX, camY, camZ);
    new Float:fOriginX2, Float:fOriginY2, Float:fOriginZ2;
    fOriginX2 = fOriginX + RandomEx(1, 5);
    fOriginY2 = fOriginY + RandomEx(1, 5);
    fOriginZ2 = fOriginZ + RandomEx(1, 5);

/*	SendMessage(issuerid, "%f & %d", hitdistance, bodypart);

	if (bodypart == 9 && hitdistance < 0.6 || bodypart == 4 && hitdistance > 0.2)
	{
        AdminMessage(COLOR_LIGHTRED, "CheatLog: %s (%d), silent aimbot kullanmaya çalýþýyor.", ReturnName(issuerid), issuerid);
        Log_Write("logs/AntiCheat.log", "[%s] %s, silent aimbot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
		SendMessage(issuerid, "Silent aimbot detected.");
		return 0;
	}*/
	new Float:Wallshot = (hitdistance) - (cameradistance2);
    if(Wallshot > -1 && IsBulletWeapon(weapon))
    {
        //AdminMessage(COLOR_LIGHTRED, "%s (%d), wallshot kullanmaya çalýþýyor.", ReturnName(issuerid, 0), issuerid);
        return 0;
    }
    if (IsBulletWeapon(weapon) && hitdistance >= 4)
    {
        AdminMessage(COLOR_LIGHTRED, "CheatLog: %s (%d), silent aimbot kullanmaya çalýþýyor.", ReturnName(issuerid), issuerid);
        Log_Write("logs/AntiCheat.log", "[%s] %s, silent aimbot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
		SendMessage(issuerid, "Silent aimbot detected.");
		return 0;
	}
    if(IsBulletWeapon(weapon) && GetPlayerCameraMode(issuerid) == 53 || GetPlayerCameraMode(issuerid) == 55)
    {
    	if (hitdistance == 0)
		{
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s (%d), silent aimbot kullanmaya çalýþýyor.", ReturnName(issuerid), issuerid);
            Log_Write("logs/AntiCheat.log", "[%s] %s, silent aimbot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
			SendMessage(issuerid, "Silent aimbot detected.");
            return 0;
		}
        if (playerdistance < 50.0 && GetPlayerTargetPlayer(issuerid) != playerid && !IsPlayerInAnyVehicle(playerid) && !IsPlayerInAnyVehicle(issuerid))
        {
            SilentWarning[playerid]++;
            SilentTimer[playerid] = gettime()+5;
		}
		if (SilentWarning[playerid] >= 3 && playerdistance < 50.0 && GetPlayerTargetPlayer(issuerid) != playerid && !IsPlayerInAnyVehicle(playerid) && !IsPlayerInAnyVehicle(issuerid))
	    {
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s (%d), silent aimbot kullanmaya çalýþýyor.", ReturnName(issuerid), issuerid);
            Log_Write("logs/AntiCheat.log", "[%s] %s, silent aimbot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
			SendMessage(issuerid, "Silent aimbot detected.");
            return 0;
	    }
	 	if(!IsPlayerInRangeOfPoint(issuerid, 10.0, fOriginX2, fOriginY2, fOriginZ2))
        {
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s (%d), silent aimbot kullanmaya çalýþýyor.", ReturnName(issuerid), issuerid);
            Log_Write("logs/AntiCheat.log", "[%s] %s, silent aimbot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
			SendMessage(issuerid, "Silent aimbot detected.");
            return 0;
        }
    }
    else if(IsBulletWeapon(weapon) && GetPlayerCameraMode(issuerid) == 4)
    {
    	if (cameradistance >= 4 && hitdistance == 0)
		{
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s (%d), wallshot kullanmaya çalýþýyor.", ReturnName(issuerid), issuerid);
            Log_Write("logs/AntiCheat.log", "[%s] %s, wallshot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
			SendMessage(issuerid, "Wallshot detected.");
            return 0;
		}
		else if (hitdistance == 0 && cameradistance < 4)
		{
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s (%d), silent aimbot kullanmaya çalýþýyor.", ReturnName(issuerid), issuerid);
            Log_Write("logs/AntiCheat.log", "[%s] %s, silent aimbot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
			SendMessage(issuerid, "Silent aimbot detected.");
            return 0;
		}
		if(!IsPlayerInRangeOfPoint(issuerid, 10.0, fOriginX2, fOriginY2, fOriginZ2))
        {
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s (%d), silent aimbot kullanmaya çalýþýyor.", ReturnName(issuerid), issuerid);
            Log_Write("logs/AntiCheat.log", "[%s] %s, silent aimbot kullanmaya çalýþýyor.", ReturnDate(), ReturnName(issuerid));
			SendMessage(issuerid, "Silent aimbot detected.");
            return 0;
        }
    }
    if (DMOda[issuerid] == 4 && bodypart == 9 && GetPlayerWeapon(playerid) == 24)
    {
	    amount = 0.0;
    }
    else if (DMOda[issuerid] == 4 && bodypart != 9)
    {
	    amount = 100.0;
	    return 0;
    }
    if (cbug[issuerid] == 1)
   	{
        cbug[issuerid] = 0;
        return 0;
   	}
    if (bodypart == 9 && GetPlayerSpeed(playerid) > 0)
    {
        HeadAimbot[issuerid] ++;
    }
    else if (bodypart != 9)
    {
	    HeadAimbot[issuerid] = 0;
    }
    if (GetPlayerSpeed(playerid) > 0)
    {
	    Aimbot[issuerid] ++;
    }
    if (HeadAimbot[issuerid] >= 4 && !IsPlayerInAnyVehicle(playerid))
    {
	    AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, headshot aimbot kullanmaya çalýþýyor (%d).", ReturnName(issuerid), HeadAimbot[issuerid]);
        Log_Write("logs/AntiCheat.log", "[%s] %s, headshot aimbot kullanmaya çalýþýyor (%d).", ReturnDate(), ReturnName(issuerid), HeadAimbot[issuerid]);
		SendMessage(issuerid, "Headshot aimbot detected.");
        return 0;
    }
    if (Aimbot[issuerid] >= 5)
    {
	    AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, normal aimbot kullanmaya çalýþýyor (%d).", ReturnName(issuerid), HeadAimbot[issuerid]);
	    Log_Write("logs/AntiCheat.log", "[%s] %s, normal aimbot kullanmaya çalýþýyor (%d).", ReturnDate(), ReturnName(issuerid), Aimbot[issuerid]);
		SendMessage(issuerid, "Normal aimbot detected.");
		return 0;
    }
    if (NoReloading[issuerid] > 1)
    {
	    return 0;
    }
	if (weapon == 24 && bodypart != 9)
	{
	    amount = 35;
	}
    else if (weapon == 24 && bodypart == 9)
    {
        if(DMOda[playerid] == 4)
        {
            if(GetPlayerArmour(playerid) == 50 && GetPlayerArmour(playerid) == 100)
            {
                amount = 35;
            }
            else
            {
                amount = 100;
            }
        }
        else
        {
            if(GetPlayerArmour(playerid) == 50 && GetPlayerArmour(playerid) == 100)
            {
                amount = 35;
            }
            else
            {
                amount = 45;
            }
        }
  }
    
    HasarAlanBolge[playerid] = bodypart;
    Hasar[playerid] = amount;
    return 1;
}

public OnPlayerDamageDone(playerid, Float:amount, issuerid, weapon, bodypart)
{
	return 1;
}
public OnPlayerSpawn(playerid)
{
	SpawnKorumasi1(playerid);
    new sorgu[200];
    format(sorgu, sizeof(sorgu), "SELECT * FROM `bans` WHERE `Ad` = '%s' OR `IP` = '%s'", ReturnName(playerid), GetIP(playerid));
    mysql_tquery(g_SQL, sorgu, "BanKontrol", "d", playerid);
	SetPlayerScore(playerid, OyuncuBilgi[playerid][pEXP]);
    SetPlayerSkin(playerid, OyuncuBilgi[playerid][pSkin]);
    PlayerTextDrawShow(playerid, Textdraw0[playerid]);
    SetTimerEx("Payday", 60 * 60000, true, "d", playerid);
   	AksesuarAyarla(playerid);
    SetCameraBehindPlayer(playerid);
    OyuncuBilgi[playerid][pSpec] = 0;
    OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
    if (OyuncuBilgi[playerid][pJailTime] > 0)
    {
		OyuncuBilgi[playerid][pJail] = 1;
        OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
	    SetPlayerPos(playerid, 215.4054,109.8750,999.0156);
    	SetPlayerFacingAngle(playerid,356.9411);
	    SetPlayerInterior(playerid, 10);
	    SendMessage(playerid, "You have unfinished jail time, remaining time: %d minutes", OyuncuBilgi[playerid][pJail]);
	}
    if (TDMOda[playerid] != -1) return TDMArenaSpawn(playerid);
    else if (DMOda[playerid] != -1) return ArenaSpawn(playerid);
    for (new i = 0; i < 8; i ++)
    {
        PlayerTextDrawShow(playerid, Hud[playerid][i]);
    }
    SetTimerEx("SaniyelikGuncelle", 100, true, "d");
    GameTextForPlayer(playerid, GIRIS_YAZISI, 3000, 6);
    StopAudioStreamForPlayer(playerid);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    OyuncuBilgi[playerid][pSpec] = 1;
	if(killerid != INVALID_PLAYER_ID && DMOda[playerid] != -1 && DMOda[killerid] != -1 && DMOda[playerid] == DMOda[killerid])
	{
	    new exp = RandomEx(2, 5);
	    new vipexp = RandomEx(4, 10);
        OyuncuBilgi[playerid][pOlme] ++;
        Kill[killerid] ++;
        Kill[playerid] = 0;
        if (Kill[killerid] == 10)
		{
			 SendMessage(killerid, "You earned one chest right for killing 10 people in a row (/opencrate).");
			 OyuncuBilgi[killerid][pSandikHakki] ++;
			 Kill[killerid] = 0;
		}
        OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
        /*TogglePlayerSpectating(playerid, 1);
        PlayerSpectatePlayer(playerid, killerid);
        SendMessage(playerid, "3 saniye sonra spawnlanacaksýnýz.");
        SetTimerEx("ArenaSpawnTimer", 3000, false, "d", playerid);*/
        TogglePlayerSpectating(playerid, true);
        TogglePlayerSpectating(playerid, false);
        ArenaSpawn(playerid);
        if (killerid != playerid)
        {
			if (OyuncuBilgi[playerid][pVip] == 1)
			{
	            OyuncuBilgi[killerid][pOldurme] ++;
	            ParaVer(killerid, 200);
	            ParaVer(playerid, -50);
	            OyuncuBilgi[killerid][pLevelExp] += vipexp;
	        }
	        else
			{
                OyuncuBilgi[killerid][pOldurme] ++;
	            ParaVer(killerid, 100);
	            ParaVer(playerid, -50);
	            OyuncuBilgi[killerid][pLevelExp] += exp;
			}
	    }
	}
	foreach(new i:Player)
	{
	    if(DMOda[i] == DMOda[playerid] || TDMOda[i] != -1 && TDMOda[playerid] != -1)
	    {
	        SendDeathMessageToPlayer(i, killerid, playerid, reason);
		}
	}
	if(killerid != INVALID_PLAYER_ID && TDMOda[playerid] != -1 && TDMOda[killerid] != -1 && DMOda[playerid] == DMOda[killerid])
	{
	    new exp = RandomEx(2, 5);
	    new vipexp = RandomEx(4, 10);
        OyuncuBilgi[playerid][pOlme] ++;
        Kill[killerid] ++;
        Kill[playerid] = 0;
        if (Kill[killerid] == 10)
		{
			 SendMessage(killerid, "You earned one chest right for killing 10 people in a row (/opencrate).");
			 OyuncuBilgi[killerid][pSandikHakki] ++;
			 Kill[killerid] = 0;
		}
        OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
        TogglePlayerSpectating(playerid, true);
        TogglePlayerSpectating(playerid, false);
        TDMArenaSpawn(playerid);
        /*PlayerSpectatePlayer(playerid, killerid);
        SendMessage(playerid, "3 saniye sonra spawnlanacaksýnýz.");
        SetTimerEx("TDMArenaSpawnTimer", 3000, false, "d", playerid);*/
        if (killerid != playerid)
        {
	        if (OyuncuBilgi[playerid][pVip] == 1)
			{
	            OyuncuBilgi[killerid][pOldurme] ++;
	            ParaVer(killerid, 200);
	            ParaVer(playerid, -50);
	            OyuncuBilgi[killerid][pLevelExp] += vipexp;
	        }
	        else
			{
                OyuncuBilgi[killerid][pOldurme] ++;
	            ParaVer(killerid, 100);
	            ParaVer(playerid, -50);
	            OyuncuBilgi[killerid][pLevelExp] += exp;
			}
	    }
	}
    if (HasarAlanBolge[playerid] == 0 && killerid != INVALID_PLAYER_ID)
	{
		AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, fake kill kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
	    Log_Write("logs/AntiCheat.log", "[%s] %s, fake kill kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
	    SendMessage(playerid, "Fake kill detected.");
    	KickEx(playerid);
    	return 0;
	}
	if(OyuncuBilgi[playerid][Duelde] && TDMOda[playerid] == -1 && DMOda[playerid] == -1)
	{
	    SendMessage(playerid, "%s beat you in a duel.", ReturnName(killerid));
	    SendMessage(killerid, "You beat %s in a duel.", ReturnName(playerid));
	    SendClientMessageToAllEx(COLOR_GREEN, "%s, won a prize for killing %s in a duel.", ReturnName(killerid), ReturnName(playerid));
        ParaVer(playerid, -50);
        ParaVer(killerid, 50);
        OyuncuBilgi[killerid][pOldurme] ++;
        OyuncuBilgi[playerid][pOlme] ++;
        OyuncuBilgi[killerid][pLevelExp] += 2;
        OyuncuBilgi[killerid][pLegalTeleport] = gettime() + 2;
        TogglePlayerSpectating(playerid, true);
        TogglePlayerSpectating(playerid, false);
        SetTimerEx("DuelloSpawnTimer", 500, false, "dd", playerid, killerid);
        ArenaCik(playerid);
        ArenaCik(killerid);
        DMOda[playerid] = -1;
        TDMOda[playerid] = -1;
        OyuncuBilgi[playerid][Duelde] = false;
        OyuncuBilgi[playerid][DuelRakip] = INVALID_PLAYER_ID;
        OyuncuBilgi[playerid][DuelSilah1] = 0;
        OyuncuBilgi[playerid][DuelSilah2] = 0;
        OyuncuBilgi[playerid][DuelMap] = 0;
        DMOda[killerid] = -1;
        TDMOda[killerid] = -1;
        OyuncuBilgi[killerid][Duelde] = false;
        OyuncuBilgi[killerid][DuelRakip] = INVALID_PLAYER_ID;
        OyuncuBilgi[killerid][DuelSilah1] = 0;
        OyuncuBilgi[killerid][DuelSilah2] = 0;
        OyuncuBilgi[killerid][DuelMap] = 0;
	}
	if (AdminArea[playerid] == 1)
	{
		TogglePlayerSpectating(playerid, true);
		TogglePlayerSpectating(playerid, false);
		OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
		SpawnKorumasi1(playerid);
		SpawnPlayer(playerid);
        SetPlayerPos(playerid, -1361.2124,-246.2557,14.1440);
        SetPlayerInterior(playerid, 0);
        SetPlayerVirtualWorld(playerid, 0);
	}
	OyuncuGuncelle(playerid);
	OyuncuGuncelle(killerid);
	SpawnPlayer(playerid);
	return 1;
}


public OnVehicleSpawn(vehicleid)
{
	SetVehicleHealth(vehicleid, 900.0);
	SetEngineStatus(vehicleid, true);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
    SetVehicleToRespawn(vehicleid);
	return 1;
}

public OnPlayerText(playerid, text[])
{
	if (OyuncuBilgi[playerid][pMute] > 0)
	{
	    ErrorMessage(playerid, "You have been muted for %d seconds.", OyuncuBilgi[playerid][pMute]);
	    return 0;
	}
	if (Logged[playerid] == 0)
	{
        ErrorMessage(playerid, "You are can't chating now!");
        return 0;
	}
 	if (OyuncuBilgi[playerid][pAdmin] == 1 && OyuncuBilgi[playerid][pAdminDuty] == 1)
	{
        SendClientMessageToAllEx(-1, "{18FF00}[Game Admin] {%06x}%s(%d): {ffffff}%s", GetPlayerColor(playerid) >>> 8, ReturnName(playerid), playerid, text);
        return 0;
	}
	else if (OyuncuBilgi[playerid][pAdmin] == 2 && OyuncuBilgi[playerid][pAdminDuty] == 1)
	{
        SendClientMessageToAllEx(-1, "{FF0004}[Management] {%06x}%s(%d): {ffffff}%s", GetPlayerColor(playerid) >>> 8, ReturnName(playerid), playerid, text);
        return 0;
	}
	else if (OyuncuBilgi[playerid][pVip] == 1 && OyuncuBilgi[playerid][pAdminDuty] == 0)
	{
        SendClientMessageToAllEx(-1, "{b8860b}V.I.P {%06x}%s(%d): {ffffff}%s", GetPlayerColor(playerid) >>> 8, ReturnName(playerid), playerid, text);
        return 0;
	}
	else if (OyuncuBilgi[playerid][pVip] == 0 && OyuncuBilgi[playerid][pAdminDuty] == 0)
	{
        SendClientMessageToAllEx(-1, "{%06x}%s(%d): {ffffff}%s", GetPlayerColor(playerid) >>> 8, ReturnName(playerid), playerid, text);
        return 0;
	}
	Log_Write("logs/Chat.log", "[%s] %s: %s", ReturnDate(), ReturnName(playerid), text);
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    if (Logged[playerid] == 0) return ErrorMessage(playerid, "You cannot use commands at now!");
    if(result == -1) return ErrorMessage(playerid, "You used an invalid command, you can browse other commands using the /help or /cmds command.");
    Log_Write("logs/Komut.log", "[%s] %s: %s",ReturnDate(), ReturnName(playerid), params);
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    BindigiArac[playerid] = vehicleid;
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    OyuncuBilgi[playerid][pLegalTeleport] = gettime()+2;
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
    {
        SetPlayerArmedWeapon(playerid, 0);
    }
    if(oldstate != PLAYER_STATE_SPECTATING && newstate == PLAYER_STATE_SPECTATING)
	{
        if (OyuncuBilgi[playerid][pSpec] == 0 && OyuncuBilgi[playerid][pAdminDuty] == 0 && OyuncuBilgi[playerid][pLegalTeleport] == 0)
        {
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, invisible hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
            Log_Write("logs/AntiCheat.log", "[%s] %s, invisible hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
            SendMessage(playerid, "Invisible detected.");
            KickEx(playerid);
        }
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	KickEx(playerid);
	return 0;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	KickEx(playerid);
	return 0;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	KickEx(playerid);
	return 0;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && (newkeys & KEY_FIRE) && (newkeys & KEY_CROUCH))
	{
		cbug[playerid] = 1;
	}
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    SetPVarInt(playerid, "LegalSpeed", 1);
    SetTimerEx("LegalSpeed", 500, false, "d", playerid);
    return 1;
}

public OnPlayerUpdate(playerid)
{
	new Float:vhealth;
	GetVehicleHealth(GetPlayerVehicleID(playerid), vhealth);
    if (vhealth < 250)
    {
		SetVehicleHealth(GetPlayerVehicleID(playerid), 350);
		SetEngineStatus(GetPlayerVehicleID(playerid), false);
	}
	if (IsPlayerInRangeOfPoint(playerid, 5.0, 2064.2261, -1831.4440, 13.2504) && vhealth >= 950)
	{
		SetVehicleHealth(GetPlayerVehicleID(playerid), 900);
	}
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER && vhealth >= 950 && !IsPlayerInRangeOfPoint(playerid, 10.0, 2064.2261, -1831.4440, 13.2504))
	{
		SetVehicleHealth(GetPlayerVehicleID(playerid), GetPVarFloat(playerid, "vhealth"));
		AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, car fix hack kullanmaya çalýþýyor.", ReturnName(playerid));
		Log_Write("logs/AntiCheat.log", "[%s] %s, car fix hack kullanmaya çalýþýyor.", ReturnDate(), ReturnName(playerid));
		SendMessage(playerid, "Car fix detected.");
		return 0;
	}
    if (OyuncuBilgi[playerid][pDakikaTimer] >= 60)
    {
		OyuncuBilgi[playerid][pDakikaTimer] = 0;
	    OyuncuBilgi[playerid][pOynamaSaati] ++;
		OyuncuBilgi[playerid][pLevelExp] += 2;
    }
    if (IsPlayerInRangeOfPoint(playerid, 50.0, 1728.5088, -1668.0836, 22.6094) && GetPlayerInterior(playerid) == 18 && GetPlayerVirtualWorld(playerid) == 10)
    {
		if (DMOda[playerid] != -1 || TDMOda[playerid] != -1 || OyuncuBilgi[playerid][Duelde] != false || AdminArea[playerid] != 0)
		{
		    DMOda[playerid] = -1;
		    TDMOda[playerid] = -1;
		    OyuncuBilgi[playerid][Duelde] = false;
		    AdminArea[playerid] = 0;
		}
	}
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetEngineStatus(GetPlayerVehicleID(playerid)) == 0 && GetPlayerSpeed(playerid) > OldSpeed[playerid] && GetPlayerSpeed(playerid) >= 20)
	{
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		SetPlayerPos(playerid, x, y, z+2);
		AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, engine hack kullanmaya çalýþýyor olabilir.", ReturnName(playerid));
		Log_Write("logs/AntiCheat.log", "[%s] %s, engine hack kullanmaya çalýþýyor olabilir.", ReturnName(playerid));
		return 0;
	}
    if (GetPVarInt(playerid, "LegalSpeed") == 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetPlayerSpeed(playerid) >= 60 && GetPlayerSpeed(playerid) - OldSpeed[playerid] >= 20)
    {
		AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, speed hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
		Log_Write("logs/AntiCheat.log", "[%s] %s, speed hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
		SendMessage(playerid, "Speed hack detected.");
		KickEx(playerid);
	}
    new HPText[128];
    format(HPText, sizeof(HPText), "%d", ReturnHealth(playerid));
	PlayerTextDrawSetString(playerid, Textdraw0[playerid], HPText);
	PlayerTextDrawShow(playerid, Textdraw0[playerid]);
    if (GetPlayerMoney(playerid) != OyuncuBilgi[playerid][pPara])
	{
	    ResetPlayerMoney(playerid);
	    GivePlayerMoney(playerid, OyuncuBilgi[playerid][pPara]);
	}
	if(OyuncuBilgi[playerid][pOlme] == 0)
	    OyuncuBilgi[playerid][pKD] = OyuncuBilgi[playerid][pOldurme];
	if(OyuncuBilgi[playerid][pOlme] > 0)
		OyuncuBilgi[playerid][pKD] = floatdiv(OyuncuBilgi[playerid][pOldurme], OyuncuBilgi[playerid][pOlme]);
    if (OyuncuBilgi[playerid][pJetpack] == 1 && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_USEJETPACK)
	{
        OyuncuBilgi[playerid][pJetpack] = 0;
	}
	/*new rand = random(sizeof(RandomLobbySpawn));
	if (GetPlayerColor(playerid) == 0x00000000) return SetPlayerColor(playerid, RandomLobbySpawn[rand]);
    */
	new str[128];
	format(str, sizeof(str), "[Olme: %d & Oldurme: %d & K/D: %0.2f - Rose DM]", OyuncuBilgi[playerid][pOlme], OyuncuBilgi[playerid][pOldurme], OyuncuBilgi[playerid][pKD]);
	PlayerTextDrawSetString(playerid, Hud[playerid][0], str);
	
	if (OyuncuBilgi[playerid][pVip] > 0 && OyuncuBilgi[playerid][pVipSure] < gettime())
    {
        OyuncuBilgi[playerid][pVip] = 0;
        OyuncuBilgi[playerid][pVipSure] = 0;
		Dialog_Show(playerid, VIPBitti, DIALOG_STYLE_MSGBOX, "{FFFFFF}>> Your VIP Package Has Expired!", "{FFFFFF}> Your 30 day VIP package has expired, you can buy it again using the /market command.\n", "{FFFFFF}Okey", "");
    }
    if (OyuncuBilgi[playerid][pLegalTeleport] > 0 && OyuncuBilgi[playerid][pLegalTeleport] < gettime())
	{
		OyuncuBilgi[playerid][pLegalTeleport] = 0;
	}
	new SurfingVehicle = GetPlayerSurfingVehicleID(playerid);
    new Float:svx, Float:svy, Float:svz, Float:npx, Float:npy, Float:npz;
    GetVehiclePos(SurfingVehicle, svx, svy, svz);
    GetPlayerPos(playerid, npx, npy, npz);
    new Float:SurfingVehicleVector = (svy + svx + svz) - (npx + npy + npz);
    if((SurfingVehicle != 65535) && (SurfingVehicleVector  < -15 || SurfingVehicleVector > 15))
    {
        return 0;
    }
	new SurfingObject = GetPlayerSurfingObjectID(playerid);
    new Float:sox, Float:soy, Float:soz;
    GetObjectPos(SurfingObject, sox, soy, soz);
    new Float:SurfingObjectVector = (sox + soy + soz) - (npx + npy + npz);
    if((SurfingObject != 65535) && (SurfingObjectVector  < -30 || SurfingObjectVector > 30))
    {
	     SendMessage(playerid, "Surfing invisible detected.");
         return 0;
    }
	new anim[2][32];
    GetAnimationName(GetPlayerAnimationIndex(playerid), anim[0], 32, anim[1], 32);
	if (NoReloading[playerid] > 0 && NoReloading2[playerid] < gettime())
	{
		NoReloading[playerid] = 0;
	}
	if (SilentWarning[playerid] > 0 && SilentTimer[playerid] < gettime() + 5)
	{
		SilentWarning[playerid] = 0;
	}
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
        GetPlayerPos(playerid, LastCarPos[playerid][0], LastCarPos[playerid][1], LastCarPos[playerid][2]);
	}
    new Float:AirbreakDistance = GetPlayerDistanceFromPoint(playerid, LastPosition[playerid][0], LastPosition[playerid][1], LastPosition[playerid][2]);
    if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && GetPlayerAnimationIndex(playerid) != 1130)
    {
        if(GetPlayerSpeed(playerid) >= 5 && AirbreakDistance >= 5.0 && AirbreakDistance < 10.0 && OyuncuBilgi[playerid][pAdminDuty] < 1)
    	{
            Airbreak[playerid]++;
    	}
	}
    if (OyuncuBilgi[playerid][pAdmin] == 1 && OyuncuBilgi[playerid][pAdminDuty] == 1)
    {
        format(str, sizeof(str), "[Game Admin]");
   	    SetPlayerChatBubble(playerid, str, 0xFF0000FF, 15.0, 1000);
	}
	else if (OyuncuBilgi[playerid][pAdmin] == 2 && OyuncuBilgi[playerid][pAdminDuty] == 1)
    {
        format(str, sizeof(str), "[Management]");
       	SetPlayerChatBubble(playerid, str, 0xFF0000FF, 15.0, 1000);
	}
	if (SpawnKorumasi[playerid] == 1 && OyuncuBilgi[playerid][pAdminDuty] == 0)
    {
        format(str, sizeof(str), "[KOS PROTECTION]");
       	SetPlayerChatBubble(playerid, str, 0x00FF00FF, 15.0, 1000);
	}
	if (OyuncuBilgi[playerid][pAdmin] < 1 && OyuncuBilgi[playerid][pAdminDuty] == 1)
	{
		OyuncuBilgi[playerid][pAdminDuty] = 0;
		PlayerTextDrawHide(playerid, AdminDuty[playerid]);
	}
	if (OyuncuBilgi[playerid][pAdmin] < 1 && OyuncuBilgi[playerid][pSpecPM] > -1)
	{
	    OyuncuBilgi[playerid][pSpecPM] = -1;
	}
	if (GetPlayerScore(playerid) != OyuncuBilgi[playerid][pEXP])
	{
		SetPlayerScore(playerid,OyuncuBilgi[playerid][pEXP]);
	}
	if (OyuncuBilgi[playerid][pSkin] == 0 || GetPlayerSkin(playerid) == 0)
	{
        OyuncuBilgi[playerid][pSkin] = 60;
		SetPlayerSkin(playerid, 60);
	}
	if (GetPlayerSpeed(playerid) >= 50 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
        return 0;
    }
    if (GetPlayerSpeed(playerid) >= 200 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        return 0;
    }
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
    return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	/*for(new i; i < sizeof(ozelkarakterpic); i++)
	{
		if(strfind(inputtext, ozelkarakterpic[i], true) != -1)
		{
		SendClientMessage(playerid,-1, "Özel karakter kullanmak yasaktýr.");
		return 0;
		}
	}*/
    switch(dialogid)
    {
        case DIALOG_GECERSIZ: return 1;
        case DIALOG_GIRIS:
        {
            if(!response) return Kick(playerid);
            new sifresakla[65];
            SHA256_PassHash(inputtext, OyuncuBilgi[playerid][pSifreSakla], sifresakla, 65);
            if(strcmp(sifresakla, OyuncuBilgi[playerid][pSifre]) == 0)
            {
                  cache_set_active(OyuncuBilgi[playerid][Cache_ID]);
                  cache_get_value_int(0, "ID", OyuncuBilgi[playerid][ID]);
                  cache_delete(OyuncuBilgi[playerid][Cache_ID]);
                  OyuncuBilgi[playerid][Cache_ID] = MYSQL_INVALID_CACHE;
                  Logged[playerid] = 1;
                  OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
                  SetSpawnInfo(playerid, NO_TEAM, 0, 1729.2484, -1668.8885, 22.6151, 49.5617, 0, 0, 0, 0, 0, 0);
                  SpawnPlayer(playerid);
                  new rand = random(sizeof(RandomLobbySpawn));
	              SetPlayerColor(playerid, RandomLobbySpawn[rand]);
                  SetPlayerInterior(playerid, 18);
                  SetPlayerVirtualWorld(playerid, 10);
                  ChatSil(playerid);
                  GiveWeapon(playerid, 24, 1000);
                  SendMessage(playerid, "You have successfully logged in.");
                  SendClientMessageToAllEx(COLOR_GREY, "%s has been logged this server.", ReturnName(playerid));
            }
            else
            {
                  ShowPlayerDialog(playerid, DIALOG_GIRIS, DIALOG_STYLE_PASSWORD, "{FFFFFF}>> Login", "{FFFFFF}> Incorrect password!\n{FFFFFF}> Please enter your password to login:", "{FFFFFF}Login", "{FFFFFF}Close");
            }
        }
        case DIALOG_KAYIT:
        {
            if(!response) return KickEx(playerid);
            if (Bakim == 1)
            {
				ErrorMessage(playerid, "Sunucu bakým modundadýr, eðer bir administrator deðilseniz sunucuya giremezsiniz.");
				KickEx(playerid);
			}
            if(strlen(inputtext) <= 5) return ShowPlayerDialog(playerid, DIALOG_KAYIT, DIALOG_STYLE_PASSWORD, "{FFFFFF}>> Register", "{FFFFFF}> Your password must be more than 5 characters long.\n{FFFFFF}> Please enter your password to register:", "{FFFFFF}Register", "{FFFFFF}Close");
            for(new i = 0; i < 16; i++) OyuncuBilgi[playerid][pSifreSakla] = random(94) + 33;
            SHA256_PassHash(inputtext, OyuncuBilgi[playerid][pSifreSakla], OyuncuBilgi[playerid][pSifre], 65);
            new sorgu[250];
            mysql_format(g_SQL, sorgu, sizeof(sorgu), "INSERT INTO `oyuncular` (`Isim`, `Sifre`, `SifreSakla`) VALUES ('%s', '%s', '%e')", OyuncuBilgi[playerid][pIsim], OyuncuBilgi[playerid][pSifre], OyuncuBilgi[playerid][pSifreSakla]);
            mysql_tquery(g_SQL, sorgu, "OyuncuKaydet", "d", playerid);
        }
        case DIALOG_SKIN:
		{
		    if (response)
		    {
                OyuncuBilgi[playerid][pSkin] = Skins[listitem];
     	        SetPlayerSkin(playerid, OyuncuBilgi[playerid][pSkin]);
     	        ParaVer(playerid, -2000);
     	        OyuncuGuncelle(playerid);
		    }
		}
		case DIALOG_VIPSKIN:
		{
		    if (response)
		    {
                OyuncuBilgi[playerid][pSkin] = VipSkin[listitem];
     	        SetPlayerSkin(playerid, OyuncuBilgi[playerid][pSkin]);
     	        ParaVer(playerid, -2000);
     	        OyuncuGuncelle(playerid);
		    }
		}
		case DIALOG_DUEL_WEAPON:
	    {
	        if(response)
	        {
	            new weaponid;
	            switch(listitem)
			    {
			        case 0: weaponid = 9;
			    	case 1: weaponid = 16;
			    	case 2: weaponid = 18;
			    	case 3: weaponid = 22;
			    	case 4: weaponid = 23;
			    	case 5: weaponid = 24;
			    	case 6: weaponid = 25;
			    	case 7: weaponid = 26;
			    	case 8: weaponid = 27;
			    	case 9: weaponid = 28;
			    	case 10: weaponid = 29;
			    	case 11: weaponid = 30;
			    	case 12: weaponid = 31;
			    	case 13: weaponid = 32;
			    	case 14: weaponid = 33;
			    	case 15: weaponid = 34;
		    	}
		    	OyuncuBilgi[playerid][DuelSilah1] = weaponid;
			    OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelSilah1] = weaponid;
                new str[512];
                format(str, 512, "{FFFFFF}> {FFFFFF}Saw\n{FFFFFF}> {FFFFFF}Grenade\n{FFFFFF}> {FFFFFF}Molotov\n{FFFFFF}> {FFFFFF}Colt-45\n{FFFFFF}> {FFFFFF}Silenced\n{FFFFFF}> {FFFFFF}Deagle\n{FFFFFF}> {FFFFFF}Shotgun\n{FFFFFF}> {FFFFFF}Sawn Off\n{FFFFFF}> {FFFFFF}Combat\n{FFFFFF}> {FFFFFF}Uzi\n{FFFFFF}> {FFFFFF}MP5\n{FFFFFF}> {FFFFFF}AK-47\n{FFFFFF}> {FFFFFF}M4\n{FFFFFF}> {FFFFFF}Tec-9\n{FFFFFF}> {FFFFFF}Rifle\n{FFFFFF}> {FFFFFF}Sniper");
			    ShowPlayerDialog(playerid, DIALOG_DUEL_WEAPON2, DIALOG_STYLE_LIST, "{FFFFFF}>> Rose Deathmatch - {FFFFFF}2. Duel Weapon", str, "{FFFFFF}Select", "{FFFFFF}Cancel");
	        }
    	}
    	case DIALOG_DUEL_WEAPON2:
    	{
	        if(response)
	        {
	            new weaponid;
	            switch(listitem)
		    	{
				    case 0: weaponid = 9;
			    	case 1: weaponid = 16;
				    case 2: weaponid = 18;
			    	case 3: weaponid = 22;
				    case 4: weaponid = 23;
			    	case 5: weaponid = 24;
				    case 6: weaponid = 25;
			    	case 7: weaponid = 26;
			    	case 8: weaponid = 27;
			    	case 9: weaponid = 28;
			    	case 10: weaponid = 29;
			    	case 11: weaponid = 30;
				    case 12: weaponid = 31;
				    case 13: weaponid = 32;
				    case 14: weaponid = 33;
				    case 15: weaponid = 34;
			    }
		    	OyuncuBilgi[playerid][DuelSilah2] = weaponid;
		    	OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelSilah2] = weaponid;
			    ShowPlayerDialog(playerid, DIALOG_DUEL_MAP, DIALOG_STYLE_LIST, "{FFFFFF}>> Rose Deathmatch - {FFFFFF}Duel Map", "{FFFFFF}> {FFFFFF}LVPD\n{FFFFFF}> {FFFFFF}Ghost Town\n{FFFFFF}> {FFFFFF}RC Battlefield", "{FFFFFF}Select", "{FFFFFF}Cancel");
	        }
    	}
    	case DIALOG_DUEL_MAP:
    	{
	        if(response)
	        {
	            new mapid;
	            switch(listitem)
	            {
	                case 0: mapid = 0;
	                case 1: mapid = 1;
	                case 2: mapid = 2;
	            }
		    	OyuncuBilgi[playerid][DuelMap] = mapid;
		    	OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelMap] = mapid;
                if(Logged[OyuncuBilgi[playerid][DuelRakip]] != 1) return SendMessage(playerid, "Opponent is not in the game.");
		    	if(OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][Duelde] || TDMOda[OyuncuBilgi[playerid][DuelRakip]] != -1 || DMOda[OyuncuBilgi[playerid][DuelRakip]] != -1) return SendMessage(playerid, "Opponent is not in the lobby.");
		    	new string[256];
		    	SendMessage(playerid, "You sent a duel request to %s.", ReturnName(OyuncuBilgi[playerid][DuelRakip]));
		    	SendMessage(playerid, "Duel weapons: %s and %s.",ReturnWeaponName(OyuncuBilgi[playerid][DuelSilah1]), ReturnWeaponName(OyuncuBilgi[playerid][DuelSilah2]));
		    	SendMessage(playerid, "Duel map: %s.", ReturnMapName(OyuncuBilgi[playerid][DuelMap]));
	            format(string, sizeof(string), "{FFFFFF}> {FFFFFF}Opponent: %s\n\n{FFFFFF}> {FFFFFF}Weapon 1: %s\n{FFFFFF}> {FFFFFF}Weapon 2: %s\n\n{FFFFFF}> {FFFFFF}Map: %s", ReturnName(playerid), ReturnWeaponName(OyuncuBilgi[playerid][DuelSilah1]), ReturnWeaponName(OyuncuBilgi[playerid][DuelSilah2]), ReturnMapName(OyuncuBilgi[playerid][DuelMap]));
	            ShowPlayerDialog(OyuncuBilgi[playerid][DuelRakip], DIALOG_DUEL, DIALOG_STYLE_MSGBOX, "{FFFFFF}>> Rose Deathmatch - {FFFFFF}Duel System", string, "{FFFFFF}Accept", "{FFFFFF}Refuse");
	        }
 	    }
	    case DIALOG_DUEL:
	    {
            if(response)
	        {
                //if(Logged[OyuncuBilgi[playerid][DuelRakip]] != 1) return SendMessage(playerid, "Rakip oyunda deðil.");
                if(OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][Duelde] || TDMOda[OyuncuBilgi[playerid][DuelRakip]] != -1 || DMOda[OyuncuBilgi[playerid][DuelRakip]] != -1) return SendMessage(playerid, "Opponent is not in the lobby.");
                if(OyuncuBilgi[playerid][Duelde] || TDMOda[playerid] != -1 || DMOda[playerid] != -1) return SendMessage(playerid, "You are not in the lobby.");
                ResetPlayerWeapons(playerid);
		    	GiveWeapon(playerid, OyuncuBilgi[playerid][DuelSilah1], 5000);
		    	GiveWeapon(playerid, OyuncuBilgi[playerid][DuelSilah2], 5000);
		    	SetPlayerHealth(playerid, 100.0);
		    	ResetPlayerWeapons(OyuncuBilgi[playerid][DuelRakip]);
		    	GiveWeapon(OyuncuBilgi[playerid][DuelRakip], OyuncuBilgi[playerid][DuelSilah1], 5000);
		    	GiveWeapon(OyuncuBilgi[playerid][DuelRakip], OyuncuBilgi[playerid][DuelSilah2], 5000);
                SetPlayerHealth(OyuncuBilgi[playerid][DuelRakip], 100.0);
                SpawnKorumasi1(playerid);
                SpawnKorumasi1(OyuncuBilgi[playerid][DuelRakip]);
			    switch(OyuncuBilgi[playerid][DuelMap])
		    	{
			        case 0:
			        {
                        OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
				    	SetPlayerPos(playerid, 288.9128,167.5972,1007.1719);
				    	SetPlayerInterior(playerid, 3);
				    	SetPlayerVirtualWorld(playerid, playerid+20);
                        OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][pLegalTeleport] = gettime() + 2;
				    	SetPlayerPos(OyuncuBilgi[playerid][DuelRakip], 300.4109,174.6213,1007.1719);
				    	SetPlayerVirtualWorld(OyuncuBilgi[playerid][DuelRakip], playerid+20);
				    	SetPlayerInterior(OyuncuBilgi[playerid][DuelRakip], 3);
			    	}
			        case 1:
			        {
                        OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
			    		SetPlayerPos(playerid, -334.6820,2219.2334,42.4877);
				    	SetPlayerVirtualWorld(playerid, playerid+20);
				    	SetPlayerInterior(playerid, 0);
                        OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][pLegalTeleport] = gettime() + 2;
				    	SetPlayerPos(OyuncuBilgi[playerid][DuelRakip], -406.3052,2200.4971,42.4873);
				    	SetPlayerInterior(OyuncuBilgi[playerid][DuelRakip], 0);
                        SetPlayerVirtualWorld(OyuncuBilgi[playerid][DuelRakip], playerid+20);
			    	}
			        case 2:
			        {
                        OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
			    		SetPlayerPos(playerid, -1131.9055, 1057.8958, 1346.4146);
				    	SetPlayerInterior(playerid, 10);
				    	SetPlayerVirtualWorld(playerid, playerid+20);
                        OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][pLegalTeleport] = gettime() + 2;
				    	SetPlayerPos(OyuncuBilgi[playerid][DuelRakip], -974.6671, 1060.8036, 1345.6719);
					    SetPlayerInterior( OyuncuBilgi[playerid][DuelRakip], 10);
				    	SetPlayerVirtualWorld( OyuncuBilgi[playerid][DuelRakip], playerid+20);
			    	}
			    }
	            OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][Duelde] = true;
	            OyuncuBilgi[playerid][Duelde] = true;
		    	return 1;
	        }
            else
	        {
	            SendMessage(OyuncuBilgi[playerid][DuelRakip], "Rakip düelloyu reddetti.");
	            OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][Duelde] = false;
	            OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelRakip] = INVALID_PLAYER_ID;
	            OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelSilah1] = 0;
	            OyuncuBilgi[OyuncuBilgi[playerid][DuelRakip]][DuelSilah2] = 0;
	            OyuncuBilgi[playerid][Duelde] = false;
	            OyuncuBilgi[playerid][DuelRakip] = INVALID_PLAYER_ID;
	            OyuncuBilgi[playerid][DuelSilah1] = 0;
	            OyuncuBilgi[playerid][DuelSilah2] = 0;
	        }
		}
  		case 53:
		{
		    if(response)
		    {
		        if(OyuncuBilgi[playerid][pASlot][listitem] != 0)
		        {
		            ErrorMessage(playerid,"Bu slot dolu, baþka bir slot seçin.");
		            return AksesuarlariGoster(playerid,1);
		        }
		        new yazi[2000];
		        for(new i; i < sizeof(AttachmentObjects); ++i)
		        {
		            format(yazi,sizeof(yazi),"%s%d\n",yazi,AttachmentObjects[i][attachmodel]);
		        }
		        SetPVarInt(playerid,"AttachmentIndexSel",listitem);
		        ShowPlayerDialog(playerid,54,DIALOG_STYLE_PREVMODEL,"Aksesuarlar",yazi,"Sec","Geri");
		    }
		}
		case 54:
		{
		    if(!response)
			{
			    AksesuarlariGoster(playerid,1);
			    return DeletePVar(playerid,"AttachmentIndexSel");
			}
			if(response)
			{
			    SetPVarInt(playerid,"AttachmentModelSel",AttachmentObjects[listitem][attachmodel]);
			    new bstring[257];
			    for(new x;x<sizeof(AttachmentBones);x++)
	        	{
	        		format(bstring, sizeof(bstring), "%s%s\n", bstring, AttachmentBones[x]);
	        	}
	        	ShowPlayerDialog(playerid,55,DIALOG_STYLE_LIST,"{FF0000}Kemik Seç",bstring,"Seç","{FF6347}Kapat");
			}
		}
		case 55:
		{
		    if(response)
		    {
		        SetPlayerAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"), GetPVarInt(playerid, "AttachmentModelSel"), listitem+1);
          		EditAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
          		UsageMessage(playerid,"{FFFF00}~k~~PED_SPRINT~{FFFFFF} tuþuna basarak kamerayý oynatabilirsiniz.");
		    }
		    new slotid = GetPVarInt(playerid, "AttachmentIndexSel");
      		new modelid = GetPVarInt(playerid, "AttachmentModelSel");
   			OyuncuBilgi[playerid][pASlot][slotid] = modelid;
      		DeletePVar(playerid, "AttachmentIndexSel");
        	DeletePVar(playerid, "AttachmentModelSel");
         	SQL_AksesuarKaydet(playerid);
		}
		case 56:
		{
		    if(response)
		    {
		        if(OyuncuBilgi[playerid][pASlot][listitem] != 0)
		        {
		            ShowPlayerDialog(playerid,57,DIALOG_STYLE_LIST,"{FF0000}Aksesuar Ayarlari","{FFFFFF}Tak/Çýkar\n{FFFFFF}Düzenle\n{FFFFFF}Renk Deðiþtir\n{FFFFFF}Sil","Seç","Geri");
		            SetPVarInt(playerid, "AttachmentIndexSel", listitem);
		        }
		        else return ErrorMessage(playerid,"You should buy accessories (/vipmenu)");
		    }
		}
		case 57:
		{
		    if(!response)
		    {
		        DeletePVar(playerid,"AttachmentIndexSel");
		        return callcmd::aksesuar(playerid);
		    }
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0:
		            {
		                new slotid =  GetPVarInt(playerid, "AttachmentIndexSel");
						if(OyuncuBilgi[playerid][pTSlot][slotid])
						{
						    UsageMessage(playerid, "Aksesuar çýkartýldý.");
							OyuncuBilgi[playerid][pTSlot][slotid] = false;
							RemovePlayerAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
							SQL_AksesuarKaydet(playerid);
						}
						else
						{
							OyuncuBilgi[playerid][pTSlot][slotid] = true;
							UsageMessage(playerid, "Aksesuar takýldý.");
							AksesuarTak(playerid, slotid);
							SQL_AksesuarKaydet(playerid);
						}
		            }
		            case 1:
		            {
                        UsageMessage(playerid,"{FFFF00}~k~~PED_SPRINT~{FFFFFF} tuþuna basarak kamerayý oynatabilirsiniz.");
                        EditAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
		            }
		            case 2:
		            {
		                Dialog_Show(playerid, AksesuarRenk, DIALOG_STYLE_LIST, "Renk Seç", "{FFFFFF}Siyah\n{FFFFFF}Kýrmýzý\n{FFFFFF}Mavi\n{FFFFFF}Turuncu\n{FFFFFF}Mor\n{FFFFFF}Sarý\n{FFFFFF}Yeþil\n{FFFFFF}Renk Kaldýr", "Seç", "Kapat");
		            }
		            case 3:
		            {
		                RemovePlayerAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
                        new slotid =  GetPVarInt(playerid, "AttachmentIndexSel");
                        OyuncuBilgi[playerid][pASlot][slotid] = 0;
                        OyuncuBilgi[playerid][pABone][slotid] = 0;
                        OyuncuBilgi[playerid][pTSlot][slotid] = 0;
						DeletePVar(playerid, "AttachmentIndexSel");
						UsageMessage(playerid, "Aksesuar silindi.");
						SQL_AksesuarKaydet(playerid);
						callcmd::aksesuar(playerid);
		            }
		        }
		    }
		}
		case 62:
		{
		    if(response)
		    {
		        if(OyuncuBilgi[playerid][pASlot][listitem] != 0)
		        {
		            ErrorMessage(playerid,"Bu slot dolu, baþka bir slot seçin.");
		            return AksesuarlariGoster(playerid,2);
		        }
		        new yazi[1000];
        		for(new i; i < sizeof(AttachCops); ++i)
	        	{
         			format(yazi,sizeof(yazi),"%s%d\n",yazi,AttachCops[i][olusumamodel]);
	        	}
	        	SetPVarInt(playerid,"AttachmentIndexSel",listitem);
	        	ShowPlayerDialog(playerid,63,DIALOG_STYLE_PREVMODEL,"Aksesuarlar",yazi,"Sec","Geri");
		    }
		}
        case 64:
		{
		    if(response)
		    {
		        SetPlayerAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"), GetPVarInt(playerid, "AttachmentModelSel"), listitem+1);
          		EditAttachedObject(playerid, GetPVarInt(playerid, "AttachmentIndexSel"));
          		UsageMessage(playerid,"{FFFF00}~k~~PED_SPRINT~{FFFFFF} tuþuna basarak kamerayý oynatabilirsiniz.");
		    }
		    new slotid = GetPVarInt(playerid, "AttachmentIndexSel");
      		new modelid = GetPVarInt(playerid, "AttachmentModelSel");
   			OyuncuBilgi[playerid][pASlot][slotid] = modelid;
      		DeletePVar(playerid, "AttachmentIndexSel");
        	DeletePVar(playerid, "AttachmentModelSel");
         	SQL_AksesuarKaydet(playerid);
		}
	}
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	if(response)
	{
		if(fScaleX < 0.1) fScaleX = 0.1;
		if(fScaleX > 1.5) fScaleX = 1.5;
		if(fScaleY < 0.1) fScaleY = 0.1;
		if(fScaleY > 1.5) fScaleY = 1.5;
		if(fScaleZ < 0.1) fScaleZ = 0.1;
		if(fScaleZ > 1.5) fScaleZ = 1.5;
		if(fOffsetX < -100) fOffsetX = 0;
		if(fOffsetX > 100) fOffsetX = 100;
		if(fOffsetY < -100) fOffsetY = 0;
		if(fOffsetY > 100) fOffsetY = 100;
		if(fOffsetZ < -100) fOffsetZ = 0;
		if(fOffsetZ > 100) fOffsetZ = 100;
	    AksesuarData[playerid][index][0] = fOffsetX;
	    AksesuarData[playerid][index][1] = fOffsetY;
	    AksesuarData[playerid][index][2] = fOffsetZ;
	   	AksesuarData[playerid][index][3] = fRotX;
	   	AksesuarData[playerid][index][4] = fRotY;
	    AksesuarData[playerid][index][5] = fRotZ;
	    AksesuarData[playerid][index][6] = (fScaleX > 3.0) ? (3.0) : (fScaleX);
	    AksesuarData[playerid][index][7] = (fScaleY > 3.0) ? (3.0) : (fScaleY);
		AksesuarData[playerid][index][8] = (fScaleZ > 3.0) ? (3.0) : (fScaleZ);
		AksesuarData[playerid][index][9] = boneid;
		OyuncuBilgi[playerid][pTSlot][index] = true;
		OyuncuBilgi[playerid][pASlot][index] = modelid;
        OyuncuBilgi[playerid][pABone][index] = boneid;
		AksesuarTak(playerid, index);
	    UsageMessage(playerid, "Aksesuar düzenlendi.");
	    SQL_AksesuarKaydet(playerid);
	}
	return 1;
}