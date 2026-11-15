_FruitBearingTreeText::
	text "Es ist ein"
	line "Obstbaum."
	done

_HeyItsFruitText::
	text "Hey! Das ist eine"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text_ram wStringBuffer3
	text_start
	line "erhalten!"
	done

_FruitPackIsFullText::
	text "Aber der BEUTEL"
	line "ist voll…"
	done

_NothingHereText::
	text "Hier ist"
	line "nichts…"
	done

_WhichApricornText::
	text "Which APRICORN"
	line "should I use?"
	done

_HowManyShouldIMakeText::
	text "How many should I"
	line "make?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "erhält @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text " KP!"
	done

_CuredOfPoisonText::
	text "Die Vergiftung von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde geheilt."
	done

_RidOfParalysisText::
	text "Die Paralyse von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde aufgehoben."
	done

_BurnWasHealedText::
	text "Verbrennung von"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "wurde geheilt."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "wurde aufgetaut."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "ist aufgewacht."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text_start
	line "ist wieder fit."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "ist wieder fit."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " er-"
	line "reicht Level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

	text_end ; unreferenced

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " kommt"
	line "wieder zu sich."
	done

_EnterNewPasscodeText::
	text "Please enter any"
	line "four-digit number."
	done

_ConfirmPasscodeText::
	text "Enter the same"
	line "number to confirm."
	done

_PasscodesNotSameText::
	text "That's not the"
	line "same number."
	done

_PasscodeSetText::
	text "Your PASSCODE has"
	line "been set."

	para "Enter this number"
	line "next time to open"
	cont "the CARD FOLDER."

	para ""
	done

_FourZerosInvalidText::
	text "0000 is invalid!"

	para ""
	done

_EnterPasscodeText::
	text "Enter the CARD"
	next "FOLDER PASSCODE."
	done

_IncorrectPasscodeText::
	text "Incorrect"
	line "PASSCODE!"

	para ""
	done

_CardFolderOpenText::
	text "CARD FOLDER open.@"
	text_end

_OakTimeWokeUpText::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz… Hm? Was…?"
	line "Du hast mich auf-"
	cont "geweckt. Kannst du"

	para "mir sagen, wie"
	line "spät es ist?"
	prompt

_OakTimeWhatTimeIsItText::
	text "Wie spät ist es?"
	done

_OakTimeWhatHoursText::
	text "Was?@"
	text_end

_OakTimeHoursQuestionMarkText::
	text "?"
	done

_OakTimeHowManyMinutesText::
	text "Wie viele Minuten?"
	done

_OakTimeWhoaMinutesText::
	text "Wow!@"
	text_end

_OakTimeMinutesQuestionMarkText::
	text "?"
	done

_OakTimeOversleptText::
	text "!"
	line "Ich habe"
	cont "verschlafen!"
	done

_OakTimeYikesText::
	text "!"
	line "Uah! Ich habe"
	cont "verschlafen!"
	done

_OakTimeSoDarkText::
	text "!"
	line "Kein Wunder, dass"
	cont "es so dunkel ist!"
	done

_OakTimeWhatDayIsItText::
	text "Welcher Tag ist"
	line "heute?"
	done

_OakTimeIsItText::
	text ", oder?"
	done

_ThereIsNothingConnectedText:: ; unreferenced
	text "There is nothing"
	line "connected."
	done

_CheckCellPhoneAdapterText:: ; unreferenced
	text "Check cell phone"
	line "adapter."
	done

_CheckCDMAAdapterText:: ; unreferenced
	text "Check CDMA"
	line "adapter."
	done

_CheckDOCOMOPHSAdapterText:: ; unreferenced
	text "Check DOCOMO PHS"
	line "adapter."
	done

_CheckDDIPHSAdapterText:: ; unreferenced
	text "Check DDI PHS"
	line "adapter."
	done

_CheckMobileAdapterText:: ; unreferenced
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done

; Mobile Adapter End

_ThePasswordIsText:: ; unreferenced
	text "The password is:"
	line ""
	done

_IsThisOKText:: ; unreferenced
	text "Is this OK?"
	done

_EnterTheIDNoText:: ; unreferenced
	text "Enter the"
	line "ID no."
	done

_EnterTheAmountText:: ; unreferenced
	text "Enter the"
	line "amount."
	done

_NothingToChooseText::
	text "There's nothing to"
	line "choose."
	prompt

_WhichSidePutOnText::
	text "Which side do you"
	line "want to put it on?"
	done

_WhichSidePutAwayText::
	text "Which side do you"
	line "want to put away?"
	done

_PutAwayTheDecoText::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "There's nothing to"
	line "put away."
	prompt

_SetUpTheDecoText::
	text "Set up the"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Put away the"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "and set up the"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "That's already set"
	line "up."
	prompt

_LookTownMapText::
	text "It's the TOWN MAP."
	done

_LookPikachuPosterText::
	text "It's a poster of a"
	line "cute PIKACHU."
	done

_LookClefairyPosterText::
	text "It's a poster of a"
	line "cute CLEFAIRY."
	done

_LookJigglypuffPosterText::
	text "It's a poster of a"
	line "cute JIGGLYPUFF."
	done

_LookAdorableDecoText::
	text "It's an adorable"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_LookGiantDecoText::
	text "A giant doll! It's"
	line "fluffy and cuddly."
	done

_MomHiHowAreYouText::
	text "Hi, <PLAYER>!"
	line "How are you?"
	prompt

_MomFoundAnItemText::
	text "I found a useful"
	line "item shopping, so"
	prompt

_MomBoughtWithYourMoneyText::
	text "I bought it with"
	line "your money. Sorry!"
	prompt

_MomItsInPCText::
	text "It's in your PC."
	line "You'll like it!"
	done

_MomFoundADollText::
	text "While shopping"
	line "today, I saw this"
	cont "adorable doll, so"
	prompt

_MomItsInYourRoomText::
	text "It's in your room."
	line "You'll love it!"
	done

_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " was"
	line "sent to @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MonNameSentToText::
	text_start
	done

_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " bids"
	line "farewell to"
	done

_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TakeGoodCareOfMonText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_ForYourMonSendsText::
	text "For @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

_OTSendsText::
	text_ram wOTTrademonSenderName
	text " sends"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_WillTradeText::
	text_ram wOTTrademonSenderName
	text " will"
	line "trade @"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unreferenced

_ForYourMonWillTradeText::
	text "for @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

_MobilePlayerWillTradeMonText::
	text_ram wPlayerTrademonSenderName
	text " will"
	line "trade @"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unreferenced

_MobileForPartnersMonText::
	text "for @"
	text_ram wOTTrademonSenderName
	text "'s"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTradeText::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

_MobileTakeGoodCareOfMonText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobilePlayersMonTrade2Text::
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text " trade…"
	done

_MobileTakeGoodCareOfText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_MobileTradeCameBackText::
	text_ram wOTTrademonSpeciesName
	text " came"
	line "back!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "MARGIT:"
	done

_OPT_IntroText2::
	text_start
	line "PROF. EICHs"
	done

_OPT_IntroText3::
	text_start
	line "#MON-TALK!"
	done

_OPT_IntroText4::
	text_start
	line "Mit MARGIT!"
	done

_OPT_OakText1::
	text_start
	line "EICH: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unreferenced

_OPT_OakText2::
	text_start
	line "wurde gesehen auf"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "MARGIT: @"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_OPT_SweetAdorablyText::
	text_start
	line "Wie bezaubernd."
	done

_OPT_WigglySlicklyText::
	text_start
	line "Wie smart."
	done

_OPT_AptlyNamedText::
	text_start
	line "Wie reizend."
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "Wie freundlich."
	done

_OPT_UnbearablyText::
	text_start
	line "Nicht zu ertragen…"
	done

_OPT_WowImpressivelyText::
	text_start
	line "Wow, faszinierend."
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "Fast giftig."
	done

_OPT_SensuallyText::
	text_start
	line "Wie einfühlsam."
	done

_OPT_MischievouslyText::
	text_start
	line "So schelmisch."
	done

_OPT_TopicallyText::
	text_start
	line "Sehr aktuell."
	done

_OPT_AddictivelyText::
	text_start
	line "Suchterregend."
	done

_OPT_LooksInWaterText::
	text_start
	line "Schaut ins Wasser."
	done

_OPT_EvolutionMustBeText::
	text_start
	line "Entwicklung, ja."
	done

_OPT_ProvocativelyText::
	text_start
	line "Wie provozierend."
	done

_OPT_FlippedOutText::
	text_start
	line "Wie ausgeflippt."
	done

_OPT_HeartMeltinglyText::
	text_start
	line "Wie wunderbar."
	done

_OPT_CuteText::
	text_start
	line "Wie niedlich."
	done

_OPT_WeirdText::
	text_start
	line "Wie verrückt."
	done

_OPT_PleasantText::
	text_start
	line "Wie angenehm."
	done

_OPT_BoldSortOfText::
	text_start
	line "Wie dreist."
	done

_OPT_FrighteningText::
	text_start
	line "Furchterregend."
	done

_OPT_SuaveDebonairText::
	text_start
	line "Wie weltmännisch!"
	done

_OPT_PowerfulText::
	text_start
	line "Wie stark."
	done

_OPT_ExcitingText::
	text_start
	line "Wie aufregend."
	done

_OPT_GroovyText::
	text_start
	line "Jetzt!"
	done

_OPT_InspiringText::
	text_start
	line "Wie inspirierend."
	done

_OPT_FriendlyText::
	text_start
	line "Wie freundlich."
	done

_OPT_HotHotHotText::
	text_start
	line "Wie interessant!"
	done

_OPT_StimulatingText::
	text_start
	line "Wie anregend."
	done

_OPT_GuardedText::
	text_start
	line "Gut geschützt."
	done

_OPT_LovelyText::
	text_start
	line "Wie lieblich."
	done

_OPT_SpeedyText::
	text_start
	line "Wie rasant."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_BenIntroText1::
	text_start
	line "BEN: #MON-MUSIK"
	done

_BenIntroText2::
	text_start
	line "PROGRAMM!"
	done

_BenIntroText3::
	text_start
	line "Ich bin's, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "FABIAN: #MUSIK!"
	done

_FernIntroText2::
	text_start
	line "Mit DJ FABIAN!"
	done

_BenFernText1::
	text_start
	line "Es ist @"
	text_today
	text "!"
	done

_BenFernText2A::
	text_start
	line "Mach mit beim"
	done

_BenFernText2B::
	text_start
	line "Entspann dich beim"
	done

_BenFernText3A::
	text_start
	line "#MON-Marsch!"
	done

_BenFernText3B::
	text_start
	line "PKMN-Schlaflied!"
	done

_LC_Text1::
	text_start
	line "BASTIAN: Yeah! Wie"
	done

_LC_Text2::
	text_start
	line "geht es euch nun?"
	done

_LC_Text3::
	text_start
	line "Geht es gut, oder"
	done

_LC_Text4::
	text_start
	line "geht es nicht,"
	done

_LC_Text5::
	text_start
	line "die GLÜCKSZAHLSHOW"
	done

_LC_Text6::
	text_start
	line "ist immer Pflicht!"
	done

_LC_Text7::
	text_start
	line "Die Glückszahl ist"
	done

_LC_Text8::
	text_start
	line "@"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Ich wiederhole!"
	done

_LC_Text10::
	text_start
	line "Gewonnen? Kommt"
	done

_LC_Text11::
	text_start
	line "zum RADIOTURM!"
	done

_LC_DragText1::
	text_start
	line "…Die Wiederholung"
	done

_LC_DragText2::
	text_start
	line "verzögert alles…"
	done

_PnP_Text1::
	text_start
	line "ORTE UND PERSONEN!"
	done

_PnP_Text2::
	text_start
	line "Moderiert von"
	done

_PnP_Text3::
	text_start
	line "DJ LILLY!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_PnP_CuteText::
	text_start
	line "ist niedlich."
	done

_PnP_LazyText::
	text_start
	line "irgendwie faul."
	done

_PnP_HappyText::
	text_start
	line "ist immer heiter."
	done

_PnP_NoisyText::
	text_start
	line "ist ziemlich laut."
	done

_PnP_PrecociousText::
	text_start
	line "ist frühreif."
	done

_PnP_BoldText::
	text_start
	line "ist wohl dreist."
	done

_PnP_PickyText::
	text_start
	line "ist zu wählerisch!"
	done

_PnP_SortOfOKText::
	text_start
	line "ist O.K."
	done

_PnP_SoSoText::
	text_start
	line "geht so."
	done

_PnP_GreatText::
	text_start
	line "ist großartig."
	done

_PnP_MyTypeText::
	text_start
	line "ist mein Typ."
	done

_PnP_CoolText::
	text_start
	line "ist so cool, oder?"
	done

_PnP_InspiringText::
	text_start
	line "ist inspirierend!"
	done

_PnP_WeirdText::
	text_start
	line "ist verrückt."
	done

_PnP_RightForMeText::
	text_start
	line "ist genau richtig?"
	done

_PnP_OddText::
	text_start
	line "ist merkwürdig!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unreferenced

_RocketRadioText1::
	text_start
	line "… …Ähm, wir sind"
	done

_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Nach drei Jahren"
	done

_RocketRadioText4::
	text_start
	line "Vorbereitung sind"
	done

_RocketRadioText5::
	text_start
	line "wir bereit für"
	done

_RocketRadioText6::
	text_start
	line "unser Comeback!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Hörst"
	done

_RocketRadioText8::
	text_start
	line "du uns? Geschafft!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Wo ist unser Boss?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Hört er zu?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: BUENA hier!"
	done

_BuenaRadioText2::
	text_start
	line "Heutiges Passwort!"
	done

_BuenaRadioText3::
	text_start
	line "Moment… es lautet"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Vergesst es nicht!"
	done

_BuenaRadioText6::
	text_start
	line "Ich bin im RADIO-"
	done

_BuenaRadioText7::
	text_start
	line "TURM von DUKATIA!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Oh, es ist…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "Mitternacht!"
	done

_BuenaRadioMidnightText3::
	text_start
	line "Ich muss aufhören!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Danke, Zuhörer!"
	done

_BuenaRadioMidnightText5::
	text_start
	line "Das Ende naht!"
	done

_BuenaRadioMidnightText6::
	text_start
	line "Bleibt nicht zu"
	done

_BuenaRadioMidnightText7::
	text_start
	line "lange auf! Euer"
	done

_BuenaRadioMidnightText8::
	text_start
	line "DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text_start
	line "Ich muss weg!"
	done

_BuenaRadioMidnightText10::
	text_start
	line "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

_EnemyWithdrewText::
	text "<ENEMY>"
	line "ersetzt"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_EnemyUsedOnText::
	text "<ENEMY>"
	line "setzt @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "bei"

	para "@"
	text_ram wEnemyMonNickname
	text_start
	line "ein!"
	prompt

_ThatCantBeUsedRightNowText:: ; unreferenced
	text "That can't be used"
	line "right now."
	prompt

_ThatItemCantBePutInThePackText:: ; unreferenced
	text "That item can't be"
	line "put in the PACK."
	done

_TheItemWasPutInThePackText:: ; unreferenced
	text "The @"
	text_ram wStringBuffer1
	text_start
	line "was put in the"
	cont "PACK."
	done

_RemainingTimeText:: ; unreferenced
	text "Remaining Time"
	done

_YourMonsHPWasHealedText:: ; unreferenced
	text "Your #MON's HP"
	line "was healed."
	prompt

_WarpingText:: ; unreferenced
	text "Warping…"
	done

_ChangeWhichNumberText:: ; unreferenced
	text "Which number"
	line "should be changed?"
	done

_WillYouPlayWithMonText:: ; unreferenced
	text "Will you play with"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

_YouNeedTwoMonForBreedingText:: ; unreferenced
	text "You need two #-"
	line "MON for breeding."
	prompt

_BreedingIsNotPossibleText:: ; unreferenced
	text "Breeding is not"
	line "possible."
	prompt

_CompatibilityShouldTheyBreedText:: ; unreferenced
	text "The compatibility"
	line "is @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Should they breed?"
	done

_ThereIsNoEggText:: ; unreferenced
	text "There is no EGG."
	line ""
	prompt

_ItsGoingToHatchText:: ; unreferenced
	text "It's going to"
	line "hatch!"
	prompt

_TestEventText:: ; unreferenced
	text "Test event"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

_StartText:: ; unreferenced
	text "Start!"
	done

_EndText:: ; unreferenced
	text "End!"
	done

_ForABoyText:: ; unreferenced
	text "For a boy!"
	done

_ForAGirlText:: ; unreferenced
	text "For a girl!"
	done

_DoesntConcernABoyText:: ; unreferenced
	text "This doesn't"
	line "concern a boy!"
	done

_TheBoxIsFullText:: ; unreferenced
	text "The BOX is full!"
	done

; Mobile Adapter

_NewCardArrivedText::
	text "A new CARD arrived"
	line "from @"
	text_ram wStringBuffer2
	text "."
	done

_PutCardInCardFolderText::
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done

_CardWasListedText::
	text_ram wStringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

_StartingLinkText::
	text "Starting link."
	done

_LinkTerminatedText::
	text "Link terminated."
	done

_ClosingLinkText::
	text "Closing link."
	done

_ClearTimeLimitText:: ; unreferenced
	text "Clear the time"
	line "limit?"
	done

_TimeLimitWasClearedText:: ; unreferenced
	text "The time limit was"
	line "cleared."
	done

_PickErrorPacketText:: ; unreferenced
	text "Pick which packet"
	line "as an error?"
	done

_TradingMonForOTMonText::
	text "Trading @"
	text_ram wStringBuffer2
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "…"
	done

; Mobile Adapter End

_ObtainedTheVoltorbBadgeText:: ; unreferenced
	text "Obtained the"
	line "VOLTORBBADGE!"
	done

_AskFloorElevatorText::
	text "Welcher Stock?"
	done

_BugCatchingContestTimeUpText::
	text "ANNOUNCER: BEEEP!"

	para "Time's up!"
	done

_BugCatchingContestIsOverText::
	text "ANNOUNCER: The"
	line "Contest is over!"
	done

_RepelWoreOffText::
	text "SCHUTZ wirkt"
	line "nicht mehr."
	done

_UseAnotherRepelText::
	text "@"
	text_ram wStringBuffer3
	text "'s"
	line "worn off."

	para "Use another?"
	done


_PlayerFoundItemText::
	text "<PLAYER> findet"
	line "@"
	text_ram wStringBuffer3
	text "."
	done

_ButNoSpaceText::
	text "Aber <PLAYER> hat"
	line "keinen Platz"
	cont "dafür…"
	done

_JustSawSomeRareMonText::
	text "I just saw some"
	line "rare @"
	text_ram wStringBuffer1
	text " in"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "I'll call you if I"
	line "see another rare"
	cont "#MON, OK?"
	prompt

_SavingRecordText::
	text "SAVING RECORD…"
	line "DON'T TURN OFF!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " erhält"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_promptbutton
	text_end

	text_end ; unreferenced

_NoCoinsText::
	text "Du hast keine"
	line "Münzen."
	prompt

_NoCoinCaseText::
	text "Du hast keinen"
	line "MÜNZKORB."
	prompt

_NPCTradeCableText::
	text "OK, connect the"
	line "Game Link Cable."
	prompt

Text_NPCTraded::
	text "<PLAYER> traded"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " for"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unreferenced

_NPCTradeIntroText1::
	text "I collect #MON."
	line "Do you have"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "You don't want to"
	line "trade? Aww…"
	done

_NPCTradeWrongText1::
	text "Huh? That's not"
	line "@"
	text_ram wStringBuffer1
	text ". "
	cont "What a letdown…"
	done

_NPCTradeCompleteText1::
	text "Yay! I got myself"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Thanks!"
	done

_NPCTradeAfterText1::
	text "Hi, how's my old"
	line "@"
	text_ram wStringBuffer2
	text " doing?"
	done

_NPCTradeIntroText2::
	text "Hi, I'm looking"
	line "for this #MON."

	para "If you have"
	line "@"
	text_ram wStringBuffer1
	text ", would"

	para "you trade it for"
	line "my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "You don't have"
	line "one either?"

	para "Gee, that's really"
	line "disappointing…"
	done

_NPCTradeWrongText2::
	text "You don't have"
	line "@"
	text_ram wStringBuffer1
	text "? That's"
	cont "too bad, then."
	done

_NPCTradeCompleteText2::
	text "Great! Thank you!"

	para "I finally got"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Hi! The @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "you traded me is"
	cont "doing great!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text "'s cute,"
	line "but I don't have"

	para "it. Do you have"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "You don't want to"
	line "trade? Oh, darn…"
	done

_NPCTradeWrongText3::
	text "That's not"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Please trade with"
	line "me if you get one."
	done

_NPCTradeCompleteText3::
	text "Wow! Thank you!"
	line "I always wanted"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "How is that"
	line "@"
	text_ram wStringBuffer2
	text " I"
	cont "traded you doing?"

	para "Your @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "so cute!"
	done

_NPCTradeCompleteText4::
	text "Uh? What happened?"
	done

_NPCTradeAfterText4::
	text "Trading is so odd…"

	para "I still have a lot"
	line "to learn about it."
	done

_MomLeavingText1::
	text "Wow, that's a cute"
	line "#MON."

	para "Where did you get"
	line "it?"

	para "…"

	para "So, you're leaving"
	line "on an adventure…"

	para "OK!"
	line "I'll help too."

	para "But what can I do"
	line "for you?"

	para "I know! I'll save"
	line "money for you."

	para "On a long journey,"
	line "money's important."

	para "Do you want me to"
	line "save your money?"
	done

_MomLeavingText2::
	text "OK, I'll take care"
	line "of your money."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Be careful."

	para "#MON are your"
	line "friends. You need"
	cont "to work as a team."

	para "Now, go on!"
	done

_MomIsThisAboutYourMoneyText::
	text "Hi! Welcome home!"
	line "You're trying very"
	cont "hard, I see."

	para "I've kept your"
	line "room tidy."

	para "Or is this about"
	line "your money?"
	done

_MomBankWhatDoYouWantToDoText::
	text "What do you want"
	line "to do?"
	done

_MomStoreMoneyText::
	text "How much do you"
	line "want to save?"
	done

_MomTakeMoneyText::
	text "How much do you"
	line "want to take?"
	done

_MomSaveMoneyText::
	text "Do you want to"
	line "save some money?"
	done

_MomHaventSavedThatMuchText::
	text "You haven't saved"
	line "that much."
	prompt

_MomNotEnoughRoomInWalletText::
	text "You can't take"
	line "that much."
	prompt

_MomInsufficientFundsInWalletText::
	text "You don't have"
	line "that much."
	prompt

_MomNotEnoughRoomInBankText::
	text "You can't save"
	line "that much."
	prompt

_MomStartSavingMoneyText::
	text "OK, I'll save your"
	line "money. Trust me!"

	para "<PLAYER>, stick"
	line "with it!"
	done

_MomStoredMoneyText::
	text "Your money's safe"
	line "here! Get going!"
	done

_MomTakenMoneyText::
	text "<PLAYER>, don't"
	line "give up!"
	done

_MomJustDoWhatYouCanText::
	text "Just do what"
	line "you can."
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "I'm the DAY-CARE"
	line "MAN. Want me to"
	cont "raise a #MON?"
	done

_DayCareManIntroEggText::
	text "I'm the DAY-CARE"
	line "MAN. Do you know"
	cont "about EGGS?"

	para "I was raising"
	line "#MON with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an EGG!"

	para "How incredible is"
	line "that?"

	para "So, want me to"
	line "raise a #MON?"
	done

_DayCareLadyIntroText::
	text "I'm the DAY-CARE"
	line "LADY."

	para "Should I raise a"
	line "#MON for you?"
	done

_DayCareLadyIntroEggText::
	text "I'm the DAY-CARE"
	line "LADY. Do you know"
	cont "about EGGS?"

	para "My husband and I"
	line "were raising some"
	cont "#MON, you see."

	para "We were shocked to"
	line "find an EGG!"

	para "How incredible"
	line "could that be?"

	para "Should I raise a"
	line "#MON for you?"
	done

_WhatShouldIRaiseText::
	text "What should I"
	line "raise for you?"
	prompt

_OnlyOneMonText::
	text "Oh? But you have"
	line "just one #MON."
	prompt

_CantAcceptEggText::
	text "Sorry, but I can't"
	line "accept an EGG."
	prompt

_RemoveMailText::
	text "Remove MAIL before"
	line "you come see me."
	prompt

_LastHealthyMonText::
	text "If you give me"
	line "that, what will"
	cont "you battle with?"
	prompt

_IllRaiseYourMonText::
	text "OK. I'll raise"
	line "your @"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Come back for it"
	line "later."
	done

_AreWeGeniusesText::
	text "Are we geniuses or"
	line "what? Want to see"
	cont "your @"
	text_ram wStringBuffer1
	text "?"
	done

_YourMonHasGrownText::
	text "Your @"
	text_ram wStringBuffer1
	text_start
	line "has grown a lot."

	para "By level, it's"
	line "grown by @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Perfect! Here's"
	line "your #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> got back"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Huh? Back already?"
	line "Your @"
	text_ram wStringBuffer1
	text_start
	para "needs a little"
	line "more time with us."

	para "If you want your"
	line "#MON back, it"
	cont "will cost ¥100."
	done

_HaveNoRoomText::
	text "You have no room"
	line "for it."
	prompt

_NotEnoughMoneyText::
	text "You don't have"
	line "enough money."
	prompt

_OhFineThenText::
	text "Oh, fine then."
	prompt

_ComeAgainText::
	text "Come again."
	done

_CantAcceptFaintedMonText::
	text "Sorry, but you'll"
	line "have to heal your"
	cont "#MON before I"
	cont "accept it."
	prompt

_NotYetText::
	text "Not yet…"
	done

_FoundAnEggText::
	text "Ah, it's you!"

	para "We were raising"
	line "your #MON, and"

	para "my goodness, were"
	line "we surprised!"

	para "Your #MON had"
	line "an EGG!"

	para "We don't know how"
	line "it got there, but"

	para "your #MON had"
	line "it. You want it?"
	done

_ReceivedEggText::
	text "<PLAYER> received"
	line "the EGG!"
	done

_TakeGoodCareOfEggText::
	text "Take good care of"
	line "it."
	done

_IllKeepItThanksText::
	text "Well then, I'll"
	line "keep it. Thanks!"
	done

_NoRoomForEggText::
	text "You have no room"
	line "in your party."
	cont "Come back later."
	done

_WhichMonPhotoText::
	text "Which #MON"
	line "should I photo-"
	cont "graph?"
	prompt

_HoldStillText::
	text "All righty. Hold"
	line "still for a bit."
	prompt

_PrestoAllDoneText::
	text "Presto! All done."
	line "Come again, OK?"
	done
