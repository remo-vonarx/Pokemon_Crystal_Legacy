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
