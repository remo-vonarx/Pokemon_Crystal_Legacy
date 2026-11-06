VanceAnswerPhoneText:
	text "Ja, hallo? Hier"
	line "ist @"
	text_ram wStringBuffer3
	text "!"

	para "Moin, <PLAY_G>!"

	para "Setzt Du Vogel-"
	line "#MON ein?"
	done

VanceAnswerPhoneDayText:
	text "Ja, hallo? Hier"
	line "ist @"
	text_ram wStringBuffer3
	text "!"

	para "Moin, <PLAY_G>!"

	para "Fliegen Deine"
	line "Vogel-#MON?"
	done

VanceAnswerPhoneNiteText:
	text "Ja, hallo? Hier"
	line "ist @"
	text_ram wStringBuffer3
	text "!"

	para "N'Abend, <PLAY_G>!"
	line "Dürfen sich Deine"

	para "Vogel-#MON wil-"
	line "de Sachen ansehen?"
	done

VanceGreetText:
	text "Guten Morgen,"
	line "<PLAY_G>!"

	para "@"
	text_ram wStringBuffer3
	text " hier!"
	line "Guten Morgen!"
	done

VanceGreetDayText:
	text "Hi, <PLAY_G>!"

	para "@"
	text_ram wStringBuffer3
	text " hier!"
	line "Erinnerst Du Dich?"
	done

VanceGreetNiteText:
	text "Guten Abend,"
	line "<PLAY_G>!"

	para "@"
	text_ram wStringBuffer3
	text " hier!"
	line "Hast Du Zeit?"
	done

VanceGenericText:
	text "Geht es Dir und"
	line "Deinen #MON"
	cont "gut?"

	para "Mein @"
	text_ram wStringBuffer4
	text_start
	line "scheint so stark"

	para "werden zu wollen,"
	line "daß es das legen-"
	cont "däre VOGEL-#MON"

	para "herausfordern und"
	line "besiegen möchte!"
	done
