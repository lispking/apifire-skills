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

Prefer the official release-download or build-from-source documentation.
If a package-manager install path is known to be current, you can use that too.

- macOS:

```bash
brew install --cask rustx-labs/tap/apifire
```

- Linux / Windows:

  install from the official website:
  - https://apifire.vercel.app

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
- explaining documented YAML project structure and config concepts
- explaining validation operators and request examples
- troubleshooting command usage and syntax

## Verified CLI command surface

Verified commands:
- `apifire init`
- `apifire run`
- `apifire auth`
- `apifire validate`

Verified global options:
- `-v`, `--verbose`
- `-d`, `--dir <DIR>`
- `-h`, `--help`
- `-V`, `--version`

Verified command options:
- `apifire init --name <NAME> --url <URL>`
- `apifire run --skip-auth --parallel [FILES]...`
- `apifire auth --token-only`

The skill should not invent subcommands or flags beyond this verified surface unless fresh `--help` output confirms them.

## Documented apifire capabilities the skill can explain

From the current product documentation, the skill can explain:
- YAML-based configuration and request definitions
- authentication support for `bearer_token`, `oauth2`, `api_key`, and `jwt`
- request chaining via `depends_on`
- response validation rules
- variable extraction via `extract`
- environment variable usage via `.env` and system environment variables
- parallel execution as a documented product capability

These are documentation-backed concepts, not additional verified CLI flags.

## Documented project structure

The skill can explain the documented project layout:
- `.apifire/config.yaml`
- `.apifire/auth.yaml`
- `.apifire/requests/*.yaml`
- `.env.example`

## Documented request YAML fields

The skill can explain documented request fields such as:
- `name`
- `method`
- `endpoint`
- `headers`
- `query`
- `body`
- `auth`
- `validate`
- `extract`
- `depends_on`

## Validation operators supported in the docs

The skill can explain these documented validation operators:
- `exists` — field must be present
- `not_exists` — field must be absent
- `equals` — value must equal the expected value
- `not_equals` — value must differ from the expected value
- `contains` — string must contain the expected substring
- `greater_than` — numeric value must be greater than the expected value
- `less_than` — numeric value must be less than the expected value
- `greater_than_or_equal` — numeric value must be at least the expected value
- `less_than_or_equal` — numeric value must be at most the expected value
- `matches` — string must match the expected regular expression

## Example documented YAML snippets

### `config.yaml`

```yaml
name: my-api-project
base_url: https://api.example.com
timeout: 30
headers:
  Content-Type: application/json
  User-Agent: apifire/1.0
```

### `auth.yaml`

```yaml
type: bearer_token
login:
  endpoint: /auth/login
  method: POST
  body:
    username: "{{env.USERNAME}}"
    password: "{{env.PASSWORD}}"
  token_path: "data.token"
  header_name: Authorization
  header_prefix: Bearer
  expires_in: 3600
```

### `requests/get_user.yaml`

```yaml
name: Get User Info
method: GET
endpoint: /user/profile
auth: required
validate:
  status: 200
  body:
    - path: "data.id"
      operator: exists
    - path: "data.name"
      operator: equals
      value: "test"
```

## Example verified commands

```bash
apifire init --name demo-api --url https://api.example.com
apifire run
apifire run requests/get_user.yaml
apifire run --skip-auth --parallel
apifire auth --token-only
apifire validate
apifire -v run
apifire --help
```

## Safety and operating rules

- Verify that the `apifire` CLI is installed before executing `apifire` commands.
- If the CLI is missing, explain that the skill and CLI are separate installs.
- Ask for confirmation before running `apifire init` in a directory that may already contain project files.
- Do not invent Linux or Windows install commands.
- Do not claim support for unverified CLI features unless fresh help output confirms them.

## More examples

See these files for the detailed source material:
- `skills/apifire/SKILL.md`
- `skills/apifire/examples.md` — the most complete example list, including command examples, validation operator coverage, and YAML explanations
