	object_const_def
	const ROUTE24_ROCKET
	const ROUTE24_MEW

Route24_MapScripts:
	def_scene_scripts

	def_callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_GRUNTM_31
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	promptbutton
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInQuickly
	playmapmusic
	end

MewScript:
	opentext
	writetext MewBattleText
	cry MEW
	waitbutton
	closetext
	loadwildmon MEW, 60
	startbattle
	disappear ROUTE24_MEW
	setevent EVENT_ROUTE_24_MEW
	setevent EVENT_ROUTE_24_MEW_CAUGHT
	reloadmapafterbattle
	end

MewBattleText:
	text "Myuu..."
	done

Route24RocketSeenText:
	text "Hey, Minimensch!"
	line "Ich sein von TEAM"
	cont "ROCKET."

	para "Sein aus fremde"
	line "Land, Trainer eins"
	cont "ich sein!"

	para "Geglaubt, wenn"
	line "nix Energie mehr,"

	para "mache viel Panik"
	line "bei Leute!"

	para "Geheim mein"
	line "Auftrag sein, ich"
	cont "Dir nix verraten!"

	para "Doch! Wenn mich"
	line "besiegen, ich sein"

	para "lieb und Dir"
	line "verrate Geheimnis."

	para "Du, Kind! Kämpfen"
	line "laß uns!"
	done

Route24RocketBeatenText:
	text "Uff! Nein,"
	line "glauben nicht ich"
	cont "kann!"

	para "Stark sehr Du"
	line "sein! Ich nix"
	cont "Gegner für Dich!"
	done

Route24RocketAfterBattleText:
	text "O.K. Verraten Dir"
	line "meine Geheimnis."

	para "SPULE, gestohlen"
	line "von mir, versteckt"

	para "in PKMN-ARENA der"
	line "AZURIA CITY."

	para "Wasser sein gute"
	line "Versteck. In"

	para "Mitte von PKMN-"
	line "ARENA Wasser sein."

	para "Kind, Du mich"
	line "vergessen nicht!"

	para "Besiege Dir wird"
	line "TEAM ROCKET tun."

	para "Werden kommen aus"
	line "JOHTO, mein"

	para "Freunde. Rächen"
	line "sie werden tun."
	done

Route24RocketDisappearsText:
	text "…"

	para "Was Du sagen? TEAM"
	line "ROCKET nix mehr"

	para "gibt? Kaputt"
	line "gemacht, Du sagen?"

	para "Oh, nein! Ich"
	line "tun was jetzt"
	cont "machen?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
	object_event  8, 12, SPRITE_MEW, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MewScript, EVENT_ROUTE_24_MEW
