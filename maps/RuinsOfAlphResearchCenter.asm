	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST4

RuinsOfAlphResearchCenter_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	scene_script .GetUnownDex ; SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.GetUnownDex:
	sdefer .GetUnownDexScript
	end

.ScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

.GetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesPlayerMovement
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	checkevent EVENT_CAUGHT_ALL_UNOWN
	iffalse .ShowHiddenPowerOnStatsScreen
	end

.ShowHiddenPowerOnStatsScreen
	setevent EVENT_CAUGHT_ALL_UNOWN
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterPhoto: ; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

RuinsOfAlphResearchCenterApproachesPlayerMovement:
	step DOWN
	step_end

RuinsOfAlphResearchCenterLeavesPlayerMovement:
	step UP
	step_end

FossilScientist:
	faceplayer
	opentext
	checkevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	iftrue .GiveAerodactyl
	checkevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	iftrue .GiveKabuto
	checkevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	iftrue .GiveOmanyte
	writetext FossilScientistIntroText
	waitbutton
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal REVIVE_OLD_AMBER, .OldAmber
	ifequal REVIVE_DOME_FOSSIL, .DomeFossil
	ifequal REVIVE_HELIX_FOSSIL, .HelixFossil
	sjump .No

.OldAmber
	checkitem OLD_AMBER
	iffalse .No
	getmonname STRING_BUFFER_3, AERODACTYL
	writetext FossilScientistMonText
	promptbutton
	readvar VAR_BADGES
	if_greater_than 6, .GotSevenBadges
	writetext MightTakeAWhileText
	yesorno
	iffalse .No
.GotSevenBadges:
	setevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	takeitem OLD_AMBER
	writetext FossilScientistGiveText
	waitbutton
	sjump .GaveScientistFossil

.DomeFossil:
	checkitem DOME_FOSSIL
	iffalse .No
	getmonname STRING_BUFFER_3, KABUTO
	writetext FossilScientistMonText
	promptbutton
	setevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	takeitem DOME_FOSSIL
	opentext
	writetext FossilScientistGiveText
	waitbutton
	sjump .GaveScientistFossil

.HelixFossil:
	checkitem HELIX_FOSSIL
	iffalse .No
	getmonname STRING_BUFFER_3, OMANYTE
	writetext FossilScientistMonText
	promptbutton
	setevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	takeitem HELIX_FOSSIL
	writetext FossilScientistGiveText
	waitbutton
	sjump .GaveScientistFossil

.No
	writetext FossilScientistNoText
	waitbutton
	closetext
	end

.GaveScientistFossil:
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_WARP_TO
	waitsfx
	pause 35
	sjump FossilScientist

.GiveAerodactyl:
	readvar VAR_BADGES
	if_less_than 7, .NotEnoughBadges
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	clearevent EVENT_GAVE_SCIENTIST_OLD_AMBER
	writetext FossilScientistDoneText
	promptbutton
	getmonname STRING_BUFFER_3, AERODACTYL
	writetext FossilScientistReceiveText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	givepoke AERODACTYL, 25
	closetext
	end

.GiveKabuto:
	readvar VAR_BADGES
	if_less_than 3, .NotEnoughBadges
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	clearevent EVENT_GAVE_SCIENTIST_DOME_FOSSIL
	writetext FossilScientistDoneText
	promptbutton
	getmonname STRING_BUFFER_3, KABUTO
	writetext FossilScientistReceiveText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	givepoke KABUTO, 15
	closetext
	end

.GiveOmanyte:
	readvar VAR_BADGES
	if_less_than 4, .NotEnoughBadges
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	clearevent EVENT_GAVE_SCIENTIST_HELIX_FOSSIL
	writetext FossilScientistDoneText
	promptbutton
	getmonname STRING_BUFFER_3, OMANYTE
	writetext FossilScientistReceiveText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	givepoke OMANYTE, 20
	closetext
	end
	
.NotEnoughBadges
	writetext FossilScientistTimeText
	waitbutton
	closetext
	end

.NoRoom:
	writetext FossilScientistPartyFullText
	waitbutton
	closetext
	end

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "OLD AMBER@"
	db "DOME FOSSIL@"
	db "HELIX FOSSIL@"
	db "CANCEL@"

RuinsOfAlphResearchCenterPC:
	opentext
	special PokemonCenterPC
	closetext
	end

FossilScientistIntroText:
	text "Hallo!"

	para "Ich leite hier"
	line "die Forschungen!"

	para "Wir erforschen"
	line "Fossilien von"
	cont "URZEIT-#MON!"

	para "Hast Du ein"
	line "Fossil für mich?"
	done

MightTakeAWhileText:
	text "Aber das hier"
	line "könnte sehr lange"
	cont "dauern."

	para "Soll ich vorher"
	line "wirklich keine"
	cont "anderen Fossilien"
	cont "wiederbeleben?"
	done

FossilScientistNoText:
	text "Nein? Zu schade!"

	para "Komm einfach"
	line "später wieder"
	cont "vorbei!"
	done

FossilScientistPartyFullText:
	text "Nein? Zu schade!"

	para "Dein Team ist"
	line "schon voll!"
	done

FossilScientistTimeText:
	text "Wow, das hier ist"
	line "ziemlich komplex…"

	para "Es wird einige"
	line "Zeit dauern!"

	para "Komm einfach"
	line "später wieder"
	cont "vorbei!"
	done

FossilScientistDoneText:
	text "Wo warst Du?"

	para "Wir haben"
	line "Dein Fossil"
	cont "wiederbelebt!"
	done

FossilScientistMonText:
	text "Oh! Das ist ein"
	line "Fossil!"

	para "Es ist ein Fossil"
	line "von @"
	text_ram wStringBuffer3
	text ","

	para "einem schon lange"
	line "ausgestorbenen"
	cont "#MON!"

	para "Dank modernster"
	line "Technik können"
	cont "wir #MON"
	cont "aus Fossilien"
	cont "wiederbeleben!"
	done

FossilScientistGiveText:
	text "Gib es schnell"
	line "her, damit ich"
	cont "fortfahren kann!"

	para "<PLAYER> übergibt"
	line "das Fossil."
	done

FossilScientistReceiveText:
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

RuinsOfAlphResearchCenterModifiedDexText:
	text "Geschafft!"

	para "Ich habe Deinen"
	line "#DEX erweitert."

	para "Ich habe Dir einen"
	line "optionalen #DEX"

	para "extra für ICOGNITO"
	line "eingebaut. Er"

	para "speichert sie in"
	line "der Reihenfolge,"
	cont "in der Du sie"
	cont "fängst."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>s #DEX"
	line "wurde erweitert."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "Jedes ICOGNITO,"
	line "das Du fängst,"
	cont "wird darin einge-"
	cont "tragen."

	para "Schlage nach,"
	line "um zu erfahren,"
	cont "wie viele es gibt."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "Hast Du alle"
	line "verschiedenen"
	cont "ICOGNITO?"

	para "Das ist eine"
	line "Spitzenleistung!"

	para "Ich habe den"
	line "Drucker aufge-"
	cont "stellt, um"
	cont "ICOGNITOs Daten"
	cont "auszudrucken."

	para "Du kannst ihn"
	line "jederzeit gerne"
	cont "benutzen."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "Die RUINEN sind"
	line "zirka 1500"
	cont "Jahre alt."

	para "Aber niemand weiß,"
	line "warum sie erbaut"
	cont "wurden."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "Ich frage mich,"
	line "wie viele #MON"
	cont "wohl in den RUINEN"
	cont "leben?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "Es gibt #MON"
	line "in den RUINEN?"

	para "Das sind unfaß-"
	line "bare Neuigkeiten!"

	para "Das müssen wir"
	line "erforschen."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Unsere Forschung"
	line "und Deine Hilfe"

	para "geben uns einen"
	line "tiefen Einblick in"
	cont "die RUINEN."

	para "Es scheint, als ob"
	line "die RUINEN als"

	para "Habitat für #-"
	line "MON gebaut wurden."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "An die Wände der"
	line "RUINEN sind selt-"
	cont "same Zeichen"

	para "gemalt."
	line "Sie sind der"

	para "Schlüssel zur"
	line "Lösung des Rätsels"
	cont "um die RUINEN."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "Die seltsamen"
	line "#MON, die Du in"
	cont "den RUINEN gesehen"
	cont "hast?"

	para "Es scheint, sie"
	line "ähneln den"

	para "Zeichnungen an"
	line "den Wänden."

	para "Hmm…"

	para "Das bedeutet, es"
	line "gibt viele"
	cont "von ihnen…"
	done

RuinsOfAlphResearchCenterUnusedText1: ; unreferenced
	text "Wir denken, daß"
	line "irgendetwas für"

	para "die rätselhaften"
	line "Muster in den"

	para "RUINEN verantwort-"
	line "lich war."

	para "Darauf basiert"
	line "unsere Forschung."
	done

RuinsOfAlphResearchCenterUnusedText2: ; unreferenced
	text "Unsere Forschung"
	line "hat ergeben…,"

	para "diese selt-"
	line "samen Muster ent-"
	cont "standen, als das"

	para "#KOM-CENTER"
	line "errichtet wurde."

	para "Das bedeutet, daß"
	line "Radiowellen einen"

	para "gewissen Einfluß"
	line "haben…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Warum sind diese"
	line "antiken Muster"

	para "jetzt an den Wän-"
	line "den aufgetaucht?"

	para "Das wird immer"
	line "geheimnisvoller…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "ALPH-RUINEN"
	line "10. Forschungsjahr"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Geheimnisvolles"
	line "#MON"
	cont "Name: ICOGNITO"

	para "26 verschiedene"
	line "gefunden."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Was diese Maschine"
	line "wohl macht?"
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "ICOGNITO kann"
	line "gedruckt werden."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "It's a photo of"
	line "the RESEARCH"

	para "CENTER'S founder,"
	line "PROF SILKTREE."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "Es gibt viele"
	line "wissenschaftliche"
	cont "Bücher dort."

	para "Antike Ruinen…"
	line "Geheimnisse der"
	cont "Antike…"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterPC
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	object_event  7,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 2, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FossilScientist, -1