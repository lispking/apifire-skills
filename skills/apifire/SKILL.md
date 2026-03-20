---
name: apifire
description: Turn natural-language API testing, project initialization, validation, and auth requests into safe apifire CLI commands; explain usage when the user is learning the tool.
---

# Apifire

Use this skill when the user wants to work with the `apifire` CLI, including:
- initializing a new API test project
- running API tests
- running authentication to obtain a token
- validating `.apifire` configuration files
- translating natural language into an `apifire` command
- learning how to use `apifire`
- debugging or refining an `apifire` command

## Verified command surface

From `apifire --help` and subcommand help, the currently verified commands are:
- `apifire init`
- `apifire run`
- `apifire auth`
- `apifire validate`

Verified global options:
- `-v`, `--verbose`
- `-d`, `--dir <DIR>`
- `-h`, `--help`
- `-V`, `--version`

Verified subcommand details:
- `apifire init [OPTIONS]`
  - `-n`, `--name <NAME>`
  - `-u`, `--url <URL>`
- `apifire run [OPTIONS] [FILES]...`
  - `--skip-auth`
  - `--parallel`
- `apifire auth [OPTIONS]`
  - `--token-only`
- `apifire validate [OPTIONS]`

## What this skill does

This skill acts as both:
1. a CLI wrapper that helps turn user intent into an `apifire` command
2. a prompt helper that explains `apifire` usage in plain language

## Operating rules

- Use only the verified commands and flags above unless new help output confirms more.
- Do not invent unsupported `apifire` subcommands or flags.
- Prefer checking `apifire --help` or `apifire <subcommand> --help` when exact syntax matters.
- Do not execute destructive or irreversible operations without user confirmation.
- If a command could overwrite files or reinitialize an existing project, ask first.
- Keep responses brief and practical.

## Workflow

1. Identify the user's goal.
   - Examples: initialize project, run tests, fetch auth token, validate config, inspect usage, fix a failing command.
2. Collect only the missing required inputs.
   - Examples: project name, base URL, `.apifire` directory, request files, whether to skip auth, whether token-only output is needed.
3. Build the matching `apifire` command.
4. If the user asked to execute it and it is safe, run it.
5. Return:
   - the command
   - a short explanation of what it does
   - the next useful step if applicable

## Intent mapping

### Project initialization
Use `apifire init` when the user wants to create a new API test project.

Ask for only what is missing:
- project name → `--name <NAME>`
- base URL → `--url <URL>`
- target `.apifire` directory when not using the current directory → `--dir <DIR>`

Example:
- `apifire init --name demo-api --url https://api.example.com`

### Run tests
Use `apifire run` when the user wants to run all tests or selected request files.

Ask for only what is missing:
- whether to run all requests or specific files
- whether auth should be skipped
- whether parallel execution is appropriate
- whether a custom `.apifire` directory is needed

Examples:
- `apifire run`
- `apifire run requests/login.http requests/profile.http`
- `apifire run --skip-auth --parallel`

### Authentication only
Use `apifire auth` when the user wants to fetch or inspect authentication output.

Ask for only what is missing:
- whether they need raw token output for scripting
- whether a custom `.apifire` directory is needed

Example:
- `apifire auth --token-only`

### Validate configuration
Use `apifire validate` when the user wants to check `.apifire` configuration files.

Example:
- `apifire validate`

### Help and troubleshooting
When the user asks how `apifire` works:
- summarize the verified commands above
- if needed, run the relevant `--help` command

When the user reports an error:
- ask for the exact command and error output first
- then suggest the corrected `apifire` command

## Safety boundaries

Always pause for confirmation before commands that may:
- overwrite files
- reinitialize an existing project
- affect non-local or shared environments

Do not claim support for code generation, OpenAPI import, or other unverified features.

## Example intents

- “用 apifire 初始化一个项目”
- “运行 apifire 测试”
- “只拿 token，不跑完整测试”
- “检查 apifire 配置有没有问题”
- “apifire 这个命令怎么用”
- “这个 apifire 报错是什么意思”

See `examples.md` for verified examples.
