_NoPhotoText::
	text "Oh, no picture?"
	line "Come again, OK?"
	done

_EggPhotoText::
	text "An EGG? My talent"
	line "is worth more…"
	done

_NameRaterHelloText::
	text "Hello, hello! I'm"
	line "the NAME RATER."

	para "I rate the names"
	line "of #MON."

	para "Would you like me"
	line "to rate names?"
	done

_NameRaterWhichMonText::
	text "Which #MON's"
	line "nickname should I"
	cont "rate for you?"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, how about a"
	line "slightly better"
	cont "nickname?"

	para "Want me to give it"
	line "a better name?"
	done

_NameRaterWhatNameText::
	text "All right. What"
	line "name should we"
	cont "give it, then?"
	prompt

_NameRaterFinishedText::
	text "That's a better"
	line "name than before!"

	para "Well done!"
	done

_NameRaterComeAgainText::
	text "OK, then. Come"
	line "again sometime."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_ram wStringBuffer1
	text_start
	line "with loving care."
	done

_NameRaterEggText::
	text "Whoa… That's just"
	line "an EGG."
	done

_NameRaterSameNameText::
	text "It might look the"
	line "same as before,"

	para "but this new name"
	line "is much better!"

	para "Well done!"
	done

_NameRaterNamedText::
	text "All right. This"
	line "#MON is now"
	cont "named @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " erhält@"
	text_end

_BoostedExpPointsText::
	text_start
	line "spezielle"
	cont "@"
	text_decimal wStringBuffer2, 2, 5
	text " EP!"
	prompt

_ExpPointsText::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 5
	text " EP!"
	prompt

_GoMonText::
	text "Los! @"
	text_end

_DoItMonText::
	text "Los! @"
	text_end

_GoForItMonText::
	text "Los,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "Mach es fertig!"
	line "Los, @"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNickname
	text "!"
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " genug!"
	line "Komm zurück!@"
	text_end

_OKComeBackText::
	text " O.K.!"
	line "Komm zurück!@"
	text_end

_GoodComeBackText::
	text " super!"
	line "Komm zurück!@"
	text_end

_ComeBackText::
	text " komm"
	line "zurück!"
	done

_BootedTMText::
	text "TM aktiviert."
	prompt

_BootedHMText::
	text "VM aktiviert."
	prompt

_ContainedMoveText::
	text "Sie enthält"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "@"
	text_ram wStringBuffer2
	text_start
	line "einem #MON"
	cont "beibringen?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " ist"
	line "nicht kompatibel"
	cont "mit @"
	text_ram wStringBuffer1
	text "."

	para "Es kann"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "nicht erlernen."
	prompt

_NoRoomTMHMText::
	text "Du hast keinen"
	line "Platz mehr für:"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

_ReceivedTMHMText::
	text "Du erhältst"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_MysteryGiftCanceledText::
	text "The link has been"
	line "cancelled."
	prompt

_MysteryGiftCommErrorText::
	text "Communication"
	line "error."
	prompt

_RetrieveMysteryGiftText::
	text "Must retrieve GIFT"
	line "at #MON CENTER."
	prompt

_YourFriendIsNotReadyText::
	text "Your friend isn't"
	line "ready."
	prompt

_MysteryGiftFiveADayText::
	text "Sorry--only five"
	line "GIFTS a day."
	prompt

_MysteryGiftOneADayText::
	text "Sorry. One GIFT"
	line "a day per person."
	prompt

_MysteryGiftSentText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MysteryGiftSentHomeText::
	text_ram wMysteryGiftPartnerName
	text " sent"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "to @"
	text_ram wMysteryGiftPlayerName
	text "'s home."
	prompt

_NameCardReceivedCardText::
	text "Received"
	line "@"
	text_ram wMysteryGiftCardHolderName
	text "'s CARD."
	prompt

_NameCardListedCardText::
	text_ram wMysteryGiftCardHolderName
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wTextDecimalByte, 1, 2
	text "."
	prompt

_NameCardNotRegisteredCardText::
	text "The CARD was not"
	line "registered."
	prompt

_NameCardLinkCancelledText::
	text "The link has been"
	line "cancelled."
	prompt

_NameCardLinkCommErrorText::
	text "Communication"
	line "error."
	prompt

_BadgeRequiredText::
	text "Du benötigst einen"
	line "neuen ORDEN."
	prompt

_CantUseItemText::
	text "Du kannst das hier"
	line "nicht benutzen."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text " setzt"
	line "den ZERSCHNEIDER"
	cont "ein!"
	prompt

_CutNothingText::
	text "Hier kann"
	line "man nichts"
	cont "zerschneiden."
	prompt

_BlindingFlashText::
	text "Ein gleißender"
	line "BLITZ erhellt"
	cont "das Gebiet!@"
	text_promptbutton
	text_end

	text_end ; unreferenced

_UsedSurfText::
	text_ram wStringBuffer2
	text " setzt"
	line "SURFER ein!"
	done

_CantSurfText::
	text "SURFER kann hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt

_AlreadySurfingText::
	text "SURFER ist bereits"
	line "eingesetzt."
	prompt

_AskSurfText::
	text "Die See ist ruhig."
	line "Möchtest du SURFER"
	cont "einsetzen?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " setzt"
	line "KASKADE ein!"
	done

_HugeWaterfallText::
	text "Wow, das ist ein"
	line "großer Wasserfall."
	done

_AskWaterfallText::
	text "Möchtest du"
	line "KASKADE einsetzen?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " setzt"
	line "SCHAUFLER ein!"
	done

_UseEscapeRopeText::
	text "<PLAYER> setzt"
	line "FLUCHTSEIL ein."
	done

_CantUseDigText::
	text "Das kann hier"
	line "nicht eingesetzt"
	cont "werden."
	done

_TeleportReturnText::
	text "Bringt dich zum"
	line "letzten #MON-"
	cont "CENTER."
	done

_CantUseTeleportText::
	text "Das kann hier"
	line "nicht eingesetzt"
	cont "werden."
	prompt

_AlreadyUsingStrengthText::
	text "Ein #MON setzt"
	line "bereits STÄRKE"
	cont "ein."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " setzt"
	line "STÄRKE ein!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " kann"
	line "Felsen bewegen."
	prompt

_AskStrengthText::
	text "Ein #MON könnte"
	line "das vielleicht"
	cont "bewegen."

	para "Möchtest du STÄRKE"
	line "einsetzen?"
	done

_BouldersMoveText::
	text "Du kannst jetzt"
	line "Felsen bewegen!"
	done

_BouldersMayMoveText::
	text "Ein #MON könnte"
	line "das vielleicht"
	cont "bewegen."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " setzt"
	line "WHIRLPOOL ein!"
	prompt

_MayPassWhirlpoolText::
	text "Das ist ein"
	line "teuflischer"
	cont "Strudel!"

	para "Ein #MON könnte"
	line "den Strudel"
	cont "durchqueren."
	done

_AskWhirlpoolText::
	text "Ein Strudel ist"
	line "im Weg."

	para "Möchtest du"
	line "WHIRLPOOL"
	cont "einsetzen?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " setzt"
	line "KOPFNUSS ein!"
	prompt

_HeadbuttNothingText::
	text "Nein. Nichts…"
	done

_AskHeadbuttText::
	text "Vielleicht steckt"
	line "ein #MON in"
	cont "diesem Baum."

	para "Möchtest du KOPF-"
	line "NUSS einsetzen?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " setzt"
	line "ZERTRÜMMERER ein!"
	prompt

_MaySmashText::
	text "Ein #MON könnte"
	line "ihn vielleicht"
	cont "zerschmettern."
	done

_AskRockSmashText::
	text "Dieser Fels sieht"
	line "zerbrechlich aus."

	para "Soll ZERTRÜMMERER"
	line "eingesetzt werden?"
	done

_RodBiteText::
	text "Uah!"
	line "Da hat etwas"
	cont "angebissen!"
	prompt

_RodNothingText::
	text "Nicht einmal"
	line "angeknabbert!"
	prompt

_UnusedNothingHereText::
	text "Hier scheint"
	line "nichts zu sein."
	prompt

_CantGetOffBikeText::
	text "Du kannst hier"
	line "nicht absteigen!"
	done

_GotOnBikeText::
	text "<PLAYER> steigt"
	line "aufs @"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> steigt von"
	line "@"
	text_ram wStringBuffer2
	text " ab."
	done

_AskCutText::
	text "Du kannst den"
	line "ZERSCHNEIDER hier"
	cont "einsetzen!"

	para "Möchtest du den"
	line "ZERSCHNEIDER"

	para "einsetzen?"
	done

_CanCutText::
	text "Der ZERSCHNEIDER"
	line "kann hier"
	cont "eingesetzt werden!"
	done

_FoundItemText::
	text "<PLAYER> findet"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "<PLAYER> kann keine"
	line "weiteren Items"
	cont "mehr tragen!"
	done

_WhitedOutText::
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#MON mehr!"

	para "<PLAYER> fällt"
	line "in Ohnmacht!"
	done

_ItemfinderItemNearbyText::
	text "Der DETEKTOR zeigt"
	line "dir an, dass ein"
	cont "Item in der Nähe"
	cont "ist."
	prompt

_ItemfinderNopeText::
	text "Der DETEKTOR"
	line "reagiert nicht."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "wurde besiegt!"
	prompt

_PoisonWhiteoutText::
	text "<PLAYER> hat kein"
	line "kampffähiges"
	cont "#MON mehr!"

	para "<PLAYER> wird"
	line "ohnmächtig!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text_start
	line "ben. LOCKDUFT!"
	done

_SweetScentNothingText::
	text "Hier ist wohl"
	line "nichts…"
	done

_SquirtbottleNothingText::
	text "<PLAYER>"
	line "verspritzt Wasser."

	para "Nichts geschieht…"
	done

_UseSacredAshText::
	text "Die #MON"
	line "von <PLAYER>"
	cont "wurden geheilt!"
	done

_AnEggCantHoldAnItemText::
	text "Ein EI kann kein"
	line "Item tragen."
	prompt

_PackNoItemText::
	text "Keine Items."
	done

_AskThrowAwayText::
	text "Wie viele"
	line "wegwerfen?"
	done

_AskQuantityThrowAwayText::
	text "Wegwerfen?"
	line "@"
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "?"
	done

_ThrewAwayText::
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "weggeworfen."
	prompt

_OakThisIsntTheTimeText::
	text "EICH: <PLAYER>!"
	line "Es ist noch nicht"
	cont "an der Zeit, dies"
	cont "zu benutzen!"
	prompt

_YouDontHaveAMonText::
	text "Du hast kein"
	line "#MON!"
	prompt

_RegisteredItemText::
	text_ram wStringBuffer2
	text_start
	line "eingetragen."
	prompt

_CantRegisterText::
	text "Du kannst dieses"
	line "Item nicht"
	cont "eintragen."
	prompt

_AskItemMoveText::
	text "Wo soll das"
	line "hin?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "Du kannst das"
	line "im Kampf nicht"
	cont "benutzen."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Bist du ein Junge?"
	line "Oder ein Mädchen?"
	done

_SelectDifficultyText::
	text "Wähle den Schwie-"
	line "rigkeitsgrad."
	done

_SelectDifficultyNormalText::
	text "Bist du sicher?"

	para "Klassische"
	line "#MON-Regeln."
	done

_SelectDifficultyHardText::
	text "Bist du sicher?"

	para "Kampfstil FOLGEND,"
	line "keine Items im"
	cont "Kampf und Level-"
	cont "grenzen je ARENA."
	done

_SelectDifficultyHardcoreText::
	text "Bist du sicher?"

	para "Wie SCHWER, aber"
	line "#MON können"
	cont "nicht wieder-"
	cont "belebt werden."

	para "Bei einer Nieder-"
	line "lage wird der"
	cont "letzte Spielstand"
	cont "geladen."
	done

Text_BattleEffectActivate::
	text "<USER>s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>steigt stark!"
	prompt

_BattleStatWentUpText::
	text " steigt!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>s"
	line "@"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>sinkt stark!"
	prompt

_BattleStatFellText::
	text " sinkt!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "erzeugt einen"
	cont "Wirbelwind!"
	prompt

_BattleTookSunlightText::
	text_start
	line "badet im Licht!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "duckt sich!"
	prompt

_BattleGlowingText::
	text_start
	line "leuchtet!"
	prompt

_BattleFlewText::
	text_start
	line "fliegt empor!"
	prompt

_BattleDugText::
	text_start
	line "gräbt ein Loch!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "ben. @"
	text_end

_UsedMove2Text::
	text_start
	line "ben. @"
	text_end

_UsedInsteadText::
	text "stattdessen"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BreedHuh::
	text "Huh?"

	para "@"
	text_end

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " came"
	line "out of its EGG!@"
	sound_caught_mon
	text_promptbutton
	text_end

	text_end ; unreferenced

_BreedAskNicknameText::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "It's @"
	text_ram wBreedMon2Nickname
	text_start
	line "that was left with"
	cont "the DAY-CARE LADY."
	done

_LeftWithDayCareManText::
	text "It's @"
	text_ram wBreedMon1Nickname
	text_start
	line "that was left with"
	cont "the DAY-CARE MAN."
	done

_BreedBrimmingWithEnergyText::
	text "It's brimming with"
	line "energy."
	prompt

_BreedNoInterestText::
	text "It has no interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "It appears to care"
	line "for @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "It's friendly with"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "It shows interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Hier sind keine"
	line "BRIEFE."
	prompt

_MailClearedPutAwayText::
	text "Der leere BRIEF"
	line "wurde eingesteckt."
	prompt

_MailPackFullText::
	text "Dein BEUTEL"
	line "ist voll."
	prompt

_MailMessageLostText::
	text "Soll der Inhalt"
	line "des BRIEFes"
	cont "gelöscht werden?"
	done

_MailAlreadyHoldingItemText::
	text "Es hat schon"
	line "ein Item."
	prompt

_MailEggText::
	text "Du kannst einem EI"
	line "keinen BRIEF"
	cont "geben."
	prompt

_MailMovedFromBoxText::
	text "Der BRIEF wurde"
	line "aus dem BRIEF-"
	cont "KASTEN gelöscht."
	prompt

_YesPromptText:: ; unreferenced
	text "Yes"
	prompt

_NoPromptText:: ; unreferenced
	text "No"
	prompt

_AnimationTypeText:: ; unreferenced
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Animation type @"
	text_ram wStringBuffer2
	text_end

	text_end ; unreferenced

_MonNumberText:: ; unreferenced
	text "#MON number?"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text_start
	line "wurde auf Bills PC"
	cont "übertragen."
	prompt

_PCGottaHavePokemonText::
	text "Du benötigst"
	line "#MON!"
	prompt

_PCWhatText::
	text "Was?"
	done

_PCMonHoldingMailText::
	text "Es gibt #MON,"
	line "die einen"
	cont "BRIEF tragen."

	para "Entferne den"
	line "BRIEF."
	prompt

_PCNoSingleMonText::
	text "Du hast kein"
	line "#MON mehr!"
	prompt

_PCCantDepositLastMonText::
	text "Du kannst das"
	line "letzte #MON"
	cont "nicht ablegen!"
	prompt

_PCCantTakeText::
	text "Du kannst keine"
	line "weiteren #MON"
	cont "mehr mitnehmen."
	prompt

_ContestCaughtMonText::
	text "Caught @"
	text_ram wStringBuffer1
	text "!"
	prompt

_ContestAskSwitchText::
	text "Switch #MON?"
	done

_ContestAlreadyCaughtText::
	text "You already caught"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "The winning score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Placing second was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

_MagikarpGuruMeasureText::
	text "Let me measure"
	line "that MAGIKARP."

	para "…Hm, it measures"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_KarpGuruRecordText::
	text "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1
	text " caught by"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	text_end

	text_end ; unreferenced

_LuckyNumberMatchPartyText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your party."
	prompt

_LuckyNumberMatchPCText::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your PC BOX."
	prompt

_CaughtAskNicknameText::
	text "Möchtest du"
	line "@"
	text_ram wStringBuffer1
	text " einen"
	cont "Spitznamen geben?"
	done

_PokecenterPCCantUseText::
	text "Dies kann nur"
	line "ein #MON"
	cont "benutzen!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_PlayersPCAskWhatDoText::
	text "Was möchtest du"
	line "tun?"
	done

_PlayersPCHowManyWithdrawText::
	text "Wie viele möchtest"
	line "du mitnehmen?"
	done

_PlayersPCWithdrewItemsText::
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "wurde mitgenommen."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr tragen."
	prompt

_PlayersPCNoItemsText::
	text "Du trägst keine"
	line "Items!"
	prompt

_PlayersPCHowManyDepositText::
	text "Wie viele möchtest"
	line "du ablegen?"
	done

_PlayersPCDepositItemsText::
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text_start
	line "wurde abgelegt."
	prompt

_PlayersPCNoRoomDepositText::
	text "Es ist kein Platz"
	line "für weitere Items."
	prompt

_TooImportantToDepositText::
	text "Dieses Item ist"
	line "zu wichtig! Du"
	cont "kannst es nicht"
	cont "ablegen!"
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> schaltet"
	line "den PC ein."
	prompt

_PokecenterPCWhoseText::
	text "Zugriff auf"
	line "wessen PC?"
	done

_PokecenterBillsPCText::
	text "Die Verbindung zu"
	line "BILLs PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das #MON-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_PokecenterPlayersPCText::
	text "Die Verbindung zu"
	line "deinem PC wurde"
	cont "hergestellt."

	para "Du hast Zugriff"
	line "auf das ITEM-"
	cont "LAGERUNGS-SYSTEM."
	prompt

_PokecenterOaksPCText::
	text "Die Verbindung zu"
	line "PROF. EICHs PC"
	cont "wurde hergestellt."

	para "Du hast Zugriff"
	line "auf die #DEX-"
	cont "BEWERTUNG."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Verbindung"
	cont "beendet…"
	done

_OakPCText1::
	text "Soll dein #DEX"
	line "bewertet werden?"
	done

_OakPCText2::
	text "In deinem #DEX"
	line "steht:"
	prompt

_OakPCText3::
	text "Ges.: @"
	text_ram wStringBuffer3
	text " #MON"
	line "Bes.: @"
	text_ram wStringBuffer4
	text " #MON"

	para "PROF. EICHs"
	line "Bewertung:"
	done

_OakRating01::
	text "Suche in"
	line "hohem Gras nach"
	cont "#MON!"
	done

_OakRating02::
	text "Gut. Ich sehe, du"
	line "kannst mit #-"
	cont "BÄLLEN umgehen."
	done

_OakRating03::
	text "Du wirst immer"
	line "besser, hast aber"

	para "noch einen langen"
	line "Weg vor dir."
	done

_OakRating04::
	text "Vervollständige"
	line "den #DEX. Fange"

	para "alle Typen von"
	line "#MON!"
	done

_OakRating05::
	text "Du gibst dir Mühe."
	line "Dein #DEX"

	para "wird immer"
	line "besser."
	done

_OakRating06::
	text "Manche #MON"
	line "entwickeln sich"

	para "durch Level,"
	line "andere benötigen"
	cont "STEINE."
	done

_OakRating07::
	text "Hast du eine"
	line "ANGEL? Du"

	para "kannst damit"
	line "#MON fangen."
	done

_OakRating08::
	text "Sehr gut! Sammeln"
	line "scheint dir Spaß"
	cont "zu machen!"
	done

_OakRating09::
	text "Du kannst manchen"
	line "#MON nur zu"

	para "gewissen Tages-"
	line "zeiten begegnen."
	done

_OakRating10::
	text "Es wird immer"
	line "besser. Mach"
	cont "weiter so!"
	done

_OakRating11::
	text "Beeindruckend."
	line "Du fängst nicht"

	para "nur #MON, du"
	line "trainierst sie"
	cont "auch."
	done

_OakRating12::
	text "Hast du KURT schon"
	line "getroffen? Seine"
	cont "handgefertigten"
	cont "#BÄLLE werden"
	cont "dir helfen."
	done

_OakRating13::
	text "Wow. Du hast mehr"
	line "#MON entdeckt,"

	para "als die letzte"
	line "#DEX-For-"
	cont "schungsgruppe."
	done

_OakRating14::
	text "Tauschst du deine"
	line "#MON?"

	para "Alleine ist das"
	line "sehr schwierig!"
	done

_OakRating15::
	text "Wow! Die 200-Marke"
	line "ist erreicht! Dein"
	cont "#DEX sieht"
	cont "großartig aus!"
	done

_OakRating16::
	text "Du hast so viele"
	line "#MON gefunden!"

	para "Du hast mir damit"
	line "sehr geholfen!"
	done

_OakRating17::
	text "Fantastisch! Du"
	line "könntest auch ein"

	para "#MON-Professor"
	line "werden!"
	done

_OakRating18::
	text "Dein #DEX ist"
	line "Wahnsinn! Du"

	para "wirst noch zu"
	line "einem Profi!"
	done

_OakRating19::
	text "Boah! Der perfekte"
	line "#DEX! Davon"

	para "habe ich immer"
	line "geträumt!"
	cont "Gratulation!"
	done

_OakPCText4::
	text "Die Verbindung zu"
	line "PROF. EICHs PC"
	cont "wurde getrennt."
	done

_TrainerRankingExplanationText:: ; unreferenced
	text "Triple-theme"
	line "trainer ranking!"

	para "The SAVE file you"
	line "just sent might"
	cont "make the rankings!"

	para ""
	done

_TrainerRankingNoDataText:: ; unreferenced
	text "There is no"
	line "ranking data."

	para "Link to obtain"
	line "ranking data."

	para ""
	done

_MemoryGameYeahText::
	text " , yeah!"
	done

_MemoryGameDarnText::
	text "Darn…"
	done

_StartMenuContestEndText::
	text "Möchtest du den"
	line "Wettkampf beenden?"
	done

_ItemsTossOutHowManyText::
	text "Wie viele"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "wegwerfen?"
	done

_ItemsThrowAwayText::
	text "Wegwerfen"
	line "@"
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer2
	text "?"
	done

_ItemsDiscardedText::
	text_decimal wItemQuantityChange, 1, 2
	text " x @"
	text_ram wStringBuffer1
	text_start
	line "wurde weggeworfen."
	prompt

_ItemsTooImportantText::
	text "Dieses Item ist"
	line "zu wichtig! Du"
	cont "kannst es nicht"
	cont "wegwerfen!"
	prompt

_ItemsOakWarningText::
	text "EICH: <PLAYER>!"
	line "Es ist noch nicht"
	cont "an der Zeit, dies"
	cont "zu benutzen."
	done

_PokemonSwapItemText::
	text "Nimmt @"
	text_ram wStringBuffer1
	text_start
	line "von @"
	text_ram wMonOrItemNameBuffer
	text_start

	para "und gibt ihm"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Gibt @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Entferne zuerst"
	line "den BRIEF."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text_start
	line "trägt kein Item."
	prompt

_ItemStorageFullText::
	text "Du kannst keine"
	line "weiteren Items"
	cont "mehr lagern."
	prompt

_PokemonTookItemText::
	text "Nimmt @"
	text_ram wStringBuffer1
	text_start
	line "von @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " hält"
	line "schon das Item"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Items wechseln?"
	done

_ItemCantHeldText::
	text "Du kannst dieses"
	line "Item keinem"
	cont "#MON geben."
	prompt

_MailLoseMessageText::
	text "Der Inhalt des"
	line "BRIEFes wird"
	cont "gelöscht"
	cont "Einverstanden?"
	done

_MailDetachedText::
	text "BRIEF entfernt von"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "Es ist nicht"
	line "genügend Platz"
	cont "für entfernte"
	cont "BRIEFE."
	prompt

_MailAskSendToPCText::
	text "Den entfernten"
	line "BRIEF auf deinen"
	cont "PC übertragen?"
	done

_MailboxFullText::
	text "Du kannst keine"
	line "weiteren BRIEFE"
	cont "auf deinen PC"
	cont "übertragen."
	prompt

_MailSentToPCText::
	text "Der BRIEF wurde"
	line "auf deinen PC"
	cont "übertragen."
	prompt

_PokemonNotEnoughHPText::
	text "Nicht genügend KP!"
	prompt

_MayRegisterItemText::
	text "Ein Item aus"
	line "deinem BEUTEL"

	para "kann auf"
	line "SELECT"
	cont "gelegt werden."
	done

_OakText1::
	text "Hi! Entschuldige"
	line "die Verspätung!"

	para "Willkommen in der"
	line "Welt der #MON!"

	para "Mein Name ist"
	line "EICH!"
	cont "Man nennt mich"

	para "den #MON-"
	line "PROFESSOR."
	prompt

_OakText2::
	text "Diese Welt wird"
	line "von Wesen"
	cont "bewohnt, die man"
	cont "#MON nennt.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

	text_end ; unreferenced

_OakText4::
	text "Menschen und"
	line "#MON leben"

	para "zusammen und"
	line "helfen einander."

	para "Für manche Leute"
	line "sind #MON"
	cont "Haustiere, andere"
	cont "tragen Kämpfe mit"
	cont "ihnen aus."
	prompt

_OakText5::
	text "Leider wissen wir"
	line "noch nicht alles"
	cont "über #MON."

	para "Es gibt noch"
	line "viele Geheimnisse"
	cont "zu lüften."

	para "Darum studiere"
	line "ich #MON"
	cont "tagaus, tagein!"
	prompt
