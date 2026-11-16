#!/usr/bin/env python3
"""Extract literal original rule tables. Does not execute ActionScript."""
import ast, json, pathlib, re
root = pathlib.Path(__file__).resolve().parents[1]
src = (root / 'Research/scripts/scripts/frame_3/DoAction.as').read_text()
blocks = re.findall(r'case\s+(\d+):\s*(.*?)(?=\s*case\s+\d+:|\s*}\s*$)', src.split('switch(diff)', 1)[1].split('_root.spd =', 1)[0], re.S)
names = ('killmoney', 'speed', 'nrg', 'cost', 'damage', 'damageP', 'rate', 'rateP', 'radius', 'radiusP', 'armor')
result = {'provenance': 'sctd2.swf, FFDec ActionScript 2 export, frame 3; literal extraction only', 'difficulties': {}}
for index, block in blocks:
    entry = {}
    for name in names:
        match = re.search(r'\b' + name + r'\s*=\s*(\[.*?\]);', block, re.S)
        if not match: raise ValueError((index, name))
        entry[name] = ast.literal_eval(match.group(1))
    entry['startingMoney'] = int(re.search(r'_root\.money\s*=\s*(\d+)', block).group(1))
    result['difficulties'][index] = entry
names_match = re.search(r'towers\s*=\s*(\[.*?\]);', src, re.S)
result['towerNames'] = ast.literal_eval(names_match.group(1))
assert len(result['difficulties']) == 3 and len(result['towerNames']) == 6
out = root / 'GameData/original-rules.json'
out.write_text(json.dumps(result, indent=2) + '\n')
print(out)
