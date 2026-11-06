	object_const_def
	const KARENSROOM_KAREN

KarensRoom_MapScripts:
	def_scene_scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_TILES, .KarensRoomDoors

.LockDoor:
	sdefer .KarensDoorLocksBehindYou
	end

.DummyScene:
	end

.KarensRoomDoors:
	checkevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_KARENS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

.KarensDoorLocksBehindYou:
	applymovement PLAYER, KarensRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

KarenScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue KarenScript_AfterBattle
	readvar VAR_BADGES
	if_less_than 16, .OriginalText
	writetext KarenScript_KarenRematchBeforeText
	sjump .EndIntroText
.OriginalText
	writetext KarenScript_KarenBeforeText
.EndIntroText
	waitbutton
	closetext
	winlosstext KarenScript_KarenBeatenText, 0
	readvar VAR_BADGES
	if_greater_than 15, .Rematch
	loadtrainer KAREN, KAREN1
	sjump .LoadtrainerEnd
.Rematch:
	loadtrainer KAREN, 2
.LoadtrainerEnd:
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opentext
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_KARENS_ROOM_EXIT_OPEN
	waitsfx
	end

KarenScript_AfterBattle:
	writetext KarenScript_KarenDefeatText
	waitbutton
	closetext
	end

KarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

KarenScript_KarenRematchBeforeText:
	text "MELANIE: Ah,"
	line "Du schon wieder."

	para "Du hast hoffent-"
	line "lich nicht meinen"
	cont "Glauben vergessen:"

	para "Wahre Stärke"
	line "entsteht aus dem"
	cont "Vertrauen in die"
	cont "eigenen #MON."

	para "Seit unserer"
	line "letzten Begegnung"

	para "ist das Band zu"
	line "meinen #MON"
	cont "noch stärker"
	cont "geworden."

	para "Bist Du bereit für"
	line "ein Team, das ein"
	cont "unzerbrechliches"
	cont "Band vereint?"

	para "Zeige mir die"
	line "Kraft des Bandes"
	cont "zu Deinen #MON."
	done

KarenScript_KarenBeforeText:
	text "Ich bin MELANIE."
	line "Nummer 4 der"
	cont "TOP VIER."

	para "Du heißt <PLAYER>?"
	line "Sehr amüsant."

	para "Ich liebe #MON"
	line "des Typs Unlicht."

	para "Ihr wilder, harter"
	line "Ruf gefällt mir."

	para "Und sie sind"
	line "wirklich stark."

	para "Glaubst Du, Du"
	line "kannst es mit uns"
	cont "aufnehmen? Los,"
	cont "ich will mich"
	cont "amüsieren."

	para "Auf geht's."
	done

KarenScript_KarenBeatenText:
	text "Nun, Du bist"
	line "gut. Das gefällt"
	cont "mir an einem"
	cont "Trainer."
	done

KarenScript_KarenDefeatText:
	text "Starke #MON."

	para "Schwache #MON."

	para "Das ist nur eine"
	line "subjektive Ein-"
	cont "schätzung anderer"
	cont "Menschen."

	para "Wirklich begabte"
	line "Trainer gewinnen"

	para "mit ihren Lieb-"
	line "lings-#MON."

	para "Ich mag Deinen"
	line "Stil. Du weißt,"
	cont "was wichtig ist."

	para "Schreite voran!"
	line "Der CHAMP"
	cont "wartet."
	done

KarensRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BRUNOS_ROOM, 3
	warp_event  5, 17, BRUNOS_ROOM, 4
	warp_event  4,  2, LANCES_ROOM, 1
	warp_event  5,  2, LANCES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KarenScript_Battle, -1
