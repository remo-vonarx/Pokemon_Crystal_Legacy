#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python check_text_width.py [file.asm|directory ...]

Report text lines that are wider than the 18-tile text box (dialogue, signs,
phone calls, radio and Pokedex entries), and map names wider than the
17 tiles the Pokegear has for them.
Checks maps/, data/, engine/ and home/ when no paths are given.
Lines whose width depends on runtime values (text_ram, text_decimal,
<USER>, ...) are skipped and need a manual check. Exits with status 1 if
any line is too wide.
"""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_PATHS = ('maps', 'data', 'engine', 'home')
MAX_WIDTH = 18
MAP_NAME_WIDTH = 17  # printed at column 2, the frame is at column 19
UNKNOWN = -1000  # pushes a line with a runtime-sized part below any limit
SKIP_FILES = {'credits_strings.asm'}  # the credits have their own layout

# tiles printed for each control character; 1 tile if not listed
CONTROL_WIDTHS = {
	'<PLAYER>': 7, '<RIVAL>': 7, '<PLAY_G>': 7, '<MOM>': 3,
	'<PKMN>': 2, '<POKE>': 2, '<TRAINER>': 7, '<ROCKET>': 6,
	'<PC>': 2, '<TM>': 2, '<……>': 2, '<DEXEND>': 0,
	'<USER>': UNKNOWN, '<TARGET>': UNKNOWN, '<ENEMY>': UNKNOWN,
}
NEW_LINE = {'line', 'cont', 'para', 'next', 'page', 'text_low'}
RUNTIME = {'text_ram', 'text_decimal', 'text_bcd', 'text_today', 'text_buffer', 'text_move'}
RESET = {'done', 'prompt', 'text_end', 'text_far', 'text_asm', 'text_promptbutton',
	'text_waitbutton', 'text_scroll', 'IF', 'ELSE', 'ELIF', 'ENDC'}
COMMAND = re.compile(r'^\s*(\w+)\b(.*)$')
LABEL = re.compile(r'^([A-Za-z_.][\w.]*)::?')
TOKEN = re.compile(r"<[^>]+>|'[dlstvrm]|{[^}]*}|.")

def string_width(string):
	string = string.split('@')[0]
	width = 0
	for token in TOKEN.findall(string):
		if token == '#':
			width += 4  # "POKé"
		elif token.startswith('{'):
			width += UNKNOWN  # interpolated symbol, like {d:NUM_UNOWN}
		else:
			width += CONTROL_WIDTHS.get(token, 1)
	return width

def check_file(path):
	problems = []
	dex_entry = path.parent.name == 'dex_entries'
	map_names = path.name == 'map_names.asm'
	width = 0
	for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
		match = LABEL.match(line)
		if match:
			width = 0
			continue
		match = COMMAND.match(line)
		if not match:
			continue
		command, rest = match.groups()
		if map_names and command == 'db':
			for string in re.findall(r'"([^"]*)"', rest):
				if string_width(string) > MAP_NAME_WIDTH:
					problems.append(f'{path.relative_to(ROOT)}:{number}: width {string_width(string)} > {MAP_NAME_WIDTH}: {line.strip()}')
			continue
		if command in RESET:
			width = 0
			continue
		if command in RUNTIME:
			width = UNKNOWN
			continue
		# in a Pokedex entry, "db" starts the first line and the species name
		if command in NEW_LINE or (dex_entry and command == 'db'):
			width = 0
		elif command != 'text':
			continue
		for string in re.findall(r'"([^"]*)"', rest):
			width += string_width(string)
		if width > MAX_WIDTH:
			name = path.relative_to(ROOT) if path.is_relative_to(ROOT) else path
			problems.append(f'{name}:{number}: width {width}: {line.strip()}')
	return problems

def main():
	args = [Path(arg).resolve() for arg in sys.argv[1:]] or [ROOT / p for p in DEFAULT_PATHS]
	paths = sorted(p for arg in args for p in (arg.rglob('*.asm') if arg.is_dir() else [arg]) if p.name not in SKIP_FILES)
	problems = [problem for path in paths for problem in check_file(path)]
	for problem in problems:
		print(problem)
	print(f'{len(problems)} line(s) too wide in {len(paths)} file(s)', file=sys.stderr)
	sys.exit(1 if problems else 0)

if __name__ == '__main__':
	main()
