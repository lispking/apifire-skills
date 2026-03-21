# apifire-skills

Official Claude Code skill package for the `apifire` CLI.

## What this repository provides

This repository provides the Claude Code skill for working with `apifire`.

With this skill, Claude Code can help you:
- translate natural-language requests into `apifire` commands
- initialize API test projects
- run API tests
- run auth-only flows and retrieve tokens
- validate `.apifire` configuration
- explain and troubleshoot `apifire` usage

## Before you begin

The `apifire` CLI and the Claude Code skill are separate installs.
Installing this skill does not install the `apifire` CLI.

## Install the `apifire` CLI

Install the `apifire` CLI first.
Official `apifire` docs cover CLI installation for macOS, Linux, and Windows.

- macOS:

```bash
brew install --cask rustx-labs/tap/apifire
```

- Linux / Windows:

  install from the official website: https://apifire.vercel.app

## Install the Claude Code skill

After the CLI is installed, install the Claude Code skill with:

```text
/plugin marketplace add lispking/apifire-skills
/plugin install apifire-skills@apifire-skills
```

This installs the Claude Code skill only.
It does not install the `apifire` CLI.

## What the skill helps with

The `apifire` skill can help with:
- translating user intent into verified `apifire` commands
- project initialization with `apifire init`
- test execution with `apifire run`
- authentication-only flows with `apifire auth`
- configuration validation with `apifire validate`
- troubleshooting command usage and syntax

## Repository contents

- `.claude-plugin/marketplace.json` — marketplace metadata for the plugin registry
- `.claude-plugin/plugin.json` — Claude Code plugin metadata
- `skills/apifire/` — source for the `apifire` skill
- `install.sh` — manual installer for legacy file-based installation

## Legacy installer

Use `install.sh` only if you need a manual file-based installation workflow on macOS or Linux.

Installer behavior:
- default target: `./.claude/skills/apifire`
- `--user` target: `$HOME/.claude/skills/apifire`
- `--target DIR` installs into `DIR/apifire`
- source copied by the installer: `skills/apifire`

Examples:

```bash
sh install.sh
sh install.sh --user
sh install.sh --target /path/to/.claude/skills
```

## License

This repository is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
