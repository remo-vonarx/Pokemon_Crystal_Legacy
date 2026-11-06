	object_const_def
	const LANCESROOM_LANCE
	const LANCESROOM_MARY
	const LANCESROOM_OAK

LancesRoom_MapScripts:
	def_scene_scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_LANCESROOM_APPROACH_LANCE

	def_callbacks
	callback MAPCALLBACK_TILES, .LancesRoomDoors

.LockDoor:
	sdefer .LancesDoorLocksBehindYou
	end

.DummyScene:
	end

.LancesRoomDoors:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	endcallback

.LancesDoorLocksBehindYou:
	applymovement PLAYER, LancesRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	reloadmappart
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	sjump LancesRoomLanceScript

Script_ApproachLanceFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LancesRoomLanceScript:
	turnobject LANCESROOM_LANCE, LEFT
	opentext
	
	readvar VAR_BADGES
	if_less_than 16, .OriginalText1
	writetext LanceRematchBattleIntroText
	sjump .EndText1
.OriginalText1
	writetext LanceBattleIntroText
.EndText1

	waitbutton
	closetext
	winlosstext LanceBattleWinText, 0
	setlasttalked LANCESROOM_LANCE
	readvar VAR_BADGES
	if_greater_than 15, .Rematch
	loadtrainer CHAMPION, LANCE
	sjump .LoadtrainerEnd
.Rematch:
	loadtrainer CHAMPION, 2
.LoadtrainerEnd:
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	readvar VAR_BADGES
	if_less_than 16, .NoRed
	setevent EVENT_ELITE_4_REMATCH
.NoRed
	
	checkflag ENGINE_HARD_MODE
	iffalse .DontUpdateBadge
	readvar VAR_BADGES
	if_less_than 9, .BaseCap
	if_not_equal 16, .DontUpdateBadge
	checkevent EVENT_CERULEAN_CAVE_B1F_MEWTWO
	iftrue .DontUpdateBadge
	loadmem wLevelCap, 77 ; update level cap for hard mode
	sjump .DontUpdateBadge
.BaseCap
	loadmem wLevelCap, 60 ; update level cap for hard mode
.DontUpdateBadge

	opentext
	writetext LanceBattleAfterText
	waitbutton
	closetext

; 	checkevent EVENT_BEAT_LANCE_FIRST_TIME
; 	iftrue .ZapdosAlreadyReleased
; 	setval ZAPDOS
;     special ShowPokedexEntry
; .ZapdosAlreadyReleased

	setevent EVENT_BEAT_LANCE_FIRST_TIME
	setevent EVENT_BEAT_CHAMPION_LANCE
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_LANCE, 15
	turnobject LANCESROOM_LANCE, DOWN
	pause 10
	turnobject PLAYER, DOWN
	appear LANCESROOM_MARY
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRushesIn
	opentext
	writetext LancesRoomMaryOhNoOakText
	waitbutton
	closetext
	appear LANCESROOM_OAK
	applymovement LANCESROOM_OAK, LancesRoomMovementData_OakWalksIn
	follow LANCESROOM_MARY, LANCESROOM_OAK
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryYieldsToOak
	stopfollow
	turnobject LANCESROOM_OAK, UP
	turnobject LANCESROOM_LANCE, LEFT
	opentext

	readvar VAR_BADGES
	if_less_than 16, .OriginalText2
	writetext LancesRoomRematchOakCongratulationsText
	sjump .EndText2
.OriginalText2
	writetext LancesRoomOakCongratulationsText
.EndText2

	waitbutton
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryInterviewChampion
	turnobject PLAYER, LEFT
	opentext

	readvar VAR_BADGES
	if_less_than 16, .OriginalText3
	writetext LancesRoomRematchMaryInterviewText
	sjump .EndText3
.OriginalText3
	writetext LancesRoomMaryInterviewText
.EndText3

	waitbutton
	closetext
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	opentext
	writetext LancesRoomNoisyText
	waitbutton
	closetext
	follow LANCESROOM_LANCE, PLAYER
	turnobject LANCESROOM_MARY, UP
	turnobject LANCESROOM_OAK, UP
	applymovement LANCESROOM_LANCE, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_LANCE
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryTriesToFollow
	showemote EMOTE_SHOCK, LANCESROOM_MARY, 15
	opentext

	readvar VAR_BADGES
	if_less_than 16, .OriginalText4
	writetext LancesRoomRematchMaryNoInterviewText
	sjump .EndText4
.OriginalText4
	writetext LancesRoomMaryNoInterviewText
.EndText4
	
	pause 30
	closetext
	applymovement LANCESROOM_MARY, LancesRoomMovementData_MaryRunsBackAndForth
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	end

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryRushesIn:
	big_step UP
	big_step UP
	big_step UP
	turn_head DOWN
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_LancePositionsSelfToGuidePlayerAway:
	step UP
	step LEFT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_MaryTriesToFollow:
	step UP
	step RIGHT
	turn_head UP
	step_end

LancesRoomMovementData_MaryRunsBackAndForth:
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

LanceRematchBattleIntroText:
	text "SIEGFRIED:"
	line "Willkommen zurück!"

	para "Du hast Dich in"
	line "JOHTO bewiesen,"

	para "alle 8 ORDEN"
	line "erkämpft und mich"
	cont "sogar besiegt."

	para "Aber jetzt spielst"
	line "Du in der obersten"
	cont "Liga."

	para "Die KANTO-LIGA!"

	para "Eine Region mit"
	line "eigenen Prüfungen"
	cont "und CHAMPS."

	para "Hier bin ich die"
	line "letzte Prüfung,"

	para "mit einem Team,"
	line "das stärker ist"
	cont "als je zuvor."

	para "Dies ist die wahre"
	line "Prüfung,"

	para "ein Kampf um den"
	line "Titel des"
	cont "KANTO-CHAMPS."

	para "Bist Du bereit für"
	line "diese neue Heraus-"
	cont "forderung?"

	para "Dich erneut zu"
	line "beweisen?"

	para "Zeige mir die"
	line "Stärke, die JOHTO"
	cont "bezwungen hat,"
	cont "CHAMP."
	done

LanceBattleIntroText:
	text "SIEGFRIED: Ich"
	line "habe Dich"
	cont "erwartet."

	para "<PLAY_G>!"

	para "Ich wußte, daß"
	line "Du mir aufgrund"

	para "Deiner Fähigkeiten"
	line "eines Tages"
	cont "gegenüberstehen"
	cont "würdest."

	para "Vor drei Jahren"
	line "stand ein Trainer"

	para "genau wie Du vor"
	line "mir."

	para "Dieser Trainer"
	line "wurde später der"

	para "stärkste unserer"
	line "beiden Regionen."

	para "Er hat mir die"
	line "LIGA anvertraut"

	para "und mich gebeten,"
	line "mich um den"

	para "legendären"
	line "Blitzvogel ZAPDOS"
	cont "zu kümmern."

	para "Worte sind hier"
	line "fehl am Platze."

	para "Ein Kampf wird"
	line "zeigen, wer"

	para "der Stärkere von"
	line "uns beiden ist."

	para "Ich, der beste"
	line "aller Trainer und"

	para "CHAMP der"
	line "#MON LIGA…"

	para "Ich, SIEGFRIED"
	line "der Drachenmeis-"
	cont "ter, nehme Deine"

	para "Herausforderung"
	line "an!"
	done

LanceBattleWinText:
	text "Das ist ein"
	line "seltsames Gefühl."

	para "Ich bin nicht"
	line "wütend, dass ich"
	cont "verloren habe. Ich"
	cont "bin glücklich."

	para "Glücklich, dass"
	line "ich den Aufstieg"

	para "eines neuen"
	line "CHAMPs miterleben"
	cont "durfte."
	done

LanceBattleAfterText:
	text "…Woa."

	para "Du bist sehr"
	line "stark geworden,"
	cont "<PLAY_G>."

	para "Deine #MON"
	line "haben deine starke"

	para "und aufrechte"
	line "Persönlichkeit"
	cont "akzeptiert."

	para "Auch du wirst"
	line "zusammen mit"

	para "deinen #MON"
	line "stärker werden."
	done

LancesRoomMaryOhNoOakText:
	text "MARGIT: Oh, nein!"
	line "Alles ist vorbei!"

	para "PROF. EICH, wenn"
	line "du nicht so lang-"
	cont "sam wärest…"
	done

LancesRoomOakCongratulationsText:
	text "PROF EICH: Ah,"
	line "<PLAY_G>!"

	para "Es ist schon"
	line "lange her."

	para "Du siehst"
	line "erhabener aus."

	para "Dein Sieg in der"
	line "JOHTO-LIGA ist"
	cont "fantastisch!"

	para "Deine Hingabe, das"
	line "Vertrauen und die"

	para "Liebe zu Deinen"
	line "#MON haben"
	cont "Dir dies er-"
	cont "möglicht."

	para "Auch Deine #-"
	line "MON waren super."

	para "Ihr Glaube an Dich"
	line "hat sie all das"

	para "durchstehen"
	line "lassen."

	para "Glückwunsch,"
	line "<PLAY_G>!"
	done

LancesRoomRematchOakCongratulationsText:
	text "PROF EICH: Ah,"
	line "<PLAY_G>!"

	para "Ich verfolge Deine"
	line "Fortschritte,"
	cont "seit PROF LIND"
	cont "Dich losgeschickt"
	cont "hat."

	para "Du siehst"
	line "wirklich"
	cont "erhabener aus."

	para "JOHTO-LIGA und nun"
	line "auch KANTO-LIGA zu"
	cont "bezwingen ist"
	cont "keine Kleinigkeit."

	para "Du hast Dich"
	line "selbst über-"
	cont "troffen!"

	para "Deine #MON"
	line "vertrauen Dir"
	cont "offensichtlich,"

	para "und dieses Ver-"
	line "trauen ist die"
	cont "Grundlage Deines"
	cont "Erfolgs."

	para "Aber denk daran:"
	line "Die Reise eines"
	cont "Trainers endet"
	cont "nie wirklich."

	para "Wenn Du Zeit hast,"
	line "besuche mich in"
	cont "meinem Labor."

	para "Ich möchte etwas"
	line "mit Dir be-"
	cont "sprechen."

	para "Glückwunsch zu"
	line "Deinem Sieg,"
	cont "<PLAY_G>!"
	done

LancesRoomMaryInterviewText:
	text "MARGIT: Ein"
	line "Interview mit dem"
	cont "neuen JOHTO-CHAMP!"
	done

LancesRoomRematchMaryInterviewText:
	text "MARGIT: Ein"
	line "Interview mit dem"
	cont "neuen KANTO-CHAMP!"
	done

LancesRoomNoisyText:
	text "SIEGFRIED: Das"
	line "wird mir alles"
	cont "ein wenig zu laut…"

	para "<PLAY_G>, kommst"
	line "du mit mir?"
	done

LancesRoomMaryNoInterviewText:
	text "MARGIT: Moment!"
	line "Wir haben das"
	cont "Interview fast"
	cont "vergessen!"
	done

LancesRoomRematchMaryNoInterviewText:
	text "MARGIT: Moment!"
	line "Du kannst das"
	cont "Interview nicht"
	cont "schon WIEDER"
	cont "absagen!"
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 23, KARENS_ROOM, 3
	warp_event  5, 23, KARENS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	def_coord_events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromRight

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, -1
	object_event  4,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
	object_event  4,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LANCES_ROOM_OAK_AND_MARY
