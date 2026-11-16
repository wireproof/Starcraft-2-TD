# SC2 TD Remaster

A research-stage project to remaster the Flash tower-defense game for iOS first, with macOS and Windows planned. The intended iOS display name is **SC2 TD**, with bundle identifier `com.wireproof.sc2td`.

**Status: early experimental prototype (0.1.0 build 1).** The iOS app provides tower placement, simple combat, upgrades, selling, generated waves and a credit cheat. It is not yet a faithful remaster: placeholder graphics, enemy types, wave schedules, balance, targeting, upgrades, audio, saving and win behavior remain incomplete. Physical-device launch, runtime testing and visual confirmation have not been performed.

## Contents

- `Research/sctd2.swf`: original Flash game obtained from the [Miniplay embed](https://www.miniplay.com/embed/starcraft-2-td), SHA-256 `0b54ec38f45e1204dbaa62a08a0581b561676671c66f887a6cf04d1915378a4b`.
- `Research/scripts`: ActionScript exported from the SWF using FFDec 26.5.0; `Research/images` contains exported images. These are static research artifacts, not evidence of runtime behavior.
- `GameData/original-rules.json`: literal original difficulty and tower tables extracted from the ActionScript. Original units and indices are retained.
- `Tools/extract_rules.py`: regenerate the rule tables with Python 3.
- `Art`: generated missile-turret icon concepts. The user selected `SC2-TD-Missile-Turret-Icon-v5.png` for the app; it is integrated into the iOS prototype.

The extracted level script sets `LASTLEVEL` to 45, while Miniplay's description says 40 waves. The original code includes five towers and indicates a loss threshold of 40 escapes. Wave scheduling, combat timing, placement, audio, artwork, and win/loss behavior need further reconstruction and runtime comparison before fidelity can be claimed.

## Regenerate the tables

```sh
python3 Tools/extract_rules.py
```

This reads `Research/scripts/scripts/frame_3/DoAction.as` and writes `GameData/original-rules.json`; it does not execute ActionScript.

## Build

Generate the Xcode project with `xcodegen generate`, then build the `SC2TD` scheme. The experimental unsigned IPA requires signing and provisioning for device installation.
