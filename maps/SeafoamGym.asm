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
	text "PYRO: Waaah!"

	para "My GYM in ZINNOBER"
	line "burned down."
	
	para "But I'm back in"
	line "business as a GYM"

	para "LEADER here in"
	line "this cave."

	para "It's fine though,"
	line "I have faced"

	para "hardship like"
	line "this before."

	para "Long ago I was"
	line "lost in the"
	
	para "mountains until"
	line "a fiery bird"
	
	para "#MON appeared"
	line "to lead me down."
	
	para "All these years"
	line "later and now"
	
	para "ROT has entrusted"
	line "me to look over"

	para "that same"
	line "legendary bird,"

	para "LAVADOS."
	
	para "Ha! You'd better"
	line "have BURN HEAL,"
	
	para "It's even hotter"
	line "than your mom!"
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
	cont "und dann wirst du"
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

	para "I see you've"
	line "become the"
	cont "KANTO CHAMPION!"

	para "That's blazing!"

	para "Your skills are"
	line "top-notch."

	para "I'm always"
	line "up for a battle."

	para "Want to have a"
	line "rematch with me?"
	done

Blaine_RematchDefeatText:
	text "PYRO: Your"
	line "skills are truly"
	cont "fiery!"

	para "You've burned"
	line "right through"
	cont "my defenses."
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
	cont "wusste nicht, wo"
	cont "du steckst."

	para "Aber egal! Du"
	line "bist auch ohne"

	para "meinen Ratschlag"
	line "zurechtgekommen."
	cont "Ich wusste, du"
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
