---
description: OpenCode 如何通过 clawd-notify 与三弟（main session）通信
---

# OpenCode 与 Clawd 通信指南

## 概述

clawd-notify 是一个命令行工具，OpenCode 通过它向三弟（主 session）发送消息，实现 OpenCode 与主 session 之间的信息同步和任务协调。

## 工具信息

- **可执行路径**：`/opt/homebrew/bin/clawd-notify`
- **目标会话**：main（OpenClaw 主 session）

## 基本命令格式

```bash
clawd-notify "<消息内容>"
```

### 构建规则

| 参数 | 值 | 说明 |
|------|-----|------|
| 消息 | `"<消息>"` | 要发送给三弟的消息内容，必须用双引号包裹 |

## 调用时机

当用户有以下请求时，你应该执行 clawd 通信：

- "通知三弟：..."
- "同步信息给主 session"
- "告诉三弟..."
- "记录状态..."
- "更新 main session..."
- 其他类似的与主 session 通信请求

## 执行步骤

1. **识别请求**：判断用户是否需要与主 session 通信
2. **提取消息**：从用户请求中提取要发送的消息内容
3. **构建命令**：`clawd-notify "..."`
4. **执行命令**：运行命令
5. **返回结果**：告诉用户通信结果（成功或失败）

## 消息格式要求

- 必须用双引号包裹
- 支持中英文、空格、标点符号
- 避免特殊转义字符（如 `\`, `"`, `$` 等需要转义）

## 典型使用场景

### 场景 1: 通知任务完成
用户：`告诉三弟：代码重构已完成`
命令：`clawd-notify "代码重构已完成"`

### 场景 2: 同步状态
用户：`更新 main session：正在测试新功能`
命令：`clawd-notify "正在测试新功能"`

### 场景 3: 记录重要信息
用户：`记录：数据库迁移需要在 2 小时后执行`
命令：`clawd-notify "数据库迁移需要在 2 小时后执行"`

### 场景 4: 请求协助
用户：`通知三弟：需要查看 GPU Scheduler 的日志`
命令：`clawd-notify "需要查看 GPU Scheduler 的日志"`

## 错误处理

如果命令执行失败，检查以下原因并提供解决方案：

| 可能原因 | 检查方法 |
|---------|---------|
| clawd-notify 不可用 | 检查 `/opt/homebrew/bin/clawd-notify` 是否存在 |
| OpenClaw gateway 未运行 | 检查 `openclaw gateway status` |
| 消息格式问题 | 确保消息用双引号正确包裹 |
| 特殊字符冲突 | 避免消息中有未转义的特殊字符 |

## 常见问题

**Q: 消息发送后三弟会立即回复吗？**
A: 不一定。消息会进入主 session 的消息队列，三弟会根据当前任务状态决定何时回复。

**Q: 可以发送多条消息吗？**
A: 可以，每次执行 `clawd-notify` 都会发送一条独立的消息。

**Q: 消息格式有限制吗？**
A: 基本没有限制，只要能通过 shell 命令传递即可。

## 工作原理

`clawd-notify` 脚本内部调用 OpenClaw 的 sessions_send API：

```bash
openclaw sessions_send --message "$1"
```

这会将消息发送到当前活跃的主 session。

## 记得

- 这是 OpenCode 与三弟通信的标准接口
- 不要在 skill 中包含具体业务内容
- 只负责通信方法的实现，不处理业务逻辑
- 始终验证命令执行结果
