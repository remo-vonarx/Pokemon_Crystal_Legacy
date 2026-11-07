	object_const_def
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUIDE

AzaleaGym_MapScripts:
	def_scene_scripts

	def_callbacks

AzaleaGymBugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_BUGSY1
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	checkflag ENGINE_HARD_MODE
	iffalse .DontUpdateBadge
	loadmem wLevelCap, 21 ; update level cap for hard mode
.DontUpdateBadge
	readvar VAR_BADGES
	scall AzaleaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	promptbutton
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .NotBeatE4
	writetext BugsyRematchText
	yesorno
	iftrue .BugsyRematch
	sjump .NoRoomForFuryCutter
.NotBeatE4
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

.BugsyRematch:
	special HealParty
	winlosstext Bugsy_RematchDefeatText, 0
	loadtrainer BUGSY, 2
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_2
	startbattle
	reloadmapafterbattle
	end


AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuideWinScript
	opentext
	writetext AzaleaGymGuideText
	waitbutton
	closetext
	end

.AzaleaGymGuideWinScript:
	opentext
	writetext AzaleaGymGuideWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, BUGSY, BUGSY1
	jumpstd GymStatue2Script

BugsyText_INeverLose:
	text "Ich bin KAI!"
	line "Ich verliere nie,"

	para "wenn es um KÄFER-"
	line "#MON geht."

	para "Meine Forschungen"
	line "machen mich zu ei-"
	cont "ner Autorität auf"
	cont "diesem Gebiet!"

	para "Wußtest Du zum"
	line "Beispiel, daß"

	para "ZERSCHNEIDER in"
	line "Wahrheit eine"
	cont "Käfer-Attacke ist?"

	para "Laß mich demonst-"
	line "rieren, was ich"
	cont "alles gelernt"
	cont "habe!"
	done

BugsyText_ResearchIncomplete:
	text "Erstaunlich!"
	line "Du bist ein wahrer"
	cont "#MON-Experte!"

	para "Meine Forschungen"
	line "sind noch nicht"
	cont "abgeschlossen."

	para "O.K., Du gewinnst."
	line "Nimm diesen ORDEN."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> erhält"
	line "INSEKTORDEN."
	done

BugsyText_HiveBadgeSpeech:
	text "Kennst Du die Vor-"
	line "züge des INSEKT-"
	cont "ORDENs?"

	para "Durch ihn gehor-"
	line "chen Dir #MON"
	cont "bis zu Level 30."

	para "Deine #MON"
	line "können ZERSCHNEI-"
	cont "DER nun auch"
	cont "außerhalb des"
	cont "Kampfes anwenden."

	para "Bitte nimm auch"
	line "dies!"
	done

BugsyText_FuryCutterSpeech:
	text "TM49 enthält"
	line "ZORNKLINGE."

	para "Wird das Ziel ge-"
	line "troffen, gewinnt"
	cont "die Attacke jede"
	cont "Runde an Stärke."

	para "Je länger der"
	line "Kampf dauert, des-"
	cont "to besser wird der"
	cont "Angriff."

	para "Ist das nicht"
	line "toll? Ich selbst"
	cont "habe diese Ent-"
	cont "deckung gemacht!"
	done

BugsyText_BugMonsAreDeep:
	text "KÄFER-#MON"
	line "sind ein weites"

	para "Gebiet. Es gibt"
	line "noch viele Geheim-"
	cont "nisse zu er-"
	cont "gründen."

	para "Studiere Deine"
	line "Lieblinge gründ-"
	cont "lich!"
	done

BugsyRematchText:
	text "Wow, Du bist jetzt"
	line "JOHTO-CHAMP!"

	para "Deine Fähigkeiten"
	line "sind wirklich"
	cont "beeindruckend!"

	para "Ich war mit meinen"
	line "Forschungen sehr"
	cont "beschäftigt."

	para "Ich zeige Dir gern"
	line "meine neuesten"
	cont "Erkenntnisse."

	para "Willst Du eine"
	line "Revanche?"
	done

Bugsy_RematchDefeatText:
	text "Wow, Du mußt"
	line "ein erfahrener"
	cont "Trainer sein."

	para "Meine Forschungen"
	line "sind wohl noch"
	cont "nicht vollendet…"
	done

BugCatcherBennySeenText:
	text "KÄFER-#MON"
	line "entwickeln sich"

	para "sehr früh. Das"
	line "heißt, daß sie"

	para "auch schnell stär-"
	line "ker werden."
	done

BugCatcherBennyBeatenText:
	text "Entwicklung allein"
	line "ist nicht genug!"
	done

BugCatcherBennyAfterBattleText:
	text "#MON werden"
	line "stärker, wenn sie"
	cont "sich entwickeln."
	cont "Wirklich!"
	done

BugCatcherAlSeenText:
	text "KÄFER-#MON"
	line "sind cool und"

	para "tough! Ich beweise"
	line "es Dir!"
	done

BugCatcherAlBeatenText:
	text "Du hast bewiesen,"
	line "wie tough Du bist…"
	done

BugCatcherAlAfterBattleText:
	text "Sie sind so cool,"
	line "aber die meisten"

	para "Mädchen mögen kei-"
	line "ne KÄFER-#MON."

	para "Ich weiß nicht,"
	line "wieso…"
	done

BugCatcherJoshSeenText:
	text "Du hast die FLEG-"
	line "MON gerettet? Oh"
	cont "Mann, bist Du"
	cont "stark!"

	para "Aber meine ausge-"
	line "wachsenen #MON"
	cont "sind auch sehr"
	cont "stark!"
	done

BugCatcherJoshBeatenText:
	text "Urrgggh!"
	done

BugCatcherJoshAfterBattleText:
	text "Vielleicht sollte"
	line "ich sie ein wenig"
	cont "besser trainieren…"
	done

TwinsAmyandmay1SeenText:
	text "EVA: Hi! Forderst"
	line "Du den LEITER"
	cont "heraus? Unmöglich!"
	done

TwinsAmyandmay1BeatenText:
	text "EVA & UTE: Oh, um"
	line "Himmels Willen!"
	done

TwinsAmyandmay1AfterBattleText:
	text "EVA: Du bist"
	line "wirklich stark!"

	para "Aber KAI ist noch"
	line "stärker! Der ZER-"
	cont "SCHNEIDER seines"

	para "SICHLORs landet"
	line "fast immer"
	cont "Volltreffer!"
	done

TwinsAmyandmay2SeenText:
	text "UTE: Du möchtest"
	line "zum LEITER?"
	cont "Viel Glück!"

	para "KAI ist so stark!"
	line "Der ZERSCHNEIDER"
	cont "seines SICHLORs"

	para "scheint immer"
	line "Volltreffer zu"
	cont "landen!"
	done

TwinsAmyandmay2BeatenText:
	text "EVA & UTE: Um"
	line "Himmels Willen!"
	done

TwinsAmyandmay2AfterBattleText:
	text "UTE: Unsere KÄFER-"
	line "#MON haben ver-"
	cont "loren! Was für ei-"
	cont "ne Schande!"

	para "Aber die von KAI"
	line "verlieren nicht!"

	para "Sein TANNZA macht"
	line "kurzen Prozeß mit"
	cont "GESTEIN-#MON!"
	done

AzaleaGymGuideText:
	text "Yo, Herausfor-"
	line "derer!"

	para "KAI ist zwar jung,"
	line "aber sein Wissen"

	para "über KÄFER-#-"
	line "MON ist unüber-"
	cont "trefflich."

	para "Ohne meine Tipps"
	line "wird der Kampf für"
	cont "Dich sehr hart."

	para "Mal sehen…"
	line "KAIs Beutelwurm-"
	cont "#MON kennt eine"

	para "Attacke, die seine"
	line "Gestein-Schwäche"
	cont "ausgleicht."

	para "Außerdem hat er"
	line "eine Käfer-Form"

	para "von ZERSCHNEIDER"
	line "entwickelt!"

	para "Ach ja, und ver-"
	line "giß nicht diese"

	para "fiesen Voll-"
	line "treffer!"

	para "Viel Glück!"
	done

AzaleaGymGuideWinText:
	text "Gut gemacht! Das"
	line "war ein Muster-"
	cont "kampf zweier ta-"
	cont "lentierter, junger"
	cont "Trainer."

	para "Mit Leuten wie Dir"
	line "sieht die Zukunft"
	cont "der #MON rosig"
	cont "aus!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	def_object_events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  8,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  0,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuideScript, -1
