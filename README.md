# apifire-skills

Open-source Claude Code skill files for the `apifire` CLI.

## Included skill

- `skills/apifire/`

This skill helps turn natural-language requests into verified `apifire` commands for:
- initializing API test projects
- running API tests
- running auth-only flows
- validating `.apifire` configuration
- explaining and troubleshooting `apifire` usage

## Repository layout

- `install.sh` — installer for copying the skill into a Claude skills directory
- `skills/apifire/SKILL.md` — main skill definition
- `skills/apifire/examples.md` — verified example prompts and commands
- `skills/apifire/README.md` — installation and usage notes

## Install locally

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

If you want Claude Code to discover this skill in a project, copy or symlink it into `.claude/skills/`.

Example:

```bash
mkdir -p .claude/skills
ln -s ../../skills/apifire .claude/skills/apifire
```

You can also copy it into your user-level Claude skills directory if that matches your setup.

## Installer behavior

- default target: `./.claude/skills/apifire`
- `--user`: installs to `$HOME/.claude/skills/apifire`
- `--target DIR`: installs to `DIR/apifire`
- existing installations are replaced with the current copy

## Command coverage

This repository currently documents verified support for:
- `apifire init`
- `apifire run`
- `apifire auth`
- `apifire validate`

The skill content was updated from real help output rather than guessed subcommands.

## License

This repository is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
