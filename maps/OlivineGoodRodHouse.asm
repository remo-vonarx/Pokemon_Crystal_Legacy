	object_const_def
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	promptbutton
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

OfferGoodRodText:
	text "OLIVIANA CITY"
	line "liegt am Meer!"

	para "Daher sollte man"
	line "dort auch jede"
	cont "Menge Fische fin-"
	cont "den!"

	para "Ich fische hier"
	line "seit 30 Jahren."

	para "Willst Du das Meer"
	line "und die Fische"
	cont "sehen?"
	done

GiveGoodRodText:
	text "Ah, hahah!"
	line "Und da haben wir"
	cont "einen neuen"
	cont "Angler!"
	done

GaveGoodRodText:
	text "Fische findet man"
	line "nicht nur im Meer."

	para "Sie sind überall,"
	line "wo es Wasser gibt."

	para "Übrigens zeigt"
	line "Dein #DEX die"
	cont "Angel-Gruppen von"
	cont "#MON."

	para "An ähnlichen Orten"
	line "gibt es ähnliche"
	cont "Fische."

	para "Dein #COM zeigt"
	line "die Angel-Gruppe"
	cont "Deines aktuellen"
	cont "Standorts."

	para "Schau nach, was Du"
	line "fangen könntest!"
	done

DontWantGoodRodText:
	text "Waaas? Du willst"
	line "nicht fischen!?"
	cont "Unfaßbar!"
	done

HaveGoodRodText:
	text "Wie steht's? Den"
	line "großen Fang ge-"
	cont "macht?"
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
