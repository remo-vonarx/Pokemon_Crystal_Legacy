_OakText6::
	text "Wie lautet Dein"
	line "Name?"
	prompt

_OakText7::
	text "<PLAYER>, bist Du"
	line "bereit?"

	para "Dein eigenes"
	line "#MON-Abenteuer"
	cont "erwartet Dich."

	para "Dich erwarten tol-"
	line "le Dinge, aber"
	cont "auch harte Zeiten."

	para "Eine Welt voller"
	line "Träume und aufre-"
	cont "gender #MON-"

	para "Abenteuer erwar-"
	line "tet Dich! Mach"
	cont "Dich bereit!"

	para "Ich treffe Dich"
	line "später!"
	done

_ClockTimeMayBeWrongText::
	text "Die Uhr könnte"
	line "falsch gestellt"
	cont "sein."

	para "Gib bitte die"
	line "genaue Uhrzeit an."
	prompt

_ClockSetWithControlPadText::
	text "Benutze dafür das"
	line "Steuerkreuz."

	para "Bestätigen:"
	line "A-Knopf"
	cont "Zurück: B-Knopf"
	done

_ClockIsThisOKText::
	text "Einverstanden?"
	done

_ClockHasResetText::
	text "Die Uhr wurde"
	line "korrigiert."
	done

_LinkTimeoutText::
	text "Es verging zu viel"
	line "Zeit. Probier's"
	cont "noch einmal."
	prompt

_LinkTradeCantBattleText::
	text "Wenn Du dieses"
	line "#MON tauschst,"
	cont "kannst Du nicht"
	cont "mehr kämpfen."
	prompt

_LinkAbnormalMonText::
	text "Das @"
	text_ram wStringBuffer1
	text_start
	cont "Deines Freundes"
	cont "scheint nicht in"
	cont "Ordnung zu sein!"
	prompt

_LinkAskTradeForText::
	text "Tausche @"
	text_ram wBufferTrademonNickname
	text_start
	line "mit @"
	text_ram wStringBuffer1
	text "?"
	done

_MobileBattleMustPickThreeMonText::
	text "Um einen Mobil"
	line "Kampf auszuführen,"

	para "mußt Du drei"
	line "#MON auswählen."

	para "In Ordnung?"
	done

_MobileBattleMoreInfoText::
	text "Benötigst Du mehr"
	line "Informationen über"
	cont "den Mobil-Kampf?"
	done

_MobileBattleRulesText::
	text "An einem Mobil-"
	line "Kampf nehmen drei"
	cont "#MON teil."

	para "Die max. Kampfzeit"
	line "pro Tag beträgt"

	para "zehn Minuten für"
	line "jeden angeschlos-"
	cont "senen Spieler."

	para "Steht nach Ablauf"
	line "des Zeitlimits"

	para "kein Sieger fest,"
	line "gewinnt der Spie-"
	cont "ler, der noch über"

	para "die meisten kampf-"
	line "fähigen #MON"
	cont "verfügt."

	para "Bei einem Remis,"
	line "gewinnt der Spie-"
	cont "ler, dessen Team"

	para "die wenigsten KP"
	line "verloren hat."
	done

_WouldYouLikeToMobileBattleText::
	text "Für heute bleiben"
	line "noch @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Möchtest Du"
	line "kämpfen?"
	done

_WantAQuickMobileBattleText::
	text "Für heute bleiben"
	line "nur noch @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Einen schnellen"
	line "Kampf bestreiten?"
	done

_WantToRushThroughAMobileBattleText::
	text "Du hast nur noch"
	line "1 min für heute!"

	para "Wie wäre es mit"
	line "einem Blitzkampf?"
	done

_PleaseTryAgainTomorrowText::
	text "Weniger, als 1"
	line "min für heute!"

	para "Kommme morgen"
	line "wieder."
	done

_TryAgainUsingSameSettingsText::
	text "Noch ein Versuch"
	line "bei gleichen"
	cont "Einstellungen?"
	done

_MobileBattleLessThanOneMinuteLeftText::
	text "Weniger, als 1"
	line "min für heute!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "Heute ist keine"
	line "Zeit für eine"
	cont "Verbindung."
	done

_PickThreeMonForMobileBattleText::
	text "Wähle drei #MON"
	line "für den Kampf."
	done

_MobileBattleRemainingTimeText::
	text "Heute sind noch"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text " min übrig."
	done

_WouldYouLikeToSaveTheGameText::
	text "Möchtest Du das"
	line "Spiel SICHERN?"
	done

_SavedTheGameText::
	text "<PLAYER> hat das"
	line "Spiel gesichert."
	done

_AnotherSaveFileText::
	text "Es gibt bereits"
	line "einen Spielstand."
	cont "Spielstand"
	cont "überschreiben?"
	done

_SaveFileCorruptedText::
	text "Der Spielstand"
	line "ist zerstört!"
	prompt

_ChangeBoxSaveText::
	text "Vor einem Wechsel"
	line "der #MON-BOX"
	cont "wird das Spiel"
	cont "gesichert!"
	done

_MoveMonWOMailSaveText::
	text "Immer, wenn Du"
	line "ein #MON"
	cont "verschiebst, wird"
	cont "das Spiel ge-"
	cont "sichert!"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "Die Speicherkapa-"
	line "zität des Fensters"
	cont "wurde überschrit-"
	cont "ten."
	done

_WindowPoppingErrorText::
	text "Für den Tausch"
	line "stehen keine Fens-"
	cont "ter zur Verfügung."
	done

_CorruptedEventText:: ; unreferenced
	text "Vorgang abge-"
	cont "brochen!"
	prompt

_ObjectEventText::
	text "Object event."
	done

_BGEventText::
	text "BG event."
	done

_CoordinatesEventText::
	text "Coordinates event"
	done

_ReceivedItemText::
	text "<PLAYER> erhält"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> steckt"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text_ram wStringBuffer3
	text_start
	line "ist voll…"
	prompt

_SeerSeeAllText::
	text "Ich sehe alles."
	line "Ich weiß alles…"

	para "Gewiß kenne ich"
	line "Deine #MON!"
	done

_SeerCantTellAThingText::
	text "Wiiieeee? Ich kann"
	line "nichts sagen!"

	para "Wieso weiß ich"
	line "darüber nichts?"
	done

_SeerNameLocationText::
	text "Hm… Du trafst"
	line "@"
	text_ram wSeerNickname
	text " hier:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "Die Tageszeit war"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Sein Level war @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Ich bin gut, oder?"
	prompt

_SeerTradeText::
	text "Hm… hast Du"
	line "@"
	text_ram wSeerNickname
	text " mit"

	para "@"
	text_ram wSeerOT
	text_start
	line "getauscht?"

	para "@"
	text_ram wSeerOT
	text " traf"
	line "@"
	text_ram wSeerNickname
	text " hier:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerNoLocationText::
	text "Was!? Unglaublich!"

	para "Ich weiß nicht"
	line "wie, aber es ist"

	para "unglaublich!"
	line "Du bist anders."

	para "Ich kann nicht sa-"
	line "gen, wo Du es"
	cont "trafst, aber sein"
	cont "Level war @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Ich bin gut, oder?"
	prompt

_SeerEggText::
	text "Heh!"

	para "Das ist ein EI!"

	para "Du kannst nicht"
	line "behaupten, Du"
	cont "hättest es schon"
	cont "getroffen…"
	done

_SeerDoNothingText::
	text "Fufufu! Ich sah,"
	line "daß Du müßig"
	cont "gehst!"
	done

_SeerMoreCareText::
	text "Apropos…"

	para "Du solltest Deine"
	line "#MON etwas"

	para "umsichtiger"
	line "trainieren."
	done

_SeerMoreConfidentText::
	text "Übrigens…"

	para "Es scheint"
	line "gewachsen zu sein."

	para "@"
	text_ram wSeerNickname
	text_start
	line "wird immer"
	cont "selbstbewußter."
	done

_SeerMuchStrengthText::
	text "Apropos…"

	para "@"
	text_ram wSeerNickname
	text " ist"
	line "gewachsen. Es ist"
	cont "viel stärker."
	done

_SeerMightyText::
	text "Apropos…"

	para "Es ist sehr"
	line "gewachsen!"

	para "@"
	text_ram wSeerNickname
	text_start
	line "muß viele"

	para "#MON-Kämpfe"
	line "bestritten haben."

	para "Es strotzt vor"
	line "Selbstbewußtsein."
	done

_SeerImpressedText::
	text "Apropos…"

	para "Deine Hingabe be-"
	line "eindruckt mich."

	para "Es ist schon lange"
	line "her, daß ich ein"

	para "so starkes #MON"
	line "wie @"
	text_ram wSeerNickname
	text_start
	cont "gesehen habe."

	para "Ich bin sicher,"
	line "daß jeder"

	para "@"
	text_ram wSeerNickname
	text_start
	line "gerne kämpfen"
	cont "sehen würde."
	done

_CongratulationsYourPokemonText::
	text "Glückwunsch!"
	line "Dein @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EvolvedIntoText::
	text_start

	para "wurde zu"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_StoppedEvolvingText::
	text "Hmm? Die Entwick-"
	line "lung wurde abge-"
	cont "brochen!"
	prompt

_EvolvingText::
	text "Hey! @"
	text_ram wStringBuffer2
	text_start
	line "entwickelt sich!"
	done

_EggMoveReminderIntro::
	text "Hallo! Ich bin der"
	line "EI-ATTACKEN-LEHRER"

	para "und kann Deinen"
	line "#MON Attacken"

	para "beibringen, die"
	line "sie sonst nur"
	cont "als EI lernen."

	para "Interessiert?"
	done

_MoveReminderIntro::
	text "Hallo! Ich bin der"
	line "ATTACKEN-ERINNERER"

	para "und bringe #MON"
	line "Attacken wieder"
	cont "bei, die sie beim"
	cont "Wachsen gelernt"
	cont "haben."

	para "Soll sich ein"
	line "#MON erinnern?"
	done

_MoveReminderWhichMon::
	text "Welches #MON"
	line "soll sich an eine"
	cont "Attacke erinnern?"
	done

_MoveReminderWhichMove::
	text "Welche Attacke"
	line "soll es lernen?"
	done

_MoveReminderCancel::
	text "Komm jederzeit"
	line "wieder."
	done

_MoveReminderEgg::
	text "Hey! Was soll ich"
	line "denn einem EI"
	cont "beibringen?"
	done

_MoveReminderNoMon::
	text "Keines Deiner"
	line "#MON kann sich"
	cont "an eine Attacke"
	cont "erinnern."
	done

_MoveReminderNoMoves::
	text "Dieses #MON"
	line "kann keine"
	cont "Attacken lernen."
	done


_MartHowManyText::
	text "Wie viele?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " x"
	line "@"
	text_ram wStringBuffer2
	text "?"

	para "Das macht dann"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Hallo,"

	para "ich verkaufe"
	line "preiswerte"
	cont "Kräutermedizin."

	para "Sie wirkt, ist"
	line "aber bitter."

	para "Deine #MON"
	line "werden sie nicht"
	cont "mögen."

	para "Hihihihi…"
	done

_HerbalLadyHowManyText::
	text "Wie viele?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Danke, Kind."
	line "Hihihihi…"
	done

_HerbalLadyPackFullText::
	text "Oh? In Deinem"
	line "BEUTEL ist kein"
	cont "Platz mehr."
	done

_HerbalLadyNoMoneyText::
	text "Hihihi… Du hast"
	line "nicht genug Geld."
	done

_HerbalLadyComeAgainText::
	text "Besuche mich"
	line "wieder. Hihihihi…"
	done

_BargainShopIntroText::
	text "Heh! Bist Du an"
	line "Schnäppchen"
	cont "interessiert?"

	para "Ich verkaufe"
	line "seltene Items,"

	para "aber leider sind"
	line "es nur Einzel-"
	cont "stücke."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Kaufen?"
	done

_BargainShopThanksText::
	text "Danke."
	done

_BargainShopPackFullText::
	text "Uhh, Dein BEUTEL"
	line "platzt aus"
	cont "allen Nähten."
	done

_BargainShopSoldOutText::
	text "Das hast Du schon"
	line "gekauft. Ich"
	cont "habe keines mehr."
	done

_BargainShopNoFundsText::
	text "Uhh, Du bist knapp"
	line "bei Kasse."
	done

_BargainShopComeAgainText::
	text "Schau mal"
	line "wieder vorbei."
	done

_PharmacyIntroText::
	text "Was ist? Brauchst"
	line "Du Medizin?"
	done

_PharmacyHowManyText::
	text "Wie viele?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "kostet ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Vielen Dank!"
	done

_PharmacyPackFullText::
	text "Du hast keinen"
	line "Platz mehr."
	done

_PharmacyNoMoneyText::
	text "Wie? Das ist nicht"
	line "genügend Geld."
	done

_PharmacyComeAgainText::
	text "In Ordnung."
	line "Bis die Tage."
	done

_NothingToSellText::
	text "Du hast nichts"
	line "zu verkaufen."
	prompt

_MartSellHowManyText::
	text "Wie viele?"
	done

_MartSellPriceText::
	text "Ich zahle Dir"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Reicht das?"
	done

_MartWelcomeText::
	text "Willkommen! Womit"
	line "kann ich dienen?"
	done

_MartThanksText::
	text "Hier, bitte."
	line "Danke schön!"
	done

_MartNoMoneyText::
	text "Du hast nicht"
	line "genügend Geld."
	done

_MartPackFullText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	done

_MartCantBuyText::
	text "Ich kann Dir das"
	line "nicht abkaufen."
	prompt

_MartComeAgainText::
	text "Komm wieder!"
	done

_MartAskMoreText::
	text "Kann ich noch"
	line "etwas für Dich"
	cont "tun?"
	done

_MartBoughtText::
	text "Erhält ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " für"
	line "@"
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "."
	done

_SlotsBetHowManyCoinsText::
	text "Wie viel setzen?"
	done

_SlotsStartText::
	text "Start!"
	done

_SlotsNotEnoughCoinsText::
	text "Nicht genügend"
	line "Münzen."
	prompt

_SlotsRanOutOfCoinsText::
	text "Mist… Ich habe"
	line "keine Münzen mehr…"
	done

_SlotsPlayAgainText::
	text "Noch einmal?"
	done

_SlotsLinedUpText::
	text "Bingo!"
	line "@"
	text_ram wStringBuffer2
	text " Münzen"
	cont "gewonnen!"
	done

_SlotsDarnText::
	text "Mist!"
	done

_MobileStadiumEntryText::
	text "Daten für das"
	line "MOBILE STADION"

	para "bei #MON"
	line "STADIUM 2 auf N64"
	cont "können hier"
	cont "gelesen werden."

	para "Daten lesen?"
	done

_MobileStadiumSuccessText::
	text "Datentransfer"
	line "abgeschlossen."

	para "Wir hoffen, Du"
	line "magst die Kämpfe"

	para "im MOBILEN STADION"
	line "bei #MON"
	cont "STADIUM 2 auf N64."
	done

_MainMenuTimeUnknownText::
	text "Uhrzeit unbekannt"
	done

_DeleteSavedLoginPasswordText::
	text "Das LOG-IN-"
	line "PASSWORT löschen?"
	done

_DeletedTheLoginPasswordText::
	text "Das LOG-IN-"
	line "PASSWORT löschen?"
	done

_MobilePickThreeMonForBattleText::
	text "Wähle drei #MON"
	line "für den Kampf."
	prompt

_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " und"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Diese 3 einsetzen?"
	done

_MobileOnlyThreeMonMayEnterText::
	text "Es dürfen nur drei"
	line "#MON kämpfen."
	prompt

_MobileCardFolderIntro1Text::
	text "Im KARTENORDNER"
	line "legst Du Deine und"

	para "die KARTEN Deiner"
	line "Freunde ab."

	para "Eine KARTE enhält"
	line "Informationen wie"

	para "den Namen, die"
	line "Nummer und das"
	cont "Profil einer"
	cont "Person."
	done

_MobileCardFolderIntro2Text::
	text "Hier, Deine KARTE."

	para "Gib Deine Telefon-"
	line "nummer ein und"

	para "tausche KARTEN"
	line "mit Deinen"
	cont "Freunden."
	done

_MobileCardFolderIntro3Text::
	text "Wenn Du im Besitz"
	line "der KARTE Deines"

	para "Freundes bist,"
	line "kannst Du ihn vom"

	para "Handy im 1.Stock"
	line "in jedem #MON-"
	cont "CENTER anrufen."
	done

_MobileCardFolderIntro4Text::
	text "Um Deine KARTEN"
	line "sicher wegzulegen,"

	para "mußt Du einen"
	line "CODE für den"
	cont "KARTENORDNER"
	cont "festlegen."
	done

_MobileCardFolderAskDeleteText::
	text "Wird der KARTEN-"
	line "ORDNER gelöscht,"

	para "werden auch alle"
	line "KARTEN und der"
	cont "CODE gelöscht."

	para "Vorsicht - Ein"
	line "gelöschter KARTEN-"
	cont "ORDNER kann nicht"
	cont "wieder hergestellt"
	cont "werden."

	para "Den KARTENORDNER"
	line "löschen?"
	done

_MobileCardFolderDeleteAreYouSureText::
	text "Möchtest Du ihn"
	line "wirklich löschen?"
	done

_MobileCardFolderDeletedText::
	text "Der KARTENORDNER"
	line "wurde gelöscht."
	done

_MobileCardFolderAskOpenOldText::
	text "Es gibt einen al-"
	line "ten KARTENORDNER"
	cont "von einem anderen"
	cont "Abenteuer."

	para "Möchtest Du ihn"
	line "öffnen?"
	done

_MobileCardFolderAskDeleteOldText::
	text "Den alten KARTEN-"
	line "ORDNER löschen?"
	done

_MobileCardFolderFinishRegisteringCardsText::
	text "Ablage der KARTEN"
	line "abgeschlossen?"
	done

_PhoneWrongNumberText::
	text "Äh? Ich habe mich"
	line "verwählt!"
	done

_PhoneClickText::
	text "Klick!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "Die Nummer ist"
	line "außerhalb des"
	cont "Funknetzes."
	done

_PhoneJustTalkToThemText::
	text "Du mußt diesen"
	line "Gesprächspartner"
	cont "zu Fuß aufsuchen!"
	done

_PhoneThankYouText::
	text "Danke!"
	done

_SpaceSpaceColonText:: ; unreferenced
	text "  :"
	done

_PasswordAskResetText::
	text "Wähle Fortfahren"
	line "& verwirf die"
	cont "Einstellungen."
	prompt

_PasswordAskResetClockText::
	text "Uhr neu stellen?"
	done

_ClearAllSaveDataText::
	text "Spielstand"
	line "löschen?"
	done

_LearnedMoveText::
	text_ram wMonOrItemNameBuffer
	text " erlernt"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	text_end

	text_end ; unreferenced

_MoveAskForgetText::
	text "Welche Attacke"
	next "soll vergessen"
	cont "werden?"
	done

_StopLearningMoveText::
	text_ram wStringBuffer2
	text_start
	line "nicht erlernen?"
	done

_DidNotLearnMoveText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "hat @"
	text_ram wStringBuffer2
	text_start
	cont "nicht erlernt."
	prompt

_AskForgetMoveText::
	text_ram wMonOrItemNameBuffer
	text " "
	line "versucht,"
	cont "@"
	text_ram wStringBuffer2
	text " zu"
	cont "erlernen!"

	para "Aber @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "kann nicht mehr"
	cont "als vier Attacken"
	cont "erlernen."

	para "Soll eine andere"
	line "Attacke zugunsten"
	cont "von @"
	text_ram wStringBuffer2
	text_start
	cont "vergessen werden?"
	done

Text_MoveForgetCount::
	text "1, 2 und…@"
	text_pause
	text_end

	text_end ; unreferenced

_MoveForgotText::
	text "Schwupp!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " hat"
	line "@"
	text_ram wStringBuffer1
	text_start

	para "vergessen!"

	para "Und…"
	prompt

_MoveCantForgetHMText::
	text "VM-Attacken"
	line "können nicht"
	cont "gelöscht werden!"
	prompt

_CardFlipPlayWithThreeCoinsText::
	text "Drei Münzen set-"
	line "zen?"
	done

_CardFlipNotEnoughCoinsText::
	text "Nicht genügend"
	cont "Münzen…"
	prompt

_CardFlipChooseACardText::
	text "Zieh eine Karte."
	done

_CardFlipPlaceYourBetText::
	text "Worauf setzen?"
	done

_CardFlipPlayAgainText::
	text "Noch einmal?"
	done

_CardFlipShuffledText::
	text "Die Karten"
	line "wurden gemischt."
	prompt

_CardFlipYeahText::
	text "Yoh!"
	done

_CardFlipDarnText::
	text "Mist…"
	done

_GearTodayText::
	text_today
	text_end

	text_end ; unreferenced

_GearEllipseText::
	text "<……>"
	done

_GearOutOfServiceText::
	text "Du bist außerhalb"
	line "des Service-"
	cont "gebiets."
	prompt

_PokegearAskWhoCallText::
	text "Wen möchtest Du"
	line "anrufen?"
	done

_PokegearPressButtonText::
	text "Drücke B-KNOPF,"
	line "um abzubrechen."
	done

_PokegearAskDeleteText::
	text "Die gespeicherte"
	line "Nummer löschen?"
	done

_BuenaAskWhichPrizeText::
	text "Welchen Preis"
	line "hättest Du gerne?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "Ist das richtig?"
	done

_BuenaHereYouGoText::
	text "Und los!"
	done

_BuenaNotEnoughPointsText::
	text "Du hast nicht ge-"
	line "nügend Punkte."
	done

_BuenaNoRoomText::
	text "Du hast keinen"
	line "Platz dafür."
	done

_BuenaComeAgainText::
	text "Oh. Komme bitte"
	line "wieder!"
	done

_BTExcuseMeText::
	text "Entschuldigung!"
	done

_ExcuseMeYoureNotReadyText::
	text "Entschuldigung. Du"
	line "bist nicht bereit."
	done

_BattleTowerReturnWhenReadyText::
	text "Komme wieder, wenn"
	line "Du bereit bist."
	done

_NeedAtLeastThreeMonText::
	text "Du benötigst min-"
	line "destens 3 #MON."
	done

_EggDoesNotQualifyText::
	text "Sorry, ein EI"
	line "geht nicht durch."
	done

_OnlyThreeMonMayBeEnteredText::
	text "Nur drei #MON"
	line "sind gestattet."
	done

_TheMonMustAllBeDifferentKindsText::
	text "Die @"
	text_ram wStringBuffer2
	text " #MON"
	line "müssen unter-"
	cont "schiedlich sein."
	done

_TheMonMustNotHoldTheSameItemsText::
	text "Die @"
	text_ram wStringBuffer2
	text " #MON"
	line "dürfen nicht"
	cont "dieselben Items"
	cont "tragen."
	done

_YouCantTakeAnEggText::
	text "Du kannst kein EI"
	line "mitnehmen!"
	done

_BallDodgedText::
	text "Es weicht dem"
	line "BALL aus!"

	para "Dieses #MON"
	line "läßt sich nicht"
	cont "fangen!"
	prompt

_BallMissedText::
	text "Du hast das"
	line "#MON verfehlt!"
	prompt

_BallBrokeFreeText::
	text "Mist! Das #MON"
	line "hat sich befreit!"
	prompt

_BallAppearedCaughtText::
	text "Fast hätte es"
	line "geklappt!"
	prompt

_BallAlmostHadItText::
	text "Mist!"
	line "Das war knapp!"
	prompt

_BallSoCloseText::
	text "Verflixt! Es"
	line "hätte beinahe"
	cont "geklappt!"
	prompt

Text_BallCaught::
	text "Toll! @"
	text_ram wEnemyMonNickname
	text_start
	line "wurde gefangen!@"
	sound_caught_mon
	text_end

	text_end ; unreferenced

_WaitButtonText::
	text_promptbutton
	text_end

	text_end ; unreferenced

_BallSentToPCText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "wurde auf BILLs PC"
	cont "übertragen."
	prompt

_NewDexDataText::
	text "Für @"
	text_ram wEnemyMonNickname
	text_start
	line "wird ein neuer"
	cont "Eintrag im"
	cont "#DEX angelegt.@"
	sound_slot_machine_start
	text_promptbutton
	text_end

	text_end ; unreferenced

_AskGiveNicknameText::
	text "Möchtest Du"
	line "@"
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done

_ItemStatRoseText::
	text_ram wStringBuffer2
	text " von"
	line "@"
	text_ram wStringBuffer1
	text_start

	para "nimmt zu."
	prompt

_ItemCantUseOnMonText::
	text "Dieses #MON"
	line "kann das nicht"
	cont "einsetzen."
	prompt

_RepelUsedEarlierIsStillInEffectText::
	text "SCHUTZ wirkt"
	line "noch immer."
	prompt

_PlayedFluteText::
	text "Die #FLÖTE"
	line "wurde gespielt."

	para "Das ist ein"
	line "flotter Rhythmus!"
	prompt

_FluteWakeUpText::
	text "Alle schlafenden"
	line "#MON sind"
	cont "aufgewacht."
	prompt

Text_PlayedPokeFlute::
	text "<PLAYER> spielte"
	line "die #FLÖTE.@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_BlueCardBalanceText::
	text "Du hast jetzt"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " Punkte."
	done

_CoinCaseCountText::
	text "Münzen:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unreferenced

_RaiseThePPOfWhichMoveText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP aufgefüllt"
	cont "werden?"
	done

_RestoreThePPOfWhichMoveText::
	text "Für welche"
	line "Attacke sollen"
	cont "die AP erneuert"
	cont "werden?"
	done

_PPIsMaxedOutText::
	text_ram wStringBuffer2
	text "s AP"
	line "wurden komplett"
	cont "aufgefüllt."
	prompt

_PPsIncreasedText::
	text_ram wStringBuffer2
	text "s AP"
	line "wurden aufgefüllt."
	prompt

_PPRestoredText::
	text "AP aufgefüllt."
	prompt

_SentTrophyHomeText::
	text "Hier ist eine"
	line "Trophäe!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " hat"
	line "die Trophäe nach"
	cont "Hause gesandt."
	prompt

_ItemLooksBitterText::
	text "Das ist bitter…"
	prompt

_ItemCantUseOnEggText::
	text "Ein EI kann das"
	line "nicht benutzen."
	prompt

_ItemOakWarningText::
	text "EICH: <PLAYER>!"
	line "Es ist nicht"
	cont "an der Zeit,"
	cont "dies zu benutzen!"
	prompt

_ItemBelongsToSomeoneElseText::
	text "Das gehört nicht"
	line "Dir!"
	prompt

_ItemWontHaveEffectText::
	text "Das hätte keinen"
	line "Effekt."
	prompt

_BallBlockedText::
	text "Der Trainer hat"
	line "den BALL"
	cont "abgeblockt!"
	prompt

_BallDontBeAThiefText::
	text "Sei kein Dieb!"
	prompt

_NoCyclingText::
	text "Rad fahren ist"
	line "hier nicht"
	cont "gestattet."
	prompt

_ItemCantGetOnText::
	text_ram wStringBuffer1
	text_start
	line "kann nicht be-"
	cont "stiegen werden."
	prompt

_BallBoxFullText::
	text "Die #MON-BOX"
	line "ist voll. Das"
	cont "kannst Du jetzt"
	cont "nicht benutzen."
	prompt

_ItemUsedText::
	text "<PLAYER> setzt"
	line "@"
	text_ram wStringBuffer2
	text " ein."
	done

_ItemGotOnText::
	text "<PLAYER> stieg auf@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

_ItemGotOffText::
	text "<PLAYER> stieg von@"
	text_low
	text_ram wStringBuffer2
	text " ab."
	prompt

_KnowsMoveText::
	text_ram wStringBuffer1
	text " kennt"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "Dieses #MON"
	line "kann nur eine"
	cont "Attacke."
	done

_AskDeleteMoveText::
	text "Soll @"
	text_ram wStringBuffer1
	text_start
	line "vergessen werden?"
	done

_DeleterForgotMoveText::
	text "Dein #MON hat"
	line "die Attacke"
	cont "vergessen."
	done

_DeleterEggText::
	text "Ein EI verfügt"
	line "über keine"
	cont "Attacken!"
	done

_DeleterNoComeAgainText::
	text "Nein? Besuche mich"
	line "wieder."
	done

_DeleterAskWhichMoveText::
	text "Welche Attacke"
	line "soll vergessen"
	cont "werden?"
	prompt

_DeleterIntroText::
	text "Ähm… Oh, ja, ich"
	line "bin der ATTACKEN-"
	cont "VERLERNER."

	para "Ich verfüge über"
	line "die Fähigkeit,"
	cont "#MON ihre"
	cont "Attacken vergessen"
	cont "zu lassen."

	para "Soll ein #MON "
	line "eine Attacke"
	cont "vergessen?"
	done

_DeleterAskWhichMonText::
	text "Welches #MON?"
	prompt

_DSTIsThatOKText::
	text " SZ,"
	line "in Ordnung?"
	done

_TimeAskOkayText::
	text ","
	line "in Ordnung?"
	done

_TimesetAskDSTText::
	text "Möchtest Du auf"
	line "Sommerzeit um-"
	cont "stellen?"
	done

_TimesetDSTText::
	text "Ich stelle die Uhr"
	line "eine Stunde vor."
	prompt

_TimesetAskNotDSTText::
	text "Ist die Sommer-"
	line "zeit vorüber?"
	done

_TimesetNotDSTText::
	text "Ich stelle die Uhr"
	line "eine Stunde zu-"
	cont "rück."
	prompt

_TimesetAskAdjustDSTText::
	text "Möchtest Du die"
	line "Uhrzeit der"

	para "Sommerzeit an-"
	line "passen?"
	done

_MomLostGearBookletText::
	text "Ich habe die An-"
	line "leitung für den"
	cont "#COM verloren."

	para "Komm später noch"
	line "mal wieder."
	prompt
