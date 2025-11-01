# Repository Guidelines

## Project Structure & Module Organization
- `prototypes/` holds all data-stage Lua modules, split into `unit_control/` for prototype definitions and `util/` helpers. Require files with dot notation (e.g., `require("prototypes.unit_control.unit_control")`).
- `script/` contains runtime control-stage code (`unit_control.lua`, `unit_deployment.lua`). These files are registered from `control.lua`.
- `graphics/` stores sprites, cursors, and audio, keeping file paths stable via `tf_util.path`.
- `locale/` includes translation files (currently `locale/en`). Add new locale keys here, mirroring existing structure.
- Root-level `data.lua` and `data-final-fixes.lua` bootstrap the prototype stage; keep new requires alphabetised to ease merges.

## Build, Test, and Development Commands
- `python ZipMod.py .` — produce a clean `Unit_Control_<version>.zip` by honoring `.gitignore` rules.
- `python CopyMod.py .` — zip (if needed) and copy the archive into your local Factorio mods directory.
- `python ZipAndCopyMod.py .` — convenience wrapper that runs both steps.
- When iterating in-game, launch Factorio 2.0 with **only** `base` and this mod enabled to surface API regressions.

## Coding Style & Naming Conventions
- Lua code uses two-space indentation, `snake_case` locals, and `lower_snake` module filenames. Keep modules returning tables (no globals) and prefer `local` for functions/constants.
- Prototype file paths follow `prototypes.<folder>.<module>`; runtime modules live under `script/`.
- Asset names in `graphics/unit_control/` should match their prototype keys (e.g., `unit_move_tool.png` for `unit_move_tool`).
- Avoid non-ASCII characters unless adding translated strings under `locale/`.

## Testing Guidelines
- Manual: load a new sandbox save, issue selection commands, deploy units, and watch the log for warnings.
- Regression: start Factorio with `/enable-extra-log-category=prototype-loader` and toggle Settings → The Rest → **check-unused-prototype-data** to catch orphaned fields.
- Simulation: `/editor` mode plus `/cheat all` speeds validation of unit commands. Record complex reproduction steps in PR descriptions.

## Commit & Pull Request Guidelines
- Commit messages should be present-tense and scoped (e.g., `fix: guard unit commandable before dispatch`). Group related Lua and prototype changes together.
- Reference relevant issues or forum threads in the body when applicable.
- Pull requests should include: summary, testing notes (Factorio version, scenario, commands run), screenshots or GIFs for UI tweaks, and reminders for translators if new locale keys were added.
