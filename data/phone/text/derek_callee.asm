DerekAnswerPhoneText:
	text "Hi, <PLAY_G>?"

	para "Guten Morgen pika."
	line "Was ist los pika?"
	done

DerekAnswerPhoneDayText:
	text "Hi, <PLAY_G>?"

	para "Guten Tag pika."
	line "Was ist los pika?"
	done

DerekAnswerPhoneNiteText:
	text "Hi, <PLAY_G>?"

	para "Guten Abend pika."
	line "Was ist los pika?"
	done

DerekGreetText:
	text "<PLAY_G> pika,"
	line "guten Morgen!"

	para "@"
	text_ram wStringBuffer3
	text " hier,"
	line "wie pika bist Du?"
	done

DerekGreetDayText:
	text "<PLAY_G> pika,"
	line "guten pika Tag!"

	para "@"
	text_ram wStringBuffer3
	text " hier,"
	line "wie pika bist Du?"
	done

DerekGreetNiteText:
	text "<PLAY_G> pika,"
	line "guten Abend!"

	para "@"
	text_ram wStringBuffer3
	text " hier."
	line "Warst Du wach?"
	done

DerekGenericText:
	text "Das mußt Du"
	line "hören! Mein lie-"
	cont "benswürdiges"

	para "@"
	text_ram wStringBuffer4
	text " sah"
	line "mich an und"
	cont "lachte!"

	para "Es muß daran lie-"
	line "gen, weil unsere"
	cont "Herzen im Einklang"
	cont "schlagen!"
	done
