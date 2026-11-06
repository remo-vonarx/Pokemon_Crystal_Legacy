	object_const_def
	const BRUNOSROOM_BRUNO

BrunosRoom_MapScripts:
	def_scene_scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks
	callback MAPCALLBACK_TILES, .BrunosRoomDoors

.LockDoor:
	sdefer .BrunosDoorLocksBehindYou
	end

.DummyScene:
	end

.BrunosRoomDoors:
	checkevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 14, $2a ; wall
.KeepEntranceOpen:
	checkevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 2, $16 ; open door
.KeepExitClosed:
	endcallback

.BrunosDoorLocksBehindYou:
	applymovement PLAYER, BrunosRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	reloadmappart
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end

BrunoScript_Battle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_4_BRUNO
	iftrue BrunoScript_AfterBattle
	readvar VAR_BADGES
	if_less_than 16, .OriginalText
	writetext BrunoScript_BrunoRematchBeforeText
	sjump .EndIntroText
.OriginalText
	writetext BrunoScript_BrunoBeforeText
.EndIntroText
	waitbutton
	closetext
	winlosstext BrunoScript_BrunoBeatenText, 0
	readvar VAR_BADGES
	if_greater_than 15, .Rematch
	loadtrainer BRUNO, BRUNO1
	sjump .LoadtrainerEnd
.Rematch:
	loadtrainer BRUNO, 2
.LoadtrainerEnd:
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_BRUNO
		
	checkflag ENGINE_HARD_MODE
	iffalse .DontUpdateBadge
	readvar VAR_BADGES
	if_less_than 9, .BaseCap
	sjump .DontUpdateBadge
.BaseCap
	loadmem wLevelCap, 55 ; update level cap for hard mode
.DontUpdateBadge

	opentext
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	reloadmappart
	closetext
	setevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	waitsfx
	end

BrunoScript_AfterBattle:
	writetext BrunoScript_BrunoDefeatText
	waitbutton
	closetext
	end

BrunosRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

BrunoScript_BrunoRematchBeforeText:
	text "BRUNO: Willkommen"
	line "zurück, Heraus-"
	cont "forderer."

	para "Durch hartes"
	line "Training sind wir"
	cont "stärker geworden."

	para "Mein eiserner"
	line "Wille ist noch"
	cont "unbeugsamer."

	para "Bist Du bereit"
	line "für eine noch"
	cont "größere Heraus-"
	cont "forderung?"

	para "Zeige mir, was"
	line "Dein Training"
	cont "gebracht hat."

	para "Uh Ah!"
	done

BrunoScript_BrunoBeforeText:
	text "Ich bin BRUNO."
	line "Ein weiteres"
	cont "Mitglied der"
	cont "TOP VIER."

	para "Ich trainiere, bis"
	line "ich erschöpft bin,"
	cont "da ich an mein"
	cont "Potential glaube."

	para "Auf diese Art bin"
	line "ich so stark"
	cont "geworden."

	para "Kannst Du unserer"
	line "Kraft widerstehen?"

	para "Hm? Ich sehe, Du"
	line "fürchtest Dich"

	para "nicht und siehst"
	line "entschlossen aus."
	cont "Genau richtig für"
	cont "einen Kampf!"

	para "Bereit, <PLAYER>?"
	line "Du wirst Dich"

	para "unserer unbändigen"
	line "Kraft beugen"
	cont "müssen!"

	para "Uh Ah!"
	done

BrunoScript_BrunoBeatenText:
	text "Warum? Wie konnte"
	line "ich nur verlieren?"
	done

BrunoScript_BrunoDefeatText:
	text "Da ich verloren"
	line "habe, muß ich"
	cont "jetzt still sein…"

	para "Bereite Dich auf"
	line "die nächste"
	cont "Herausforderung"
	cont "vor!"
	done

BrunosRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, KOGAS_ROOM, 3
	warp_event  5, 17, KOGAS_ROOM, 4
	warp_event  4,  2, KARENS_ROOM, 1
	warp_event  5,  2, KARENS_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_BRUNO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BrunoScript_Battle, -1
