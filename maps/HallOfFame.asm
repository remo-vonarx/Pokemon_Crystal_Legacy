	object_const_def
	const HALLOFFAME_LANCE

HallOfFame_MapScripts:
	def_scene_scripts
	scene_script .EnterHallOfFame ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.EnterHallOfFame:
	sdefer .EnterHallOfFameScript
	end

.DummyScene:
	end

.EnterHallOfFameScript:
	follow HALLOFFAME_LANCE, PLAYER
	applymovement HALLOFFAME_LANCE, HallOfFame_WalkUpWithLance
	stopfollow
	turnobject PLAYER, RIGHT
	opentext

	readvar VAR_BADGES
	if_less_than 16, .OriginalText
	writetext HallOfFame_Rematch_LanceText
	sjump .EndText
.OriginalText
	writetext HallOfFame_LanceText
.EndText

	waitbutton
	closetext
	turnobject HALLOFFAME_LANCE, UP
	applymovement PLAYER, HallOfFame_SlowlyApproachMachine
	setscene SCENE_FINISHED
	pause 15
	setval HEALMACHINE_HALL_OF_FAME
	special HealMachineAnim
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_TELEPORT_GUY
	setevent EVENT_RIVAL_SPROUT_TOWER
	clearevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	clearevent EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	setmapscene SPROUT_TOWER_3F, SCENE_FINISHED
	special HealParty
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue .SkipPhoneCall
	specialphonecall SPECIALCALL_SSTICKET
.SkipPhoneCall:
	halloffame
	end

HallOfFame_WalkUpWithLance:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end

HallOfFame_SlowlyApproachMachine:
	slow_step UP
	step_end

HallOfFame_LanceText:
	text "SIEGFRIED: Ich war"
	line "schon lange nicht"
	cont "mehr hier."

	para "Hier werden die"
	line "LIGA-CHAMPS"

	para "für alle Ewigkeit"
	line "gewürdigt."

	para "Ihre mutigen #-"
	line "MON sind auch"
	cont "aufgeführt."

	para "Hier und heute"
	line "wurden wir Zeuge"

	para "des Aufstiegs ei-"
	line "nes neuen LIGA-"
	cont "CHAMPS -- eines"
	cont "Trainers, der"

	para "Leidenschaft für"
	line "und Vertrauen in"
	cont "seine #MON hat."

	para "Ein Trainer,"
	line "dessen Erfolg auf"

	para "Ausdauer und"
	line "Entschlossenheit"
	cont "basiert."

	para "Der neue LIGA-"
	line "CHAMP, der"

	para "alle Zeichen von"
	line "Größe in sich"
	cont "vereint!"

	para "<PLAY_G>, darf ich"
	line "dich und deine"

	para "Partner als"
	line "CHAMPS"
	cont "eintragen?"
	done

HallOfFame_Rematch_LanceText:
	text "SIEGFRIED: Ich"
	line "erinnere mich,"

	para "es ist nicht lange"
	line "her, da stand ich"
	cont "hier"

	para "und begrüßte dich"
	line "als CHAMP von"
	cont "JOHTO."

	para "Und nun sind wir"
	line "wieder hier,"

	para "an diesem heiligen"
	line "Ort, an dem wir"
	cont "die allerbesten"
	cont "Trainer und ihre"
	cont "#MON ehren."

	para "Inzwischen hast du"
	line "dich nicht nur in"
	cont "JOHTO, sondern nun"
	cont "auch in KANTO"
	cont "bewiesen"

	para "und heute sogar"
	line "mein stärkstes"
	cont "Team bezwungen."

	para "Du hast deinen"
	line "#MON bemerkens-"
	cont "wertes Mitgefühl"
	cont "und Vertrauen"
	cont "entgegengebracht,"

	para "ein Band, das dich"
	line "immer wieder zum"
	cont "Sieg getragen hat."

	para "Deine Reise war"
	line "geprägt von"
	cont "Ausdauer und"
	cont "unerschütterlicher"
	cont "Entschlossenheit."

	para "Sie zeugt von"
	line "deinem wahren"
	cont "Wesen als Trainer."

	para "Du hast das Zeug"
	line "zu einer wahren"
	cont "Größe,"

	para "vielleicht sogar"
	line "zur allergrößten."

	para "<PLAY_G>, es ist"
	line "mir eine Ehre,"
	cont "dich"

	para "und deine treuen"
	line "Partner"

	para "erneut als CHAMPS"
	line "einzutragen."
	done

HallOfFame_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 13, LANCES_ROOM, 3
	warp_event  5, 13, LANCES_ROOM, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 12, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
