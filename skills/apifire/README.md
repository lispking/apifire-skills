---
name: apifire
version: 0.1.0
---

# apifire Claude Code skill

This README covers the `apifire` skill source in `skills/apifire/`.

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
