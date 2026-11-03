#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python check_names.py [--table-only | --tables | --category mon]

Check that the German names from german_names.py are used everywhere.
--table-only      only check data/pokemon/names.asm and the A-Z Pokedex order
--tables          check the name tables (Pokemon, map names, landmarks, ...)
--category NAME   only look for leftover English names of one category in text strings
Without options, everything is checked. Exits with status 1 if anything is found.
"""

import re
import sys
from pathlib import Path

import german_names as names

ROOT = Path(__file__).resolve().parent.parent
SCAN_DIRS = ('maps', 'data', 'engine', 'home')
SKIP_LINE = re.compile(r'^\s*(INCLUDE|INCBIN|SECTION)\b')

def changed(mapping):
	return {en: de for en, de in mapping.items() if en != de}

CATEGORIES = {
	'mon': changed({en: de for en, de in names.POKEMON.values()}
		| names.POKEMON_TEXT_ALIASES | names.NPC_NICKNAMES),
	'people': changed(names.PEOPLE),
	'place': changed(names.PLACES),
}

# files a category never touches; trainer names in parties.asm are renamed
# per trainer group, because e.g. a SWIMMER is called MARY too
SKIP_FILES = {
	'people': {'data/trainers/parties.asm', 'data/decorations/names.asm'},
}
# the staff credits keep their real names in every category
SKIP_ALWAYS = {'data/credits_strings.asm'}

PROTECTED = re.compile('|'.join(names.PROTECTED))

def protected_spans(string):
	return {i for match in PROTECTED.finditer(string) for i in range(*match.span())}

def category_paths(category, paths):
	skip = SKIP_FILES.get(category, set()) | SKIP_ALWAYS
	return [path for path in paths if str(path.relative_to(ROOT)) not in skip]

TABLE_FILES = {
	'data/maps/landmarks.asm': CATEGORIES['mon'] | CATEGORIES['place'],
	'data/maps/map_names.asm': CATEGORIES['mon'],
	'data/wild/fish.asm': CATEGORIES['mon'],
}

def code_part(line):
	# drop a trailing comment, but not a ';' inside a string
	return re.match(r'^((?:[^";]|"[^"]*")*)', line).group(1)

def strings(line):
	if SKIP_LINE.match(line):
		return []
	return re.findall(r'"([^"]*)"', code_part(line))

def word_re(*words):
	# "_" keeps symbols like {d:NUM_UNOWN} inside a string untouched
	return re.compile(r'(?<![A-Z_])(?:' + '|'.join(map(re.escape, words)) + r')(?![A-Z_])')

def scan(paths, mapping):
	# longest names first, so "MEW" isn't reported again inside "MEWTWO"
	patterns = [(en, mapping[en], word_re(en)) for en in sorted(mapping, key=len, reverse=True)]
	hits = []
	for path in paths:
		for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
			for string in strings(line):
				taken = protected_spans(string)
				for en, de, pattern in patterns:
					for match in pattern.finditer(string):
						span = set(range(*match.span()))
						if span & taken:
							continue
						taken |= span
						hits.append(f'{path.relative_to(ROOT)}:{number}: {en} -> {de}: "{string}"')
	return hits + scan_split(paths, mapping)

TEXT_LINE = re.compile(r'^\s*(?:text|line|cont|para|next|page|db)\s+"([^"]*)"')

def scan_split(paths, mapping):
	"""Find names hyphenated across two lines, like "MAGI-" / "KARP are biting!"."""
	hits = []
	for path in paths:
		lines = path.read_text(encoding='utf-8').splitlines()
		texts = [(number, match.group(1)) for number, line in enumerate(lines, 1) if (match := TEXT_LINE.match(line))]
		for (number, first), (_, second) in zip(texts, texts[1:]):
			head, tail = re.search(r'([A-Z]+)-$', first), re.match(r'[A-Z]+', second)
			if head and tail and head.group(1) + tail.group(0) in mapping:
				en = head.group(1) + tail.group(0)
				hits.append(f'{path.relative_to(ROOT)}:{number}: {en} -> {mapping[en]}: "{first}" / "{second}"')
	return hits

def species_constants():
	"""Map each species index (1-based) to its constant."""
	constants = {}
	for line in (ROOT / 'constants/pokemon_constants.asm').read_text().splitlines():
		match = re.match(r'\s*const\s+(\w+)\s*;\s*([0-9A-Fa-f]+)\s*$', line)
		if match:
			constants[int(match.group(2), 16)] = match.group(1)
	return constants

def alpha_key(name):
	# NIDORAN♀ before NIDORAN♂, both before NIDORINA
	return name.replace('♀', '0').replace('♂', '1')

def check_pokemon_table():
	constants = species_constants()
	entries = re.findall(r'db "([^"]*)"', (ROOT / 'data/pokemon/names.asm').read_text(encoding='utf-8'))
	problems = []
	for index, entry in enumerate(entries, 1):
		constant = constants.get(index)
		if constant not in names.POKEMON:
			continue
		got, want = entry.rstrip('@'), names.POKEMON[constant][1]
		if got != want:
			problems.append(f'data/pokemon/names.asm: {constant}: "{got}" should be "{want}"')
		if len(entry) != 10:
			problems.append(f'data/pokemon/names.asm: {constant}: "{entry}" is not 10 bytes long')
	order = re.findall(r'^\s*db (\w+)', (ROOT / 'data/pokemon/dex_order_alpha.asm').read_text(), re.M)
	want = sorted(names.POKEMON, key=lambda constant: alpha_key(names.POKEMON[constant][1]))
	if order != want:
		first = next(i for i, (a, b) in enumerate(zip(order, want)) if a != b)
		problems.append(f'data/pokemon/dex_order_alpha.asm: entry {first + 1} is {order[first]}, should be {want[first]} (sorted by German name)')
	return problems

def check_trades_and_defaults():
	problems = []
	trades = re.findall(r'^\s*npctrade .*?"([^"]*)".*?"([^"]*)"', (ROOT / 'data/events/npc_trades.asm').read_text(encoding='utf-8'), re.M)
	for (nickname, ot), (_, want) in zip(trades, names.TRADES):
		got = (nickname.rstrip('@'), ot.rstrip('@'))
		if got != want:
			problems.append(f'data/events/npc_trades.asm: {got} should be {want}')
	for path, english in (('data/player_names.asm', ('CHRIS', 'KRIS')), ('engine/menus/intro_menu.asm', ('CHRIS', 'KRIS')),
			('engine/events/specials.asm', ('SILVER',))):
		found = re.findall(r'db "([A-Z]+)@*"', (ROOT / path).read_text(encoding='utf-8'))
		for en in english:
			if en in found or names.DEFAULT_NAMES[en] not in found:
				problems.append(f'{path}: default name {en} should be {names.DEFAULT_NAMES[en]}')
	return problems

def check_trainers():
	from rename_trainers import PARTIES, trainers
	lines = PARTIES.read_text(encoding='utf-8').split('\n')
	problems = []
	for index, group, name in trainers(lines):
		mapping = names.TRAINER_NAMES.get(group, {})
		# German Kristall reuses names crosswise (CooltrainerF IRENE -> LOLA,
		# LOLA -> ROSI), so a name that is also a German name is no leftover
		if name in mapping and mapping[name] != name and name not in mapping.values():
			problems.append(f'data/trainers/parties.asm:{index + 1}: {group} {name} should be {names.TRAINER_NAMES[group][name]}')
	return problems

def check_tables():
	problems = check_pokemon_table() + check_trades_and_defaults() + check_trainers()
	for path, mapping in TABLE_FILES.items():
		problems += scan([ROOT / path], mapping)
	return problems

def check_category(category):
	paths = sorted(p for d in SCAN_DIRS for p in (ROOT / d).rglob('*.asm'))
	return scan(category_paths(category, paths), CATEGORIES[category])

def main():
	args = sys.argv[1:]
	if args == ['--table-only']:
		problems = check_pokemon_table()
	elif args == ['--tables']:
		problems = check_tables()
	elif len(args) == 2 and args[0] == '--category' and args[1] in CATEGORIES:
		problems = check_category(args[1])
	elif not args:
		problems = check_tables()
		for category in CATEGORIES:
			problems += check_category(category)
	else:
		print(__doc__, file=sys.stderr)
		sys.exit(2)
	for problem in problems:
		print(problem)
	print(f'{len(problems)} problem(s) found', file=sys.stderr)
	sys.exit(1 if problems else 0)

if __name__ == '__main__':
	main()
