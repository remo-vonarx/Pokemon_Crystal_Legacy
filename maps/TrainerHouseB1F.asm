	object_const_def
	const TRAINERHOUSEB1F_RECEPTIONIST
	const TRAINERHOUSEB1F_CHRIS

TrainerHouseB1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	def_callbacks

.DummyScene:
	end

TrainerHouseReceptionistScript:
	turnobject PLAYER, UP
.GetDayForSprite: ; make sure overworld sprite is correct for trainer
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Smith_Craig_Sprite
	ifequal TUESDAY, .Smith_Craig_Sprite
	ifequal WEDNESDAY, .Weebra_Sprite
	ifequal THURSDAY, .Smith_Craig_Sprite
	ifequal FRIDAY, .Smith_Craig_Sprite
	ifequal SATURDAY, .Smith_Craig_Sprite
	ifequal SUNDAY, .Weebra_Sprite
.Smith_Craig_Sprite
	variablesprite SPRITE_TRAINER_HOUSE_PKMN_TRAINER, SPRITE_CHRIS
	special LoadUsedSpritesGFX
	sjump .GotSprite
.Weebra_Sprite
	variablesprite SPRITE_TRAINER_HOUSE_PKMN_TRAINER, SPRITE_KRIS
	sjump .GotSprite

.GotSprite:
	opentext
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue .FoughtTooManyTimes
	writetext TrainerHouseB1FIntroText
	promptbutton
	special TrainerHouse
	iffalse .GetCal3Name
	gettrainername STRING_BUFFER_3, CAL, CAL2
	sjump .GotName

.GetCal3Name:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .SmithName
	ifequal TUESDAY, .CraigName
	ifequal WEDNESDAY, .WeebraName
	ifequal THURSDAY, .SmithName
	ifequal FRIDAY, .CraigName
	ifequal SATURDAY, .SmithName
	ifequal SUNDAY, .WeebraName
.SmithName
	gettrainername STRING_BUFFER_3, CAL, SMITH ; SMITH
	sjump .GotName
.CraigName
	gettrainername STRING_BUFFER_3, CAL, CRAIG ; CRAIG
	sjump .GotName
.WeebraName
	gettrainername STRING_BUFFER_3, PKMNTRAINERF, WEEBRA ; WEEBRA
	sjump .GotName

.GotName:
	writetext TrainerHouseB1FYourOpponentIsText
	promptbutton
	writetext TrainerHouseB1FAskWantToBattleText
	yesorno
	iffalse .Declined
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	writetext TrainerHouseB1FGoRightInText
	waitbutton
	closetext
	applymovement PLAYER, Movement_EnterTrainerHouseBattleRoom
	special TrainerHouse
	iffalse .NoSpecialBattle
	opentext
	writetext TrainerHouseB1FCalBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FCalBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CAL2
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_CAL2
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_CAL2
	startbattle
	reloadmapafterbattle
	iffalse .End
.NoSpecialBattle:
	opentext
	readvar VAR_WEEKDAY
	ifequal MONDAY, .SmithBeforeText
	ifequal TUESDAY, .CraigBeforeText
	ifequal WEDNESDAY, .WeebraBeforeText
	ifequal THURSDAY, .SmithBeforeText
	ifequal FRIDAY, .CraigBeforeText
	ifequal SATURDAY, .SmithBeforeText
	ifequal SUNDAY, .WeebraBeforeText
.SmithBeforeText
	writetext TrainerHouseB1FSmithBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FSmithBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, SMITH ; SMITH
	sjump .DoneBattle
.CraigBeforeText
	writetext TrainerHouseB1FCraigBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FCraigBeatenText, 0 
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer CAL, CRAIG ; CRAIG
	sjump .DoneBattle
.WeebraBeforeText
	writetext TrainerHouseB1FWeebraBeforeText
	waitbutton
	closetext
	winlosstext TrainerHouseB1FWeebraBeatenText, 0
	setlasttalked TRAINERHOUSEB1F_CHRIS
	loadtrainer PKMNTRAINERF, WEEBRA ; WEEBRA
	sjump .DoneBattle
.DoneBattle
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_WEEBRA ; WEEBRA
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_WEEBRA ; WEEBRA
	startbattle
	reloadmapafterbattle
.End:
	applymovement PLAYER, Movement_ExitTrainerHouseBattleRoom
	end

.Declined:
	writetext TrainerHouseB1FPleaseComeAgainText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

.FoughtTooManyTimes:
	writetext TrainerHouseB1FSecondChallengeDeniedText
	waitbutton
	closetext
	applymovement PLAYER, Movement_TrainerHouseTurnBack
	end

Movement_EnterTrainerHouseBattleRoom:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	turn_head RIGHT
	step_end

Movement_ExitTrainerHouseBattleRoom:
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

Movement_TrainerHouseTurnBack:
	step RIGHT
	turn_head LEFT
	step_end

TrainerHouseB1FIntroText:
	text "Hi. Willkommen in"
	line "unserer"
	cont "ÜBUNGSHALLE."

	para "Einmal pro Tag"
	line "kannst Du gegen"
	cont "einen Trainer"
	cont "kämpfen."
	done

TrainerHouseB1FYourOpponentIsText:
	text_ram wStringBuffer3
	text " ist"
	line "heute Dein Gegner."
	done

TrainerHouseB1FAskWantToBattleText:
	text "Möchtest Du"
	line "kämpfen?"
	done

TrainerHouseB1FGoRightInText:
	text "Geh bitte einfach"
	line "weiter."

	para "Du darfst sofort"
	line "anfangen."
	done

TrainerHouseB1FPleaseComeAgainText:
	text "Nur die Trainer,"
	line "die kämpfen dür-"
	cont "fen, haben"
	cont "Zutritt."
	done

TrainerHouseB1FSecondChallengeDeniedText:
	text "Es tut mir Leid,"
	line "das wäre für Dich"

	para "heute der zweite"
	line "Kampf. Es ist aber"

	para "nur ein Kampf pro"
	line "Tag erlaubt."
	done

TrainerHouseB1FCalBeatenText:
	text "Ich habe verloren…"
	line "Mist…"
	done

TrainerHouseB1FSmithBeatenText:
	text "Ich habe verloren…"
	line "Nicht so spritzig."
	done

TrainerHouseB1FCraigBeatenText:
	text "Das sind gute"
	line "Daten! Die kann"
	cont "ich gebrauchen."
	done

TrainerHouseB1FWeebraBeatenText:
	text "Ach, Mist…"

	para "Und ich durfte"
	line "nicht mal meine"
	cont "'Essenz des"
	cont "Capoeira-Stils'"
	cont "einsetzen…"
	done

TrainerHouseB1FCalBeforeText:
	text "Ich bin nur"
	line "hergereist, um"
	cont "gegen Dich zu"
	cont "kämpfen."
	done

TrainerHouseB1FSmithBeforeText:
	text "Hey, wie läuft's?"
	done

TrainerHouseB1FCraigBeforeText:
	text "Ich sammle Kampf-"
	line "erfahrung für ein"

	para "#MON-Spiel, das"
	line "ich gerade mache."
	done

TrainerHouseB1FWeebraBeforeText:
	text "Du siehst ziemlich"
	line "stark aus, was?"
	done

TrainerHouseB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  4, TRAINER_HOUSE_1F, 3

	def_coord_events
	coord_event  7,  3, SCENE_DEFAULT, TrainerHouseReceptionistScript

	def_bg_events

	def_object_events
	object_event  7,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 11, SPRITE_TRAINER_HOUSE_PKMN_TRAINER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
