# Unit Control

Real-time tactics for Factorio 2.0: Unit Control adds RTS-style selection, command queues, and deployer automation so you can direct armies without leaving the factory view.

## Requirements
- Factorio **2.0.0** or later (tested with vanilla Space Age disabled for initial load-out).
- No mandatory dependencies; compatible with most combat overhauls as long as units remain commandable.

## Installation
- **Mod portal:** search for “Unit Control” and enable it from the in-game Mod Manager.
- **Manual (source checkout):**
  1. Clone this repository into a workspace.
  2. Run `python ZipMod.py .` to produce `Unit_Control_<version>.zip`.
  3. Copy the zip into your Factorio mods directory (macOS: `~/Library/Application Support/factorio/mods`).
  4. Enable the mod in-game and restart Factorio.

## Gameplay Quickstart
1. Press `ALT + mouse-button-1` to spawn the **Unit Selection Tool** or click the shortcut button.
2. Drag-select a group, then issue context orders with right-click.
3. Hold `SHIFT` while selecting or commanding to queue orders instead of replacing them.
4. Place assembler “deployers”: any machine flagged with `is_deployer` will spawn units from its output inventory, inheriting the latest queued commands.

## Hotkeys & Tools
| Action | Default Binding | Notes |
| --- | --- | --- |
| Spawn Selection Tool | `ALT + mouse-button-1` | Starts drag selection immediately. |
| Select All Units Near Cursor | `SHIFT + ALT + mouse-button-1` | Grabs up to 200-tile radius. |
| Select All Deployers | `SHIFT + ALT + mouse-button-2` | Useful for mass reconfiguration. |
| Attack-Move Tool | `ALT + A` | Grants a cursor that issues attack-move orders. |
| Move Tool | `ALT + M` | Forces units to move without attacking. |
| Patrol Tool | `ALT + P` | Click multiple points to create a loop. |
| Stop / Queue Stop | `ALT + S` / `SHIFT + ALT + S` | Immediate halt or queued halt. |
| Hold Position / Queue | `ALT + H` / `SHIFT + ALT + H` | Locks units in place. |
| Suicide Target | `DELETE` | Selected units self-destruct. |
| Suicide All Selected | `CTRL + DELETE` | Applies to the entire selection. |

Full localisation strings live in `locale/en/unit-control.cfg`; update translations there if you change bindings or terminology.

## Advanced Features
- **Command Queues:** Units maintain per-entity queues; shift-modified commands append new entries, while regular commands replace the current path.
- **Indicators:** Selection and target indicators are defined in `graphics/unit_control/` and updated in real time to reflect state. Rendering is handled via Lua highlight boxes for performance.
- **Map Tweaks:** `unit_control.on_init` adjusts map pathfinding limits to improve responsiveness of large armies; this runs automatically on first load.

## Development & Packaging
- Prototype definitions live in `prototypes/unit_control/`; runtime scripts are under `script/`.
- Utility helpers (`tf_util.lua`) centralise sprite paths and prototype mutations.
- Packaging commands (run from repo root):
  - `python ZipMod.py .` – create a clean distributable.
  - `python CopyMod.py .` – copy the current zip into the mods directory (implicitly zips if missing).
  - `python ZipAndCopyMod.py .` – convenience wrapper for both steps.
- When testing, start Factorio with **only** `base` plus Unit Control, then enable other mods incrementally to check compatibility.

## Contributing & Support
- Use two-space indentation and snake_case identifiers in Lua.
- Keep new hotkeys or prototype names mirrored between `shared.lua`, `prototypes/`, and `locale/`.
- Open issues with: Factorio version, log excerpts (`factorio-current.log`), reproduction steps, and screenshots/GIFs when UI is involved.
- Pull requests should state testing performed (new game, existing save, sandbox) and list any new locale keys that may need translation updates.
