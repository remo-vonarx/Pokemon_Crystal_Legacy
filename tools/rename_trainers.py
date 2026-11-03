#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python rename_trainers.py [--dry-run]

Rename the trainers in data/trainers/parties.asm to their German names from
german_names.TRAINER_NAMES. Only the name of each trainer header
(db "NAME@", TRAINERTYPE_...) inside the listed groups changes.
"""

import re
import sys
from pathlib import Path

from german_names import TRAINER_NAMES

ROOT = Path(__file__).resolve().parent.parent
PARTIES = ROOT / 'data/trainers/parties.asm'
GROUP = re.compile(r'^(\w+Group):')
HEADER = re.compile(r'^(\s*db ")([^"@]*)(@", TRAINERTYPE_.*)$')
NAME_LENGTH = 10

def trainers(lines):
	"""Yield (line index, group, name) for every trainer header."""
	group = None
	for index, line in enumerate(lines):
		match = GROUP.match(line)
		if match:
			group = match.group(1)
		match = HEADER.match(line)
		if match:
			yield index, group, match.group(2)

def main():
	dry_run = sys.argv[1:] == ['--dry-run']
	lines = PARTIES.read_text(encoding='utf-8').split('\n')
	# a group that already holds a German-only name has been renamed; renaming
	# it again would turn IRENE -> LOLA into LOLA -> ROSI
	done = {group for _, group, name in trainers(lines)
		if name in TRAINER_NAMES.get(group, {}).values() and name not in TRAINER_NAMES[group]}
	changes = 0
	for index, group, name in trainers(lines):
		if group in done:
			continue
		german = TRAINER_NAMES.get(group, {}).get(name)
		if german is None or german == name:
			continue
		assert len(german) <= NAME_LENGTH, f'{german} is longer than {NAME_LENGTH}'
		new = HEADER.sub(lambda m: m.group(1) + german + m.group(3), lines[index])
		print(f'{PARTIES.relative_to(ROOT)}:{index + 1}: {group} {name} -> {german}')
		lines[index] = new
		changes += 1
	if not dry_run:
		PARTIES.write_text('\n'.join(lines), encoding='utf-8')
	print(f'{changes} trainer(s) {"would be renamed" if dry_run else "renamed"}', file=sys.stderr)

if __name__ == '__main__':
	main()
