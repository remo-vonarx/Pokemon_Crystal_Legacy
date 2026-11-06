casinomon: MACRO
; species, coins needed
	db \1
	dw \2
ENDM

specialencounter: MACRO
; requested mon, offered mon, item, OT ID, OT name, gender requested
	db \1
	dw \2
	map_id \3
	dw \4
ENDM

CasinoMons::
; usually 3 per region, but not a hard coded limit
	; region map ; 2 bytes (group/ID)
	; species, coins (2 bytes)

	; johto, from maps\goldenrodgamecorner.asm
	map_id GOLDENROD_GAME_CORNER
	casinomon ABRA, GOLDENRODGAMECORNER_ABRA_COINS
	casinomon PORYGON, GOLDENRODGAMECORNER_PORYGON_COINS
	casinomon DRATINI, GOLDENRODGAMECORNER_DRATINI_COINS
	db -1
	; kanto, from maps\celadongamecornerprizeroom.asm
	map_id CELADON_GAME_CORNER_PRIZE_ROOM
	casinomon PIKACHU, CELADONGAMECORNERPRIZEROOM_PIKACHU_COINS 
	casinomon WOBBUFFET, CELADONGAMECORNERPRIZEROOM_WOBBUFFET_COINS
	casinomon LARVITAR, CELADONGAMECORNERPRIZEROOM_LARVITAR_COINS 
	db -1

NPCTradeMons_Locations::
; corresponds to NPCTrades:: in data\events\npc_trades.asm
	table_width 2 ; map is 2 bytes
	map_id GOLDENROD_DEPT_STORE_5F 	; MAPGROUP_GOLDENROD, 	MAP_GOLDENROD_DEPT_STORE_5F
	map_id VIOLET_KYLES_HOUSE		; MAPGROUP_VIOLET, 		MAP_VIOLET_KYLES_HOUSE
	map_id OLIVINE_TIMS_HOUSE 		; MAPGROUP_OLIVINE, 	MAP_OLIVINE_TIMS_HOUSE 
	map_id BLACKTHORN_EMYS_HOUSE 	; MAPGROUP_BLACKTHORN, 	MAP_BLACKTHORN_EMYS_HOUSE
	map_id PEWTER_POKECENTER_1F 	; MAPGROUP_PEWTER, 		MAP_PEWTER_POKECENTER_1F
	map_id ROUTE_14 				; MAPGROUP_FUCHSIA, 	MAP_ROUTE_14
	map_id POWER_PLANT 				; MAPGROUP_CERULEAN, 	MAP_POWER_PLANT
	assert_table_length NUM_NPC_TRADES

EventWildMons::
; BROKEN: ; replace map_id with -1 to hide location but keep hint
; specialencounter 	 SPECIES,   EVENT_FLAG,                         map_id, blurb string ptr
	specialencounter LAPRAS, 	-1, 								UNION_CAVE_B2F, FridayLapras_Str ; reoccurs every Friday
	specialencounter ELECTRODE, -1, 								TEAM_ROCKET_BASE_B2F, Trap_Electrode_Str
	specialencounter SUDOWOODO, EVENT_FOUGHT_SUDOWOODO, 			ROUTE_36, SudowoodoEvent_Str
	specialencounter GYARADOS, 	EVENT_LAKE_OF_RAGE_RED_GYARADOS, 	LAKE_OF_RAGE, ShinyGyarados_Str
	specialencounter SNORLAX, 	EVENT_FOUGHT_SNORLAX, 				VERMILION_CITY, SnorlaxEvent_Str
	specialencounter SUICUNE,	EVENT_FOUGHT_SUICUNE, 				TIN_TOWER_1F, SuicuneEvent_Str ; will not normally be seen by player w/o Dex Splash Page, may need new EVENT constant
	specialencounter CELEBI, 	EVENT_CELEBI_FATEFUL_ENCOUNTER, 	ILEX_FOREST, CelebiEvent_Str ; will not normally be seen by player w/o Dex Splash Page, may need new EVENT constant
	specialencounter LUGIA, 	EVENT_FOUGHT_LUGIA, 				WHIRL_ISLAND_LUGIA_CHAMBER, LugiaEvent_Str ; will not normally be seen by player w/o Dex Splash Page, may need new EVENT constant
	specialencounter HO_OH, 	EVENT_FOUGHT_HO_OH,  				TIN_TOWER_ROOF, HoOhEvent_Str ; will not normally be seen by player w/o Dex Splash Page, may need new EVENT constant
	specialencounter ARTICUNO, 	EVENT_CAUGHT_ARTICUNO, 				ROUTE_20, ArticunoEvent_Str ; will not normally be seen by player w/o Dex Splash Page, may need new EVENT constant
	specialencounter ZAPDOS, 	EVENT_CAUGHT_ZAPDOS, 				ROUTE_10_NORTH, ZapdosEvent_Str ; will not normally be seen by player w/o Dex Splash Page, may need new EVENT constant
	specialencounter MOLTRES, 	EVENT_CAUGHT_MOLTRES, 				VICTORY_ROAD, MoltresEvent_Str ; will not normally be seen by player w/o Dex Splash Page, may need new EVENT constant
	specialencounter MEWTWO, 	EVENT_CERULEAN_CAVE_B1F_MEWTWO, 	SILVER_CAVE_ROOM_3, MewtwoEvent_Str ; will not normally be seen by player w/o Dex Splash Page, may need new EVENT constant
	specialencounter MEW, 		EVENT_ROUTE_24_MEW_CAUGHT, 			ROUTE_24, MewEvent_Str ; will not normally be seen by player w/o Dex Splash Page, may need new EVENT constant
	db -1

; LoadWildMon Dex Hints, max 18 chars per line
FridayLapras_Str:
	db 	 "Erscheint jeden"
	next "FREITAG einsam in"
	next "versteckter Höhle.@"
Trap_Electrode_Str:
	db 	 "ACHTUNG:"
	next "Kann als Item"
	next "getarnt sein.@"	
SudowoodoEvent_Str:
	db 	 "Falscher Baum."
	next "Gegossen wird er"
	next "wütend. LEVEL 20.@"
ShinyGyarados_Str:
	db 	 "Einzigartiger,"
	next "wütender roter"
	next "GARADOS. LEVEL 30.@"
SnorlaxEvent_Str:
	db 	 "Trägt garantiert"
	next "ÜBERRESTE."
	next "LEVEL 40.@"
SuicuneEvent_Str:
	db 	 "Die KLARGLOCKE ist"
	next "der Schlüssel zur"
	next "Jagd. LEVEL 40.@"
CelebiEvent_Str:
	db 	 "GS-BALL, tief in"
	next "RUINEN vergraben."
	next "Am SCHREIN opfern.@"
LugiaEvent_Str:
	db 	 "SILBERFLÜGEL, matt"
	next "im MARMORIA-Glanz."
	next "Vergessenes Erbe.@"
HoOhEvent_Str:
	db 	 "BUNTSCHWINGE für"
	next "Trainer nach VIER"
	next "Prüfungen.@"
ArticunoEvent_Str:
	db 	 "Wartet umgeben"
	next "von Wellen."
	next "LEVEL 60.@"
ZapdosEvent_Str:
	db 	 "Wartet über der"
	next "Energiequelle."
	next "LEVEL 60.@"
MoltresEvent_Str:
	db 	 "Wartet im Dunkel"
	next "der SIEGESSTRASSE."
	next "LEVEL 60.@"
MewtwoEvent_Str:
	db 	 "Nicht AZURIA, doch"
	next "ROT, SILBER, Eis."
	next "LEVEL 75.@"
MewEvent_Str:
	db 	 "Treffen an der"
	next "NUGGET-BRÜCKE, mit"
	next "251. LEVEL 60.@"

GiftMons::
; replace map_id with -1 to hide location but keep hint
; species, EVENT_FLAG, map_id, blurb string ptr
	specialencounter SHUCKLE, 	EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM, MANIAS_HOUSE, ShuckieEvent_Str ; EVENT_GOT_SHUCKIE / EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	specialencounter SPEAROW, 	EVENT_GOT_KENYA, 					ROUTE_35_GOLDENROD_GATE, KenyaEvent_Str
	specialencounter DRATINI, 	EVENT_GOT_DRATINI, 					DRAGON_SHRINE, ExtremespeedDratini_Str
	specialencounter EEVEE,	 	EVENT_GOT_EEVEE, 					BILLS_FAMILYS_HOUSE, BillsEevee_Str
	specialencounter TYROGUE, 	EVENT_GOT_TYROGUE_FROM_KIYO, 		MOUNT_MORTAR_1F_OUTSIDE, TyrogueEvent_Str
	specialencounter AERODACTYL,EVENT_GAVE_SCIENTIST_OLD_AMBER, 	RUINS_OF_ALPH_RESEARCH_CENTER, OldAmberEvent_Str
	specialencounter KABUTO, 	EVENT_GAVE_SCIENTIST_DOME_FOSSIL, 	RUINS_OF_ALPH_RESEARCH_CENTER, DomeFossil_Str
	specialencounter OMANYTE, 	EVENT_GAVE_SCIENTIST_HELIX_FOSSIL, 	RUINS_OF_ALPH_RESEARCH_CENTER, HelixFossil_Str
	db -1

; GivePoke Dex Hints, max 18 chars per line
ShuckieEvent_Str:
	db 	 "Zuneigung über 150"
	next "kann sein Herz für"
	next "immer umstimmen.@"
KenyaEvent_Str:
	db 	 "Zähes Vögelchen"
	next "trägt Brief für"
	next "ROUTE 31.@"
ExtremespeedDratini_Str:
	db 	 "TURBOTEMPO als"
	next "Lohn für wahre"
	next "Tugendhaftigkeit.@"
BillsEevee_Str:
	db 	 "LEVEL 20 - Süßes"
	next "Baby mit grenzen-"
	next "losem Potential.@"
TyrogueEvent_Str:
	db 	 "Geschenk von LEIF,"
	next "Karate-Experte."
	next "@"
OldAmberEvent_Str:
	db 	 "Löse das Rätsel"
	next "der RUINEN, dann"
	next "belebe das Fossil.@"
DomeFossil_Str:
	db 	 "Löse das Rätsel"
	next "der RUINEN, dann"
	next "belebe das Fossil.@"
HelixFossil_Str:
	db 	 "Löse das Rätsel"
	next "der RUINEN, dann"
	next "belebe das Fossil.@"