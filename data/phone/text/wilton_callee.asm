WiltonAnswerPhoneText:
	text "Hallo, Du sprichst"
	line "mit @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAY_G>."
	done

WiltonAnswerPhoneDayText:
	text "Hallo, Du sprichst"
	line "mit @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, <PLAY_G>,"
	line "nicht wahr?"
	done

WiltonAnswerPhoneNiteText:
	text "Hallo, Du sprichst"
	line "mit @"
	text_ram wStringBuffer3
	text "…"

	para "Ah, wenn das nicht"
	line "<PLAY_G> ist."
	done

WiltonGreetText:
	text_ram wStringBuffer3
	text " hier…"

	para "Hast Du einen Mo-"
	line "ment Zeit?"
	done

WiltonGreetDayText:
	text_ram wStringBuffer3
	text " hier…"

	para "Kannst Du jetzt"
	line "reden?"
	done

WiltonGreetNiteText:
	text_ram wStringBuffer3
	text " hier…"

	para "Entschuldige die"
	line "späte Störung."
	done

WiltonGenericText:
	text "Sind Deine #MON"
	line "gewachsen?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "ist ganz schön"
	cont "gewachsen."
	done
