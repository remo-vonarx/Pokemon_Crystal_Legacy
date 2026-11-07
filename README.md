# Pokémon Crystal Legacy

This is a Pokemon Rom Hack made by [TheSmithPlays](https://www.youtube.com/@TheSmithPlays) based on [the Pokémon Crystal Disassembly](https://github.com/pret/pokecrystal) with the intended purpose of fixing Pokemon Crystal into a more polished, balanced and overall engaging Crystal experience. Generation 2 is one of the most beloved sets of games in the franchise. It introduced tons of mechanics to the game that ended up becoming mainstays within the franchise even now. It also had fan favorite Pokemon, a diverse region, deep lore, nonlinearity, and an entire separate region as its postgame which allowed the player to rematch characters from Generation 1. This created an intoxicating and memorable experience that is still remembered by fans today. Unfortunately, it seems that for every good decision Gen 2 saw, there was a mistake made too, and this is why it sees a lot of criticism. Most often, players critique Gen 2 for failing in its representation of its own region’s Pokemon, its inconsistent level curve and a lackluster postgame. Furthermore, terrible learnsets inhibit the vast majority of Pokemon and questionable design choices make diverse party building incredibly difficult. It’s also been criticized for having a poorly written villainous group storyline with no enjoyable payoff. Ultimately, these and many other small features lead to this trio of games feeling incredibly underbaked, much to the dismay of its fans. Feeling as if it could be so much more, TSP (TheSmithPlays) set out to fix this game, and to turn it into the best possible version of itself, while still retaining the iconic Pokemon Crystal feel that fans have come to love. 

Fixes and/or adjustments in this rom hack will include the following: moves, learnsets for Pokemon, wild Pokemon locations, the Team Rocket storyline, the rival’s team & their storyline, teams on both normal trainers, Gym Leaders, Elite Four, and other bosses. In addition it comes with many quality of life features that weren’t possible or weren’t considered when the games first came out.

Huge thanks to TSP for leading the project, Jaashouh the admin of the discord server, Craig the programmer helping Smith (TSP), Weebra the Editor for SmithPlays Pokemon, The mod team Regi, Aero, Daily, Zach, and the Testers for the game, Tiberius, Disq, Sable, Niftimo, Tavros, Karlos, Reader Dragon, Isona, Obelisk, BriceMCK, and Half1sch. Most of all Thanks to all of the fans who are supporting the project through the video series, the discord, and youtube community.

We would also like to credit & thank Katt, Chamber, Soloo993, Blue Emerald, Lake, Neslug, Tom Wang, Seasick, & Pikachu25 for the several amazing custom sprites used in the hack. Nayru62 for their help involving the Pokedex & Pokemon pages. Rangi42, Idain, DamienDoury, Sylvie, aaaaaa123456789, SonicRay100, Edtv-thevoid, coco-bandicoot, MajorAgnostic, KDLPro, Nick-PC, XaeroChill, & NobodySociety for their incredibly helpful tutorials for Pokecrystal. Finally, a massive shoutout to everyone involved in [the Pokémon Crystal Disassembly](https://github.com/pret/pokecrystal) as this project wouldn’t have even been able to get off the ground without them!


## Changes in this fork

This fork is a full German translation of Crystal Legacy. The general rule was to follow the German release *Pokémon Kristall*: its wording, menu layouts and graphics are used wherever Crystal Legacy did not change a spot, and its minor mistakes, such as typos, grammar errors and text running past its box, are fixed. Text that Crystal Legacy added or changed got a new translation in the German release's wording and style. It is the sister of the German fork of [Yellow Legacy](https://github.com/cRz-Shadows/Pokemon_Yellow_Legacy).

**German:**
* All dialogue, signs, phone calls, radio shows, item and move descriptions and menus, in the German release's old spelling (*daß*, *muß*) with *Du* and *Dein* capitalised; a girl player is addressed neutrally
* The Pokédex, with entries and categories from the German release and heights and weights in metres and kilograms, and Nayru's Pokédex pages (stats, moves, areas, evolutions and pictures) with their labels in the German release's style
* Moves, items, badges, types, stats, trainer classes and map names
* All 251 Pokémon (FLEGMON, KARPADOR, ICOGNITO, ...); the Pokédex A to Z mode is sorted by the German names
* Characters, cities and places as in *Pokémon Kristall* (PROF LIND, NEUBORKIA, DUKATIA CITY, KNOFENSA-TURM, ALPH-RUINEN, ...)
* The in-game trade nicknames and OTs, the default names GOLD, KRISTA and SILBER, and the cries of talking Pokémon as in the German release (`docs/german_cries.md` lists them all)
* The title KRISTALL-VERMÄCHTNIS, the German graphics (bag pockets, battle, trainer card, slot machine, Unown words, word rooms, diploma, printer, ...) and the German staff credits; Legacy's own credits got German role headings, while names and handles stay as they are

DVs and EVs keep their English abbreviations, DV and EV. The battle menu says KAMPF, where the German release shortens it to KMPF.

**Still English:** the debug menus. The Unown words stay English as in the German release, and so do WEEBRA's KAPOERA *Cinderella* and the word *Disassembly* in the thanks to pret.

**Bug fixes from upstream pull requests and issues:**
* [#33](https://github.com/cRz-Shadows/Pokemon_Crystal_Legacy/pull/33) by Linus Unnebäck: the Battle Tower uses the Rocket leader's class, not Archer's trainer id
* [#35](https://github.com/cRz-Shadows/Pokemon_Crystal_Legacy/pull/35) by Linus Unnebäck: Cara's Seadra knows TWINEEDLE
* [#36](https://github.com/cRz-Shadows/Pokemon_Crystal_Legacy/pull/36) by Linus Unnebäck: Blue's second party for the rematch
* [#42](https://github.com/cRz-Shadows/Pokemon_Crystal_Legacy/pull/42) by ssabo: the Pokédex area page shows the right game corner and price for the prize Pokémon
* [#27](https://github.com/cRz-Shadows/Pokemon_Crystal_Legacy/issues/27): the Pokédex stats pages wrap back to the first page
* [#38](https://github.com/cRz-Shadows/Pokemon_Crystal_Legacy/issues/38): the herb shop lady in the underground says she sells herbs, as in the German release

The font has Ä in tile `$cd`, Ö and Ü in `$da`-`$db`, and ä, ö, ü and ß in `$d0`-`$d3`. To keep names, line lengths and text commands consistent after changes, run `python3 tools/check_names.py`, `python3 tools/check_text_width.py` and `python3 tools/check_text_mode.py`.


## Download and Play

* ### **You should use RGBDS version 0.5.2.**
* On macOS, build 0.5.2 from source:
  ```
  brew install bison libpng pkg-config
  curl -L https://github.com/gbdev/rgbds/archive/refs/tags/v0.5.2.tar.gz | tar -xz
  cd rgbds-0.5.2
  make BISON=$(brew --prefix bison)/bin/bison
  make install PREFIX=$HOME/.local/rgbds-0.5.2
  ```
  Then run `export PATH=$HOME/.local/rgbds-0.5.2/bin:$PATH` before `make` in this repository. With a newer RGBDS the `Pics` banks overflow.
* To set up the repository, see [INSTALL.md](INSTALL.md).


## A complete list of features can be found here:
Full doc: https://docs.google.com/document/d/1Zku4s049Sri266zr4BhF-riqecOOHjytfZPbQULmcYk/edit?usp=sharing

These videos also provide an overview of the hack and the ideology behind it:
- Release 1.0: https://www.youtube.com/watch?v=oeJBVY3z_uE&t=1s
- Update 1.2: https://www.youtube.com/watch?v=7ojafJ5Xg4U
- Prerelease: https://www.youtube.com/playlist?list=PLyv5bsGgaxolnH8KcZsCmL9StmMQOBZlv


## Our Other Projects
* Pokemon Yellow Legacy: https://github.com/cRz-Shadows/Pokemon_Yellow_Legacy
* Pokemon Cursed Yellow: https://github.com/cRz-Shadows/Pokemon_Cursed_Yellow
* Pokemon Battle Simulator: https://github.com/cRz-Shadows/Pokemon_Trainer_Tournament_Simulator


## Discussion and Community
* YouTube: https://www.youtube.com/@smithplayspokemon
* Discord: https://discord.gg/Wupx8tHRVS
* Twitter: https://twitter.com/TheSmithPlays
* Instagram: https://www.instagram.com/thesmithplays/


## Pret Stuff
- **All Pret Projects:** [pret.github.io](https://pret.github.io/).
- [**FAQ**](FAQ.md)
- [**Documentation**][docs]
- [**Wiki**][wiki] (includes [tutorials][tutorials])
- **Discord:** [pret][discord]
- **IRC:** [libera#pret][irc]


## Credits For Crystal Legacy:

### Creators:
- TheSmithPlays - Developer
- cRz Shadows - Devoloper
- Weebra - Video Editor


### Playtesters:
- Jaashouh - Project and Discord Manager
- Aerogod
- Disq
- Karlos
- ZuperZACH
- Regi
- Isona
- Bricemck
- Daily
- Tiberios
- Sable
- Niftimo
- Tavros
- Reader Dragon
- Half1sch
- Talos
- Wootonmajr
- Obelisk


### Sprite Artists:
- Pokemon overworld sprites
    - Katt
    - Karlos
- Pokemon party sprites
    - Chamber
    - Soloo993
    - Blue Emerald
    - Lake
    - Neslug
    - Pikachu25
    - Tom Wang
    - Seasick


### Where you can find all Pret Tutorials:
* https://github.com/pret/pokecrystal/wiki


### Code Credits:
- Rangi42: 
    - [Add a new map and landmark](https://github.com/pret/pokecrystal/wiki/Add-a-new-map-and-landmark)
    - [Add a new trainer class](https://github.com/pret/pokecrystal/wiki/Add-a-new-trainer-class)
    - [Add a new item](https://github.com/pret/pokecrystal/wiki/Add-a-new-item)
    - [Add a new party menu icon](https://github.com/pret/pokecrystal/wiki/Add-a-new-party-menu-icon)
    - [Add a new overworld sprite](https://github.com/pret/pokecrystal/wiki/Add-a-new-overworld-sprite)
    - [Add a new Mart](https://github.com/pret/pokecrystal/wiki/Add-a-new-Mart)
    - [Add a fourth stats page](https://github.com/pret/pokecrystal/wiki/Add-a-fourth-stats-page)
    - [Add a new spawn point](https://github.com/pret/pokecrystal/wiki/Add-a-new-spawn-point)
    - [Add a new scene script](https://github.com/pret/pokecrystal/wiki/Add-a-new-scene-script)
    - [Expand tilesets from 192 to 255 tiles](https://github.com/pret/pokecrystal/wiki/Expand-tilesets-from-192-to-255-tiles)
    - [Allow more than 15 object_events per map](https://github.com/pret/pokecrystal/wiki/Allow-more-than-15-object_events-per-map)
    - [Improve the outdoor sprite system](https://github.com/pret/pokecrystal/wiki/Improve-the-outdoor-sprite-system)
    - [Color party menu icons by species](https://github.com/pret/pokecrystal/wiki/Color-party-menu-icons-by-species)
    - [Colored trainer card badges](https://github.com/pret/pokecrystal/wiki/Colored-trainer-card-badges)
    - [Show the tops of leaders heads on the trainer card](https://github.com/pret/pokecrystal/wiki/Show-the-tops-of-leaders-heads-on-the-trainer-card)
    - [Show move names when you receive a TM or HM](https://github.com/pret/pokecrystal/wiki/Show-move-names-when-you-receive-a-TM-or-HM)
    - [Automatically reuse Repel](https://github.com/pret/pokecrystal/wiki/Automatically-reuse-Repel)
    - [Running Shoes](https://github.com/pret/pokecrystal/wiki/Running-Shoes)
    - [Show an icon for the current weather](https://github.com/pret/pokecrystal/wiki/Show-an-icon-for-the-current-weather)
    - [Use unique colors for each thrown Poké Ball](https://github.com/pret/pokecrystal/wiki/Use-unique-colors-for-each-thrown-Pok%C3%A9-Ball)
    - [Level cap](https://github.com/pret/pokecrystal/wiki/Level-cap)
- Nayru62:
    - [Nayru's Pokedex](https://github.com/Nayru62/pokecrystal/tree/Nayrus-Pokedex-Vanilla-TypeGFX-BETA)
    - [Ultimate Pokemon stats pages](https://github.com/Nayru62/pokecrystal/tree/stats-pages-utilities-vanilla)
    - [Move reminder and egg move reminder - (Adapted from Rangi42's Polished Crystal)](https://github.com/Nayru62/pokecrystal/tree/PC_Move_and_EggMove_Relearner)
    - [Kurt Makes Pokeballs Instantly](https://github.com/pret/pokecrystal/wiki/Kurt-Makes-Pokeballs-Instantly)
- Idain:
    - [Allow more trainer parties, with individual DVs, stat experience, nicknames, variable teams, etc](https://github.com/pret/pokecrystal/wiki/Allow-more-trainer-parties,-with-individual-DVs,-stat-experience,-nicknames,-variable-teams,-etc)
    - [Color Pokémon pictures shown in overworld](https://github.com/pret/pokecrystal/wiki/Color-Pok%C3%A9mon-pictures-shown-in-overworld)
    - [Option to show shiny colors in Pokédex](https://github.com/pret/pokecrystal/wiki/Option-to-show-shiny-colors-in-Pok%C3%A9dex)
- aaaaaa123456789 - [Remove the artificial save delay](https://github.com/pret/pokecrystal/wiki/Remove-the-artificial-save-delay)
- SonicRay100 - [Simplify the Clock Reset Procedure](https://github.com/pret/pokecrystal/wiki/Simplify-the-Clock-Reset-Procedure)
- Etdv-thevoid - [Add a third trainer card page for Kanto badges](https://github.com/pret/pokecrystal/wiki/Add-a-third-trainer-card-page-for-Kanto-badges)
- coco-bandicoot - [Restore the GS Ball Celebi Event](https://github.com/pret/pokecrystal/wiki/Restore-the-GS-Ball-Celebi-Event)
- MajorAgnostic - [Force Set battle style or forbid item usage in battle](https://github.com/pret/pokecrystal/wiki/Force-Set-battle-style-or-forbid-item-usage-in-battle)
- KDLPro - [Make new battle text to distinguish status move misses and fails](https://github.com/pret/pokecrystal/wiki/Make-new-battle-text-to-distinguish-status-move-misses-and-fails)
- Nick-PC - [Splash a Pokédex Entry from an Overworld Event (Generation I)](https://github.com/pret/pokecrystal/wiki/Splash-a-Pok%C3%A9dex-Entry-from-an-Overworld-Event-(Generation-I))
- XaeroChill - [Reviving Pokémon from Fossils (Gen I)](https://github.com/pret/pokecrystal/wiki/Reviving-Pok%C3%A9mon-from-Fossils-(Gen-I))
- NobodySociety - [Customizable Pokédex Color](https://github.com/pret/pokecrystal/wiki/Customizable-Pok%C3%A9dex-Color)
- Luther7718 - [Text Suggestions/Fixes](https://github.com/luther7718/Pokemon_Crystal_Legacy_Gaiden)
- Mauve - Soft reset on wipeout (used in hardcore mode)
- towersvault [Adds Pack item sorting](https://github.com/cRz-Shadows/Pokemon_Crystal_Legacy/pull/18)


[pokered]: https://github.com/pret/pokered
[pokeyellow]: https://github.com/pret/pokeyellow
[pokegold]: https://github.com/pret/pokegold
[pokepinball]: https://github.com/pret/pokepinball
[poketcg]: https://github.com/pret/poketcg
[pokeruby]: https://github.com/pret/pokeruby
[pokefirered]: https://github.com/pret/pokefirered
[pokeemerald]: https://github.com/pret/pokeemerald
[docs]: https://pret.github.io/pokecrystal/
[wiki]: https://github.com/pret/pokecrystal/wiki
[tutorials]: https://github.com/pret/pokecrystal/wiki/Tutorials
[discord]: https://discord.gg/d5dubZ3
[irc]: https://web.libera.chat/?#pret
[ci]: https://github.com/pret/pokecrystal/actions
[ci-badge]: https://github.com/pret/pokecrystal/actions/workflows/main.yml/badge.svg
