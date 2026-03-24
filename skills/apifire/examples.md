# apifire skill examples

These examples are grounded in two sources:
- verified CLI help output for commands and flags
- current product documentation for YAML project structure and configuration concepts

## What is verified

Verified CLI commands:
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

## Supported natural-language examples

### 1. Initialize a project

Natural language:
- `用 apifire 初始化一个项目，名字叫 demo-api，地址是 https://api.example.com`
- `帮我创建一个 apifire 项目`

Command:
```bash
apifire init --name demo-api --url https://api.example.com
```

What it means:
- creates a new apifire project
- sets the project name
- sets the base API URL

Typical follow-up explanation:
- the generated project is documented as containing `.apifire/config.yaml`, `.apifire/auth.yaml`, `.apifire/requests/*.yaml`, and `.env.example`

### 2. Initialize in another directory

Natural language:
- `在 ./demo 目录初始化 apifire 项目`

Command:
```bash
apifire --dir ./demo init --name demo-api --url https://api.example.com
```

What it means:
- initializes the project under a custom target directory

### 3. Run all tests

Natural language:
- `运行当前项目里的所有 apifire 测试`
- `跑一下所有 API 测试`

Command:
```bash
apifire run
```

What it means:
- runs the project's API tests using the current apifire configuration

### 4. Run specific YAML request files

Natural language:
- `只运行 get_user.yaml`
- `运行两个指定请求文件`

Command:
```bash
apifire run requests/get_user.yaml
```

Or:

```bash
apifire run requests/login.yaml requests/profile.yaml
```

What it means:
- runs only the selected YAML request definitions

### 5. Run tests and skip authentication

Natural language:
- `运行测试但跳过认证`
- `不要先跑登录，直接执行请求`

Command:
```bash
apifire run --skip-auth
```

What it means:
- runs tests without executing the authentication flow first

### 6. Run tests in parallel

Natural language:
- `并行运行测试`
- `把独立测试并行跑起来`

Command:
```bash
apifire run --parallel
```

What it means:
- runs independent tests in parallel

### 7. Combine run options

Natural language:
- `跳过认证并且并行运行测试`

Command:
```bash
apifire run --skip-auth --parallel
```

What it means:
- skips auth
- runs independent tests in parallel

### 8. Run from another apifire directory

Natural language:
- `用 ./examples/demo-project 这个 apifire 目录运行测试`

Command:
```bash
apifire --dir ./examples/demo-project run
```

What it means:
- runs tests using a non-default project directory

### 9. Run auth only

Natural language:
- `只执行认证流程`
- `先只跑登录，不跑全部测试`

Command:
```bash
apifire auth
```

What it means:
- runs only the authentication flow

### 10. Output token only

Natural language:
- `只拿 token`
- `给我原始 token 输出，方便脚本使用`

Command:
```bash
apifire auth --token-only
```

What it means:
- runs auth and outputs the token only

### 11. Validate configuration

Natural language:
- `校验 apifire 配置`
- `看看 config 有没有问题`

Command:
```bash
apifire validate
```

What it means:
- validates the project's apifire configuration

### 12. Validate another project directory

Natural language:
- `校验 ./demo 里的 apifire 配置`

Command:
```bash
apifire --dir ./demo validate
```

What it means:
- validates configuration in a custom directory

### 13. Ask for verbose output

Natural language:
- `详细一点运行`
- `用 verbose 模式执行测试`

Command:
```bash
apifire -v run
```

What it means:
- runs the command with verbose output enabled

### 14. View top-level help

Natural language:
- `查看 apifire 帮助`
- `apifire 怎么用`

Command:
```bash
apifire --help
```

What it means:
- shows the top-level CLI help

### 15. View subcommand help

Natural language:
- `看一下 run 子命令帮助`
- `apifire auth 有哪些参数`

Commands:
```bash
apifire run --help
```

```bash
apifire auth --help
```

What it means:
- shows help for a specific verified subcommand

## Supported documentation explanations

The skill may also explain documented apifire concepts even when no CLI command is needed.

### Documented project structure

The skill can explain:
- `.apifire/config.yaml` for project-level settings such as name and base URL
- `.apifire/auth.yaml` for authentication setup
- `.apifire/requests/*.yaml` for request definitions
- `.env.example` as an example environment file

### Documented auth types

The skill can explain these documented auth types:
- `bearer_token`
- `oauth2`
- `api_key`
- `jwt`

### Documented request capabilities

The skill can explain documented request concepts such as:
- `method`
- `endpoint`
- `headers`
- `query`
- `body`
- `auth`
- `validate`
- `extract`
- `depends_on`

### Documented validation operators

The skill can explain these documented operators:
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

### Validation operator examples

#### Example: `exists`

```yaml
validate:
  body:
    - path: "data.id"
      operator: exists
```

Meaning:
- passes when `data.id` exists in the response body

#### Example: `not_exists`

```yaml
validate:
  body:
    - path: "error"
      operator: not_exists
```

Meaning:
- passes when `error` is not present in the response body

#### Example: `equals`

```yaml
validate:
  body:
    - path: "data.name"
      operator: equals
      value: "test"
```

Meaning:
- passes when `data.name` equals `test`

#### Example: `not_equals`

```yaml
validate:
  body:
    - path: "data.status"
      operator: not_equals
      value: "disabled"
```

Meaning:
- passes when `data.status` is not `disabled`

#### Example: `contains`

```yaml
validate:
  body:
    - path: "message"
      operator: contains
      value: "success"
```

Meaning:
- passes when `message` contains the substring `success`

#### Example: `greater_than`

```yaml
validate:
  body:
    - path: "data.count"
      operator: greater_than
      value: 10
```

Meaning:
- passes when `data.count` is greater than `10`

#### Example: `less_than`

```yaml
validate:
  body:
    - path: "data.count"
      operator: less_than
      value: 100
```

Meaning:
- passes when `data.count` is less than `100`

#### Example: `greater_than_or_equal`

```yaml
validate:
  body:
    - path: "data.score"
      operator: greater_than_or_equal
      value: 60
```

Meaning:
- passes when `data.score` is `60` or higher

#### Example: `less_than_or_equal`

```yaml
validate:
  body:
    - path: "data.score"
      operator: less_than_or_equal
      value: 100
```

Meaning:
- passes when `data.score` is `100` or lower

#### Example: `matches`

```yaml
validate:
  body:
    - path: "data.email"
      operator: matches
      value: "^[^@]+@example\\.com$"
```

Meaning:
- passes when `data.email` matches the regex pattern

### Documented template variable examples

The skill can explain documented template variables such as:
- `{{env.USERNAME}}`
- `{{env.PASSWORD}}`
- `{{config.VARIABLE_NAME}}`

## YAML-oriented explanation examples

### Example: explain `config.yaml`

User asks:
- `apifire 的 config.yaml 怎么写？`

Supported explanation:
```yaml
name: my-api-project
base_url: https://api.example.com
timeout: 30
headers:
  Content-Type: application/json
  User-Agent: apifire/1.0
```

### Example: explain `auth.yaml`

User asks:
- `bearer token 登录配置怎么写？`

Supported explanation:
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

### Example: explain a request YAML file

User asks:
- `给我一个 apifire 请求例子`

Supported explanation:
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

### Example: explain validation operator choices

User asks:
- `validation operators 都支持什么？`
- `equals 和 contains 有什么区别？`
- `给我一个 matches 的校验例子`

Supported explanation:
- `exists` / `not_exists` 用来判断字段是否存在
- `equals` / `not_equals` 用来判断值是否相等
- `contains` 用来判断字符串是否包含某个子串
- `greater_than` / `less_than` / `greater_than_or_equal` / `less_than_or_equal` 用来做数值比较
- `matches` 用来做正则匹配

## Boundaries

- Do not invent commands or flags beyond verified help output.
- Do not claim support for unverified CLI features such as `update` unless fresh help output confirms them.
- Do not treat documentation concepts as extra CLI flags.
- Before executing `apifire` commands, first verify that the `apifire` CLI is installed.
- Ask for confirmation before running `apifire init` in a directory that may already contain project files.
