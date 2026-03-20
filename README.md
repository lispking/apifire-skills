# apifire-skills

Claude Code plugin that installs the apifire skill for API testing workflows.

## What this repository ships

This repository packages the `apifire` Claude Code skill as a plugin and also keeps the source skill files in-repo for local development and legacy file-based installation.

The installed skill helps turn natural-language requests into verified `apifire` CLI commands for:
- initializing API test projects
- running API tests
- running auth-only flows and retrieving tokens
- validating `.apifire` configuration
- explaining and troubleshooting `apifire` usage

## Repository layout

- `.claude-plugin/plugin.json` — Claude Code plugin metadata
- `.claude-plugin/marketplace.json` — marketplace metadata
- `skills/apifire/` — checked-in source for the `apifire` skill
- `install.sh` — legacy installer that copies `skills/apifire` into a Claude skills directory

When installed, the skill ends up in a Claude skills directory such as `.claude/skills/apifire/`, but that path is an installation target, not a checked-in repository directory.

## Install with Claude Code plugins

Recommended flow in Claude Code:

1. Add this repository from the plugin marketplace.
2. Install the plugin into your Claude Code environment.

```text
/plugin marketplace add lispking/apifire-skills
/plugin install apifire-skills@apifire-skills
```

After installation, Claude Code should discover the `apifire` skill from the installed plugin.

## Verified command coverage

Based on verified `apifire --help` output and verified examples, this repository currently documents support for these commands:
- `apifire init`
- `apifire run`
- `apifire auth`
- `apifire validate`

Verified global flags:
- `--verbose`
- `--dir <DIR>`
- `--help`
- `--version`

Verified use cases:
- initialize a new API test project
- run all tests or selected request files
- run authentication only and retrieve a token
- validate `.apifire` configuration
- get usage help and troubleshoot command syntax

These docs are based on verified help output and checked examples. They do not claim support for unverified `apifire` commands or features.

## Legacy installer

Plugin-based installation is the recommended path, but `install.sh` is still available for direct file-based installation.

Exact installer behavior:
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

## Reference

For verified usage examples and skill-specific documentation, see:
- `skills/apifire/examples.md`
- `skills/apifire/README.md`

Minimal verified examples:

```bash
apifire init --name demo-api --url https://api.example.com
apifire run
apifire auth --token-only
apifire validate
```

## License

This repository is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.
