# apifire-skills

Open-source Claude Code skill files for the `apifire` CLI.

## Included skill

- `apifire`

This plugin installs a Claude Code skill that helps turn natural-language requests into verified `apifire` commands for:
- initializing API test projects
- running API tests
- running auth-only flows
- validating `.apifire` configuration
- explaining and troubleshooting `apifire` usage

## Repository layout

- `.claude-plugin/marketplace.json` — plugin marketplace metadata
- `.claude/skills/apifire/` — installable Claude Code skill
- `skills/apifire/` — source copy of the skill files
- `install.sh` — legacy installer for direct file-based installation

## Install with Claude Code plugins

Recommended flow in Claude Code:

1. Add this repository from the plugin marketplace.
2. Install the plugin into your Claude Code environment.

```text
/plugin marketplace add lispking/apifire-skills
/plugin install apifire-skills@apifire-skills
```

After installation, Claude Code should discover the `apifire` skill from the installed plugin.

## Alternative local setup

If you want to use the files directly from a local checkout instead of installing via plugins, Claude Code can discover repo-local skills from `.claude/skills/`.

Example:

```bash
mkdir -p .claude/skills
ln -s ../../skills/apifire .claude/skills/apifire
```

You can also copy it into a user-level Claude skills directory if that matches your setup.

## Legacy installer

This repository still includes `install.sh` for environments that prefer direct file-based installation, but plugin-based installation is the recommended path.

## Command coverage

This repository currently documents verified support for:
- `apifire init`
- `apifire run`
- `apifire auth`
- `apifire validate`

The skill content was updated from real help output rather than guessed subcommands.

## License

This repository is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
