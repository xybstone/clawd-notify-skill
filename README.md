# Clawd Notify Skill

OpenCode 通信技能 - 通过 `clawd-notify` 与三弟（OpenClaw 主 session）通信。

## 概述

这是一个让 OpenCode 与 OpenClaw 主 session 通信的 skill，实现：

- 向主 session 发送消息和通知
- 同步状态和进度更新
- 请求主 session 的协助

## 功能

- 通过 `clawd-notify` 命令向主 session 发送消息
- 支持中英文消息
- 简单易用的命令行接口

## 系统要求

- macOS
- OpenCode
- OpenClaw (已安装)
- GitHub CLI (用于安装)

## 安装

### 1. 克隆仓库

```bash
gh repo clone xuyangbo/clawd-notify-skill
cd clawd-notify-skill
```

### 2. 安装到 OpenCode

```bash
cp SKILL.md ~/.claude/skills/clawd-notify/SKILL.md
```

### 3. 安装命令行工具

```bash
chmod +x clawd-notify.sh
sudo cp clawd-notify.sh /opt/homebrew/bin/clawd-notify
```

## 使用方法

安装后，你可以在 OpenCode 对话中自然地请求通信：

### 示例 1: 通知任务完成
```
告诉三弟：代码重构已完成
```

### 示例 2: 同步状态
```
更新 main session：正在测试新功能
```

### 示例 3: 记录重要信息
```
记录：数据库迁移需要在 2 小时后执行
```

### 示例 4: 请求协助
```
通知三弟：需要查看 GPU Scheduler 的日志
```

## 工作原理

- OpenCode 识别用户的通信请求
- 调用 `clawd-notify` 命令
- `clawd-notify` 内部执行 `openclaw sessions_send`
- 消息发送到主 session

## 自定义

如果你使用不同的 OpenClaw 配置，可以修改 `clawd-notify.sh` 脚本中的命令参数。

## 故障排查

### 命令未找到
```bash
which clawd-notify
# 应该输出: /opt/homebrew/bin/clawd-notify
```

### OpenClaw 未运行
```bash
openclaw gateway status
# 检查 gateway 是否正在运行
```

## 许可证

MIT License

## 作者

Created for OpenCode + OpenClaw integration

## 相关链接

- [OpenCode](https://github.com/OhMyOpenCode)
- [OpenClaw](https://github.com/openclaw/openclaw)
- [OpenClaw Docs](https://docs.openclaw.ai)
