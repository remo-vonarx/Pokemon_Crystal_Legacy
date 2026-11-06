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
	text "I'm KAI!"
	line "I never lose when"

	para "it comes to bug"
	line "#MON."

	para "My research is"
	line "going to make me"

	para "the authority on"
	line "bug #MON!"
	
	para "For example, did"
	line "you know that"
	
	para "the move CUT is"
	line "actually a BUG-"
	cont "type move?"
	
	para "Let me demonstrate"
	line "all I've learned"
	cont "from my studies."
	done

BugsyText_ResearchIncomplete:
	text "Erstaunlich!"
	line "Du bist ein wahrer"
	cont "#MON-Experte!"

	para "Meine Forschungen"
	line "sind noch nicht"
	cont "abgeschlossen."

	para "O.K., du gewinnst."
	line "Nimm diesen ORDEN."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> erhält"
	line "INSEKTORDEN."
	done

BugsyText_HiveBadgeSpeech:
	text "Kennst du die Vor-"
	line "züge des INSEKT-"
	cont "ORDENs?"

	para "Durch ihn gehor-"
	line "chen dir #MON"
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
	text "Käfer-#MON"
	line "sind ein weites"

	para "Gebiet. Es gibt"
	line "noch viele Geheim-"
	cont "nisse zu er-"
	cont "gründen."

	para "Studiere deine"
	line "Lieblinge gründ-"
	cont "lich!"
	done

BugsyRematchText:
	text "Wow, you're the"
	line "JOHTO CHAMPION"
	cont "now!"

	para "Your skills are"
	line "truly impressive!"

	para "I've been busy"
	line "with my research."

	para "I'm ready to"
	line "show you my new"
	cont "findings."

	para "Want to have a"
	line "rematch with me?"
	done

Bugsy_RematchDefeatText:
	text "Wow, you must"
	line "be an expert"
	cont "trainer."

	para "My research must"
	line "not be complete…"
	done

BugCatcherBennySeenText:
	text "Käfer-#MON"
	line "entwickeln sich"

	para "sehr früh. Das"
	line "heißt, dass sie"

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
	text "Käfer-#MON"
	line "sind cool und"

	para "tough! Ich beweise"
	line "es dir!"
	done

BugCatcherAlBeatenText:
	text "Du hast bewiesen,"
	line "wie tough du bist…"
	done

BugCatcherAlAfterBattleText:
	text "Sie sind so cool,"
	line "aber die meisten"

	para "Mädchen mögen kei-"
	line "ne Käfer-#MON."

	para "Ich weiß nicht,"
	line "wieso…"
	done

BugCatcherJoshSeenText:
	text "Du hast die FLEG-"
	line "MON gerettet? Oh"
	cont "Mann, bist du"
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
	line "du den LEITER"
	cont "heraus? Unmöglich!"
	done

TwinsAmyandmay1BeatenText:
	text "EVA & UTE: Oh, um"
	line "Himmels Willen!"
	done

TwinsAmyandmay1AfterBattleText:
	text "EVA: You're"
	line "really strong!"

	para "But KAI's even"
	line "stronger! His"

	para "SICHLOR's CUT al-"
	line "most always makes"
	cont "critical hits!"
	done

TwinsAmyandmay2SeenText:
	text "UTE: You want to"
	line "see the LEADER?"
	cont "Good luck!"
	
	para "KAI is so"
	line "strong! His"
	cont "SICHLOR's CUT"
	
	para "always seems to"
	line "crit!"
	done

TwinsAmyandmay2BeatenText:
	text "EVA & UTE: Um"
	line "Himmels Willen!"
	done

TwinsAmyandmay2AfterBattleText:
	text "UTE: Our bug #-"
	line "MON lost! Oh, what"
	cont "a shame."

	para "KAI's won't"
	line "lose though!"

	para "His TANNZA makes"
	line "short work of"
	cont "ROCK-type #MON!"
	done

AzaleaGymGuideText:
	text "Yo, challenger!"

	para "KAI's young, but"
	line "his knowledge of"

	para "bug #MON is for"
	line "real."

	para "It's going to be"
	line "tough without my"
	cont "advice."

	para "Let's see…"
	line "KAI's bagworm"
	cont "#MON knows a"
	
	para "move that covers"
	line "its ROCK-type"
	cont "weakness."

	para "He's also devel-"
	line "oped a new"
	
	para "version of CUT"
	line "that is BUG-type."

	para "Oh, and don't"
	line "forget about"

	para "those nasty"
	line "critical hits!"

	para "Good luck!"
	done

AzaleaGymGuideWinText:
	text "Gut gemacht! Das"
	line "war ein Muster-"
	cont "kampf zweier ta-"
	cont "lentierter, junger"
	cont "Trainer."

	para "Mit Leuten wie dir"
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
