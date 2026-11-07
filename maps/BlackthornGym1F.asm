	object_const_def
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUIDE

BlackthornGym1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .Boulders

.Boulders:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	endcallback

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_CLAIR1
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .NotBeatE4
	writetext ClairRematchText
	yesorno
	iftrue .ClairRematch
	sjump .CantRematchYet
.NotBeatE4
	writetext BlackthornGymClairText_League
	waitbutton
.CantRematchYet:
	closetext
	end

.ClairRematch:
	special HealParty
	winlosstext Clair_RematchDefeatText, 0
	loadtrainer CLAIR, 2
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_2
	startbattle
	reloadmapafterbattle
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuideWinScript
	writetext BlackthornGymGuideText
	waitbutton
	closetext
	end

.BlackthornGymGuideWinScript:
	writetext BlackthornGymGuideWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd GymStatue2Script

ClairIntroText:
	text "Ich bin SANDRA."

	para "Der beste Drachen-"
	line "meister der Welt."

	para "Ich bestehe sogar"
	line "gegen die TOP VIER"
	cont "der #MON LIGA."

	para "Willst Du immer"
	line "noch gegen mich"
	cont "antreten?"

	para "…Gut."
	line "Auf geht's!"

	para "Da ich eine ARENA-"
	line "LEITERIN bin,"

	para "bringe ich mein"
	line "ganzes Können ge-"
	cont "gen jeden Gegner"
	cont "auf!"
	done

ClairWinText:
	text "Ich habe verloren?"

	para "Ich kann es nicht"
	line "glauben. Das muß"
	cont "ein Irrtum sein…"
	done

ClairText_GoToDragonsDen:
	text "Ich gestehe das"
	line "nicht ein."

	para "Ich mag verloren"
	line "haben, aber Du"

	para "bist noch nicht"
	line "reif für die"
	cont "#MON LIGA."

	para "Ich weiß. Stelle"
	line "Dich der Drachen-"
	cont "Trainer-Heraus-"
	cont "forderung."

	para "Hinter der PKMN-"
	line "ARENA liegt die"
	cont "DRACHENHÖHLE."

	para "In deren Mitte ist"
	line "ein Schrein. Gehe"
	cont "dorthin."

	para "Falls Du beweisen"
	line "kannst, daß Du"

	para "Deine faulen"
	line "Ideale aufgegeben"

	para "hast, werde ich"
	line "Dich als einen"

	para "Trainer ansehen,"
	line "der würdig ist,"

	para "einen ORDEN"
	line "zu erhalten!"
	done

ClairText_TooMuchToExpect:
	text "Was ist los?"

	para "Erwarte ich etwa"
	line "zu viel von Dir?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "Du hast mich war-"
	line "ten lassen!"

	para "Hier! Nimm dies!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> erhält"
	line "TM24 FEUERODEM."
	done

BlackthornGymClairText_DescribeTM24:
	text "Sie enthält"
	line "FEUERODEM."

	para "Nein, das hat"
	line "nichts mit"
	cont "schlechtem Atem"
	cont "zu tun."

	para "Wenn Du sie nicht"
	line "willst, mußt Du"
	cont "sie nicht nehmen."
	done

BlackthornGymClairText_BagFull:
	text "Was ist das? Du"
	line "hast keinen Platz?"
	done

BlackthornGymClairText_League:
	text "Was ist los?"

	para "Gehst Du nicht zur"
	line "#MON LIGA?"

	para "Kennst Du den"
	line "Weg nicht?"

	para "Gehe von hier nach"
	line "NEUBORKIA."

	para "SURFE dann nach"
	line "Osten. Der Weg"

	para "wird dann sehr be-"
	line "schwerlich."

	para "Wage es nicht, in"
	line "der #MON"
	cont "LIGA zu verlieren!"

	para "Das würde meine"
	line "Niederlage gegen"

	para "Dich noch ver-"
	line "schlimmern!"

	para "Gib Dein Bestes!"
	done

ClairRematchText:
	text "Du hast es also"
	line "geschafft?"

	para "Du bist jetzt"
	line "JOHTO-CHAMP."

	para "Du hast Deine"
	line "Stärke bewiesen,"

	para "aber kannst Du es"
	line "noch einmal mit"
	cont "mir aufnehmen?"

	para "Als Drachen-"
	line "meisterin halte"
	cont "ich mich nicht"
	cont "zurück."

	para "Diesmal nicht."

	para "Willst Du eine"
	line "Revanche?"
	done

Clair_RematchDefeatText:
	text "Ich habe verloren?"

	para "Schon wieder?"

	para "Ich kann es nicht"
	line "glauben. Das muß"
	cont "ein Irrtum sein…"
	done

CooltrainermPaulSeenText:
	text "Ist das Dein ers-"
	line "ter Kampf gegen"
	cont "Drachen?"

	para "Ich zeige Dir, wie"
	line "stark sie sind!"
	done

CooltrainermPaulBeatenText:
	text "Mein DRACHEN-"
	line "#MON hat"
	cont "verloren?"
	done

CooltrainermPaulAfterBattleText:
	text "SIEGFRIED sagte"
	line "Dir, er möchte"

	para "Dich noch einmal"
	line "sehen? Das kann"
	cont "nicht sein!"
	done

CooltrainermMikeSeenText:
	text "Die Chancen, gegen"
	line "Dich zu verlieren?"
	cont "Nicht mal ein Pro-"
	cont "zent!"
	done

CooltrainermMikeBeatenText:
	text "Hm, eigenartig."
	done

CooltrainermMikeAfterBattleText:
	text "Ich kenne jetzt"
	line "meine Schwachstel-"
	cont "len. Danke für den"
	cont "Hinweis!"
	done

CooltrainerfLolaSeenText:
	text "Drachen sind hei-"
	line "lige #MON."

	para "Sie sind voller"
	line "Lebensenergie."

	para "Wenn Du es nicht"
	line "ernst meinst, dann"

	para "wirst Du sie nicht"
	line "besiegen können."
	done

CooltrainerfLolaBeatenText:
	text "Großartig!"
	done

CooltrainerfLolaAfterBattleText:
	text "Drachen sind"
	line "schwach gegen Dra-"
	cont "chen-Attacken."
	done

BlackthornGymGuideText:
	text "Yo! CHAMP in spe!"

	para "Es war eine lange"
	line "Reise, aber bald"

	para "sind wir da! Zähle"
	line "auf mich!"

	para "SANDRA eifert dem"
	line "Drachenmeister"
	cont "SIEGFRIED nach,"

	para "hat aber mit ihrem"
	line "Team aus Drachen"
	cont "des Meeres"

	para "ihren eigenen Weg"
	line "gefunden."

	para "Angeblich sind"
	line "Drachen anfällig"

	para "gegen Eis-"
	line "Attacken,"

	para "aber Du brauchst"
	line "auch eigene"

	para "Drachen-Attacken,"
	line "wenn Du gewinnen"
	cont "willst."

	para "Du schaffst das!"
	done

BlackthornGymGuideWinText:
	text "Gegen SANDRA zu"
	line "gewinnen ist eine"
	cont "Meisterleistung."

	para "Alles was Dir nun"
	line "noch bevorsteht,"
	cont "ist die #MON"
	cont "LIGA."

	para "Du bist auf dem"
	line "besten Weg, der"
	cont "#MON-CHAMP"
	cont "zu werden!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuideScript, -1
