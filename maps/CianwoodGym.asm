	object_const_def
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, RIGHT
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	;  Level scaling if statments
	readvar VAR_BADGES
	ifequal 6, .SevenBadges
	ifequal 5, .SixBadges
	ifequal 4, .FiveBadges
.FiveBadges:
	loadtrainer CHUCK, CHUCK1
	sjump .CianwoodGymChuckScriptEnd
.SixBadges:
	loadtrainer CHUCK, 2
	sjump .CianwoodGymChuckScriptEnd
.SevenBadges:
	loadtrainer CHUCK, 3
	sjump .CianwoodGymChuckScriptEnd
.CianwoodGymChuckScriptEnd:
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE

	; Update level caps with level scaling
	checkflag ENGINE_HARD_MODE
	iffalse .DontUpdateBadge
	readvar VAR_BADGES
	ifequal 7, .SevenBadgeCap
	ifequal 6, .SixBadgeCap
	ifequal 5, .FiveBadgeCap
.FiveBadgeCap:
	loadmem wLevelCap, 36 ; update level cap for hard mode
	sjump .LevelCapScriptEnd
.SixBadgeCap:
	loadmem wLevelCap, 38 ; update level cap for hard mode
	sjump .LevelCapScriptEnd
.SevenBadgeCap:
	loadmem wLevelCap, 45 ; update level cap for hard mode
	sjump .LevelCapScriptEnd
.DontUpdateBadge
.LevelCapScriptEnd:

	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .NotBeatE4
	writetext ChuckRematchText
	yesorno
	iftrue .ChuckRematch
	sjump .BagFull
.NotBeatE4
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

.ChuckRematch:
	special HealParty
	winlosstext Chuck_RematchDefeatText, 0
	loadtrainer CHUCK, 4
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_4
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_4
	startbattle
	reloadmapafterbattle
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd StrengthBoulderScript

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	jumpstd GymStatue2Script

CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step LEFT
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

ChuckIntroText1:
	text "WAHAHAH!"

	para "Du hast es also"
	line "bis hierher ge-"
	cont "schafft!"

	para "Lass dir gesagt"
	line "sein, dass ich ein"
	cont "harter Brocken"
	cont "bin."

	para "Meine #MON"
	line "werden dich in"
	cont "Grund und Boden"
	cont "rammen!"

	para "Pass auf!"
	done

ChuckIntroText2:
	text "HARTWIG: Urggh!"
	line "…"

	para "Oooarrgh!"
	done

ChuckIntroText3:
	text "Da! Jetzt hast du"
	line "dich erschreckt!"

	para "Wie?"
	line "Es hat nichts mit"

	para "#MON zu tun?"
	line "Das ist wahr!"

	para "Komm her. Lass uns"
	line "kämpfen!"
	done

ChuckLossText:
	text "Wa…? Huch?"
	line "Ich habe verloren?"

	para "Wie wär's damit?"
	line "Du bist des FAUST-"
	cont "ORDENs würdig!"
	done

GetStormBadgeText:
	text "<PLAYER> erhält"
	line "FAUSTORDEN."
	done

ChuckExplainBadgeText:
	text "Durch den FAUSTOR-"
	line "DEN gehorchen dir"

	para "alle #MON"
	line "bis LV 70. Dies"

	para "gilt auch für Ge-"
	line "tauschte."

	para "Außerdem können"
	line "deine #MON"

	para "FLIEGEN auch"
	line "außerhalb eines"
	cont "Kampfes einsetzen."

	para "Hier, nimm auch"
	line "dies!"
	done

ChuckExplainTMText:
	text "Das ist WUCHT-"
	line "SCHLAG."

	para "Er trifft zwar"
	line "nicht immer, aber"

	para "wenn er es tut,"
	line "verwirrt er den"
	cont "Gegner!"
	done

ChuckAfterText:
	text "WAHAHAH! Es hat"
	line "Spaß gemacht, ge-"
	cont "gen dich zu kämp-"
	cont "fen."

	para "Aber eine Nieder-"
	line "lage bleibt eine"
	cont "Niederlage!"

	para "Von jetzt an werde"
	line "ich 24 Stunden am"
	cont "Tag trainieren!"
	done

ChuckRematchText:
	text "Wahahah!"
	line "JOHTO-CHAMP!"

	para "Du willst also"
	line "noch mehr!"

	para "Ich sehe, Deine"
	line "Fähigkeiten haben"
	cont "sich verbessert!"

	para "Bereit, um zu"
	line "sehen, wer von"
	cont "uns stärker ist?"
	done

Chuck_RematchDefeatText:
	text "Was? Hä? Ich habe"
	line "verloren?"
	cont "Schon wieder?"
	done

BlackbeltYoshiSeenText:
	text "Meine #MON und"
	line "mich verbindet un-"
	cont "sere Freundschaft."

	para "Dieses Band wird"
	line "nie zerreißen!"
	done

BlackbeltYoshiBeatenText:
	text "Das ist unmöglich!"
	done

BlackbeltYoshiAfterText:
	text "Es scheint, als"
	line "stündest auch du"
	cont "deinen #MON"
	cont "sehr nahe!"
	done

BlackbeltLaoSeenText:
	text "Wir Meister der"
	line "Kampfkunst haben"
	cont "vor nichts Angst!"
	done

BlackbeltLaoBeatenText:
	text "Schockierend!"
	done

BlackbeltLaoAfterText:
	text "Kampf-#MON"
	line "fürchten sich vor"
	cont "Psycho-Attacken…"
	done

BlackbeltNobSeenText:
	text "Worte sind nutz-"
	line "los. Lass deine"
	cont "Fäuste sprechen!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "Ich habe verloren!"
	line "Ich bin sprachlos!"
	done

BlackbeltLungSeenText:
	text "Gegen die Wut mei-"
	line "ner Fäuste können"
	cont "deine #MON"
	cont "nichts ausrichten!"
	done

BlackbeltLungBeatenText:
	text "Ich wurde zer-"
	line "schmettert!"
	done

BlackbeltLungAfterText:
	text "Meine #MON ha-"
	line "ben verloren…"
	cont "Mein Stolz ist"
	cont "zerstört…"
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  5,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
