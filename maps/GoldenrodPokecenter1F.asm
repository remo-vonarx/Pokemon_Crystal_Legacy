	object_const_def
	const GOLDENRODPOKECENTER1F_NURSE
	const GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	const GOLDENRODPOKECENTER1F_GAMEBOY_KID
	const GOLDENRODPOKECENTER1F_LASS
	const GOLDENRODPOKECENTER1F_POKEFAN_F

GoldenrodPokecenter1F_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodPokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

GoldenrodPokecenter1F_GSBallSceneLeft:
	; checkcode VAR_BADGES
	; if_greater_than 6, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1F_GSBallSceneRight:
	; checkcode VAR_BADGES
	; if_greater_than 6, .gsball
	end

.gsball
	checkevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	iftrue .cancel
	playsound SFX_EXIT_BUILDING
	moveobject GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, 0, 7
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	appear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playmusic MUSIC_SHOW_ME_AROUND
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement
	turnobject PLAYER, UP
	opentext
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText
	waitbutton
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_POKECOM_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	writetext GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText
	waitbutton
	closetext
	applymovement GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST, GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement
	special RestartMapMusic
	disappear GOLDENRODPOKECENTER1F_LINK_RECEPTIONIST
	playsound SFX_EXIT_BUILDING
.cancel
	end

GoldenrodPokecenter1FGameboyKidScript:
	jumptextfaceplayer GoldenrodPokecenter1FGameboyKidText

GoldenrodPokecenter1FLassScript:
	jumptextfaceplayer GoldenrodPokecenter1FLassText

GoldenrodPokecenter1FPokefanF:
	faceplayer
	opentext
	writetext GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FAskGiveAwayAnEonMailText
	yesorno
	iffalse .NoEonMail
	takeitem EON_MAIL
	iffalse .NoEonMail
	writetext GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText
	waitbutton
	writetext GoldenrodPokecenter1FPokefanFThisIsForYouText
	waitbutton
	verbosegiveitem REVIVE
	iffalse .NoRoom
	writetext GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText
	waitbutton
	closetext
	end

.NoEonMail:
	writetext GoldenrodPokecenter1FPokefanFTooBadText
	waitbutton
	closetext
	end

.NoRoom:
	giveitem EON_MAIL
	writetext GoldenrodPokecenter1FPokefanFAnotherTimeThenText
	waitbutton
	closetext
	end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtLeftDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromLeftDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistApproachPlayerAtRightDoorwayTileMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head DOWN
	step_end

GoldenrodPokeCenter1FLinkReceptionistWalkToStairsFromRightDoorwayTileMovement:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

GoldenrodPokecomCenterWelcomeToTradeCornerText: ; unreferenced
	text "Hallo! Willkommen"
	line "in der TAUSCHECKE"
	cont "im #KOM-CENTER."

	para "Hier kannst du"
	line "#MON mit Leuten"
	cont "tauschen, die weit"
	cont "entfernt sind."
	done

GoldenrodPokecomCenterWeMustHoldYourMonText: ; unreferenced
	text "Für einen Tausch"
	line "müssen wir dein"
	cont "#MON verwahren."

	para "Möchtest du"
	line "tauschen?"
	done

GoldenrodPokecomCenterWhatMonDoYouWantText: ; unreferenced
	text "Welches #MON"
	line "möchtest du dafür"
	cont "haben?"
	done

GoldenrodPokecomCenterWeWillTradeYourMonForMonText: ; unreferenced
	text "In Ordnung. Wir"
	line "versuchen, dein"

	para "@"
	text_ram wStringBuffer3
	text " gegen"
	line "@"
	text_ram wStringBuffer4
	text " zu"
	cont "tauschen."

	para "Wir müssen dein"
	line "#MON verwahren,"
	cont "solange der Tausch"
	cont "läuft."

	para "Bitte warte, bis"
	line "wir den Raum dafür"
	cont "vorbereitet haben."
	done

GoldenrodPokecomCenterWeWillTradeYourMonForNewText: ; unreferenced
	text "In Ordnung. Wir"
	line "versuchen, dein"

	para "@"
	text_ram wStringBuffer3
	text " gegen"
	line "ein #MON zu"
	cont "tauschen, das du"
	cont "noch nie gesehen"
	cont "hast."

	para "Wir müssen dein"
	line "#MON verwahren,"
	cont "solange der Tausch"
	cont "läuft."

	para "Bitte warte, bis"
	line "wir den Raum dafür"
	cont "vorbereitet haben."
	done

GoldenrodPokecomCenterYourMonHasBeenReceivedText: ; unreferenced
	text "Wir haben dein"
	line "Tausch-#MON"
	cont "erhalten."

	para "Es wird etwas"
	line "dauern, einen"
	cont "Tauschpartner zu"
	cont "finden."

	para "Bitte komm später"
	line "wieder."
	done

GoldenrodPokecomCenterYouHaveOnlyOneMonText: ; unreferenced
	text "Oh? Du hast nur"
	line "ein #MON in"
	cont "deinem Team."

	para "Bitte komm wieder,"
	line "wenn dein Team"
	cont "größer ist."
	done

GoldenrodPokecomCenterWeHopeToSeeYouAgainText: ; unreferenced
	text "Wir hoffen, dich"
	line "wiederzusehen."
	done

GoldenrodPokecomCenterCommunicationErrorText: ; unreferenced
	text "Verbindungsfehler…"
	done

GoldenrodPokecomCenterCantAcceptLastMonText: ; unreferenced
	text "Wenn wir dieses"
	line "#MON annehmen,"
	cont "womit kämpfst du"
	cont "dann?"
	done

GoldenrodPokecomCenterCantAcceptEggText: ; unreferenced
	text "Tut mir Leid. Wir"
	line "können kein EI"
	cont "annehmen."
	done

GoldenrodPokecomCenterCantAcceptAbnormalMonText: ; unreferenced
	text "Tut mir Leid, aber"
	line "dein #MON"
	cont "scheint nicht"
	cont "normal zu sein."

	para "Wir können es"
	line "nicht annehmen."
	done

GoldenrodPokecomCenterAlreadyHoldingMonText: ; unreferenced
	text "Oh? Verwahren wir"
	line "nicht schon ein"
	cont "#MON von dir?"
	done

GoldenrodPokecomCenterCheckingTheRoomsText: ; unreferenced
	text "Wir sehen in den"
	line "Räumen nach."

	para "Bitte warte."
	done

GoldenrodPokecomCenterTradePartnerHasBeenFoundText: ; unreferenced
	text "Danke für deine"
	line "Geduld."

	para "Wir haben einen"
	line "Tauschpartner"
	cont "gefunden."
	done

GoldenrodPokecomCenterItsYourNewPartnerText: ; unreferenced
	text "Das ist dein neuer"
	line "Partner."

	para "Bitte kümmere dich"
	line "liebevoll darum."

	para "Wir hoffen, dich"
	line "wiederzusehen."
	done

GoldenrodPokecomCenterYourPartyIsFullText: ; unreferenced
	text "Oh, oh. Dein Team"
	line "ist bereits voll."

	para "Bitte komm wieder,"
	line "wenn in deinem"
	cont "Team Platz ist."
	done

GoldenrodPokecomCenterNoTradePartnerFoundText: ; unreferenced
	text "Leider hat sich"
	line "noch niemand als"

	para "Tauschpartner"
	line "gemeldet."

	para "Möchtest du dein"
	line "#MON zurück?"
	done

GoldenrodPokecomCenterReturnedYourMonText: ; unreferenced
	text "Wir geben dir"
	line "dein #MON"
	cont "zurück."
	done

GoldenrodPokecomCenterYourMonIsLonelyText: ; unreferenced
	text "Leider hat sich"
	line "noch niemand als"

	para "Tauschpartner"
	line "gemeldet."

	para "Wir haben dein"
	line "#MON lange ver-"
	cont "wahrt. Deshalb ist"
	cont "es sehr einsam."

	para "Tut mir Leid, aber"
	line "wir müssen es dir"
	cont "zurückgeben."
	done

GoldenrodPokecenter1FWeHopeToSeeYouAgainText_2: ; unreferenced
	text "Wir hoffen, dich"
	line "wiederzusehen."
	done

GoldenrodPokecomCenterContinueToHoldYourMonText: ; unreferenced
	text "In Ordnung. Wir"
	line "verwahren dein"
	cont "#MON weiterhin."
	done

GoldenrodPokecomCenterRecentlyLeftYourMonText: ; unreferenced
	text "Oh? Du hast uns"
	line "dein #MON erst"
	cont "vor Kurzem über-"
	cont "lassen."

	para "Bitte komm später"
	line "wieder."
	done

GoldenrodPokecomCenterSaveBeforeTradeCornetText: ; unreferenced
	text "Wir SICHERN dein"
	line "Spiel, bevor wir"
	cont "uns mit dem"
	cont "CENTER verbinden."
	done

GoldenrodPokecomCenterWhichMonToTradeText: ; unreferenced
	text "Welches #MON"
	line "möchtest du"
	cont "tauschen?"
	done

GoldenrodPokecomCenterTradeCanceledText: ; unreferenced
	text "Tut mir Leid, aber"
	line "wir müssen den"
	cont "Tausch abbrechen."
	done

GoldenrodPokecomCenterEggTicketText: ; unreferenced
	text "Oh!"

	para "Du hast ja ein"
	line "EI-TICKET!"

	para "Mit diesem Gut-"
	line "schein können"

	para "besondere Leute"
	line "ein besonderes"
	cont "#MON erhalten!"
	done

GoldenrodPokecomCenterOddEggBriefingText: ; unreferenced
	text "Ich erkläre dir"
	line "kurz, wie es geht."

	para "Beim Tausch in der"
	line "TAUSCHECKE kennen"

	para "sich die beiden"
	line "Trainer nicht."

	para "Deshalb kann es"
	line "etwas dauern."

	para "Ein KURIOS-EI ist"
	line "aber nur für dich"
	cont "bereit."

	para "Es wird dir sofort"
	line "zugeschickt."

	para "Bitte wähle einen"
	line "der Räume im"

	para "CENTER. Das"
	line "KURIOS-EI wird aus"

	para "dem gewählten Raum"
	line "geschickt."
	done

GoldenrodPokecomCenterPleaseWaitAMomentText: ; unreferenced
	text "Bitte warte einen"
	line "Moment."
	done

GoldenrodPokecomCenterHereIsYourOddEggText: ; unreferenced
	text "Danke fürs Warten."

	para "Wir haben dein"
	line "KURIOS-EI"
	cont "erhalten."

	para "Hier ist es!"

	para "Bitte zieh es"
	line "liebevoll auf."
	done

GoldenrodPokecomCenterNoEggTicketServiceText: ; unreferenced
	text "Es tut mir sehr"
	line "Leid."

	para "Der Umtausch von"
	line "EI-TICKETS ist"
	cont "zurzeit nicht"
	cont "möglich."
	done

GoldenrodPokecomCenterNewsMachineText: ; unreferenced
	text "Das ist eine #-"
	line "MON NACHRICHTEN-"
	cont "MASCHINE."
	done

GoldenrodPokecomCenterWhatToDoText: ; unreferenced
	text "Was möchtest du"
	line "tun?"
	done

GoldenrodPokecomCenterNewsMachineExplanationText: ; unreferenced
	text "Die #MON NACH-"
	line "RICHTEN werden aus"

	para "den SPIELSTÄNDEN"
	line "von #MON-"
	cont "Trainern zusammen-"
	cont "gestellt."

	para "Wenn du die NACH-"
	line "RICHTEN liest,"

	para "wird eventuell"
	line "dein SPIELSTAND"
	cont "übertragen."

	para "Er enthält dein"
	line "Abenteuer-Tagebuch"

	para "und dein Mobil-"
	line "Profil."

	para "Deine Telefon-"
	line "nummer wird nicht"
	cont "übertragen."

	para "Der Inhalt der"
	line "NACHRICHTEN hängt"

	para "von den SPIEL-"
	line "STÄNDEN ab, die du"

	para "und die anderen"
	line "#MON-Trainer"
	cont "senden."

	para "Vielleicht kommst"
	line "du sogar in die"
	cont "NACHRICHTEN!"
	done

GoldenrodPokecomCenterWouldYouLikeTheNewsText: ; unreferenced
	text "Möchtest du die"
	line "NACHRICHTEN laden?"
	done

GoldenrodPokecomCenterReadingTheLatestNewsText: ; unreferenced
	text "Lade die neuesten"
	line "NACHRICHTEN…"
	cont "Bitte warten."
	done

GoldenrodPokecomCenterNoOldNewsText: ; unreferenced
	text "Es gibt keine"
	line "alten NACHRICHTEN…"
	done

GoldenrodPokecomCenterCorruptedNewsDataText: ; unreferenced
	text "Die NACHRICHTEN-"
	line "DATEN sind be-"
	cont "schädigt."

	para "Bitte lade die"
	line "NACHRICHTEN noch"
	cont "einmal herunter."
	done

GoldenrodPokecomCenterMakingPreparationsText: ; unreferenced
	text "Wir treffen gerade"
	line "Vorbereitungen."

	para "Bitte komm später"
	line "wieder."
	done

GoldenrodPokecomCenterSaveBeforeNewsMachineText: ; unreferenced
	text "Wir SICHERN deinen"
	line "Fortschritt, bevor"

	para "die NACHRICHTEN-"
	line "MASCHINE startet."
	done

GoldenrodPokecomCenterPerson1Text: ; unreferenced
	text "Dieses #MON-"
	line "CENTER ist riesig."

	para "Es wurde soeben"
	line "fertig. Es gibt"

	para "auch viele neue"
	line "Maschinen."
	done

GoldenrodPokecomCenterPerson2Text: ; unreferenced
	text "Ich habe mir etwas"
	line "lustiges für die"
	cont "TAUSCHECKE aus-"
	cont "gedacht!"

	para "Ich gebe TAUBSI"
	line "einen BRIEF und"

	para "tausche es gegen"
	line "ein anderes!"

	para "Wenn das jeder"
	line "tut, könnte man"

	para "mit allen mög-"
	line "lichen Leuten"
	cont "BRIEFE tauschen!"

	para "Ich nenne das"
	line "TAUBSI-BRIEF!"

	para "Setzt es sich"
	line "durch, schließe"

	para "ich viele neue"
	line "Freundschaften!"
	done

GoldenrodPokecomCenterPerson3Text: ; unreferenced
	text "Sie sagen, dass"
	line "man dort sogar mit"

	para "Fremden tauschen"
	line "kann."

	para "Aber sie arbeiten"
	line "noch daran."
	done

GoldenrodPokecomCenterPerson4Text: ; unreferenced
	text "Ein mir fremdes"
	line "Mädchen schickte"

	para "mir ihr"
	line "HOPPSPROSS."

	para "Tausche #MON,"
	line "die du möchtest."
	done

GoldenrodPokecomCenterPerson5Text: ; unreferenced
	text "Ich erhielt ein"
	line "weibliches"
	cont "HOPPSPROSS, das"
	cont "SEAMUS heißt!"

	para "So heißt mein"
	line "Vater!"
	done

GoldenrodPokecomCenterPerson6Text: ; unreferenced
	text "Welches ist die"
	line "NACHRICHTEN-"
	cont "MASCHINE?"

	para "Bezieht sie die"
	line "Nachrichten"
	cont "nur vom Radio?"
	done

GoldenrodPokecomCenterPerson7Text: ; unreferenced
	text "Das #KOM-CENTER"
	line "wird drahtlos mit"

	para "allen #MON-"
	line "CENTERN verbunden."

	para "Dann kann ich mich"
	line "bestimmt mit allen"
	cont "möglichen Leuten"
	cont "verbinden."
	done

GoldenrodPokecomCenterPerson8Text: ; unreferenced
	text "Die Maschinen sind"
	line "noch nicht ein-"
	cont "satzbereit."

	para "Dennoch ist es"
	line "toll, solch einen"

	para "modernen Ort vor"
	line "allen anderen zu"
	cont "besuchen."
	done

GoldenrodPokecomCenterPerson9Text: ; unreferenced
	text "Mein Freund war"
	line "neulich in den"

	para "NACHRICHTEN. Das"
	line "hat mich"
	cont "überrascht!"
	done

GoldenrodPokecomCenterPerson10Text: ; unreferenced
	text "Ich werde unruhig,"
	line "wenn ich nicht"

	para "die neusten"
	line "NACHRICHTEN"

	para "bekomme!"
	done

GoldenrodPokecomCenterPerson11Text: ; unreferenced
	text "Wenn ich in die"
	line "NACHRICHTEN komme,"

	para "werde ich berühmt"
	line "und verehrt."

	para "Wie kann ich es"
	line "bloß in die NACH-"
	cont "RICHTEN schaffen?"
	done

GoldenrodPokecenter1FGameboyKidText:
	text "Im oberen Stock-"
	line "werk findest du"

	para "das KOLOSSEUM."
	line "Hier kannst du"

	para "gegen Freunde"
	line "antreten."

	para "Kampfergebnisse"
	line "werden an der Wand"

	para "ausgehängt. Ich"
	line "kann es mir nicht"

	para "erlauben, zu ver-"
	line "lieren."
	done

GoldenrodPokecomCenterPerson12Text: ; unreferenced
	text "Ich bin sofort"
	line "hierher gekommen,"

	para "als ich hörte,"
	line "dass das #MON-"
	cont "CENTER in DUKATIA"

	para "neue Maschinen"
	line "hat."

	para "Aber es scheint,"
	line "als seien sie noch"

	para "mitten in den"
	line "Vorbereitungen…"
	done

GoldenrodPokecomCenterPerson13Text: ; unreferenced
	text "Allein das Be-"
	line "trachten dieser"

	para "neuen Errungen-"
	line "schaften macht"
	cont "mich jünger!"
	done

GoldenrodPokecenter1FLassText:
	text "Ein starkes #-"
	line "MON muss nicht"
	cont "zwingend gewinnen."

	para "Meist entscheidet"
	line "der Vor- oder"
	cont "Nachteil des Typs."

	para "Ich glaube nicht,"
	line "dass es ein #-"
	cont "MON gibt, das al-"
	cont "len anderen über-"
	cont "legen ist."
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseAcceptGSBallText:
	text "<PLAYER>, oder?"

	para "Glückwunsch!"

	para "Nur für dich wurde"
	line "ein GS-BALL"
	cont "geschickt!"

	para "Nimm ihn bitte!"
	done

GoldenrodPokeCenter1FLinkReceptionistPleaseDoComeAgainText:
	text "Beehre uns bald"
	line "wieder!"
	done

GoldenrodPokecomCenterSignText: ; unreferenced
	text "#KOM-CENTER"
	line "1. STOCK: INFO"

	para "Links:"
	line "VERWALTUNG"

	para "Mitte:"
	line "TAUSCHECKE"

	para "Rechts:"
	line "#MON NACH-"
	cont "RICHTEN"
	done

GoldenrodPokecomCenterNewsMachineNotYetText: ; unreferenced
	text "Das ist eine #-"
	line "MON NACHRICHTEN-"
	cont "MASCHINE!"

	para "Sie ist noch nicht"
	line "in Betrieb…"
	done

GoldenrodPokecenter1FPokefanFDoYouHaveEonMailText:
	text "Oh, dein Beutel"
	line "sieht schwer aus!"

	para "Oh! Hast du zufäl-"
	line "lig etwas, das man"
	cont "ANARA-BRIEF nennt?"

	para "Meine Tochter"
	line "sucht danach."

	para "Du gibst mir doch"
	line "einen, nicht wahr?"
	done

GoldenrodPokecenter1FAskGiveAwayAnEonMailText:
	text "ANARA-BRIEF"
	line "weggeben?"
	done

GoldenrodPokecenter1FPokefanFThisIsForYouText:
	text "Oh, großartig!"
	line "Danke, Schatz!"

	para "Hier, als Aus-"
	line "gleich sollst"
	cont "du das haben!"
	done

GoldenrodPokecenter1FPokefanFDaughterWillBeDelightedText:
	text "Meine Tochter wird"
	line "entzückt sein!"
	done

GoldenrodPokecenter1FPokefanFTooBadText:
	text "Oh? Du hast"
	line "keinen? Schade."
	done

GoldenrodPokecenter1FPokefanFAnotherTimeThenText:
	text "Oh… Ein anderes"
	line "Mal vielleicht."
	done

GoldenrodPokecenter1FPlayerGaveAwayTheEonMailText:
	text "<PLAYER> gibt den"
	line "ANARA-BRIEF weg."
	done

GoldenrodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, GOLDENROD_CITY, 15
	warp_event  4,  7, GOLDENROD_CITY, 15
	warp_event  0,  6, POKECOM_CENTER_ADMIN_OFFICE_MOBILE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events
	coord_event  3,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneLeft
	coord_event  4,  7, SCENE_DEFAULT, GoldenrodPokecenter1F_GSBallSceneRight

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FNurseScript, -1
	object_event 16,  8, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FGameboyKidScript, -1
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FLassScript, -1
	object_event  7,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodPokecenter1FPokefanF, -1
