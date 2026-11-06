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
	line "Schön, daß Du"

	para "den weiten Weg"
	line "nach KANTO gemacht"
	cont "hast."

	para "Was hältst Du von"
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
	text "Wenn Du mal wieder"
	line "in der Gegend"
	cont "bist, dann schau"
	cont "doch wieder rein."
	done

OakOpenMtSilverText:
	text "EICH: Wow! Das ist"
	line "hervorragend!"

	para "Du hast die ORDEN"
	line "der ARENALEITER in"
	cont "KANTO erkämpft"

	para "und bist CHAMP der"
	line "KANTO-LIGA und"
	cont "der JOHTO-LIGA."

	para "Gut gemacht!"

	para "Ich habe Dich"
	line "richtig"
	cont "eingeschätzt."

	para "Weißt Du was,"
	line "<PLAY_G>? Ich"

	para "werde es so ein-"
	line "richten, daß Du"
	cont "zum SILBERBERG"
	cont "gehen kannst."

	para "Der SILBERBERG ist"
	line "ein großes Habitat"

	para "für viele wilde"
	line "#MON."

	para "Es ist zu"
	line "gefährlich für"

	para "einen Durch-"
	line "schnittstrainer."

	para "Deshalb ist es"
	line "verboten. Aber für"
	cont "Dich, <PLAY_G>,"
	cont "können wir eine"
	cont "Ausnahme machen."

	para "Steige auf das"
	line "INDIGO PLATEAU."

	para "Von dort kannst"
	line "Du den SILBERBERG"
	cont "erreichen."
	done

OakBattleKantoE4Text:
	text "EICH: Wow! Das ist"
	line "hervorragend!"

	para "Du hast die ORDEN"
	line "der ARENALEITER in"
	cont "KANTO erkämpft,"

	para "aber ich glaube,"
	line "Du bist noch"
	cont "nicht soweit."

	para "Du mußt zu den"
	line "TOP VIER zurück-"
	cont "kehren…"

	para "und in der"
	line "KANTO-LIGA"
	cont "kämpfen!"

	para "Erst dann hast Du"
	line "wirklich das"
	cont "Zeug dazu."
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
	line "Du forderst sie"
	cont "heraus."
	done

OakYesKantoBadgesText:
	text "EICH: Ah, Du"
	line "sammelst ORDEN der"
	cont "ARENALEITER von"
	cont "KANTO."

	para "Ich kann mir"
	line "vorstellen, daß"

	para "es schwer für Dich"
	line "ist, aber Du"
	cont "sammelst wertvolle"
	cont "Erfahrungen."

	para "Besuche mich"
	line "wieder, wenn Du"

	para "sie alle hast."
	line "Ich gebe Dir dann"
	cont "ein Geschenk."

	para "Streng Dich weiter"
	line "so an, <PLAYER>!"
	done

OaksAssistant1Text:
	text "PROF EICHs #-"
	line "MON-TALK wird in"

	para "KANTO nicht im"
	line "Radio gesendet."

	para "Das ist schade."
	line "Ich würde es gerne"
	cont "hören."
	done

OaksAssistant2Text:
	text "Die Forschungen"
	line "des PROFESSORS"
	cont "kommen dank Deiner"

	para "Arbeit am #DEX"
	line "sehr gut voran."
	done

OaksAssistant3Text:
	text "Erzähl es keinem,"
	line "aber PROF EICHs"

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
	text "Möchtest Du Deinen"
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
	cont "PROF EICH?"

	para "Nun, ich ackere"
	line "weiter."

	para "Ich habe Gerüchte"
	line "gehört, daß"

	para "sich <PLAY_G>"
	line "einen Namen macht."

	para "Es freut mich, das"
	line "zu hören."

	para "PROF LIND in"
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
