_OakText6::
	text "Wie lautet dein"
	line "Name?"
	prompt

_OakText7::
	text "<PLAYER>, bist du"
	line "bereit?"

	para "Dein eigenes"
	line "#MON-Abenteuer"
	cont "erwartet dich."

	para "Dich erwarten tol-"
	line "le Dinge, aber"
	cont "auch harte Zeiten."

	para "Eine Welt voller"
	line "Träume und aufre-"
	cont "gender #MON-"

	para "Abenteuer erwar-"
	line "tet dich! Mach"
	cont "dich bereit!"

	para "Ich treffe dich"
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
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

_LinkTradeCantBattleText::
	text "If you trade that"
	line "#MON, you won't"
	cont "be able to battle."
	prompt

_LinkAbnormalMonText::
	text "Your friend's"
	line "@"
	text_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

_LinkAskTradeForText::
	text "Trade @"
	text_ram wBufferTrademonNickname
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "?"
	done

_MobileBattleMustPickThreeMonText::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done

_MobileBattleMoreInfoText::
	text "Need more info on"
	line "mobile battles?"
	done

_MobileBattleRulesText::
	text "For a mobile"
	line "battle, choose"
	cont "three #MON."

	para "The maximum daily"
	line "play time is ten"

	para "minutes for each"
	line "linked player."

	para "If a battle isn't"
	line "finished within"

	para "the time limit,"
	line "the player with"

	para "the fewest fainted"
	line "#MON wins."

	para "If tied, the team"
	line "that lost the"

	para "least amount of HP"
	line "wins."
	done

_WouldYouLikeToMobileBattleText::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

_WantAQuickMobileBattleText::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

_WantToRushThroughAMobileBattleText::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

_PleaseTryAgainTomorrowText::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

_TryAgainUsingSameSettingsText::
	text "Try again using"
	line "the same settings?"
	done

_MobileBattleLessThanOneMinuteLeftText::
	text "There is less than"
	line "1 min. left today!"
	done

_MobileBattleNoTimeLeftForLinkingText::
	text "No time left for"
	line "linking today."
	done

_PickThreeMonForMobileBattleText::
	text "Pick three #MON"
	line "for battle."
	done

_MobileBattleRemainingTimeText::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

_WouldYouLikeToSaveTheGameText::
	text "Möchtest du das"
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
	text "Immer, wenn du"
	line "ein #MON"
	cont "verschiebst, wird"
	cont "das Spiel ge-"
	cont "sichert!"
	done

_WindowAreaExceededErrorText:: ; unreferenced
	text "The window save"
	line "area was exceeded."
	done

_WindowPoppingErrorText::
	text "No windows avail-"
	line "able for popping."
	done

_CorruptedEventText:: ; unreferenced
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event"
	done

_BGEventText::
	text "BG event"
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
	text "I see all."
	line "I know all…"

	para "Certainly, I know"
	line "of your #MON!"
	done

_SeerCantTellAThingText::
	text "Whaaaat? I can't"
	line "tell a thing!"

	para "How could I not"
	line "know of this?"
	done

_SeerNameLocationText::
	text "Hm… I see you met"
	line "@"
	text_ram wSeerNickname
	text " here:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

_SeerTimeLevelText::
	text "The time was"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Its level was @"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Am I good or what?"
	prompt

_SeerTradeText::
	text "Hm… @"
	text_ram wSeerNickname
	text_start
	line "came from @"
	text_ram wSeerOT
	text_start
	cont "in a trade?"

	para "@"
	text_ram wSeerCaughtLocation
	text_start
	line "was where @"
	text_ram wSeerOT
	text_start
	cont "met @"
	text_ram wSeerNickname
	text "!"
	prompt

_SeerNoLocationText::
	text "What!? Incredible!"

	para "I don't understand"
	line "how, but it is"

	para "incredible!"
	line "You are special."

	para "I can't tell where"
	line "you met it, but it"
	cont "was at level @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Am I good or what?"
	prompt

_SeerEggText::
	text "Hey!"

	para "That's an EGG!"

	para "You can't say that"
	line "you've met it yet…"
	done

_SeerDoNothingText::
	text "Fufufu! I saw that"
	line "you'd do nothing!"
	done

_SeerMoreCareText::
	text "Incidentally…"

	para "It would be wise"
	line "to raise your"

	para "#MON with a"
	line "little more care."
	done

_SeerMoreConfidentText::
	text "Incidentally…"

	para "It seems to have"
	line "grown a little."

	para "@"
	text_ram wSeerNickname
	text " seems"
	line "to be becoming"
	cont "more confident."
	done

_SeerMuchStrengthText::
	text "Incidentally…"

	para "@"
	text_ram wSeerNickname
	text " has"
	line "grown. It's gained"
	cont "much strength."
	done

_SeerMightyText::
	text "Incidentally…"

	para "It certainly has"
	line "grown mighty!"

	para "This @"
	text_ram wSeerNickname
	text_start
	line "must have come"

	para "through numerous"
	line "#MON battles."

	para "It looks brimming"
	line "with confidence."
	done

_SeerImpressedText::
	text "Incidentally…"

	para "I'm impressed by"
	line "your dedication."

	para "It's been a long"
	line "time since I've"

	para "seen a #MON as"
	line "mighty as this"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "I'm sure that"
	line "seeing @"
	text_ram wSeerNickname
	text_start

	para "in battle would"
	line "excite anyone."
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
    text "Hiya, I'm the"
    line "EGG-MOVE TUTOR!"

    para "I can teach your"
    line "#MON moves they"

    para "can normally only"
    line "learn as an EGG."

	para "Are you"
    line "interested?"
    done

_MoveReminderIntro::
    text "Hiya, I'm the"
    line "MOVE REMINDER!"

    para "I can make #MON"
    line "rememember moves"

    para "that they learned"
    line "while growing up."

	para "Shall I make a"
	line "#MON remember?"
    done

_MoveReminderWhichMon::
    text "Which #MON"
    next "would you like"

    para "to make remember"
    line "a move?"
    done

_MoveReminderWhichMove::
    text "Which move should"
    line "it learn?"
    done

_MoveReminderCancel::
    text "Come back anytime."
    done

_MoveReminderEgg::
    text "Hey! What am I"
    line "supposed to teach"
    cont "an EGG?"
    done

_MoveReminderNoMon::
    text "You don't have a"
    line "#MON that can"
    cont "remember a move."
    done

_MoveReminderNoMoves::
    text "There are no moves"
    line "for this #MON"
    cont "to learn."
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
	text "Hello, dear."

	para "I sell rare and"
	line "valuable stones."

	para "They've been known"
	line "to make #MON"
	cont "change forms."

	para "Hehehehe…"
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
	text "Danke, Kleiner."
	line "Hihihihi…"
	done

_HerbalLadyPackFullText::
	text "Oh? In deinem"
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
	text "Heh! Bist du an"
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
	text "Uhh, dein BEUTEL"
	line "platzt aus"
	cont "allen Nähten."
	done

_BargainShopSoldOutText::
	text "Das hast du schon"
	line "gekauft. Ich"
	cont "habe keines mehr."
	done

_BargainShopNoFundsText::
	text "Uhh, du bist knapp"
	line "bei Kasse."
	done

_BargainShopComeAgainText::
	text "Schau mal"
	line "wieder vorbei."
	done

_PharmacyIntroText::
	text "Was ist? Brauchst"
	line "du Medizin?"
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
	text "Ich zahle dir"
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
	text "Ich kann dir das"
	line "nicht abkaufen."
	prompt

_MartComeAgainText::
	text "Komm wieder!"
	done

_MartAskMoreText::
	text "Kann ich noch"
	line "etwas für dich"
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
	text "Bet how many"
	line "coins?"
	done

_SlotsStartText::
	text "Start!"
	done

_SlotsNotEnoughCoinsText::
	text "Not enough"
	line "coins."
	prompt

_SlotsRanOutOfCoinsText::
	text "Darn… Ran out of"
	line "coins…"
	done

_SlotsPlayAgainText::
	text "Play again?"
	done

_SlotsLinedUpText::
	text "lined up!"
	line "Won @"
	text_ram wStringBuffer2
	text " coins!"
	done

_SlotsDarnText::
	text "Darn!"
	done

_MobileStadiumEntryText::
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #MON"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "MOBILE STADIUM"

	para "battles in the N64"
	line "#MON STADIUM 2."

	para ""
	done

_MainMenuTimeUnknownText::
	text "Uhrzeit unbekannt"
	done

_DeleteSavedLoginPasswordText::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

_DeletedTheLoginPasswordText::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

_MobilePickThreeMonForBattleText::
	text "Pick three #MON"
	line "for battle."
	prompt

_MobileUseTheseThreeMonText::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " and"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Use these three?"
	done

_MobileOnlyThreeMonMayEnterText::
	text "Only three #MON"
	line "may enter."
	prompt

_MobileCardFolderIntro1Text::
	text "The CARD FOLDER"
	line "stores your and"

	para "your friends'"
	line "CARDS."

	para "A CARD contains"
	line "information like"

	para "the person's name,"
	line "phone number and"
	cont "profile."

	para ""
	done

_MobileCardFolderIntro2Text::
	text "This is your CARD."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade CARDS with"
	cont "your friends."

	para ""
	done

_MobileCardFolderIntro3Text::
	text "If you have your"
	line "friend's CARD, you"

	para "can use it to make"
	line "a call from a"

	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#MON CENTER."

	para ""
	done

_MobileCardFolderIntro4Text::
	text "To safely store"
	line "your collection of"

	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."

	para ""
	done

_MobileCardFolderAskDeleteText::
	text "If the CARD FOLDER"
	line "is deleted, all"

	para "its CARDS and the"
	line "PASSCODE will also"
	cont "be deleted."

	para "Beware--a deleted"
	line "CARD FOLDER can't"
	cont "be restored."

	para "Want to delete"
	line "your CARD FOLDER?"
	done

_MobileCardFolderDeleteAreYouSureText::
	text "Are you sure you"
	line "want to delete it?"
	done

_MobileCardFolderDeletedText::
	text "The CARD FOLDER"
	line "has been deleted."

	para ""
	done

_MobileCardFolderAskOpenOldText::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

_MobileCardFolderAskDeleteOldText::
	text "Delete the old"
	line "CARD FOLDER?"
	done

_MobileCardFolderFinishRegisteringCardsText::
	text "Finish registering"
	line "CARDS?"
	done

_PhoneWrongNumberText::
	text "Huh? Sorry, wrong"
	line "number!"
	done

_PhoneClickText::
	text "Click!"
	done

_PhoneEllipseText::
	text "<……>"
	done

_PhoneOutOfAreaText::
	text "That number is out"
	line "of the area."
	done

_PhoneJustTalkToThemText::
	text "Just go talk to"
	line "that person!"
	done

_PhoneThankYouText::
	text "Thank you!"
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
	text "Play with three"
	line "coins?"
	done

_CardFlipNotEnoughCoinsText::
	text "Not enough coins…"
	prompt

_CardFlipChooseACardText::
	text "Choose a card."
	done

_CardFlipPlaceYourBetText::
	text "Place your bet."
	done

_CardFlipPlayAgainText::
	text "Want to play"
	line "again?"
	done

_CardFlipShuffledText::
	text "The cards have"
	line "been shuffled."
	prompt

_CardFlipYeahText::
	text "Yeah!"
	done

_CardFlipDarnText::
	text "Darn…"
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
	text "Wen möchtest du"
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
	line "hättest du gerne?"
	done

_BuenaIsThatRightText::
	text_ram wStringBuffer1
	text "?"
	line "Ist das richtig?"
	done

_BuenaHereYouGoText::
	text "Und los!"

	para ""
	done

_BuenaNotEnoughPointsText::
	text "Du hast nicht ge-"
	line "nügend Punkte."

	para ""
	done

_BuenaNoRoomText::
	text "Du hast keinen"
	line "Platz dafür."

	para ""
	done

_BuenaComeAgainText::
	text "Oh. Komme bitte"
	line "wieder!"
	done

_BTExcuseMeText::
	text "Excuse me!"

	para ""
	done

_ExcuseMeYoureNotReadyText::
	text "Excuse me."
	line "You're not ready."

	para ""
	done

_BattleTowerReturnWhenReadyText::
	text "Please return when"
	line "you're ready."
	done

_NeedAtLeastThreeMonText::
	text "You need at least"
	line "three #MON."

	para ""
	done

_EggDoesNotQualifyText::
	text "Sorry, an EGG"
	line "doesn't qualify."

	para ""
	done

_OnlyThreeMonMayBeEnteredText::
	text "Only three #MON"
	line "may be entered."

	para ""
	done

_TheMonMustAllBeDifferentKindsText::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must all be"
	cont "different kinds."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "The @"
	text_ram wStringBuffer2
	text " #MON"
	line "must not hold the"
	cont "same items."

	para ""
	done

_YouCantTakeAnEggText::
	text "You can't take an"
	line "EGG!"

	para ""
	done

_BallDodgedText::
	text "Es weicht dem"
	line "BALL aus!"

	para "Dieses #MON"
	line "lässt sich nicht"
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
	text "Möchtest du"
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
	line "dir!"
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
	cont "kannst du jetzt"
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
	text " knows"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_MoveKnowsOneText::
	text "That #MON knows"
	line "only one move."
	done

_AskDeleteMoveText::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_DeleterForgotMoveText::
	text "Done! Your #MON"
	line "forgot the move."
	done

_DeleterEggText::
	text "An EGG doesn't"
	line "know any moves!"
	done

_DeleterNoComeAgainText::
	text "No? Come visit me"
	line "again."
	done

_DeleterAskWhichMoveText::
	text "Which move should"
	line "it forget, then?"
	prompt

_DeleterIntroText::
	text "Um… Oh, yes, I'm"
	line "the MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done

_DeleterAskWhichMonText::
	text "Which #MON?"
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
	text "Möchtest du auf"
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
	text "Möchtest du die"
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