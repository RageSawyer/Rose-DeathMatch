forward DelayedKickk(playerid);
public DelayedKickk(playerid)
{
    Kick(playerid);
    return 1;
}

forward PursuitControl();
public PursuitControl()
{
	if (ToplamPursuitPlayer == 10)
	{
		//Eklenecek
	}
	return 1;
}

forward AntiCheat(playerid);
public AntiCheat(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    new anim[2][32];
	OldSpeed[playerid] = GetPlayerSpeed(playerid);
    GetAnimationName(GetPlayerAnimationIndex(playerid), anim[0], 32, anim[1], 32);
    new Float:vhealth;
    GetVehicleHealth(vehicleid, vhealth);
    SetPVarFloat(playerid, "vhealth", vhealth);
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER && BindigiArac[playerid] != vehicleid && OyuncuBilgi[playerid][pAdminDuty] == 0)
    {
        AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, car warp kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
        Log_Write("logs/AntiCheat.log", "[%s] %s, car warp kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
        SendMessage(playerid, "Car warp detected.");
        KickEx(playerid);
    }
	if (Logged[playerid] == 1 && OyuncuBilgi[playerid][pAdminDuty] == 0)
	{
        if (Airbreak[playerid] >= 3)
        {
	    	AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, airbreak kullanmaya çalýþýyor.", ReturnName(playerid));
            Log_Write("logs/AntiCheat.log", "[%s] %s, airbreak kullanmaya çalýþýyor.", ReturnDate(), ReturnName(playerid));
            Airbreak[playerid] = 0;
		}
        else if(OyuncuBilgi[playerid][pLegalTeleport] == 0 && Airbreak[playerid] == 0 && Logged[playerid] == 1 && !IsPlayerInRangeOfPoint(playerid, 50.0, LastPosition[playerid][0], LastPosition[playerid][1], LastPosition[playerid][2]) && GetPlayerState(playerid) != PLAYER_STATE_PASSENGER && GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID)
        {
            new Float:distance = GetPlayerDistanceFromPoint(playerid, LastPosition[playerid][0], LastPosition[playerid][1], LastPosition[playerid][2]);
            new Float:distance2 = GetPlayerDistanceFromPoint(playerid, LastCarPos[playerid][0], LastCarPos[playerid][1], LastCarPos[playerid][2]);
            if (distance >= 50.0 && distance != 100.0 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
            {
                AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, teleport hack kullanmaya çalýþýyor.", ReturnName(playerid), playerid, distance);
                Log_Write("logs/AntiCheat.log", "[%s] %s, teleport hack kullanmaya çalýþýyor.", ReturnDate(), ReturnName(playerid), distance);
				SendMessage(playerid, "Teleport detected.");
            }
            else if (distance2 >= 50.0 && distance != 100.0 && GetPlayerSpeed(playerid) < 100 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
            {
                AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, teleport hack (driver) kullanmaya çalýþýyor.", ReturnName(playerid), distance);
                Log_Write("logs/AntiCheat.log", "[%s] %s, teleport hack (driver) kullanmaya çalýþýyor.", ReturnDate(), ReturnName(playerid), distance);
				SendMessage(playerid, "Teleport detected.");
            }
            if (distance == 100.0)
	        {
                AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, invisible hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
                Log_Write("logs/AntiCheat.log", "[%s] %s, invisible hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
                SendMessage(playerid, "Invisible detected.");
                KickEx(playerid);
			}
        }
    }
    GetPlayerPos(playerid, LastPosition[playerid][0], LastPosition[playerid][1], LastPosition[playerid][2]);
    if(GetPlayerAnimationIndex(playerid) && OyuncuBilgi[playerid][pAdminDuty] == 0)
    {
        if(!strcmp(anim[0], "BEACH", true) && !strcmp(anim[1], "ParkSit_W_loop", true))
        {
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
            Log_Write("logs/AntiCheat.log", "[%s] %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
            SendMessage(playerid, "Fly hack detected.");
            KickEx(playerid);
        }
        else if(!strcmp(anim[0], "SWIM", true) && !strcmp(anim[1], "SWIM_TREAD", true))
        {
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
            Log_Write("logs/AntiCheat.log", "[%s] %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
            SendMessage(playerid, "Fly hack detected.");
            KickEx(playerid);
        }
        else if(!strcmp(anim[0], "PARACHUTE", true) && !strcmp(anim[1], "FALL_SKYDIVE_ACCEL", true) && GetPlayerWeapon(playerid) != 46)
        {
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
            Log_Write("logs/AntiCheat.log", "[%s] %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
            SendMessage(playerid, "Fly hack detected.");
            KickEx(playerid);
        }
        else if(!strcmp(anim[0], "PARACHUTE", true) && !strcmp(anim[1], "FALL_SKYDIVE", true) && GetPlayerWeapon(playerid) != 46)
        {
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
            Log_Write("logs/AntiCheat.log", "[%s] %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
            SendMessage(playerid, "Fly hack detected.");
            KickEx(playerid);
        }
        else if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && !strcmp(anim[0], "BMX", true) && !strcmp(anim[1], "BMX_PEDAL", true))
        {
            AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
            Log_Write("logs/AntiCheat.log", "[%s] %s, fly hack kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
            SendMessage(playerid, "Fly hack detected.");
            KickEx(playerid);
        }
    }
    if(GetPlayerAnimationIndex(playerid) == 970 || GetPlayerAnimationIndex(playerid) == 966 || GetPlayerAnimationIndex(playerid) == 516)
    {
		AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, troll hack (troll animation) kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
		Log_Write("logs/AntiCheat.log", "[%s] %s, troll hack (troll animation) kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
		SendMessage(playerid, "Troll hack detected.");
        KickEx(playerid);
    }
    if(GetPlayerAnimationIndex(playerid) == 402)
    {
        AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, animation invisible kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
		Log_Write("logs/AntiCheat.log", "[%s] %s, animation invisible kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
		SendMessage(playerid, "Animation invisible detected.");
        KickEx(playerid);
	}
    if (OyuncuBilgi[playerid][pJetpack] == 0 && OyuncuBilgi[playerid][pAdmin] < 1 && GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK && OyuncuBilgi[playerid][pAdminDuty] == 0)
    {
        AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, jetpack hilesi kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnName(playerid));
        Log_Write("logs/AntiCheat.log", "[%s] %s, jetpack hilesi kullanmaya çalýþtýðý için sunucudan atýldý.", ReturnDate(), ReturnName(playerid));
        SendMessage(playerid, "Jetpack hack detected.");
        Kick(playerid);
    }
    return 1;
}

forward AnimIzle(playerid);
public AnimIzle(playerid)
{
	new userid = AnimSpec[playerid];
    if (GetPlayerAnimationIndex(userid) && AnimSpec[playerid] != -1)
    {
        new
            animLib[32],
            animName[32];

        GetAnimationName(GetPlayerAnimationIndex(userid), animLib, sizeof animLib, animName, sizeof animName);
        SendMessage(playerid, "Animation: %s %s", animLib, animName);
    }
    return 1;
}

forward MinuteCheck();
public MinuteCheck()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
		if (OyuncuBilgi[i][pJail])
		{
			OyuncuBilgi[i][pJailTime]--;
		}
		if (OyuncuBilgi[i][pJailTime] <= 0 && OyuncuBilgi[i][pJail])
		{
			OyuncuBilgi[i][pJail] = 0;
			OyuncuBilgi[i][pJailTime] = 0;
			SpawnKorumasi1(i);
            OyuncuBilgi[i][pLegalTeleport] = gettime() + 2;
            SetPlayerPos(i, 1728.5088, -1668.0836, 22.6094);
            SetPlayerFacingAngle(i, 49.5617);
            SetPlayerInterior(i, 18);
            SetPlayerVirtualWorld(i, 10);
            SetPlayerSkin(i, OyuncuBilgi[i][pSkin]);
            ResetPlayerWeapons(i);
            GivePlayerWeapon(i, 24, 999);
            OyuncuGuncelle(i);
		}
    }
	return 1;
}

forward SecondUpdate(playerid);
public SecondUpdate(playerid)
{
	new dakika;
    if (OyuncuBilgi[playerid][pMute] >= 1)
    {
        OyuncuBilgi[playerid][pMute]--;
    }
    if (OyuncuBilgi[playerid][pMute] < 1)
    {
        OyuncuBilgi[playerid][pMute] = 0;
    }
    if (dakika >= 60)
	{
        OyuncuBilgi[playerid][pDakikaTimer] ++;
        OyuncuGuncelle(playerid);
	}
    dakika++;
	return 1;
}

forward DelayedKick(playerid);
public DelayedKick(playerid)
{
    Kick(playerid);
	return 1;
}

forward ActorSpawn();
public ActorSpawn()
{
    //TDM
    SetActorPos(actors[0], 1721.5087,-1668.4894,20.2255);
    SetActorFacingAngle(actors[0], 43.3116);
    //DM
    SetActorPos(actors[1], 1728.7838,-1661.5387,20.2380);
    SetActorFacingAngle(actors[1], 41.7356);
    //PP
    SetActorPos(actors[2], 1713.8925,-1663.5391,20.2279);
    SetActorFacingAngle(actors[2], 270.8640);
	return 1;
}

forward AracCekmeHilesiKick(playerid);
public AracCekmeHilesiKick(playerid)
{
    AdminMessage(COLOR_LIGHTRED, "CheatLog: %s, get car hack kullanmaya çalýþýyor olabilir (kesin bildirim deðil).", ReturnName(playerid));
    Log_Write("logs/AntiCheat.log", "[%s] %s, get car hack kullanmaya çalýþýyor olabilir (kesin bildirim deðil).", ReturnDate(), ReturnName(playerid));
	return 1;
}

forward ReconnectSifirla(playerid);
public ReconnectSifirla(playerid)
{
	Reconnect[playerid] = 0;
	return 1;
}

forward ShotReset(playerid);
public ShotReset(playerid)
{
    SetPVarInt(playerid, "Shot", 0);
	return 1;
}

forward Payday(playerid);
public Payday(playerid)
{
	
    return 1;
}

forward SpawnKorumasi2(playerid);
public SpawnKorumasi2(playerid)
{
    TogglePlayerControllable(playerid,1);
    SpawnKorumasi[playerid] = 0;
	if (TDMOda[playerid] > -1 && DMOda[playerid] > -1) return callcmd::lobby(playerid);
    if (TDMOda[playerid] > -1) return DMOda[playerid] = -1;
    if (DMOda[playerid] > -1) return TDMOda[playerid] = -1;
    return 1;
}

forward ArenaSpawnTimer(playerid);
public ArenaSpawnTimer(playerid)
{
    TogglePlayerSpectating(playerid, false);
    OyuncuBilgi[playerid][pSpec] = 0;
    ArenaSpawn(playerid);
    TDMOda[playerid] = -1;
    return 1;
}

forward TDMArenaSpawnTimer(playerid);
public TDMArenaSpawnTimer(playerid)
{
    TogglePlayerSpectating(playerid, false);
	OyuncuBilgi[playerid][pSpec] = 0;
    TDMArenaSpawn(playerid);
    DMOda[playerid] = -1;
    return 1;
}

forward DuelloSpawnTimer(playerid, killerid);
public DuelloSpawnTimer(playerid, killerid)
{
    TogglePlayerSpectating(playerid, false);
	OyuncuBilgi[playerid][pSpec] = 0;
    ArenaCik(playerid);
    ArenaCik(killerid);
    OyuncuBilgi[killerid][pLegalTeleport] = gettime() + 2;
    SpawnKorumasi1(playerid);
    SpawnKorumasi1(killerid);
    SetPlayerPos(killerid, 1728.5088, -1668.0836, 22.6094);
    OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
    SetPlayerPos(playerid, 1728.5088, -1668.0836, 22.6094);
    SetPlayerInterior(playerid, 18);
    SetPlayerVirtualWorld(playerid, 10);
    SetPlayerInterior(killerid, 18);
    SetPlayerVirtualWorld(killerid, 10);
    return 1;
}

forward LegalSpeed(playerid);
public LegalSpeed(playerid)
{
	SetPVarInt(playerid, "LegalSpeed", 0);
	return 1;
}

forward SunucuGuncelle();
public SunucuGuncelle()
{
	if (LVPDArena < 0) return LVPDArena = 0;
	if (JeffersonArena < 0) return JeffersonArena = 0;
    if (RCArena < 0) return RCArena = 0;
    if (GhostArena < 0) return GhostArena = 0;
    if (HeadshotArena < 0) return HeadshotArena = 0;
    if (GroveTakim < 0) return GroveTakim = 0;
    if (BallasTakim < 0) return BallasTakim = 0;
    if (VagosTakim < 0) return VagosTakim = 0;
    if (AztecasTakim < 0) return AztecasTakim = 0;
    return 1;
}

forward OyuncuVeriYukle(playerid);
public OyuncuVeriYukle(playerid)
{
      SendClientMessage(playerid, 0xA9C4E4FF, "Rose Deathmatch loading models...");
      SendClientMessage(playerid, 0xA9C4E4FF, "Rose Deathmatch loading maps...");
      SendClientMessage(playerid, 0xA9C4E4FF, "Loading Rose Roleplay...");
      new mesaj[150], string[128];
      if(cache_num_rows() > 0)
      {
            OyuncuBilgi[playerid][Cache_ID] = cache_save();
            cache_get_value(0, "Sifre", OyuncuBilgi[playerid][pSifre], 65);
            cache_get_value(0, "SifreSakla", OyuncuBilgi[playerid][pSifreSakla], 17);
            cache_get_value_name_int(0, "Admin", OyuncuBilgi[playerid][pAdmin]);
            cache_get_value_name_int(0, "Dakika", OyuncuBilgi[playerid][pDakikaTimer]);
            cache_get_value_name_int(0, "Oldurme", OyuncuBilgi[playerid][pOldurme]);
            cache_get_value_name_int(0, "Olme", OyuncuBilgi[playerid][pOlme]);
            cache_get_value_name_int(0, "EXP", OyuncuBilgi[playerid][pEXP]);
            cache_get_value_name_int(0, "Skin", OyuncuBilgi[playerid][pSkin]);
            cache_get_value_name_int(0, "Mute", OyuncuBilgi[playerid][pMute]);
            cache_get_value_name_int(0, "VIP", OyuncuBilgi[playerid][pVip]);
            cache_get_value_name_int(0, "VipSure", OyuncuBilgi[playerid][pVipSure]);
            cache_get_value_name_int(0, "Sniper", OyuncuBilgi[playerid][pSniper]);
            cache_get_value_name_int(0, "Para", OyuncuBilgi[playerid][pPara]);
            cache_get_value_name_int(0, "SandikHakki", OyuncuBilgi[playerid][pSandikHakki]);
            cache_get_value_name_int(0, "Jail", OyuncuBilgi[playerid][pJailTime]);
            cache_get_value_name_int(0, "RCoin", OyuncuBilgi[playerid][pRcoin]);
            cache_get_value_name_int(0, "LevelExp", OyuncuBilgi[playerid][pLevelExp]);
            cache_get_value_name(0,"ASlot1",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][0], OyuncuBilgi[playerid][pABone][0], OyuncuBilgi[playerid][pTSlot][0], OyuncuBilgi[playerid][pARenk][0]);
            cache_get_value_name(0,"ASlot2",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][1], OyuncuBilgi[playerid][pABone][1], OyuncuBilgi[playerid][pTSlot][1], OyuncuBilgi[playerid][pARenk][1]);
            cache_get_value_name(0,"ASlot3",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][2], OyuncuBilgi[playerid][pABone][2], OyuncuBilgi[playerid][pTSlot][2], OyuncuBilgi[playerid][pARenk][2]);
            cache_get_value_name(0,"ASlot4",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][3], OyuncuBilgi[playerid][pABone][3], OyuncuBilgi[playerid][pTSlot][3], OyuncuBilgi[playerid][pARenk][3]);
            cache_get_value_name(0,"ASlot5",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][4], OyuncuBilgi[playerid][pABone][4], OyuncuBilgi[playerid][pTSlot][4], OyuncuBilgi[playerid][pARenk][4]);
            cache_get_value_name(0,"ASlot6",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][5], OyuncuBilgi[playerid][pABone][5], OyuncuBilgi[playerid][pTSlot][5], OyuncuBilgi[playerid][pARenk][5]);
            cache_get_value_name(0,"ASlot7",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][6], OyuncuBilgi[playerid][pABone][6], OyuncuBilgi[playerid][pTSlot][6], OyuncuBilgi[playerid][pARenk][6]);
            cache_get_value_name(0,"ASlot8",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][7], OyuncuBilgi[playerid][pABone][7], OyuncuBilgi[playerid][pTSlot][7], OyuncuBilgi[playerid][pARenk][7]);
            cache_get_value_name(0,"ASlot9",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][8], OyuncuBilgi[playerid][pABone][8], OyuncuBilgi[playerid][pTSlot][8], OyuncuBilgi[playerid][pARenk][8]);
            cache_get_value_name(0,"ASlot10",string,45);
            sscanf(string, "p<|>iiii", OyuncuBilgi[playerid][pASlot][9], OyuncuBilgi[playerid][pABone][9], OyuncuBilgi[playerid][pTSlot][9], OyuncuBilgi[playerid][pARenk][9]);
            cache_get_value_name(0, "ASlot1Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][0][0], AksesuarData[playerid][0][1], AksesuarData[playerid][0][2], AksesuarData[playerid][0][3], AksesuarData[playerid][0][4], AksesuarData[playerid][0][5], AksesuarData[playerid][0][6], AksesuarData[playerid][0][7], AksesuarData[playerid][0][8]);
            cache_get_value_name(0, "ASlot2Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][1][0], AksesuarData[playerid][1][1], AksesuarData[playerid][1][2], AksesuarData[playerid][1][3], AksesuarData[playerid][1][4], AksesuarData[playerid][1][5], AksesuarData[playerid][1][6], AksesuarData[playerid][1][7], AksesuarData[playerid][1][8]);
            cache_get_value_name(0, "ASlot3Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][2][0], AksesuarData[playerid][2][1], AksesuarData[playerid][2][2], AksesuarData[playerid][2][3], AksesuarData[playerid][2][4], AksesuarData[playerid][2][5], AksesuarData[playerid][2][6], AksesuarData[playerid][2][7], AksesuarData[playerid][2][8]);
            cache_get_value_name(0, "ASlot4Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][3][0], AksesuarData[playerid][3][1], AksesuarData[playerid][3][2], AksesuarData[playerid][3][3], AksesuarData[playerid][3][4], AksesuarData[playerid][3][5], AksesuarData[playerid][3][6], AksesuarData[playerid][3][7], AksesuarData[playerid][3][8]);
            cache_get_value_name(0, "ASlot5Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][4][0], AksesuarData[playerid][4][1], AksesuarData[playerid][4][2], AksesuarData[playerid][4][3], AksesuarData[playerid][4][4], AksesuarData[playerid][4][5], AksesuarData[playerid][4][6], AksesuarData[playerid][4][7], AksesuarData[playerid][4][8]);
            cache_get_value_name(0, "ASlot6Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][5][0], AksesuarData[playerid][5][1], AksesuarData[playerid][5][2], AksesuarData[playerid][5][3], AksesuarData[playerid][5][4], AksesuarData[playerid][5][5], AksesuarData[playerid][5][6], AksesuarData[playerid][5][7], AksesuarData[playerid][5][8]);
            cache_get_value_name(0, "ASlot7Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][6][0], AksesuarData[playerid][6][1], AksesuarData[playerid][6][2], AksesuarData[playerid][6][3], AksesuarData[playerid][6][4], AksesuarData[playerid][6][5], AksesuarData[playerid][6][6], AksesuarData[playerid][6][7], AksesuarData[playerid][6][8]);
            cache_get_value_name(0, "ASlot8Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][7][0], AksesuarData[playerid][7][1], AksesuarData[playerid][7][2], AksesuarData[playerid][7][3], AksesuarData[playerid][7][4], AksesuarData[playerid][7][5], AksesuarData[playerid][7][6], AksesuarData[playerid][7][7], AksesuarData[playerid][7][8]);
            cache_get_value_name(0, "ASlot9Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][8][0], AksesuarData[playerid][8][1], AksesuarData[playerid][8][2], AksesuarData[playerid][8][3], AksesuarData[playerid][8][4], AksesuarData[playerid][8][5], AksesuarData[playerid][8][6], AksesuarData[playerid][8][7], AksesuarData[playerid][8][8]);
            cache_get_value_name(0, "ASlot10Pos", string, 100);
            sscanf(string, "p<|>fffffffff", AksesuarData[playerid][9][0], AksesuarData[playerid][9][1], AksesuarData[playerid][9][2], AksesuarData[playerid][9][3], AksesuarData[playerid][9][4], AksesuarData[playerid][9][5], AksesuarData[playerid][9][6], AksesuarData[playerid][9][7], AksesuarData[playerid][9][8]);
            SendMessage(playerid, "Your account has been found, please login.");
            if (Bakim == 1 && OyuncuBilgi[playerid][pAdmin] < 1)
            {
				ErrorMessage(playerid, "This server is locked.");
				KickEx(playerid);
			}
            format(mesaj, sizeof(mesaj), "{FFFFFF}> {FF0000}%s {FFFFFF}Please enter your password to login:", OyuncuBilgi[playerid][pIsim]);
            ShowPlayerDialog(playerid, DIALOG_GIRIS, DIALOG_STYLE_PASSWORD, "{FFFFFF}>> Login", mesaj, "{FFFFFF}Login", "{FFFFFF}Cancel");
      }
      else
      {
          format(mesaj, sizeof(mesaj), "{FFFFFF}> Hello {FF0000}%s{FFFFFF}, you can register by entering your password:", OyuncuBilgi[playerid][pIsim]);
          ShowPlayerDialog(playerid, DIALOG_KAYIT, DIALOG_STYLE_PASSWORD, "{FFFFFF}>> Register", mesaj, "{FFFFFF}Register", "{FFFFFF}Cancel");
      }
      SetPlayerCameraPos(playerid, 1717.6449, -1642.2242, 27.0327);
	  SetPlayerCameraLookAt(playerid, 1717.9038, -1643.1880, 26.6477);
	  SetPlayerInterior(playerid, 18);
      SetPlayerVirtualWorld(playerid, 10);
      return 1;
}

forward OyuncuKaydet(playerid);
public OyuncuKaydet(playerid)
{
      OyuncuBilgi[playerid][ID] = cache_insert_id();
      ChatSil(playerid);
      SendMessage(playerid, "You have successfully registered, you can get information about commands with /help.");
      Logged[playerid] = 1;
      OyuncuBilgi[playerid][pLegalTeleport] = gettime() + 2;
      SetSpawnInfo(playerid, NO_TEAM, 0, 1729.2484, -1668.8885, 22.6151, 49.5617, 0, 0, 0, 0, 0, 0);
      SpawnPlayer(playerid);
      new rand = random(sizeof(RandomLobbySpawn));
      SetPlayerColor(playerid, RandomLobbySpawn[rand]);
      SetPlayerSkin(playerid, 60);
      SetPlayerInterior(playerid, 18);
      SetPlayerVirtualWorld(playerid, 10);
      GiveWeapon(playerid, 24, 1000);
      OyuncuGuncelle(playerid);
      Log_Write("logs/Kayýt.log","[%s] %s has been registered this server.",ReturnDate(), ReturnName(playerid));
      return 1;
}


forward BanKontrol(playerid, pip[]);
public BanKontrol(playerid, pip[])
{
	new rows;
	cache_get_row_count(rows);
	if (rows)
	{
	    new ad[24], bantarih[30], sebep[50], sure, banlayan[24], hddserial[75];
	    new ip[20];
        GetPlayerIp(playerid, ip, sizeof(ip));
	    cache_get_value_name(0, "Ad", ad, 24);
	    cache_get_value_name(0, "IP", ip, 20);
	    cache_get_value_name(0, "BanlanmaTarihi", bantarih, 30);
	    cache_get_value_name(0, "Sebep", sebep, 50);
	    cache_get_value_name(0, "Banlayan", banlayan, 24);
	    cache_get_value_name(0, "hddserial", hddserial, 75);
	    cache_get_value_name_int(0, "Sure", sure);
	    new tarih[8];
	    new tarihskrt[20];
	    format(tarihskrt, sizeof(tarihskrt), "%s", bantarih);
	    TimestampToDate(sure, tarih[0],tarih[1],tarih[2],tarih[3],tarihskrt[4],tarih[5]);
	    if (sure >= 1)
	    {
	        if (gettime() > sure)
	        {
	            RemoveBan(ReturnName(playerid));
	            return 1;
	        }
	        else
	        {
	            Dialog_Show(playerid, Banli, DIALOG_STYLE_MSGBOX, "{FFFFFF}>> You Are Banned!", "{FFFFFF}> Your account has been temporarily banned from this server.\n\n{FFFFFF}> Account: %s\nReason: %s\nBanned Time: %s\nAdmin: %s\nUnban Time: %02d/%02d/%02d\n\n{FFFFFF}> If you think there is an incorrect ban, you can request a ban appeal on Discord.", "{FFFFFF}Close", "", ad, sebep, bantarih, banlayan, tarih[2], tarih[1],tarih[0]);
	            /*ErrorMessage(playerid, "Hesabýnýz bu sunucudan geçici olarak yasaklandý.");
                SendMessage(playerid, "Hesap: %s, Sebep: %s, Banlanma Tarihi: %s, Banlayan Admin: %s, Banýn Açýlacaðý Tarih: %02d/%02d/%02d", ad, sebep, bantarih, banlayan, tarih[2], tarih[1],tarih[0]);*/
	            KickEx(playerid);
	            return 0;
	        }
	    }
        else if (sure == 0)
        {
        	Dialog_Show(playerid, Banli, DIALOG_STYLE_MSGBOX, "{FFFFFF}>> You Are Banned!", "{FFFFFF}> You have been permanently banned from this server.\n\n{FFFFFF}> Account: %s\nBanned Time: %s\nAdmin: %s\nReason: %s\n\n{FFFFFF}> If you think there is an incorrect ban, you can request a ban appeal on Discord.", "{FFFFFF}Close", "", ad, bantarih, banlayan, sebep);
        	/*ErrorMessage(playerid, "Hesabýnýz bu sunucudan kalýcý olarak yasaklandý.");
            SendMessage(playerid, "Hesap: %s, Sebep: %s, Banlanma Tarihi: %s, Banlayan Admin: %s, Ban Süresi: Sýnýrsýz", ad, sebep, bantarih, banlayan);*/
         	KickEx(playerid);
         	return 0;
        }
	}
	return 1;
}

forward UnBan(playerid, ad[]);
public UnBan(playerid, ad[])
{
	new rows;
	cache_get_row_count(rows);
	if (!rows) return ErrorMessage(playerid, "Bu hesap banlý deðil.");
	RemoveBan(ad);
	SendMessage(playerid, "%s adlý oyuncunun baný açýldý.", ad);
	return 1;
}

forward MysqlBaglanti();
public MysqlBaglanti()
{

  new MySQLOpt:options = mysql_init_options();
  mysql_set_option(options, AUTO_RECONNECT, true);
  mysql_log(ERROR);
  g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE);
  if(mysql_errno(g_SQL) != 0)
  {
    print("[ROSE-DM] MySQL baðlantýsý baþarýsýz!");
  }
  else
  {
    print("[ROSE-DM] MySQL baðlantýsý kuruldu!");
  }
  return true;
}

forward SaniyelikGuncelle(playerid);
public SaniyelikGuncelle(playerid)
{
	new	playerip[16];
	GetPlayerIp(playerid, playerip, sizeof(playerip));
	new query[331];
	mysql_format(g_SQL, query, sizeof query, "UPDATE `oyuncular` SET `Admin` = %d, `Dakika` = %d, `OynamaSaati` = %d, `Olme` = %d, `Oldurme` = %d, `EXP` = %d, `Skin` = %d, `Mute` = %d, `VIP` = %d, `VipSure` = %d, `Para` = %d, `Sniper` = %d, `SandikHakki` = %d, `Jail` = %d, `RCoin` = %d, `LevelExp` = %d  WHERE `ID` = %d",
 	OyuncuBilgi[playerid][pAdmin],
  	OyuncuBilgi[playerid][pDakikaTimer],
  	OyuncuBilgi[playerid][pOynamaSaati],
  	OyuncuBilgi[playerid][pOlme],
   	OyuncuBilgi[playerid][pOldurme],
   	GetPlayerScore(playerid),
   	GetPlayerSkin(playerid),
   	OyuncuBilgi[playerid][pMute],
	OyuncuBilgi[playerid][pVip],
	OyuncuBilgi[playerid][pVipSure],
	GetPlayerMoney(playerid),
	OyuncuBilgi[playerid][pSniper],
	OyuncuBilgi[playerid][pSandikHakki],
	OyuncuBilgi[playerid][pJailTime],
	OyuncuBilgi[playerid][pRcoin],
	OyuncuBilgi[playerid][pLevelExp],
	OyuncuBilgi[playerid][ID]);
	mysql_tquery(g_SQL, query);
	if(OyuncuBilgi[playerid][pLevelExp] >= OyuncuBilgi[playerid][pEXP]*10)
	{
        OyuncuBilgi[playerid][pEXP]++;
	}
	return 1;
}