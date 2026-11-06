	object_const_def
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL
	const RADIOTOWER5F_GIOVANNI

RadioTower5F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_RADIOTOWER5F_NOTHING

	def_callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_EXECUTIVEM_3
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	promptbutton
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScene:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer ROCKET_LEADER, 1
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_1
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext

	; Giovanni Event
	showemote EMOTE_SHOCK, RADIOTOWER5F_ROCKET_GIRL, 10
	appear RADIOTOWER5F_GIOVANNI
	applymovement RADIOTOWER5F_GIOVANNI, GiovanniEnterenceMovement
	faceobject RADIOTOWER5F_ROCKET, RADIOTOWER5F_GIOVANNI
	showemote EMOTE_SHOCK, RADIOTOWER5F_ROCKET, 10
	faceobject PLAYER, RADIOTOWER5F_GIOVANNI
	showemote EMOTE_SHOCK, PLAYER, 10
	opentext
	writetext RadioTower5FGiovanniText1
	waitbutton

	faceobject RADIOTOWER5F_GIOVANNI, RADIOTOWER5F_ROCKET
	writetext RadioTower5FGiovanniText2
	waitbutton
	closetext

	applymovement RADIOTOWER5F_GIOVANNI, LookRightMovement
	pause 50

	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	variablesprite SPRITE_RADIOTOWER_GIOVANNI, SPRITE_GIOVANNI
	special LoadUsedSpritesGFX
	special ReloadSpritesNoPalettes
	pause 15
	special FadeInQuickly

	pause 30
	applymovement RADIOTOWER5F_GIOVANNI, LookDownMovement
	pause 50
	faceobject RADIOTOWER5F_GIOVANNI, RADIOTOWER5F_ROCKET

	opentext
	writetext RadioTower5FGiovanniText3
	waitbutton
	closetext

	applymovement RADIOTOWER5F_GIOVANNI, GiovanniMoveTowerdsExecutive
	faceobject RADIOTOWER5F_ROCKET, RADIOTOWER5F_GIOVANNI
	faceobject PLAYER, RADIOTOWER5F_GIOVANNI
	opentext
	writetext RadioTower5FGiovanniText4
	waitbutton
	closetext
	applymovement RADIOTOWER5F_GIOVANNI, LookDownMovement
	pause 50

	applymovement RADIOTOWER5F_GIOVANNI, GiovanniMoveAway
	faceobject RADIOTOWER5F_ROCKET, RADIOTOWER5F_GIOVANNI
	faceobject PLAYER, RADIOTOWER5F_GIOVANNI
	opentext
	writetext RadioTower5FGiovanniText5
	waitbutton
	closetext
	applymovement RADIOTOWER5F_GIOVANNI, RADIOTOWER_GiovanniLeavesMovement
	disappear RADIOTOWER5F_GIOVANNI

	; Archer Leaves Event
	faceobject PLAYER, RADIOTOWER5F_ROCKET
	pause 30
	applymovement RADIOTOWER5F_ROCKET, LookDownMovement
	pause 30
	applymovement RADIOTOWER5F_ROCKET, LookLeftMovement
	pause 50
	applymovement RADIOTOWER5F_ROCKET, LookDownMovement
	pause 30
	opentext
	writetext RadioTower5FRocketBossDisbandText1
	waitbutton
	closetext
	faceobject RADIOTOWER5F_ROCKET, PLAYER
	pause 50
	applymovement RADIOTOWER5F_ROCKET, LookDownMovement
	pause 30
	applymovement RADIOTOWER5F_ROCKET, ArcherMovement1
	faceobject PLAYER, RADIOTOWER5F_ROCKET
	
	opentext
	writetext RadioTower5FRocketBossDisbandText2
	waitbutton
	closetext

	applymovement RADIOTOWER5F_ROCKET, ArcherMovement2
	faceobject PLAYER, RADIOTOWER5F_ROCKET
	opentext
	writetext RadioTower5FRocketBossDisbandText3
	waitbutton
	closetext
	pause 30
	applymovement RADIOTOWER5F_ROCKET, LookRightMovement
	pause 20

	opentext
	writetext RadioTower5FRocketBossDisbandText4
	waitbutton
	closetext
	applymovement RADIOTOWER5F_ROCKET, LookDownMovement
	pause 40
	applymovement RADIOTOWER5F_ROCKET, LookRightMovement
	pause 20
	applymovement RADIOTOWER5F_ROCKET, LookUpMovement
	pause 80

	applymovement RADIOTOWER5F_ROCKET, ArcherMovement3
	opentext
	writetext RadioTower5FRocketBossDisbandText5
	waitbutton
	closetext
	pause 20

	applymovement RADIOTOWER5F_ROCKET, LookLeftMovement
	pause 50
	applymovement RADIOTOWER5F_ROCKET, LookDownMovement
	pause 50
	applymovement RADIOTOWER5F_ROCKET, ArcherMovement4
	pause 20
	opentext
	writetext RadioTower5FRocketBossDisbandText6
	waitbutton

	applymovement RADIOTOWER5F_ROCKET, LookDownMovement
	writetext RadioTower5FRocketBossDisbandText7
	waitbutton
	closetext

	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInQuickly

	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	promptbutton
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOTHING
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_DEFAULT
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED

	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd MagazineBookshelfScript

LookUpMovement:
	turn_head UP
	step_end

LookDownMovement:
	turn_head DOWN
	step_end

LookLeftMovement:
	turn_head LEFT
	step_end

LookRightMovement:
	turn_head RIGHT
	step_end

GiovanniEnterenceMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head RIGHT
	step_end

GiovanniMoveTowerdsExecutive:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	turn_head UP
	step_end

GiovanniMoveAway:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

RADIOTOWER_GiovanniLeavesMovement:
	slow_step UP
	slow_step UP
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end

ArcherMovement1:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

ArcherMovement2:
	slow_step UP
	slow_step UP
	step_end

ArcherMovement3:
	big_step DOWN
	step_end

ArcherMovement4:
	step LEFT
	step_end

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "D-Du! Bist Du"
	line "gekommen, um mich"
	cont "zu retten?"
	done

FakeDirectorTextBefore2:
	text "Ist es das, was Du"
	line "erwartet hast?"

	para "Falsch! Ich bin"
	line "ein Betrüger!"

	para "Ich gebe vor, der"
	line "Echte zu sein, um"

	para "unsere Übernahme"
	line "vorzubereiten."

	para "Möchtest Du wis-"
	line "sen, wo wir den"
	cont "echten INTENDANTEN"
	cont "versteckt haben?"

	para "Ich werde es Dir"
	line "verraten, wenn"
	cont "Du mich besiegst!"
	done

FakeDirectorWinText:
	text "O.K. Ich sage"
	line "Dir, wo er ist."
	done

FakeDirectorTextAfter:
	text "Der Boss hat den"
	line "echten INTENDANTEN"

	para "in das UNTERGRUND-"
	line "LAGERHAUS"
	cont "verschleppt."

	para "Es ist am Ende"
	line "des UNTERGRUNDs."

	para "Ich bezweifle"
	line "aber, daß Du"
	cont "so weit kommst."
	done

Executivef1SeenText:
	text "Kennst Du mich"
	line "noch aus dem"
	cont "VERSTECK in"
	cont "MAHAGONIA CITY?"

	para "Mein Boss hat mich"
	line "getadelt, aber"
	cont "ich bin stärker."

	para "Damals habe ich"
	line "verloren, aber das"

	para "wird heute nicht"
	line "passieren."
	done

Executivef1BeatenText:
	text "Das darf nicht"
	line "wahr sein!"

	para "Ich habe mich so"
	line "angestrengt und"
	cont "dennoch verloren…"

	para "Es tut mir so"
	line "leid, GIOVANNI…"
	done

Executivef1AfterBattleText:
	text "<PLAYER>, oder?"

	para "Ein Balg wie Du"
	line "weiß die Größe"

	para "von TEAM ROCKET"
	line "nicht zu würdigen."

	para "Das ist schade."
	line "Ich bewundere"
	cont "Deine Stärke."
	done

RadioTower5FRocketBossBeforeText:
	text "Oh? Du bist"
	line "so weit gekommen?"

	para "Du mußt ein aus-"
	line "gezeichneter Trai-"
	cont "ner sein."

	para "Wir planen, die"
	line "RADIOSTATION zu"

	para "annektieren und"
	line "unsere Rückkehr"
	cont "bekanntzugeben."

	para "Das sollte unseren"
	line "Anführer GIOVANNI"

	para "überzeugen, sein"
	line "Solo-Training"
	cont "abzubrechen und"
	cont "zurückzukehren."

	para "Wir werden unseren"
	line "früheren Ruhm"
	cont "wiedererlangen."

	para "Ich werde nicht"
	line "zulassen, daß Du"
	cont "unsere Pläne"
	cont "durchkreuzt."
	done

RadioTower5FRocketBossWinText:
	text "Nein! Vergib mir,"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "Wie kann das sein?"

	para "TEAM ROCKET war"
	line "dazu bestimmt,"
	cont "wieder aufzu-"
	cont "steigen…"

	para "Für GIOVANNI, für"
	line "unser Vermächtnis!"
	cont "Wir dürfen nicht"
	cont "fallen!"

	para "Du hast diesen"
	line "Kampf gewonnen,"

	para "aber den Krieg?"
	line "Der ist noch lange"
	cont "nicht vorbei."
	cont "Du wirst sehen."

	para "Unser Ehrgeiz,"
	line "unser Traum wird"
	cont "nicht vergehen."

	para "Die Welt wird"
	line "TEAM ROCKET wieder"
	cont "fürchten."

	para "Das ist nur ein"
	line "Rückschlag!"
	done

RadioTower5FGiovanniText1:
	text "???:"
	line "So viel Über-"
	cont "zeugung."

	para "Das erinnert mich"
	line "an eine Zeit, in"
	cont "der auch ich mir"
	cont "so sicher war."
	done

RadioTower5FGiovanniText2:
	text "Du sprichst von"
	line "Vermächtnis,"

	para "von Machtüber-"
	line "nahme…"

	para "Aber erinnere"
	line "Dich, ATLAS."

	para "Warum habe ich es"
	line "aufgelöst?"
	done

RadioTower5FGiovanniText3:
	text "GIOVANNI:"
	line "Es war nicht nur"
	cont "Niederlage oder"
	cont "Laune."

	para "Es war ein"
	line "Erwachen."

	para "Sieh Dir an, was"
	line "aus dieser Gruppe"
	cont "geworden ist."

	para "Verzweifelte"
	line "Taten, Verstecke."

	para "Weit entfernt von"
	line "dem, was wir"
	cont "einst waren."
	done

RadioTower5FGiovanniText4:
	text "Macht bedeutet"
	line "nicht nur"
	cont "Herrschaft."

	para "Sie bedeutet Ver-"
	line "ständnis und"
	cont "Respekt."

	para "Ist das das Ver-"
	line "mächtnis, das Du"
	cont "Dir vorgestellt"
	cont "hast?"

	para "Im Schatten herum-"
	line "zuschleichen?"
	done

RadioTower5FGiovanniText5:
	text "Überdenke diesen"
	line "Weg."

	para "Siehst Du wirklich"
	line "eine Zukunft für"
	cont "dieses TEAM"
	cont "ROCKET?"
	done

RadioTower5FRocketBossDisbandText1:
	text "ATLAS:"
	line "Ich…"

	para "Ich habe das für"
	line "Dich getan. Für"
	cont "den Ruhm von TEAM"
	cont "ROCKET."

	para "All meine Mühen,"
	line "all diese Opfer."

	para "Und Du…"

	para "War das alles"
	line "umsonst?"

	para "Habe ich unsere"
	line "Bestimmung falsch"
	cont "verstanden?"
	done

RadioTower5FRocketBossDisbandText2:
	text "Du bist gegangen."

	para "Du bist wortlos"
	line "verschwunden."

	para "Wir waren"
	line "verloren. Ich"
	cont "wollte Dein"
	cont "Vermächtnis"
	cont "weitertragen."
	done

RadioTower5FRocketBossDisbandText3:
	text "Du warst der"
	line "Anführer,"

	para "der Visionär."

	para "Und ich…"

	para "Ich bin nur…"
	done

RadioTower5FRocketBossDisbandText4:
	text "War ich nur eine"
	line "Marionette?"

	para "Die einem Traum"
	line "nachjagte, den Du"
	cont "nie geteilt hast?"
	done

RadioTower5FRocketBossDisbandText5:
	text "Aber… aber ich"
	line "kann nicht einfach"
	cont "loslassen. Nicht"
	cont "nach allem."

	para "Erwartest Du, daß"
	line "ich einfach gehe,"

	para "und unsere Sache"
	line "aufgebe?"
	done

RadioTower5FRocketBossDisbandText6:
	text "Ich… ich brauche"
	line "Zeit. Ich muß hier"
	cont "weg."
	done

RadioTower5FRocketBossDisbandText7:
	text "Aber merke Dir,"
	line "GIOVANNI. Auch"
	cont "wenn der Weg"
	cont "falsch war…"

	para "Meine Absichten"
	line "waren aufrichtig!"
	done

RadioTower5FDirectorThankYouText:
	text "INTENDANT:"
	line "<PLAY_G>!"
	cont "Vielen Dank!"

	para "Dein couragiertes"
	line "Handeln hat die"

	para "#MON im ganzen"
	line "Land gerettet."

	para "Ich weiß, es ist"
	line "nicht viel, aber"
	cont "nimm dies bitte."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Früher gab es hier"
	line "einen Turm in"
	cont "DUKATIA CITY."

	para "Aber er war alt"
	line "und baufällig."

	para "Also haben wir ihn"
	line "durch unseren"
	cont "RADIOTURM ersetzt."

	para "Beim Bau haben wir"
	line "diese Glocke"
	cont "gefunden."

	para "Ich hörte, daß"
	line "früher viele ver-"
	cont "schiedene #MON"

	para "in DUKATIA CITY"
	line "lebten."

	para "Vielleicht…"

	para "…hat diese Glocke"
	line "etwas mit dem"

	para "ZINNTURM in TEAK"
	line "CITY zu tun…"

	para "Ah!"

	para "Das erinnert mich…"

	para "Ich habe TEAM"
	line "ROCKET zufällig"
	cont "flüstern hören."

	para "Es scheint, als"
	line "führten sie etwas"
	cont "am ZINNTURM im"
	cont "Schilde."

	para "Ich habe keine"
	line "Ahnung, was vor"

	para "sich geht. Viel-"
	line "leicht solltest Du"
	cont "es überprüfen."

	para "O.K., ich gehe in"
	line "mein BÜRO zurück."
	done

RadioTower5FDirectorText:
	text "INTENDANT: Hallo,"
	line "<PLAY_G>!"

	para "Du weißt, ich"
	line "liebe #MON."

	para "Ich errichtete"
	line "diesen RADIOTURM,"

	para "um meiner Liebe zu"
	line "#MON Ausdruck"
	cont "zu verleihen."

	para "Es wäre wunderbar,"
	line "wenn die Menschen"
	cont "unsere Sendungen"
	cont "liebten."
	done

BenText:
	text "BEN: Hörst Du Dir"
	line "unsere Musik an?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "4S BÜRO DES"
	line "   INTENDANTEN"
	done

RadioTower5FStudio1SignText:
	text "4S STUDIO 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	def_coord_events
	coord_event  0,  3, SCENE_DEFAULT, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScene

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	def_object_events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
	object_event 12,  0, SPRITE_RADIOTOWER_GIOVANNI, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GIOVANNI_RADIOTOWER
