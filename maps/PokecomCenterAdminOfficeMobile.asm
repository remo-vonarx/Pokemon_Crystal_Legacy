	object_const_def
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST1
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST2
	const POKECOMCENTERADMINOFFICEMOBILE_SCIENTIST3

PokecomCenterAdminOfficeMobile_MapScripts:
	def_scene_scripts

	def_callbacks

PokecomCenterAdminOfficeMobileScientist1Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist1Text

PokecomCenterAdminOfficeMobileScientist2Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist2Text

PokecomCenterAdminOfficeMobileScientist3Script:
	jumptextfaceplayer PokecomCenterAdminOfficeMobileScientist3Text

PokecomCenterAdminOfficeMobileComputer1:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer1MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .PokeComClub
	ifequal 2, .MobileCenter
	sjump .Quit

.PokeComClub:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub
	waitbutton
	sjump .loop

.MobileCenter:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer1MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "#　つうしん　クラブ@" ; # COM CLUB
	db "モバイルセンター@" ; MOBILE CENTER
	db "やめる@" ; QUIT

PokecomCenterAdminOfficeMobileComputer2:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text
	waitbutton
.loop:
	reloadmappart
	loadmenu .Computer2MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UsePhone
	ifequal 2, .DontUsePhone
	sjump .Quit

.UsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_UsePhone
	waitbutton
	sjump .loop

.DontUsePhone:
	opentext
	writetext PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone
	waitbutton
	sjump .loop

.Quit:
	closetext
	end

.Computer2MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "でんわ<WO>つかうとき@" ; Use phone
	db "でんわ<GA>つながらないとき@" ; Don't use phone
	db "やめる@" ; QUIT

PokecomCenterAdminOfficeMobileComputer3:
	jumptext PokecomCenterAdminOfficeMobileComputer3Text

PokecomCenterAdminOfficeMobileScientist1Text:
	text "Das #KOM-CENTER"
	line "und das MOBILE-"
	cont "CENTER wurden"

	para "gebaut, um den"
	line "Wunsch nach Tausch"

	para "und Kämpfen mit"
	line "Trainern in weiter"

	para "Ferne und mit"
	line "völlig Fremden zu"
	cont "erfüllen."
	done

PokecomCenterAdminOfficeMobileScientist2Text:
	text "Als du dich zum"
	line "ersten Mal per"

	para "Handy mit jemandem"
	line "verbunden hast,"

	para "warst du da nicht"
	line "beeindruckt?"

	para "Als mein erster"
	line "Versuch klappte,"

	para "war ich so beein-"
	line "druckt, dass ich"
	cont "zitterte!"
	done

PokecomCenterAdminOfficeMobileScientist3Text:
	text "Dank Fortschritten"
	line "auf dem Gebiet der"

	para "Funktechnologie,"
	line "konnten sie diese"
	cont "Stätte bauen."
	done

PokecomCenterAdminOfficeMobileComputer1Text:
	text "Ein Hinweis dazu,"
	line "wo MOBILE-ADAPTER"
	cont "zu verwenden sind…"
	done

PokecomCenterAdminOfficeMobileComputer1Text_PokeComClub:
	text "In jedem #MON-"
	line "CENTER gibt es"
	cont "oben einen"
	cont "#KOM-CLUB."

	para "Dort kannst du mit"
	line "einem MOBILE-"
	cont "ADAPTER mit einem"
	cont "Freund in weiter"
	cont "Ferne kämpfen oder"
	cont "tauschen."

	para "Für eine Verbin-"
	line "dung muss dein"
	cont "Freund dieselbe"
	cont "Art MOBILE-ADAPTER"
	cont "haben wie du."
	done

PokecomCenterAdminOfficeMobileComputer1Text_MobileCenter:
	text "Um die TAUSCHECKE"
	line "zu nutzen oder die"
	cont "#MON"
	cont "NACHRICHTEN zu"
	cont "lesen, musst du"
	cont "das MOBILE-CENTER"
	cont "anrufen."

	para "Bevor du dich dort"
	line "verbinden kannst,"
	cont "musst du dich beim"
	cont "MOBILE-CENTER"
	cont "registrieren."
	done

PokecomCenterAdminOfficeMobileComputer2Text:
	text "Ein Hinweis zur"
	line "Benutzung des"
	cont "Handys…"
	done

PokecomCenterAdminOfficeMobileComputer2Text_UsePhone:
	text "Bitte stelle"
	line "sicher, dass dein"

	para "Handy und dein"
	line "MOBILE-ADAPTER"
	cont "richtig verbunden"
	cont "sind."

	para "Bitte sorge für"
	line "ein starkes Funk-"
	cont "signal des Handys."

	para "Berühre das Handy"
	line "während der Ver-"
	cont "bindung nicht und"
	cont "lege nicht auf."
	done

PokecomCenterAdminOfficeMobileComputer2Text_DontUsePhone:
	text "Ist der Server"
	line "ausgelastet, ist"

	para "eine Anmeldung"
	line "eventuell nicht"
	cont "möglich."

	para "Bitte rufe dann"
	line "später noch einmal"
	cont "an."

	para "Kannst du dich"
	line "nicht anmelden"
	cont "oder verstehst du"
	cont "die Fehler-"
	cont "meldungen nicht,"

	para "dann wende dich an"
	line "den Kundendienst"
	cont "oder lies die"
	cont "Anleitung."
	done

PokecomCenterAdminOfficeMobileComputer3Text:
	text "Die VERWALTUNG hat"
	line "eine E-Mail erhal-"
	cont "ten. Darin steht…"

	para "<……> <……> <……>"

	para "An die Mitarbeiter"
	line "im #KOM-CENTER…"

	para "Dank der Funkkom-"
	line "munikation können"

	para "#MON-Trainer im"
	line "ganzen Land mit-"
	cont "einander in Kon-"
	cont "takt treten."

	para "Arbeiten wir"
	line "weiter auf den Tag"
	cont "hin, an dem sich"

	para "alle Trainer der"
	line "Welt ohne Grenzen"
	cont "verbinden können!"

	para "<……> <……> <……>"
	done

PokecomCenterAdminOfficeMobile_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0, 31, GOLDENROD_POKECENTER_1F, 3
	warp_event  1, 31, GOLDENROD_POKECENTER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  6, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer1
	bg_event  6, 28, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer2
	bg_event  3, 26, BGEVENT_UP, PokecomCenterAdminOfficeMobileComputer3

	def_object_events
	object_event  4, 28, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist1Script, -1
	object_event  7, 27, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist2Script, -1
	object_event  7, 29, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PokecomCenterAdminOfficeMobileScientist3Script, -1
