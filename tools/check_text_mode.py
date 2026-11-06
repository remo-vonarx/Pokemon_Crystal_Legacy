#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python check_text_mode.py [file.asm|directory ...]

Report text that the game would misread. The text printer is either reading
a string, where each byte is a character, or between strings, where each byte
is a text command. A command inside a string goes wrong: text_start and text
are $00 there, which prints "NN FEHLER" through NullChar. A string also has
to end before the next label, or the printer runs on into whatever follows.
Checks maps/, data/, engine/ and home/ when no paths are given. The
_CRYSTAL11_VC branches are skipped: they hold padding that is never read. Exits
with status 1 if anything is found.
"""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_PATHS = ('maps', 'data', 'engine', 'home')

OPEN = {'text', 'text_start'}
STRING_LINE = {'line', 'cont', 'para', 'next', 'page'}
STRING_END = {'done', 'prompt', 'dex'}
COMMANDS = {
	'text_ram', 'text_bcd', 'text_move', 'text_box', 'text_low', 'text_promptbutton',
	'text_scroll', 'text_asm', 'text_decimal', 'text_pause', 'text_dots',
	'text_waitbutton', 'text_far', 'text_buffer', 'text_today',
	'sound_dex_fanfare_50_79', 'sound_dex_fanfare_20_49', 'sound_dex_fanfare_80_109',
	'sound_item', 'sound_caught_mon', 'sound_fanfare', 'sound_slot_machine_start',
}
NEUTRAL = {'IF', 'ELIF', 'ELSE', 'ENDC', 'vc_patch', 'vc_patch_end', 'vc_hook', 'vc_assert'}

STRINGS = re.compile(r'"([^"]*)"')
COMMENT = re.compile(r'^((?:[^";]|"[^"]*")*);.*$')
LABEL = re.compile(r'^([A-Za-z_.][\w.]*)::?')
COMMAND = re.compile(r'^\s*(\w+)\b(.*)$')
VC_BRANCH = re.compile(r'^\s*IF DEF\(_CRYSTAL11_VC\)')

STRING, BETWEEN, PLAIN, OUTSIDE = 'string', 'between', 'plain', 'outside'

def live_lines(path):
	"""Yield (number, line) without comments and without the _CRYSTAL11_VC branches."""
	depth = 0  # IF blocks open inside a skipped branch
	skipping = False
	for number, line in enumerate(path.read_text(encoding='utf-8').splitlines(), 1):
		line = COMMENT.sub(r'\1', line)
		if skipping:
			word = line.split()[0] if line.split() else ''
			if word == 'IF':
				depth += 1
			elif word == 'ENDC' and depth:
				depth -= 1
			elif word in ('ELSE', 'ENDC') and not depth:
				skipping = False
			continue
		if VC_BRANCH.match(line):
			skipping = True
			continue
		yield number, line

def check_file(path):
	problems = []
	name = path.relative_to(ROOT) if path.is_relative_to(ROOT) else path
	state = OUTSIDE
	opened = None  # line of the string being read
	def report(number, message, line):
		problems.append(f'{name}:{number}: {message}: {line.strip()}')
	for number, line in live_lines(path):
		match = LABEL.match(line)
		if match:
			if state == STRING:
				report(opened, f'string runs into {match.group(1)}', line)
			state = OUTSIDE
			continue
		match = COMMAND.match(line)
		if not match:
			continue
		command, rest = match.groups()
		ended = '@' in ''.join(STRINGS.findall(rest))
		if command in OPEN:
			if state == STRING:
				report(number, f'{command} inside a string', line)
			state, opened = (BETWEEN if ended else STRING), number
		elif command in STRING_LINE:
			if state == BETWEEN:
				report(number, f'{command} outside a string', line)
			elif state == STRING:
				state = BETWEEN if ended else STRING
			elif ended:
				state = OUTSIDE
		elif command in STRING_END:
			if state == BETWEEN:
				report(number, f'{command} outside a string', line)
			state = OUTSIDE
		elif command in COMMANDS:
			if state == STRING:
				report(number, f'{command} inside a string', line)
			state = OUTSIDE if command == 'text_asm' else BETWEEN
		elif command == 'text_end':
			state = OUTSIDE
		elif command == 'db':
			if state == STRING:
				state = BETWEEN if ended else STRING
			else:
				state = PLAIN if '"' in rest and not ended else OUTSIDE
		elif command not in NEUTRAL:
			state = OUTSIDE
	return problems

def main():
	args = [Path(arg).resolve() for arg in sys.argv[1:]] or [ROOT / p for p in DEFAULT_PATHS]
	paths = sorted(p for arg in args for p in (arg.rglob('*.asm') if arg.is_dir() else [arg]))
	problems = [problem for path in paths for problem in check_file(path)]
	for problem in problems:
		print(problem)
	print(f'{len(problems)} problem(s) in {len(paths)} file(s)', file=sys.stderr)
	sys.exit(1 if problems else 0)

if __name__ == '__main__':
	main()
