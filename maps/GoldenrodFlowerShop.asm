	object_const_def
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA
	const GOLDENRODFLOWERSHOP_CLERK

GoldenrodFlowerShop_MapScripts:
	def_scene_scripts

	def_callbacks

FlowerShopTeacherScript:
	opentext
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .SkipSquirtBottle
	checkflag ENGINE_PLAINBADGE
	iffalse .SkipSquirtBottle
	faceplayer
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	promptbutton
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
.SkipSquirtBottle
	checkevent EVENT_MET_FLORIA
	iffalse .HaventMetFloria
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iffalse .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	checkevent EVENT_GOT_GOLD_BERRY_FROM_FLOWER_SHOP
	iftrue .GotReward
	faceplayer
	writetext GoldenrodFlowerShopTeacherHeresTheGoldBerryText
	promptbutton
	verbosegiveitem GOLD_BERRY
	setevent EVENT_GOT_GOLD_BERRY_FROM_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	closetext
	end
	
.GotReward
	sjump .Lalala

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	end

.GotSquirtbottle:
	jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText

.NoPlainBadge:
	faceplayer
	writetext GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText
	promptbutton
	checkevent EVENT_MET_FLORIA
	iffalse .HaventMetFloria
	closetext
	end

.HaventMetFloria:
	faceplayer
	writetext GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text
	waitbutton
	closetext
	end

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iffalse .TalkToFlorida
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
.TalkToFlorida
	writetext GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	waitbutton
	setevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	closetext
	end

.GotSquirtbottle:
	writetext GoldenrodFlowerShopFloriaYouBeatWhitneyText
	waitbutton
	closetext
	end

.FoughtSudowoodo:
	writetext GoldenrodFlowerShopFloriaItReallyWasAMonText
	waitbutton
	closetext
	end

FlowerShopShelf1: ; unreferenced
	jumpstd PictureBookshelfScript

FlowerShopShelf2: ; unreferenced
	jumpstd MagazineBookshelfScript

FlowerShopRadio: ; unreferenced
	jumpstd Radio2Script

BerryMartScript:
	faceplayer
	opentext
	readvar VAR_BADGES
	if_less_than 7, .NotSevenBadges
	sjump .SevenBadges
.NotSevenBadges
	pokemart MARTTYPE_STANDARD, MART_BERRYS
	sjump .end
.SevenBadges
	pokemart MARTTYPE_STANDARD, MART_BERRYS_2
.end
	closetext
	end

GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "Hast Du den wacke-"
	line "ligen Baum auf"
	cont "ROUTE 36 gesehen?"

	para "Meine kleine"
	line "Schwester war auf-"
	cont "geregt und wollte"
	cont "ihn sich ansehen…"

	para "Ich bin besorgt…"
	line "Ist das riskant?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "Möchtest Du auch"
	line "die Gießkanne aus-"
	cont "leihen? Ich werde"
	cont "nicht zulassen,"

	para "daß Du etwas Ge-"
	line "fährliches damit"
	cont "anstellst."
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Oh, Du bist besser"
	line "als BIANKA…"

	para "Dann bist Du in"
	line "Ordnung. Hier, die"
	cont "SCHIGGYKANNE!"
	done

GoldenrodFlowerShopTeacherHeresTheGoldBerryText:
	text "Oh, Du hast FLORA"
	line "gefunden…"

	para "Hier, eine GOLD-"
	line "BEERE zum Dank!"
	done

GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "Unternimm nichts"
	line "Gefährliches!"
	done

GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText:
	text "Lalala lalalala."
	line "Da hast Du Wasser,"
	cont "mein Hübsches!"
	done

GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "Als ich meiner"
	line "Schwester von dem"

	para "wackeligen Baum"
	line "erzählte, sagte"

	para "sie mir, daß er"
	line "gefährlich sei."

	para "Ich frage mich, ob"
	line "sie mir ihre Gieß-"
	cont "kanne leiht, wenn"
	cont "ich BIANKA"
	cont "besiege…"
	done

GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Wow, Du hast gegen"
	line "BIANKA gewonnen?"
	done

GoldenrodFlowerShopFloriaItReallyWasAMonText:
	text "Es war tatsächlich"
	line "ein #MON!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
	object_event  5,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BerryMartScript, -1
