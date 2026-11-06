	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE

SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_BLAINE1
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
	appear SEAFOAMGYM_GYM_GUIDE
.ReturnAfterBattle:
	reloadmapafterbattle
	clearevent EVENT_CAUGHT_MOLTRES
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE

; 	checkevent EVENT_BEAT_BLAINE
; 	iftrue .MoltresAlreadyReleased
; 	setval MOLTRES
;     special ShowPokedexEntry
; .MoltresAlreadyReleased

	setevent EVENT_BEAT_BLAINE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	jumpstd KantoLevelCapUpdateScript
	end

.FightDone:
	checkevent EVENT_ELITE_4_REMATCH
	iffalse .NotBeatE4Rematch
	writetext BlaineRematchText
	yesorno
	iftrue .BlaineRematch
	sjump .SaidNo
.NotBeatE4Rematch
	writetext BlaineFightDoneText
	waitbutton
.SaidNo
	closetext
	end

.BlaineRematch:
	special HealParty
	winlosstext Blaine_RematchDefeatText, 0
	loadtrainer BLAINE, BLAINE1
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	.normalmode_2
	startbattle
	reloadmapafterbattle
	end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	iftrue .TalkedToSeafoamGymGuideScript
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUIDE_ONCE
	end

.TalkedToSeafoamGymGuideScript:
	writetext SeafoamGymGuideWinText2
	waitbutton
	closetext
	end

BlaineIntroText:
	text "PYRO: Wuah!"

	para "Meine PKMN-ARENA"
	line "auf der ZINNOBER-"
	cont "INSEL ist abge-"
	cont "brannt."

	para "Aber ich führe"
	line "meine Tätigkeit"

	para "als ARENALEITER in"
	line "dieser Höhle"
	cont "weiter aus."

	para "Das macht nichts,"
	line "ich habe schon"

	para "Schlimmeres"
	line "durchgemacht."

	para "Vor langer Zeit"
	line "verirrte ich mich"

	para "in den Bergen, bis"
	line "ein feuriges"

	para "Vogel-#MON auf-"
	line "tauchte und mich"
	cont "hinabführte."

	para "All die Jahre"
	line "später hat ROT"

	para "mir eben diesen"
	line "legendären Vogel"
	cont "anvertraut,"

	para "LAVADOS."

	para "Ha! Hoffentlich"
	line "hast Du"
	cont "FEUERHEILER!"

	para "Er ist heißer als"
	line "Deine Mutter!"
	done

BlaineWinLossText:
	text "PYRO: Gut gemacht."
	line "Ich bin"
	cont "ausgebrannt…"

	para "Hier nimm den"
	line "VULKANORDEN!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> erhält"
	line "VULKANORDEN."
	done

BlaineAfterBattleText:
	text "PYRO: Diesmal habe"
	line "ich verloren, aber"

	para "beim nächsten Mal"
	line "werde ich"
	cont "gewinnen."

	para "Ich werde meine"
	line "PKMN-ARENA auf der"

	para "ZINNOBERINSEL"
	line "wieder aufbauen"
	cont "und dann wirst Du"
	cont "erneut gegen mich"
	cont "antreten."
	done

BlaineFightDoneText:
	text "PYRO: Meine Feuer-"
	line "#MON werden"

	para "noch stärker sein."
	line "Du wirst schon"
	cont "sehen!"
	done

BlaineRematchText:
	text "PYRO: Whoa!"

	para "Du bist also"
	line "KANTO-CHAMP"
	cont "geworden!"

	para "Das ist heiß!"

	para "Dein Können ist"
	line "erstklassig."

	para "Für einen Kampf"
	line "bin ich immer zu"
	cont "haben."

	para "Willst Du eine"
	line "Revanche?"
	done

Blaine_RematchDefeatText:
	text "PYRO: Dein Können"
	line "ist wirklich"
	cont "feurig!"

	para "Du hast meine"
	line "Verteidigung"
	cont "verbrannt."
	done

SeafoamGymGuideWinText:
	text "Jawohl!"

	para "…Huh? Es ist"
	line "schon vorüber?"

	para "Sorry, Kumpel!"

	para "Die PKMN-ARENA auf"
	line "der ZINNOBERINSEL"

	para "existiert nicht"
	line "mehr und ich"
	cont "wußte nicht, wo"
	cont "Du steckst."

	para "Aber egal! Du"
	line "bist auch ohne"

	para "meinen Ratschlag"
	line "zurechtgekommen."
	cont "Ich wußte, Du"
	cont "würdest gewinnen."
	done

SeafoamGymGuideWinText2:
	text "Eine PKMN-ARENA"
	line "kann überall sein,"

	para "solange der ARENA-"
	line "LEITER dort ist."

	para "Man braucht dafür"
	line "kein Gebäude."
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, ROUTE_20, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event  6,  5, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, EVENT_SEAFOAM_GYM_GYM_GUIDE
