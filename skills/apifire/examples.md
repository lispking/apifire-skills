# apifire skill examples

These examples are based on verified help output from `apifire --help` and related subcommand help.

## Verified examples

1. Natural language: `用 apifire 初始化一个项目，名字叫 demo-api，地址是 https://api.example.com`
   - Command: `apifire init --name demo-api --url https://api.example.com`

2. Natural language: `运行当前项目里的所有 apifire 测试`
   - Command: `apifire run`

3. Natural language: `只运行两个请求文件`
   - Command: `apifire run requests/login.http requests/profile.http`

4. Natural language: `运行测试但跳过认证`
   - Command: `apifire run --skip-auth`

5. Natural language: `并行运行测试`
   - Command: `apifire run --parallel`

6. Natural language: `只执行认证并输出 token`
   - Command: `apifire auth --token-only`

7. Natural language: `校验 apifire 配置`
   - Command: `apifire validate`

8. Natural language: `查看 apifire 帮助`
   - Command: `apifire --help`

## Notes

- Global options supported across commands include `--verbose` and `--dir <DIR>`.
- If the user reports a failure, ask for the exact command and error output before suggesting a fix.
