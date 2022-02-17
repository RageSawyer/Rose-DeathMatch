/*
Sunucu Sql Sürüm: R41
Sunucu Kurucularý: Sawyer
Sunucu Geliþtiricileri: Sawyer
Sunucu Modu Baþlangýç Tarihi: 11.02.2022 / 04:21
*/


#pragma compat 1
#pragma dynamic 500000

#pragma warning disable 239, 203, 214, 217

/*--------------[MYSQL Bilgilerinizi girin]----------------*/
#define      MYSQL_HOST                "localhost"
#define      MYSQL_USER                "root"
#define      MYSQL_PASSWORD            ""
#define      MYSQL_DATABASE            "rosedm"

/*--------------[Sunucu Bilgilerinizi girin]----------------*/
#define 	SUNUCU_ADI			"[7/24] Rose Deathmatch 0.3.DL [Turkish/English]"
#define 	SUNUCU_WEBSITE		"www.rageturk.com"
#define 	SUNUCU_GELISTIRICI	"Sawyer(Emre)"
#define 	SUNUCU_MAP			"Rose World"
#define 	SUNUCU_DIL 			"Turkish/English"
#define 	SUNUCU_SURUM		"RS DM V0.1"
#define 	GIRIS_SURESI		30
#define 	C7					"{720000}"
#define 	C8					"{D2D2D2}" // 44444
#define 	SDIALOG 			""C7"R"C8"ose "C7"D"C8"eath"C7"M"C8"atch"
#define 	KAYIT_YAZISI 		"~r~~h~R~w~~h~ose ~r~~h~D~w~~h~eath~r~~h~M~w~~h~atch"
#define 	GIRIS_YAZISI		"~r~~h~R~w~~h~ose ~r~~h~D~w~~h~eath~r~~h~M~w~~h~atch"

/*-----------------[Fuction]-------------------*/
    #include    "src/fonksiyonlar/include.pwn"
    #include    "src/fonksiyonlar/define.pwn"
    #include    "src/fonksiyonlar/enum.pwn"
    #include    "src/fonksiyonlar/new.pwn"
    #include    "src/fonksiyonlar/tanimlar.pwn"
    #include    "src/fonksiyonlar/forward.pwn"
    #include    "src/fonksiyonlar/public.pwn"
    #include    "src/fonksiyonlar/stock.pwn"
    #include    "src/fonksiyonlar/dialog.pwn"
/*----------------------------------------------*/

/*-------------------[Player]-------------------*/
    //#include    "src/player/aksesuar.pwn"
    //#include    "scripts/anticheat.pwn"
    #include    "src/cmd.pwn"
    #include    "src/cmd-a.pwn"
/*----------------------------------------------*/

main()
{
	static cs[1024];
	printf("");
	printf("");
	printf("");
	printf("");
	printf("");
	printf("");
	printf("\n--------------------------------------------------------------------");
	printf("");
	format(cs, sizeof(cs), "[RS:DM] Geliþtiriciler  : %s", SUNUCU_GELISTIRICI); printf(cs);
	printf("");
	printf("--------------------------------------------------------------------\n");
	printf("");
	printf("\n--------------------------------------------------------------------");
	format(cs, sizeof(cs), "[RS:DM] %s © Developer Team - @2021-2022", SUNUCU_ADI); printf(cs);
	printf("--------------------------------------------------------------------");
	printf("[RS:DM]    [BILGILER]    [DEGER]");
	format(cs, sizeof(cs), "[RS:DM] Sunucu website  : %s", SUNUCU_WEBSITE); printf(cs);
	format(cs, sizeof(cs), "[RS:DM] Sunucu map adi  : %s", SUNUCU_MAP); printf(cs);
	format(cs, sizeof(cs), "[RS:DM] Sunucu dili     : %s", SUNUCU_DIL); printf(cs);
	format(cs, sizeof(cs), "[RS:DM] Surum           : %s", SUNUCU_SURUM); printf(cs);
	format(cs, sizeof(cs), "[RS:DM] Maksimum Oyuncu : %d", MAX_PLAYERS); printf(cs);
	printf("--------------------------------------------------------------------");
	format(cs, sizeof(cs), "[RS:DM] MySQL Host      : %s", MYSQL_HOST); printf(cs);
	format(cs, sizeof(cs), "[RS:DM] MySQL User      : %s", MYSQL_USER); printf(cs);
	format(cs, sizeof(cs), "[RS:DM] MySQL Password  : %s", MYSQL_PASSWORD); printf(cs);
	format(cs, sizeof(cs), "[RS:DM] MySQL Database  : %s\n", MYSQL_DATABASE); printf(cs);
}
