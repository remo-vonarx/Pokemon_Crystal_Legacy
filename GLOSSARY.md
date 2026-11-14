# Glossary

Settled translation decisions for Crystal Legacy. Read before every task; add each new decision here. General rules live in `CLAUDE.md` (Project decisions).

| English | German | Where | Source / note |
|---|---|---|---|
| FIGHT | KAMPF | battle menu | My choice over the German ROM's `KMPF`; any layout change it needs is shown first |
| Normal / Hard / Hardcore | NORMAL / SCHWER / EXTREM | Legacy's difficulty menu | Own; capitals like the German ROM's `JUNGE` / `MÄDCHEN` menu |
| Select difficulty. | Wähle den Schwie- / rigkeitsgrad. | difficulty menu | Own |
| Are you sure? Classic POKéMON rules. | Bist du sicher? Klassische #MON-Regeln. | after NORMAL | Own; `Bist du sicher?` is the German ROM's phrase |
| Are you sure? SET mode, no items in battle, GYM LVL caps. | Bist du sicher? Kampfstil FOLGEND, keine Items im Kampf und Levelgrenzen je ARENA. | after SCHWER | Own; `FOLGEND` is the German ROM's name for the SET battle style; `Levelgrenze` for level cap |
| Are you sure? Hard mode, but POKéMON can't be revived. Wipeouts reset to previous save. | Bist du sicher? Wie SCHWER, aber #MON können nicht wiederbelebt werden. Bei einer Niederlage wird der letzte Spielstand geladen. | after EXTREM | Own, literal; chosen over the German ROM's BELEBER and whiteout wording (`besiegte #MON wachen nicht wieder auf`, `kein kampffähiges #MON`) |
| Select CONTINUE & reset settings. | Wähle Fortfahren & verwirf die Einstellungen. | clock reset on the title screen | German ROM 71:5792 without its first line `Passwort O.K.` (Legacy has no password); `Fortfahren` kept although the menu item is `WEITER` |
| (menu layouts) | German ROM coordinates | Continue box, save question, yes/no box, clear-save and clock reset, boy/girl menu, weekday box, options | Taken from the German ROM's code where the German text needs the room |
| (`<MN>` glyph) | German ROM's tile | standard, inverted and overworld font | The only glyph both ROMs share that the German ROM redrew |
| Close this menu | Menü / schliessen | start menu, description of ZURÜCK | German ROM 04:67a9 verbatim, ss kept (chosen over the ß rule) |
| Also, your POKéGEAR is back from the shop. | Außerdem ist dein #COM von der Reparatur zurück. | Mom, first talk | German ROM 1e:6c34 with Legacy's cuts; `Außerdem` own for Legacy's `Also,`; the ROM's `von der Reparatur` kept for Legacy's `shop` |
| Great! No need to explain it then. | Toll! Dann muss ich es dir nicht erklären. | Mom, after JA to the phone question | Own |
| Oh, and remember, you can get there faster if you run! | Oh, und vergiss nicht: Wenn du rennst, bist du schneller dort! | Mom, end of her talk | Own; `Vergiss nicht` as in the German ROM |
| Pokémon, move, item, type and trainer class names, A–Z Pokédex order | German ROM tables, by index | everywhere | German ROM: Pokémon 14:736e (incl. `?????` and `EI`), moves 72:5e9d, items 72:4000, types via 14:496e (BIRD is empty there), classes 0b:41ef, A–Z order 10:4c5e |
| Trainer names | German ROM, by trainer class and position | trainer battles, phone | Same English name, different German name by position: the two KIMONO_GIRL NAOKOs are NAOKO and EDITH; KATE is `EDNA ` with the ROM's trailing space |
| OLD AMBER / DOME FOSSIL / HELIX FOSSIL | ALTBERNSTEIN / DOMFOSSIL / HELIXFOSSIL | Legacy's fossil items | Official (PokeAPI) |
| BOSS (Legacy's trainer class) | BOSS | Giovanni | German Feuerrot/Blattgrün (PokéWiki); chosen over HeartGold/SoulSilver's `Rocket Boss` |
| ROCKET / <PKMN> TRAINER (Legacy's classes) | ROCKET / TRAINER | Archer, Weebra | The German ROM's names for the same English class names |
| ARCHER / ARIANA | ATLAS / ATHENA | Rocket executives | PokéWiki (HeartGold/SoulSilver) |
| ETO (Legacy's named grunt) | RÜPEL | Slowpoke Well, Rocket HQ, Goldenrod warehouse | Like the German ROM's other grunts (GRUNT → RÜPEL) |
| SMITH / CRAIG / WEEBRA | SMITH / CRAIG / WEEBRA | Trainer House B1F | Legacy's own names, kept |
| DORIS / PAUL (trade nicknames) | DORIS / POLLO | Legacy's MR. MIME and HAUNTER trades | The German ROM's DORI and AVIO in these slots were puns on DODRIO and XATU. DORIS kept; POLLO is the German nickname of the HAUNTER traded in Diamond/Pearl/Platinum (PokéWiki), since the German ROM's trainer here is PAUL. OTs from the German ROM (CARMEN, PAUL) |
| Item pocket names, receive texts | ITEM-TASCHE / BASIS-ITEMS / BALL-TASCHE / TM-TASCHE; `erhält`, `steckt … in …`, `… ist voll…` | receiving items | German ROM 25:7024, 71:4820–484e |
| Party menu, submenus, stats screen, pack, TM pocket and trainer card labels and texts; item and move descriptions | German ROM, verbatim | party, stats, pack, trainer card | German ROM: party 14:40c8–4549, submenus 09:4cb2 and 09:4edd, item and mail texts 70:5dcf, healing results 6f:40ae, stats screen 13:6128 and 14:4ba7, pack 04:412c and 70:4d52, TM pocket 70:4368, descriptions 72:4979 and 0b:4b55 (by index), trainer card 09:52f8. Debug-only stats screen lines stay English |
| USE / GIVE / TOSS / SEL / QUIT, CANCEL | OK / GIB / MÜLL / WAHL / ZUR., ZURÜCK | pack menus, list ends | German ROM |
| (menu layouts) | German ROM coordinates | party submenu (x 5), mail submenu (x 10), battle submenu (x 9), move screen `ANGR/` (11,12), trainer card: no `NAME/`, the name at (2,2) | User decision: follow the German ROM |
| DVS: ATK DEF / HP SPC SPE | DV: ANGR VER / KP SPEZ INIT | Legacy's 4th stats page | `DV` kept (user, over PokéWiki's `IS`); abbreviations from the German ROM (stats screen, `SPEZ-Wert` in KALZIUM's text); the values stay in Legacy's columns |
| MET: / MORN DAY NITE / TRADE / UNKNOWN LOCATION | FANG / VORM. TAG NACHT / TAUSCH / UNBEKANNTER ORT | Legacy's 4th stats page | Own (approved); `VORM.` after the German clock's `VORMITTAG`. Gifts and trades have no catch time, so `TAUSCH` has the level's column to itself |
| HIDDEN POWER, its type and power in Unown letters | KRAFTRESERVE; Ä as AE (`KAEFER`); `EINUNDFUENFZIG` | Legacy's 4th stats page, once every UNOWN is caught | German move name; units before tens and Ä→AE are two small code changes (user-approved); ü written UE (Unown has A–Z only) |
| Sorting items! / Sorting is complete! | Items werden / sortiert! – Sortieren / abgeschlossen! | START in the pack (Legacy) | Own |
| OLD AMBER / DOME FOSSIL / HELIX FOSSIL descriptions | Bernstein mit / #MON-DNA. – Versteinerte / #MON-Schale. – Versteinerte / #MON-Muschel. | pack | Yellow Legacy's German texts (user); DOME and HELIX get their own text there, so Legacy's shared block is split |
| CUT description (Legacy: high critical hit ratio) | Hohe Volltreffer- / quote. | move screen, TM pocket | Legacy uses KARATE CHOP's English: the German ROM's text for it |
| SKY ATTACK description (Legacy: one-turn attack) | Starke / Flug-Attacke. | move screen, TM pocket | Own, after the German ROM's MEGA KICK (`Starke Fuß-Attacke.`); Yellow Legacy keeps the two-turn text |
| HP: / № / POCKET and the pocket labels / ID No (tiles) | KP: / Nr / TASCHE and the German ROM's pocket labels / ID.Nr | party, stats screen, battle HUD, Pokédex; pack; trainer card | German ROM's tiles, byte for byte (user-approved): 3e:4600 tiles 0 and 20, 04:4b0d (17 label tiles), 22:47c2 tiles 4–5. Its blank tile `$70` (`<PO>`, still used by our text) is not taken |
