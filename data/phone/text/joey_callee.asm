JoeyAnswerPhoneText:
	text_ram wStringBuffer3
	text ", hallo!"

	para "Oh, <PLAYER>?"
	line "Geht es Dir gut?"
	done

JoeyAnswerPhoneDayText:
	text_ram wStringBuffer3
	text ", hallo!"

	para "Oh, <PLAYER>?"
	line "Geht es Dir gut?"
	done

JoeyAnswerPhoneNiteText:
	text_ram wStringBuffer3
	text ", hallo!"

	para "Oh, <PLAYER>?"
	line "Geht es Dir gut?"
	done

JoeyGreetText:
	text "Yo, <PLAYER>!"
	line "Wie geht es Dir?"

	para "Ich, @"
	text_ram wStringBuffer3
	text ","
	line "hast Du Zeit?"
	done

JoeyGreetDayText:
	text "Yo, <PLAYER>!"
	line "Wie steht's?"

	para "@"
	text_ram wStringBuffer3
	text ", hallo!"
	line "Hast Du Zeit?"
	done

JoeyGreetNiteText:
	text "Yo, <PLAYER>!"
	line "Wie geht es Dir?"

	para "@"
	text_ram wStringBuffer3
	text ", hallo,"
	line "hast Du Zeit?"
	done

JoeyGenericText:
	text "Wie geht es Deinen"
	line "#MON?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist nicht zu hal-"
	cont "ten, wie immer."

	para "Es ist mein Ein"
	line "und Alles. Ich"

	para "werde mit ihm ein"
	line "toller Trainer"
	cont "sein!"
	done
