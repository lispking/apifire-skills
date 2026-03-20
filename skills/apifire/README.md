---
name: apifire
version: 0.1.0
---

# apifire Claude Code skill

This repository ships an `apifire` Claude Code skill in `.claude/skills/apifire/` so it can be installed through the Claude Code plugin system.

## Files

- `.claude/skills/apifire/SKILL.md`
- `.claude/skills/apifire/examples.md`
- `skills/apifire/` — source copy in the repository

## Install with Claude Code plugins

Recommended flow in Claude Code:

1. Add this repository from the plugin marketplace.
2. Install the plugin into your Claude Code environment.

```text
/plugin marketplace add lispking/apifire-skills
/plugin install apifire-skills
```

After installation, Claude Code should load the `apifire` skill from the installed plugin.

## Alternative local setup

Claude Code also discovers repo-local skills from `.claude/skills/`, so for local use you can copy or symlink this skill into your own Claude skills directory.

Example:

```bash
mkdir -p .claude/skills
ln -s ../../skills/apifire .claude/skills/apifire
```

Or copy it into a user-level Claude skills directory if that is how you organize your setup.

## Legacy installer

This repository still includes `install.sh` for direct file-based installation, but plugin-based installation is the recommended path.

## Purpose

This skill helps translate natural-language requests into verified `apifire` CLI commands for:
- project initialization
- test execution
- auth-only runs
- configuration validation
- usage help and troubleshooting
