	object_const_def
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScripts:
	def_scene_scripts

	def_callbacks

.DummyScene: ; unreferenced
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	promptbutton
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	checkevent EVENT_ELITE_4_REMATCH
	iffalse .notBeatE4Rematch
	writetext OakOpenMtSilverText
	promptbutton
	setevent EVENT_OPENED_MT_SILVER
	sjump .EndOpenMtSilver
.notBeatE4Rematch:
	writetext OakBattleKantoE4Text
	promptbutton
.EndOpenMtSilver:
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	promptbutton
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	promptbutton
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd DifficultBookshelfScript

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "EICH: <PLAY_G>!"
	line "Schön, dass du"

	para "den weiten Weg"
	line "nach KANTO gemacht"
	cont "hast."

	para "Was hältst du von"
	line "den Trainern hier"

	para "draußen?"
	line "Ziemlich stark,"

	para "was?"
	done

OakLabDexCheckText:
	text "Wie geht es mit"
	line "dem #DEX voran?"

	para "Mal sehen…"
	done

OakLabGoodbyeText:
	text "Wenn du mal wieder"
	line "in der Gegend"
	cont "bist, dann schau"
	cont "doch wieder rein."
	done

OakOpenMtSilverText:
	text "EICH: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO,"

	para "and become"
	line "CHAMPION of both"
	cont "the KANTO and"
	cont "JOHTO LEAGUES."
	
	para "Well done!"

	para "I was right in my"
	line "assessment of you."

	para "Tell you what,"
	line "<PLAY_G>. I'll make"

	para "arrangements so"
	line "that you can go to"
	cont "MT.SILVER."

	para "MT.SILVER is a big"
	line "mountain that is"

	para "home to many wild"
	line "#MON."

	para "It's too dangerous"
	line "for your average"

	para "trainer, so it's"
	line "off limits. But"

	para "we can make an"
	line "exception in your"
	cont "case, <PLAY_G>."

	para "Go up to INDIGO"
	line "PLATEAU. You can"

	para "reach MT.SILVER"
	line "from there."
	done

OakBattleKantoE4Text:
	text "EICH: Wow! That's"
	line "excellent!"

	para "You collected the"
	line "BADGES of GYMS in"
	cont "KANTO,"

	para "but I still don't"
	line "think you are"
	cont "ready."

	para "You must return"
	line "to the ELITE"
	cont "FOUR..."

	para "and battle in"
	line "the KANTO LEAGUE!"

	para "Only then will"
	line "you truly have"
	cont "what it takes."
	done

OakNoKantoBadgesText:
	text "EICH: Hm? Du hast"
	line "keine ORDEN der"

	para "PKMN-ARENEN"
	line "in KANTO?"

	para "Die ARENALEITER in"
	line "KANTO sind genauso"

	para "stark wie die"
	line "in JOHTO."

	para "Ich schlage vor,"
	line "du forderst sie"
	cont "heraus."
	done

OakYesKantoBadgesText:
	text "EICH: Ah, du"
	line "sammelst ORDEN der"
	cont "ARENALEITER von"
	cont "KANTO."

	para "Ich kann mir"
	line "vorstellen, dass"

	para "es schwer für dich"
	line "ist, aber du"
	cont "sammelst wertvolle"
	cont "Erfahrungen."

	para "Besuche mich"
	line "wieder, wenn du"

	para "sie alle hast."
	line "Ich gebe dir dann"
	cont "ein Geschenk."

	para "Streng dich weiter"
	line "so an, <PLAYER>!"
	done

OaksAssistant1Text:
	text "PROF. EICHs #-"
	line "MON-TALK wird in"

	para "KANTO nicht im"
	line "Radio gesendet."

	para "Das ist schade."
	line "Ich würde es gerne"
	cont "hören."
	done

OaksAssistant2Text:
	text "Die Forschungen"
	line "des PROFESSORs"
	cont "kommen dank deiner"

	para "Arbeit am #DEX"
	line "sehr gut voran."
	done

OaksAssistant3Text:
	text "Erzähl es keinem,"
	line "aber PROF. EICHs"

	para "#MON-TALK wird"
	line "nicht live"
	cont "gesendet."
	done

OaksLabPoster1Text:
	text "Drücke START, um"
	line "das MENÜ zu"
	cont "öffnen."
	done

OaksLabPoster2Text:
	text "Möchtest du deinen"
	line "Spielstand von"

	para "Zeit zu Zeit"
	line "speichern, dann"
	cont "wähle im MENÜ die"
	cont "Option SICHERN."
	done

OaksLabTrashcanText:
	text "Hier drin ist"
	line "nichts…"
	done

OaksLabPCText:
	text "Auf dem PC ist"
	line "eine E-Mail."

	para "…"

	para "Wie kommen Sie"
	line "mit Ihren"
	cont "Forschungen voran,"
	cont "PROF. EICH?"

	para "Nun, ich ackere"
	line "weiter."

	para "Ich habe Gerüchte"
	line "gehört, dass"

	para "sich <PLAY_G>"
	line "einen Namen macht."

	para "Es freut mich, das"
	line "zu hören."

	para "PROF. LIND in"
	line "NEUBORKIA"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	def_object_events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
