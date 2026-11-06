	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	;  Level scaling if statments
	readvar VAR_BADGES
	ifequal 6, .SevenBadges
	ifequal 5, .SixBadges
	ifequal 4, .FiveBadges
.FiveBadges:
	loadtrainer JASMINE, JASMINE1
	sjump .OlivineGymJasmineScriptEnd
.SixBadges:
	loadtrainer JASMINE, 2
	sjump .OlivineGymJasmineScriptEnd
.SevenBadges:
	loadtrainer JASMINE, 3
	sjump .OlivineGymJasmineScriptEnd
.OlivineGymJasmineScriptEnd
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE

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
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .NotBeatE4
	writetext JasmineRematchText
	yesorno
	iftrue .JasmineRematch
	sjump .NoRoomForIronTail
.NotBeatE4
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

.JasmineRematch:
	special HealParty
	winlosstext Jasmine_RematchDefeatText, 0
	loadtrainer JASMINE, 4
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_4
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_4
	startbattle
	reloadmapafterbattle
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "…Danke für deine"
	line "Hilfe beim LEUCHT-"
	cont "TURM…"

	para "Erlaube mir, mich"
	line "vorstellen zu dür-"
	cont "fen!"

	para "Ich bin JASMIN,"
	line "eine ARENALEITE-"
	cont "RIN. Ich setze"
	cont "STAHL-#MON ein."

	para "…Hast du von die-"
	line "sem Typ schon ge-"
	cont "hört?"

	para "Er wurde erst vor"
	line "kurzer Zeit ent-"
	cont "deckt."

	para "…Ähm… Darf ich be-"
	line "ginnen?"
	done

Jasmine_BetterTrainer:
	text "…Du bist ein bes-"
	line "serer Trainer als"

	para "ich. Das betrifft"
	line "sowohl Geschick,"

	para "als auch Fein-"
	line "gefühl."

	para "In Übereinstimmung"
	line "mit den Regeln der"

	para "LIGA überreiche"
	line "ich dir diesen"
	cont "ORDEN."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> erhält"
	line "STAHLORDEN."
	done

Jasmine_BadgeSpeech:
	text "Der STAHLORDEN"
	line "erhöht die VERT"
	cont "deiner #MON."

	para "…Ähm… Bitte nimm"
	line "auch das…"
	done

Text_ReceivedTM09: ; unreferenced
	text "<PLAYER> erhält"
	line "TM09."
	done

Jasmine_IronTailSpeech:
	text "…Mit dieser TM"
	line "kannst du deinen"
	cont "#MON EISEN-"
	cont "SCHWEIF lehren."
	done

Jasmine_GoodLuck:
	text "Ähm… Ich weiß"
	line "nicht, wie ich das"
	cont "sagen soll, aber…"
	cont "Viel Glück!"
	done

JasmineRematchText:
	text "…Congratulations,"
    line "JOHTO CHAMPION."

    para "You have become"
    line "so strong…"

    para "I wonder if I"
    line "have improved."

    para "Would you like"
    line "to test that?"

    para "Want to have a"
    line "rematch with me?"
	done

Jasmine_RematchDefeatText:
	text "…You are a better"
	line "trainer than me,"

	para "in both skill and"
	line "kindness."
	done

OlivineGymGuideText:
	text "JASMIN uses the"
	line "newly discovered"
	cont "STEEL-type."

	para "She's known for"
	line "having not one,"
	cont "but two aces."
	
	para "The first is a"
	line "metal bug that can"
	
	para "use a technique to"
	line "boost its ATTACK."
	
	para "While fire will"
	line "hurt it, it can"

	para "sometimes endure"
	line "powerful blows."
	
	para "The second is a"
	line "giant iron snake"
	
	para "with lots of"
	line "powerful moves."
	
	para "Approach it with"
	line "caution."
	
	para "It may look slow,"
	line "but I've seen it"

	para "strike first with"
	line "shocking displays"
	cont "of SPEED."
	done

OlivineGymGuideWinText:
	text "Das war großartig!"

	para "Der Typ Stahl,"
	line "was?"

	para "Das war eine un-"
	line "heimliche Begeg-"
	cont "nung der unbe-"
	cont "kannten Art."
	done

OlivineGymGuidePreText:
	text "JASMIN, die ARE-"
	line "NALEITERIN, ist im"
	cont "LEUCHTTURM."

	para "Sie kümmert sich"
	line "um ein krankes"
	cont "#MON."

	para "Ein starker Trai-"
	line "ner muss auch Mit-"
	cont "gefühl zeigen."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
