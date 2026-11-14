npctrade: MACRO
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	dw \8
	db \9, \<10>, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	table_width NPCTRADE_STRUCT_LENGTH, NPCTrades
	npctrade TRADE_DIALOGSET_COLLECTOR, ABRA,       MACHOP,     "HERAKLES@@@", $37, $66, GOLD_BERRY,   37460, "RALF@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, BELLSPROUT, ONIX,       "AARON@@@@@@", $96, $66, HARD_STONE,   48926, "TOBI@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     KRABBY,     VOLTORB,    "KUGO@@@@@@@", $98, $88, MAGNET,       29189, "TIM@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      DODRIO,     MR__MIME,  	"DORIS@@@@@@", $77, $66, TWISTEDSPOON,  00283, "CARMEN@@@@@", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_NEWBIE,    XATU,       HAUNTER,    "POLLO@@@@@@", $96, $86, MYSTERYBERRY, 15616, "PAUL@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      CHANSEY,    AERODACTYL, "AEROY@@@@@@", $96, $66, GOLD_BERRY,   26491, "KIM@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, DUGTRIO,    MAGNETON,   "LORETTA@@@@", $96, $66, METAL_COAT,   50082, "WALDO@@@@@@", TRADE_GENDER_EITHER
	assert_table_length NUM_NPC_TRADES
