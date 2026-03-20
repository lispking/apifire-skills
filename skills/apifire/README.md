# apifire Claude Code skill

This repository ships an `apifire` Claude Code skill in `skills/apifire/` so it is easy to review, fork, and reuse in open-source workflows.

## Files

- `skills/apifire/SKILL.md`
- `skills/apifire/examples.md`

## Install

### One-line install

```bash
curl -fsSL https://raw.githubusercontent.com/lispking/apifire-skills/main/install.sh | sh
```

Install to the user-level Claude skills directory instead:

```bash
curl -fsSL https://raw.githubusercontent.com/lispking/apifire-skills/main/install.sh | sh -s -- --user
```

Install to a specific Claude skills directory instead:

```bash
curl -fsSL https://raw.githubusercontent.com/lispking/apifire-skills/main/install.sh | sh -s -- --target /path/to/.claude/skills
```

### Download first, then run

```bash
curl -fsSL https://raw.githubusercontent.com/lispking/apifire-skills/main/install.sh -o install.sh
sh install.sh
```

### Manual install

Claude Code discovers repo-local skills from `.claude/skills/`, so for local use you can copy or symlink this skill into your own Claude skills directory.

Example:

```bash
mkdir -p .claude/skills
ln -s ../../skills/apifire .claude/skills/apifire
```

Or copy it into a user-level Claude skills directory if that is how you organize your setup.

## Installer behavior

- default target: `./.claude/skills/apifire`
- `--user`: installs to `$HOME/.claude/skills/apifire`
- `--target DIR`: installs to `DIR/apifire`
- existing installations are replaced with the current copy

## Purpose

This skill helps translate natural-language requests into verified `apifire` CLI commands for:
- project initialization
- test execution
- auth-only runs
- configuration validation
- usage help and troubleshooting
