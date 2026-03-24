---
name: apifire
description: Help users translate requests into verified `apifire` commands for project setup, YAML-based API tests, auth flows, configuration validation, and troubleshooting.
---

# Apifire

The `apifire` skill helps users work with the `apifire` CLI for command-line API testing and CI/CD-friendly workflows.

Use it for:
- translating natural-language requests into verified `apifire` commands
- initializing YAML-based API test projects
- running API tests from all requests or selected YAML files
- running authentication-only flows and retrieving tokens
- validating `.apifire` configuration
- explaining and troubleshooting `apifire` usage

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

## Verified product context

From the current product docs, `apifire` is a CLI for automated API testing with:
- YAML-based configuration and request definitions
- authentication support including Bearer token, OAuth2, API key, and JWT flows
- request chaining with dependencies
- response validation
- variable extraction for reuse in later requests
- environment variable support via `.env` and system environment variables
- parallel execution for independent tests

Documented validation operator support includes:
- `exists` for checking that a field is present
- `not_exists` for checking that a field is absent
- `equals` for exact value matching
- `not_equals` for inequality checks
- `contains` for substring containment checks
- `greater_than` for numeric greater-than checks
- `less_than` for numeric less-than checks
- `greater_than_or_equal` for numeric lower-bound checks
- `less_than_or_equal` for numeric upper-bound checks
- `matches` for regex-based matching

Use this context to explain how the tool works, but do not claim any CLI command or flag beyond the verified command surface above unless fresh help output confirms it.

## What the skill helps with

This skill can:
1. translate user intent into a verified `apifire` command
2. explain `apifire` usage in plain language
3. explain the documented YAML project structure and config model
4. help troubleshoot incorrect or failing `apifire` commands

## Operating rules

- Use only the verified commands and flags above unless new help output confirms more.
- Do not invent unsupported `apifire` subcommands or flags.
- You may explain documented concepts such as `config.yaml`, `auth.yaml`, `requests/*.yaml`, validation operators, template variables, `.env`, and auth types, as long as you do not turn them into unverified CLI claims.
- Prefer checking `apifire --help` or `apifire <subcommand> --help` when exact syntax matters.
- Before executing `apifire --help` or any `apifire` subcommand, first verify that the `apifire` CLI is installed.
- If the `apifire` CLI is missing, stop execution and explain that the Claude Code skill and the `apifire` CLI are separate installs.
- If the user needs CLI installation help, point them to the official `apifire` install docs, website for Linux, macOS, and Windows.
- On macOS, recommend `brew install --cask rustx-labs/tap/apifire` only if that install path is confirmed current.
- Otherwise prefer the documented release-download or build-from-source instructions.
- Do not invent install commands for Linux or Windows.
- `apifire init` creates project files and may overwrite or reinitialize an existing setup, so ask for confirmation before executing it in a non-empty or already initialized target.
- Do not execute destructive or irreversible operations without user confirmation.
- Keep responses brief and practical.

## Prerequisite

The Claude Code skill helps generate and run `apifire` commands, but it does not install the `apifire` CLI. Verify that `apifire` is available before execution.

## Workflow

1. Identify the user's goal.
   - Examples: initialize project, run tests, run an auth-only flow, validate config, inspect usage, explain YAML files, fix a failing command.
2. Collect only the missing required inputs.
   - Examples: project name, base URL, `.apifire` directory, request files, whether to skip auth, whether token-only output is needed.
3. Build the matching `apifire` command.
4. If the user is asking conceptual questions, answer using the verified command surface plus the documented project model.
5. If the user asked to execute a command or inspect live help output, first verify that the `apifire` CLI is installed.
   - If `apifire` is missing, stop and explain how to install it.
   - Prefer the official release-download, or source-build documentation unless a package-manager route is confirmed current.
6. If the user asked to execute it and it is safe, run it.
7. Return:
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
- confirmation if the target may already contain an existing project

Example:
- `apifire init --name demo-api --url https://api.example.com`

After initialization, you may explain the documented structure:
- `.apifire/config.yaml`
- `.apifire/auth.yaml`
- `.apifire/requests/*.yaml`
- `.env.example`

### Run tests
Use `apifire run` when the user wants to run all tests or selected request files.

Ask for only what is missing:
- whether to run all requests or specific files
- whether auth should be skipped
- whether parallel execution is appropriate
- whether a custom `.apifire` directory is needed

Examples:
- `apifire run`
- `apifire run requests/get_user.yaml`
- `apifire run --skip-auth --parallel`

When explaining files, refer to documented YAML request definitions rather than `.http` files unless help output or repo examples confirm another format.

### Authentication only
Use `apifire auth` when the user wants to fetch or inspect authentication output.

Ask for only what is missing:
- whether they need raw token output for scripting
- whether a custom `.apifire` directory is needed

Example:
- `apifire auth --token-only`

You may explain documented auth configuration concepts including `bearer_token`, `oauth2`, `api_key`, and `jwt`, but do not invent extra CLI flags for them.

### Validate configuration
Use `apifire validate` when the user wants to check `.apifire` configuration files.

Example:
- `apifire validate`

You may explain that validation relates to the documented project config, auth config, and request YAML files.

### Help and troubleshooting
When the user asks how `apifire` works:
- summarize the verified commands above
- explain the documented YAML-based workflow if useful
- if needed, run the relevant `--help` command

When the user asks about project files or examples:
- explain the documented structure and supported concepts
- clearly distinguish product documentation from verified CLI syntax

When the user reports an error:
- ask for the exact command and error output first
- then suggest the corrected `apifire` command or config change

## Safety boundaries

Always pause for confirmation before commands that may:
- overwrite files
- reinitialize an existing project
- affect non-local or shared environments

Do not claim support for code generation, OpenAPI import, managed self-update, or other unverified CLI features unless fresh help output confirms them.

## Example intents

- “用 apifire 初始化一个项目”
- “在指定目录初始化 apifire 项目”
- “运行 apifire 测试”
- “只运行某个 yaml 请求文件”
- “跳过认证运行测试”
- “并行运行测试”
- “只拿 token，不跑完整测试”
- “检查 apifire 配置有没有问题”
- “apifire 这个命令怎么用”
- “apifire 的 yaml 怎么写”
- “auth.yaml 怎么配置 bearer token”
- “validation operators 都支持什么”
- “equals 和 contains 有什么区别”
- “给我一个 matches 的校验例子”
- “给我一个 request yaml 例子”
- “这个 apifire 报错是什么意思”

See `examples.md` for the full supported example set, including command examples, validation operator coverage, and documented YAML explanations.
