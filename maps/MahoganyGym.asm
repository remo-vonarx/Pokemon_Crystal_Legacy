	object_const_def
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BEAUTY1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BEAUTY2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUIDE

MahoganyGym_MapScripts:
	def_scene_scripts

	def_callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	;  Level scaling if statments
	readvar VAR_BADGES
	ifequal 6, .SevenBadges
	ifequal 5, .SixBadges
	ifequal 4, .FiveBadges
.FiveBadges:
	loadtrainer PRYCE, PRYCE1
	sjump .MahoganyGymPryceScriptEnd
.SixBadges:
	loadtrainer PRYCE, 2
	sjump .MahoganyGymPryceScriptEnd
.SevenBadges:
	loadtrainer PRYCE, 3
	sjump .MahoganyGymPryceScriptEnd
.MahoganyGymPryceScriptEnd:
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE

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
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	promptbutton
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .NotBeatE4
	writetext PryceRematchText
	yesorno
	iftrue .PryceRematch
	sjump .CantRematchYet
.NotBeatE4
	writetext PryceText_CherishYourPokemon
	waitbutton
.CantRematchYet:
	closetext
	end

.PryceRematch:
	special HealParty
	winlosstext Pryce_RematchDefeatText, 0
	loadtrainer PRYCE, 4
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_4
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_4
	startbattle
	reloadmapafterbattle
	end

MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuideWinScript
	writetext MahoganyGymGuideText
	waitbutton
	closetext
	end

.MahoganyGymGuideWinScript:
	writetext MahoganyGymGuideWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd GymStatue2Script

PryceText_Intro:
	text "#MON machen in"
	line "ihrem Leben viele"

	para "Erfahrungen. Genau"
	line "wie Menschen."

	para "Auch ich habe in"
	line "meinem Leben viel"
	cont "gesehen und er-"
	cont "litten."

	para "Da ich der Ältere"
	line "bin, laß mich Dir"
	cont "zeigen, was ich"
	cont "meine."

	para "Ich war schon mit"
	line "#MON zusammen,"

	para "bevor Du geboren"
	line "wurdest."

	para "Ich verliere nicht"
	line "gerne."

	para "Ich, NORBERT, der"
	line "Wintertrainer,"

	para "werde meine Macht"
	line "demonstrieren!"
	done

PryceText_Impressed:
	text "Ich bin von Deinem"
	line "Können beein-"
	cont "druckt."

	para "Mit Deinem starken"
	line "Willen wirst Du"

	para "alle Widrigkeiten"
	line "in Deinem Leben"
	cont "überstehen."

	para "Du bist dieses"
	line "ORDENS würdig!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> erhält"
	line "EISORDEN."
	done

PryceText_GlacierBadgeSpeech:
	text "Dieser ORDEN hebt"
	line "den SPEZ-Wert Dei-"
	cont "ner #MON."

	para "Außerdem können"
	line "Deine #MON"
	cont "WHIRLPOOL einset-"
	cont "zen, um echte"
	cont "Strudel zu"
	cont "überwinden."

	para "Und dies… dies ist"
	line "ein Geschenk von"
	cont "mir!"
	done

PryceText_IcyWindSpeech:
	text "Diese TM enthält"
	line "EISSTURM."

	para "Sie verursacht"
	line "Schaden und ver-"
	cont "ringert die Ge-"
	cont "schwindigkeit."

	para "Sie stellt die"
	line "Härte des Winters"
	cont "dar."
	done

PryceText_CherishYourPokemon:
	text "Wenn Eis und"
	line "Schnee geschmolzen"
	cont "sind, kehrt der"
	cont "Frühling wieder."

	para "Du und Deine"
	line "#MON werden"

	para "noch viele Jahre"
	line "zusammen sein."

	para "Genießt Eure ge-"
	line "meinsame Zeit!"
	done

PryceRematchText:
	text "Ah, JOHTO-CHAMP!"

	para "Dein Können ist"
	line "wahrlich"
	cont "bemerkenswert."

	para "Ich bin beein-"
	line "druckt."

	para "Aber auch jetzt"
	line "können wir noch"
	cont "viel voneinander"
	cont "lernen."

	para "Ich, NORBERT,"
	line "der Lehrer der"
	cont "Härte des Winters,"

	para "kenne noch ein"
	line "paar Tricks."

	para "Willst Du eine"
	line "Revanche?"
	done

Pryce_RematchDefeatText:
	text "Ich bin erneut von"
	line "Deinem Können"
	cont "beeindruckt."

	para "Mit Deinem starken"
	line "Willen wirst Du"

	para "alle Widrigkeiten"
	line "in Deinem Leben"
	cont "überstehen."
	done

BoarderRonaldSeenText:
	text "Ich werde Deine"
	line "#MON einfrie-"
	cont "ren, so daß sie"
	cont "sich nicht bewegen"
	cont "können."
	done

BoarderRonaldBeatenText:
	text "Mist! Ich konnte"
	line "nichts tun."
	done

BoarderRonaldAfterBattleText:
	text "Ich glaube, es"
	line "gibt eine Attacke,"

	para "die #MON"
	line "auch ausführen"

	para "können, wenn sie"
	line "gefroren sind."
	done

BoarderBradSeenText:
	text "Diese PKMN-ARENA"
	line "hat einen rutschi-"
	cont "gen Boden. Das ist"
	cont "doch lustig, oder?"

	para "Aber wir sind"
	line "nicht hier, um zu"
	cont "spielen!"
	done

BoarderBradBeatenText:
	text "Siehst Du jetzt,"
	line "wie ernst wir es"
	cont "meinen?"
	done

BoarderBradAfterBattleText:
	text "Diese PKMN-ARENA"
	line "ist toll. Ich"
	cont "liebe es, mit mei-"
	cont "nen #MON hier"
	cont "zu snowboarden!"
	done

BoarderDouglasSeenText:
	text "Ich kenne NORBERTs"
	line "Geheimnis."
	done

BoarderDouglasBeatenText:
	text "O.K. Ich verrate"
	line "Dir NORBERTs Ge-"
	cont "heimnis."
	done

BoarderDouglasAfterBattleText:
	text "Das Geheimnis von"
	line "NORBERTs Kraft…"

	para "Er meditiert täg-"
	line "lich unter einem"

	para "Wasserfall, um"
	line "Geist und Körper"
	cont "zu stärken."
	done

SkierRoxanneSeenText:
	text "Um zu NORBERT, un-"
	line "serem ARENALEITER,"

	para "zu gelangen, mußt"
	line "Du denken, bevor"
	cont "Du loslegst."
	done

SkierRoxanneBeatenText:
	text "Beim Skifahren"
	line "würde ich nie ge-"
	cont "gen Dich verlie-"
	cont "ren."
	done

SkierRoxanneAfterBattleText:
	text "Wenn Du nicht ge-"
	line "nau rutschst,"

	para "kommst Du in die-"
	line "ser PKMN-ARENA"
	cont "nicht weit."
	done

SkierClarissaSeenText:
	text "Sieh Dir meinen"
	line "Parallelschwung"
	cont "an!"
	done

SkierClarissaBeatenText:
	text "Nein! Jetzt bin"
	line "ich weggerutscht!"
	done

SkierClarissaAfterBattleText:
	text "Ich hätte mit mei-"
	line "nen Ski-Künsten"
	cont "nicht so angeben"
	cont "sollen…"
	done

MahoganyGymGuideText:
	text "NORBERT ist ein"
	line "Veteran, der seine"

	para "#MON schon"
	line "seit fast 50 Jah-"
	cont "ren trainiert."

	para "Er hat ein solides"
	line "Team aus #MON,"

	para "die gegen alles"
	line "bestehen, was Du"
	cont "ihm entgegen-"
	cont "stellst."

	para "Feuer ist ein"
	line "guter Anfang,"

	para "aber nimm Dich"
	line "vor dem Regen"
	cont "in acht!"
	done

MahoganyGymGuideWinText:
	text "NORBERT ist nicht"
	line "übel, aber Du"
	cont "bist noch besser!"

	para "Das war ein heißer"
	line "Kampf, der die"

	para "Kluft zwischen den"
	line "Generationen über-"
	cont "wunden hat."
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	def_object_events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuideScript, -1
