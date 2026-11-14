# CLAUDE.md

Guardrails for translating a Pokémon ROM hack into German. They apply to every task unless the task explicitly overrides them.

Everything game-specific lives in **Project profile** and **Project decisions**. The rest of this file is the same for every hack and refers to those two sections.

## Project profile

Fill in once per hack. If a field is empty or turns out wrong, find the right value, tell me, and propose the change.

| Field | Value |
|---|---|
| Hack and repo | Pokémon Crystal Legacy, `cRz-Shadows/Pokemon_Crystal_Legacy`. Work happens on the fork `remo-vonarx/Pokemon_Crystal_Legacy`; PRs go there (`gh pr create --repo remo-vonarx/Pokemon_Crystal_Legacy`) |
| Based on | pret `pokecrystal`, by file content commit `82e315e48` (2022-04-19). Legacy shares no git history with pret |
| German original | Pokémon Kristall-Edition. ROM: `.claude/upload/Pokemon - Kristall-Edition (Germany).gbc` (SHA-1 `accb5842…`). `.claude/upload/` is excluded locally in `.git/info/exclude`. Text dump: `.claude/upload/german_text_dump.txt` (`[texts]` 5,692, `[pokemon names]` 251, `[trainers]` 541 by class and position, `[names]` 393 lists; each line starts with bank:address), made by `.claude/upload/dump_german_text.py`; verbatim. The ROM already uses the new spelling (`dass` 293×, never `daß`; `Straße`), lowercase `du`/`dein`, the lowercase possessive s (`LINDs`, `BILLs`) and `PROF. LIND` |
| Previous translations to reuse | Only the drawn graphics from branch `backup/german-translation-before-reset-2026-11-13`: the title banner `KRISTALL-VERMÄCHTNIS`, the Pokédex tab labels, the type pills, the weather icons and the Pokégear tiles. The words on them are asked again before reuse. That branch's text is not a source |
| Textbox | 18 characters × 2 lines, fixed-width font (one tile per character). The ▼ sits on the bottom border (`LoadBlinkingCursor`, tile 18,17), not on a text tile, so every line keeps all 18 tiles |
| Text commands | `text`, `next`, `line`, `para`, `cont`, `done`, `prompt`, `page` (`macros/scripts/text.asm`, as `EQUS`); inline: `text_far`, `text_ram`, `text_decimal`, `text_bcd`, `text_move`, `text_box`, `text_low`, `text_promptbutton`, `text_waitbutton`, `text_scroll`, `text_pause`, `text_dots`, `text_buffer`, `text_today`, `text_start`, `text_end`, `text_asm`, `sound_*`. Pokédex entries (`data/pokemon/dex_entries/`): species, height/weight, then 3 lines per page, 2 pages (`page`), ending in `@`; nothing is added after the last line. English lines reach 18 characters (SKIPLOOM) |
| Length constants | `constants/text_constants.asm`: `NAME_LENGTH` and `MON_NAME_LENGTH` 11 (10 characters + terminator), `PLAYER_NAME_LENGTH` 8 (7 + terminator), `BOX_NAME_LENGTH` 9, `MOVE_NAME_LENGTH`, `ITEM_NAME_LENGTH` and `TRAINER_CLASS_NAME_LENGTH` 13 (12 + terminator) |
| Charmap and font | `charmap.asm`, `gfx/font/` (`font.png`, `overworld.png`, `font_inversed.png`). Ä `$cd`, Ö Ü `$da`/`$db` (the unused bold A and B), ä ö ü ß `$d0–$d3` (the tiles of the contractions `'d 'l 'm 'r`, which the English text now writes as an apostrophe and a letter); the glyphs are the German ROM's, byte for byte, and so is `<MN>` (`$e2`) in all three fonts. Legacy's own redraws stay: `g j p q y` and `→` in `font_inversed.png` (Nayru's Pokédex). The German ROM has ß at `$be` and Ä Ö Ü ä ö ü at `$c0–$c5`, which Legacy uses for `<%> <BOLD_P> <BOLD_C>` and the box frame, so its RAM and tile bytes differ from ours |
| Build | `make RGBDS=~/.local/rgbds-0.5.2/bin/` (rgbds 0.5.2) builds `pokecrystal.gbc`. All targets: `crystal crystal11 crystal_au crystal_debug crystal11_debug crystal11_vc`. Upstream's own code gives 14 distinct rgbasm warnings (`-Wtruncation`, `-Wnumeric-string`); a task adds none. ROM0 has 342 bytes free (`main` at `c5d2a9142`) |
| Debug build | `make RGBDS=~/.local/rgbds-0.5.2/bin/ crystal_debug`. With a save, the main menu adds DEBUG ROOM (pret's developer tool); not tried in Legacy yet |
| Virtual Console | The game must also run as a Virtual Console title on the New Nintendo 3DS. `make RGBDS=~/.local/rgbds-0.5.2/bin/ crystal11_vc` builds `pokecrystal11.patch`, the VC patch that goes with `pokecrystal11.gbc`, from `vc/pokecrystal11.patch.template` (the helper ROM `pokecrystal11_vc.gbc` only feeds the patch). Only a real 3DS can run it; the build checks the hooks |
| Check scripts | `python3 tools/check_text_width.py`, `python3 tools/check_text_mode.py`, `python3 tools/check_names.py` (names from `tools/german_names.py`, read from the German ROM's tables by position). Known hits in Legacy's English, gone once translated: `maps/CeladonGameCornerPrizeRoom.asm:215` is 19 tiles wide (real, upstream's own). Known false alarms: `maps/RuinsOfAlphInnerChamber.asm:134`, Legacy's `NoRoomText` never ends, but nothing uses it; `check_names.py`'s `KimonoGirlGroup NAOKO should be EDITH`, the German ROM names pret's two NAOKOs NAOKO and EDITH by position. `check_names.py` reports every English place name until the place names are translated (`data/maps/landmarks.asm`, Legacy's `data/maps/map_names.asm`) |
| Emulator | PyBoy 2.9 with Pillow, in a venv in the scratchpad |
| Tilemap symbol | `wTilemap`, 20×18 tiles at `$C4A0`; the German ROM keeps it at `$C4A0` too |
| Test entry points | Event scripts without a hook: assemble a script (`INCLUDE "constants.asm"`, `LOAD` at `wOTPartyMons` `$D293`, up to `$120` bytes, safe outside trainer battles), write it there, then set `wMapReentryScriptBank` 1, `wMapReentryScriptAddress` to `$D293` and `wMapReentryScriptQueueFlag` 1; it runs on the next overworld frame (`givepoke`, `setflag ENGINE_POKEDEX`, `special …`, `callasm` to code in the same block). A new game: wait about 2400 frames, START, then A through the intro; on the naming screen START and A; about 100 A presses in all reach the player's room (map group 24, number 7). Mom's weekday and daylight-saving questions: from the player's room walk right 4, up 3, then down 3 on 1F. Title screen: about 3,150 frames after boot without input; there UP+SELECT+B opens the clear-save dialog and DOWN+B the clock reset (the German ROM's clock-reset combination did not fire in PyBoy). Save edits, the same in both ROMs (PyBoy `ram_file` in, `stop(save=True, ram_file=…)` out): bit 7 of `$AC60` in SRAM bank 0 (offset `0x0c60`) gives `UHR NICHT GESTELLT` and the clock correction; changing both checksums, bank 1 `$AD0D` and bank 0 `$BF0D` (offsets `0x2d0d`, `0x1f0d`), gives the corrupted-save message. Far calls from code in an event-script block: `ld a, bank` / `ld hl, address` / `rst $08`, values from the `.sym` file (`farcall` does not link there); this reaches `NameRival` and `NamingScreen` (`ld b, NAME_BOX`). The German ROM keeps pret's WRAM: in the ranges used so far that is Legacy's address minus `$0B` (`wMapReentryScript…` `$D45C`–`$D45F`, `wStatusFlags` `$D84C`, `wPartyCount` `$DCD7`, read off the matching code such as `RunMemScript`), so the same event-script entry point works there with the script at `$D288`; German routine addresses come from the matching code too. Legacy's script macros are pret's, so the same assembled script (`givepoke`, `verbosegiveitem`, `loadtrainer` + `startbattle`) runs in both ROMs; only Legacy's TM item numbers (2 higher: it moved `ITEM_C3`/`ITEM_DC` in front of the TMs) and its `special` numbers from `MoveReminder` on (two added) differ; assemble those numerically per ROM. German `wPokedexCaught`/`wPokedexSeen`: `$DE99`/`$DEB9`. Party, stats, pack: give the #MON with `givepoke`, then set their bytes in `wPartyMons` (ours `$DCEA`, German `$DCDF`, 48 bytes each: item +1, moves +2, DVs +21, happiness/egg cycles +27, catch data +29, status +32, HP +34; all stats +34–47 so both ROMs show the same numbers); an egg is `$FD` in `wPartySpecies`. Legacy's level cap (`wLevelCap` `$D9FE`) blocks RARE CANDY; Legacy's 4th stats page shows the hidden power line once `EVENT_CAUGHT_ALL_UNOWN` is set. Party genders: special `DayCareMan`. Start menu with every item: bit 0 of `wStatusFlags` (#DEX) and `wPartyCount` 1 with a species in `wPartySpecies` and `$ff` after it (#MON); bit 2 of `wStatusFlags2` gives the bug contest menu with FERTIG. Save questions: changing the saved player ID (SRAM bank 1 `$A009`, both ROMs) while the game runs gives the other-save-file question on the next save; the box-change and move-#MON save questions come from far calls to `ChangeBoxSaveGame` and `StartMoveMonWOMail_SaveGame` (German ROM `05:4A83`, `05:4B34`). Pokédex: fill `wPokedexSeen`/`wPokedexCaught` with `$ff`; on the list, set `wDexListingScrollOffset` to the species' index in `wPokedexOrder` minus 1 and `wDexListingCursor` 0, press DOWN (loads the sprite), A, then RIGHT ×3 and A for the area page. Time of day: `wStartHour`. Link (from the first translation): patch the slave copy's `START_TRANSFER_EXTERNAL_CLOCK` and the hardcoded `(1 << rSC_ON) \| (0 << rSC_CLOCK)` in `home/serial.asm` and `engine/link/link.asm`; save states break serial, so make an in-game save; talk to the battle receptionist from (9,3); keep both emulators within 2 frames |

## Project decisions

Settled choices for this hack. If one of the topics below is not decided yet and a task touches it, ask before translating.

- Name casing: capitals as in the German ROM (PROF. LIND, NEUBORKIA, #MON).
- Spelling: new German spelling, as the German ROM already writes it (dass, Straße); ß as the new spelling writes it (see Style). `du`, `dein`, `dich`, `dir` in lowercase as in the German ROM, also in Legacy's new text; capital only at a sentence start.
- "Pokémon": the charmap token `#` (POKé), as in the German ROM (`#MON` 1255×, `#DEX`).
- Stat labels: as in the German ROM, on screens and in text. Labels Legacy added (DV, EV, …) are asked when they come up.
- Pokédex: metric as in the German ROM; entries from the German Kristall-Edition (Legacy changed none of the 251). Shortening is not allowed.
- Trainer names: original German names from the German ROM, incl. unused slots. Characters Legacy added from later games (e.g. the Rocket executives) get their official German name from the game they come from; shorten the class, never the name.
- Characters from later games: official German names from the game they come from (PokéWiki).
- Player address: the player can be a boy or a girl, as in the German ROM. Keep the German ROM's lines as they are; Legacy's new text addresses the player neutrally (no Junge / Mädchen / Kleiner; `Kind` or no word). Role words such as Trainer and Champion stay as in the German games. Propose every such change and let me confirm it.
- Mobile adapter screens (trade corner, profile, news; never reached outside Japan): translated like everything else. The German ROM's text where it has one, own translation (flagged) for the rest.
- Debug room (debug builds only): stays English.
- Choices from the first translation (branch `backup/german-translation-before-reset-2026-11-13`) are not settled: follow the German ROM and ask again when one comes up. Only `KAMPF` in the battle menu is kept (see `GLOSSARY.md`) and its drawn graphics may be reused (see the profile).
- One-off NPC names without an official source: propose a German name and flag it.

## Source priority

For each string, use the first source that covers it:

1. `GLOSSARY.md`: decisions already made are final unless I reopen them.
2. Dump of the German original: if the string exists there, take it verbatim. If the hack changed the English text, start from the original German wording and change only what differs.
3. Previous translations: reuse them if they match the current English text.
4. Official German text from later games: PokéWiki (pokewiki.de); PokeAPI (pokeapi.co, language `de`) for species, moves, items, abilities and natures.
5. Own translation: allowed, but always flagged as such and listed for review. See "New content from the hack" below.

- PokeAPI documentation: https://pokeapi.co/docs/v2. Useful endpoints: `pokemon-species`, `move`, `item`, `ability`, `nature`. German text is in the `names`, `genera` and `flavor_text_entries` lists, filtered by `language.name == "de"` (e.g. https://pokeapi.co/api/v2/item/assault-vest).
- PokeAPI's German data is incomplete for some entries. If a German value is missing or looks wrong, check PokéWiki; if the two disagree, PokéWiki wins and you mention the difference.
- Cache PokeAPI responses locally in the scratchpad instead of requesting the same resource again.
- Bulbapedia and other English sources are for understanding context only, never for German wording.
- Never present a name as "official" without a source. If nothing is found, say so.

### New content from the hack

Text the hack added has no German original, so translate it faithfully:

- Keep the full meaning: every piece of information, instruction and hint. Add nothing, leave nothing out, don't "improve" or rewrite the content.
- Keep the tone, the character's voice, jokes and references. Write natural German, not word for word, but don't adapt freely beyond what German needs.
- Terms that already exist in the game (items, moves, places, characters) use their official German names, even inside new text.
- Wordplay, puns and references that don't work in German: propose a German equivalent that keeps the effect, explain the original, and flag it.
- Match the German original's style so new text doesn't stand out next to the old.

## Working agreement

- Code, labels, comments, file names and commit messages stay in English. Only player-visible text is translated.
- Read `GLOSSARY.md` before every task; add every new decision to it.
- State assumptions. Ask rather than guess, especially for names.
- Collect open questions during a task and ask them together, as a table:

  | File:line | English | German candidate(s) | Source | Where in game | Why unsure / what differs |

- Keep each task scoped to one area (one map, one data file, one menu). No drive-by refactors.
- Change string contents only. Don't rename labels, reorder data or touch game logic. If a translation needs a code change (e.g. wider menu), propose it first.
- Reference material (dumps, original ROMs, previous translations) is read-only.

## Text constraints

- Never exceed the textbox from the profile. With variable-width fonts, measure in pixels, not characters.
- If the profile says the ▼ covers a text tile, a line in the box's bottom row that waits for a button (followed by `cont`, `para` or `prompt`) holds one character less: the character under the ▼ is lost.
- Pokédex entries: follow the line limits and the ending in the profile (some engines add a closing "." themselves).
- Keep the semantics of the text commands: re-breaking lines is fine; changing how a box ends is not.
- Count variables (player and rival name, Pokémon, item and move names, numbers) at their maximum length. Take the limits from the length constants, never from memory.
- Names and fixed-width strings (menus, padded labels) must respect their length constant or exact padded width.
- Use only characters defined in the charmap. Verify that ä, ö, ü, Ä, Ö, Ü, ß and any punctuation you use map to font tiles. Don't add charmap entries or font graphics without asking.
- Know the special charmap tokens (e.g. `#` for "POKé") and follow the project decisions on whether to use them.
- Avoid German constructions whose article, case or gender depends on a variable (e.g. "einen/eine <ITEM>"). Rephrase neutrally.
- If the player can be male or female, avoid gendered forms for the player, or follow how the German original handles it.

### When text doesn't fit

Never leave out a word, a piece of information or a nuance to make something fit. Work through these steps in order:

1. Fit the full words. In dialogue, re-break the lines or add another line or box before touching any word.
2. Look for an official abbreviation: the German original, later German games (PokéWiki) or `GLOSSARY.md`, in that order.
3. If none exists, suggest abbreviations yourself and ask before using them. For each, show the full word, the limit, one or two abbreviation options, and why each one stays unambiguous next to similar terms.
4. Abbreviate as little as possible: shorten one word, not several, and keep the meaning unambiguous. Use the same abbreviation for the same word everywhere and add it to `GLOSSARY.md`.

Example: *Assault Vest* is officially "Offensivweste" (13 characters); the item name limit is 12.

| Option | Verdict |
|---|---|
| Offensivwest | Bad: silently cut, looks like a typo |
| Weste | Bad: drops what makes this item distinct |
| Offensivw. | Weak: keeps the distinct part, but loses what kind of item it is |
| Offens.weste | Good: one word shortened, item type intact, still recognisable |

Ask me with the last two options, then record the choice in `GLOSSARY.md`.

When a name and a generic part (trainer class, title) share a limited space, shorten the generic part. Never shorten the name: it is what identifies the character.

Example: *OFFICER ROCKY* doesn't fit.

| Option | Verdict |
|---|---|
| OFFICER ROC | Bad: name silently cut |
| OFFICER RO. | Bad: the name is abbreviated and no longer recognisable |
| ROCKY | Bad: drops the trainer class |
| OFF. ROCKY | Good: class shortened, name intact |

Use the same class abbreviation for every trainer of that class.

Exceptions to these rules exist only where the project decisions say so (e.g. Pokédex entries that may be shortened).

## Style

- Write ß as the new spelling does: after a long vowel or diphthong (Straße, groß, weiß, heiß), ss after a short vowel (dass, muss, lässt, Biss). Text from the German original keeps its ß except in those short-vowel words, which are one character longer there, so re-check the length. Words in capitals keep SS, as in the German ROM (WINDSTOSS, AUSSER BETRIEB).
- Match the tone of the German original; keep each NPC's voice (kids, elders, villain teams, gym leaders) consistent.
- Reuse the original's in-game terminology (e.g. "Arena", "Orden", "Beutel") rather than modern synonyms, unless the glossary says otherwise.

## Validation (every task)

- The build must succeed without errors. If a section or bank overflows because German text is longer, stop and report. Don't move sections on your own.
- The Virtual Console patch must build too (`crystal11_vc`, see the profile), without errors or warnings.
- Re-check every changed line against the textbox and length limits.
- Test every change in the game (see below).
- Finish with a summary: files touched, strings translated, own proposals (flagged), open questions, screens seen and screens not reached.

## Testing in the game

A text, menu or graphics change is done when you have seen it in the emulator and it matches the German original **by position**: the same tiles in the same places, unless the hack itself changed that spot or the new spelling writes ss where the original has ß (dass for daß). Where it did, compare against the hack's English screen instead: same layout, German text fits. A string existing somewhere in the ROM proves nothing.

1. After any text edit, run the check scripts from the profile. Ignore only the known false alarms listed there.
2. Clone the repo into the scratchpad and do all test work there. Hooks, ROM patches and save states stay in that clone and are never committed.
3. Build the debug ROM (or the normal one if there is none) as described in the profile.
4. Drive it from a script with the emulator from the profile, with its dependencies in a venv in the scratchpad. Read the tilemap to check each position, and save a screenshot for me.
5. Open the same screen in the German original ROM and compare it tile by tile. For menus, compare the box coordinates too. The original ROM's RAM addresses differ from the hack's symbol file: never reuse those addresses on it.
6. Tell me which screens you saw, and name the ones you could not reach.

### Reaching a screen

- Use the debug menu if the hack has one.
- For screens you can't reach directly, add a hook at the top of a routine that runs every overworld frame. The hook reads an unused RAM byte and jumps to a test case: a warp, a battle, or any routine through a far call. Save a state in the overworld and reload it for each case.
- Battles can often be started by setting the opponent and level variables in the overworld and taking one step.
- If a warp keeps the old position (e.g. between maps with the same tileset), warp through an interior first.
- If the game has a real-time clock, set it so time-of-day and weekday texts appear.
- When you find a reliable way to reach a kind of screen, propose adding it to the profile.

### Link features (trades, link battles)

- Run two emulator instances that share the serial connection. With PyBoy: a shared subclass of `SerialSharedMemoryBuffer`, with `serial_interrupt_based=True` (worked with PyBoy 2.9).
- One side must be master and the other slave. Patch a copy of the ROM for the second instance so it takes the other role, and record the patch in the profile.
- Arm the slave only while the master waits (with PyBoy: write `$80` to `rSC` while `buf.barrier.n_waiting > 0`).
- Save states break serial, so each run boots from scratch. Prepare a save standing in front of the link receptionist.
- If the link menu misses inputs, hold each button longer (about 12 frames was needed in Yellow Legacy).

## Git

- One-line commit messages, no `Co-Authored-By` or session trailers.
- Don't push.
