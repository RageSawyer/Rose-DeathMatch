Dialog:DMArena(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        if(strfind(inputtext, "LVPD Arena", true) != -1)
        {
			DMOda[playerid] = 0;
			LVPDArena++;
			TDMOda[playerid] = -1;
			ArenaSpawn(playerid);
        }
        if(strfind(inputtext, "Jefferson Motel", true) != -1)
        {
			DMOda[playerid] = 1;
			JeffersonArena++;
			TDMOda[playerid] = -1;
			ArenaSpawn(playerid);
        }
        if(strfind(inputtext, "RC Battlefield", true) != -1)
        {
			DMOda[playerid] = 2;
			RCArena++;
			TDMOda[playerid] = -1;
			ArenaSpawn(playerid);
        }
        if(strfind(inputtext, "Ghost Town", true) != -1)
        {
			DMOda[playerid] = 3;
			GhostArena++;
			TDMOda[playerid] = -1;
			ArenaSpawn(playerid);
        }
        if(strfind(inputtext, "Headshot Arena", true) != -1)
        {
			DMOda[playerid] = 4;
			HeadshotArena++;
			TDMOda[playerid] = -1;
			ArenaSpawn(playerid);
        }
    }
    return 1;
}

Dialog:Report(playerid, response, listitem, inputtext[])
{
	if (response)
	{
		new userid;
		if (sscanf(inputtext, "u", userid)) return Dialog_Show(playerid, Report, DIALOG_STYLE_INPUT, "{FFFFFF}>> Report", "{FFFFFF}> Please enter the ID of the player you want to report:", "{FFFFFF}Enter", "{FFFFFF}Cancel");
		if(!IsPlayerConnected(userid)) return Dialog_Show(playerid, Report, DIALOG_STYLE_INPUT, "{FFFFFF}>> Report", "{FFFFFF}> Invalid ID!\nPlease enter the ID of the player you want to report:", "{FFFFFF}Enter", "{FFFFFF}Cancel");
        Dialog_Show(playerid, Report2, DIALOG_STYLE_INPUT, "{FFFFFF}>> Report", "{FFFFFF}> Why do you want to report this player?", "{FFFFFF}Send", "{FFFFFF}Cancel");
	}
	return 1;
}

Dialog:Report2(playerid, response, listitem, inputtext[])
{
    new userid = strval(inputtext);
	if (response)
	{
        if(strlen(inputtext) > 24) return Dialog_Show(playerid, Report2, DIALOG_STYLE_INPUT, "{FFFFFF}>> Report", "The reason for the report cannot be longer than 24 characters!\nWhy do you want to report this player?", "{FFFFFF}Send", "{FFFFFF}Kapat");
        SendMessage(playerid, "Your report has been sent successfully.", ReturnName(userid),inputtext);
        foreach (new i : Player)
        {
            if(OyuncuBilgi[i][pAdmin] >= 1)
			{
                SendClientMessageEx(i, 0xD47626FF, "%s (%d), %s (%d) adlý oyuncuyu %s sebebi ile rapor etti.", ReturnName(playerid), playerid, ReturnName(userid), userid, inputtext);
                Log_Write("logs/Rapor.log","[%s] %s (%d), %s (%d) adlý oyuncuyu %s sebebi ile rapor etti.", ReturnDate(), ReturnName(playerid), playerid, ReturnName(userid), userid, inputtext);
            }
        }
	}
	return 1;
}
Dialog:VIPSatinal(playerid, response, listitem, inputtext[])
{
	if (response)
	{
	    if (OyuncuBilgi[playerid][pRcoin] < 500000) return ErrorMessage(playerid, "You don't have enough rcoin to buy V.I.P (500.000 R-Coin).");
        if (OyuncuBilgi[playerid][pVip] == 1) return ErrorMessage(playerid, "You already have ''V.I.P''.");
        OyuncuBilgi[playerid][pVip] = 1;
     	OyuncuBilgi[playerid][pVipSure] = gettime()+30*86400;
        SendMessage(playerid, "Congratulations! You bought a V.I.P that lasted 30 days.");
        Log_Write("logs/Market.log","[%s] %s $300.000 ödeyerek 30 günlük V.I.P satýn aldý.",ReturnDate(),ReturnName(playerid));
        OyuncuBilgi[playerid][pRcoin] -= 500000;
        OyuncuGuncelle(playerid);
    }
	return 1;
}/*
Dialog:ChangeColor(playerid, response, listitem, inputtext[])
{
    if(response)
    {
	    switch(listitem)
	    {
            case 0:
            {
				new rand = random(sizeof(RandomLobbySpawn));
	            SetPlayerColor(playerid, RandomLobbySpawn[rand]);
			}
			case 1:
            {
				SetPlayerColor(playerid, 0xFF0000FF);
			}
			case 2:
            {
				SetPlayerColor(playerid, 0x0000FFFF);
			}
			case 3:
            {
				SetPlayerColor(playerid, 0xFFFF00FF);
			}
			case 4:
            {
				SetPlayerColor(playerid, 0x008000FF);
			}
			case 5:
            {
				SetPlayerColor(playerid, 0x800080FF);
			}
			case 6:
            {
				SetPlayerColor(playerid, 0xFFFFFFFF);
			}
			case 7:
            {
				SetPlayerColor(playerid, 0xFF7F00FF);
			}
			case 8:
            {
				SetPlayerColor(playerid, 0x964B00FF);
			}
			case 9:
            {
				SetPlayerColor(playerid, 0xFFC0CBFF);
			}
    	}
    }
	return 1;
}*/
Dialog:ChangeNameOnay(playerid, response, listitem, inputtext[])
{
    if(response)
    {
		Dialog_Show(playerid, ChangeName, DIALOG_STYLE_INPUT, "{FFFFFF}>> Change Name", "{FFFFFF}> Please enter your new name:", "{FFFFFF}Enter", "{FFFFFF}Cancel");
    }
	return 1;
}

Dialog:ChangeName(playerid, response, listitem, inputtext[])
{
    if(response)
    {
		if (GetPlayerMoney(playerid) < 100000) return ErrorMessage(playerid, "You don't have enough money to change your name ($100.000).");
		ParaVer(playerid, -100000);
		Log_Write("logs/NameChange.log", "[%s] %s, $100.000 ödeyerek ismini %s olarak deðiþtirdi", ReturnDate(), ReturnName(playerid), inputtext);
		SetPlayerName(playerid, inputtext);
		OyuncuGuncelle(playerid);
    }
	return 1;
}

Dialog:market(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        if(strfind(inputtext, "Armor 2.000 RCoin", true) != -1)
        {
			if (OyuncuBilgi[playerid][pRcoin] < 2000) return ErrorMessage(playerid, "You don't have enough rcoin to buy armor (2.000 R-Coin).");
  			if (ReturnHealth(playerid) != 100) return ErrorMessage(playerid, "In order to buy armor, your health bar must be full.");
     		SetPlayerArmour(playerid, 100);
       		SendMessage(playerid, "You bought armor for 2.000 R-Coin.");
         	Log_Write("logs/Market.log","[%s] %s $2.000 ödeyerek zýrh satýn aldý.",ReturnDate(), ReturnName(playerid));
     		OyuncuBilgi[playerid][pRcoin] -= 2000;
     		OyuncuGuncelle(playerid);
        }
        if(strfind(inputtext, "V.I.P 500.000 RCoin", true) != -1)
        {
			Dialog_Show(playerid, VIPSatinal, DIALOG_STYLE_MSGBOX, "{FFFFFF}>> V.I.P Features", "{FFFFFF}> When you get a kill, you earn 2x money and exp.\nFree armor and snipers are given in deathmatch arenas.\nV.I.P skins can be used (/vipskin).\nThe Discord server is given the role of V.I.P.\nWhen you write, it says ''V.I.P'' at the beginning of your name.\n", "{FFFFFF}Buy", "{FFFFFF}Cancel");
        }
        if(strfind(inputtext, "Sniper 25.000 RCoin", true) != -1)
        {
			if (OyuncuBilgi[playerid][pRcoin] < 50000) return ErrorMessage(playerid, "You don't have enough rcoin to buy a sniper (25.000 R-Coin).");
  			if (OyuncuBilgi[playerid][pSniper] == 1) return ErrorMessage(playerid, "You already have the weapon called ''Sniper''.");
			OyuncuBilgi[playerid][pSniper] = 1;
			SendMessage(playerid, "Congratulations! you bought a sniper.");
			OyuncuBilgi[playerid][pRcoin] -= 25000;
			Log_Write("logs/Market.log","[%s] %s $50.000 dolar ödeyerek sniper satýn aldý.",ReturnDate(), ReturnName(playerid));
   			OyuncuGuncelle(playerid);
        }
    }
    return 1;
}

Dialog:TDMArena(playerid, response, listitem, inputtext[])
{
    if(response)
    {
        if(strfind(inputtext, "Grove", true) != -1)
        {
			//if (GroveTakim == 8) return ErrorMessage(playerid, "This arena is full.");
			TDMOda[playerid] = 0;
			GroveTakim++;
			SetPlayerTeam(playerid, 1);
			TDMArenaSpawn(playerid);
        }
        if(strfind(inputtext, "Ballas", true) != -1)
        {
            //if (BallasTakim == 8) return ErrorMessage(playerid, "This arena is full.");
			TDMOda[playerid] = 1;
			BallasTakim++;
			SetPlayerTeam(playerid, 2);
			TDMArenaSpawn(playerid);
        }
        if(strfind(inputtext, "Vagos", true) != -1)
        {
			//if (VagosTakim == 8) return ErrorMessage(playerid, "This arena is full.");
			TDMOda[playerid] = 2;
			VagosTakim++;
			SetPlayerTeam(playerid, 3);
			TDMArenaSpawn(playerid);
        }
        if(strfind(inputtext, "Aztecas", true) != -1)
        {
            //if (AztecasTakim == 8) return ErrorMessage(playerid, "This arena is full.");
			TDMOda[playerid] = 3;
			AztecasTakim++;
			SetPlayerTeam(playerid, 4);
			TDMArenaSpawn(playerid);
        }
    }
    return 1;
}

Dialog:AksesuarRenk(playerid, response, listitem, inputtext[])
{
	if(response)
	{
	    new slot = GetPVarInt(playerid, "AttachmentIndexSel");
	    if(listitem >= 0 && listitem <= 6)
	    {
	        OyuncuBilgi[playerid][pARenk][slot] = listitem+1;
	    }
	    else
	    {
	        OyuncuBilgi[playerid][pARenk][slot] = 0;
	    }
	    SQL_AksesuarKaydet(playerid);
	    AksesuarTak(playerid, slot);
	}
	return 1;
}

Dialog:VipMenu(playerid, response, listitem, inputtext[])
{
	if(response)
	{
	    if(listitem == 0)
	    {
			AksesuarlariGoster(playerid);
	    }
        if(listitem == 1)
	    {
            ErrorMessage(playerid, "Yapacaðýz babab bi sakin aq");	
	    }
        if(listitem == 2)
	    {
            ErrorMessage(playerid, "Yapacaðýz babab bi sakin aq");
	    }
	        
	}
	return 1;
}