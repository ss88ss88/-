# Chaonao 超脑 - AI 通用规则引擎

> 让 AI 按需读取规则，精准解决问题，不再迷失在上下文中。

---

## 是什么

Chaonao（超脑）是一个**AI 通用规则引擎系统**，解决 AI 开发中的核心痛点：

- ❌ AI 上下文窗口有限，装不下所有规则
- ❌ 规则写了，AI 不执行
- ❌ 文件太多，AI 找不到要做什么

Chaonao 通过**场景路由 + 速查卡 + 强制自检**机制，让 AI 每次只加载当前需要的规则，并确保规则被执行。

---

## 核心特点

| 特点 | 说明 |
|------|------|
| **场景路由** | 根据关键词自动匹配加载文件，不浪费上下文 |
| **速查卡** | AGENTS.md 一张卡看完所有规则，不废话 |
| **强制自检** | 任务完成后必须勾选清单，确保规则执行 |
| **Game Studio** | 内置 35 个游戏开发 Agent + 72 个 Skill，按需调用 |
| **编码守护** | 自动识别 GBK/UTF-8，防止乱码 |

---

## 快速开始

### 1. 克隆项目

```bash
git clone https://github.com/yourname/chaonao.git
cd chaonao
```

### 2. 让 AI 读取入口文件

告诉 AI：

> "请先读取 `AGENTS.md`，然后按规则执行。"

AI 会自动：
1. 读取主规则（`rules/project.md` + `rules/security.md`）
2. 根据你的需求匹配场景
3. 加载对应文件
4. 执行任务
5. 记录结果到 `memory/l0_hot.md`

### 3. 开始对话

| 你说 | AI 加载 |
|------|---------|
| "帮我设计个 UI" | `skills/huashu-design/SKILL.md` |
| "写个游戏功能" | `rules/project.md` + Game Studio Agent |
| "配 NPC 数据" | `.knowledge/verified/api/data-script-core.md` |
| "报错了" | `.knowledge/mistakes/prevention.md` |

---

## 目录结构

```
chaonao/
├── AGENTS.md              ← AI 入口速查卡（必读）
├── index/
│   └── global-index.json  ← 场景路由表
├── rules/
│   ├── registry.json      ← 完整规则注册表（56 个条目）
│   ├── project.md         ← 项目核心规则
│   ├── security.md        ← 安全规则
│   └── collaboration.md   ← 协作规则
├── .knowledge/
│   ├── verified/          ← 验证过的知识
│   │   ├── api/           ← Lua API、数据脚本
│   │   ├── patterns/      ← 设计模式
│   │   └── rules/         ← 编码标准、工作流
│   └── mistakes/          ← 常见错误预防
├── game-studio/           ← 游戏开发工作室（212 个文件）
│   ├── agents/            ← 35 个专业 Agent
│   ├── skills/            ← 72 个开发 Skill
│   ├── rules/             ← 11 个代码规范
│   └── docs/              ← 文档和指南
├── skills/
│   └── huashu-design/     ← HTML 高保真设计 Skill
├── core/
│   ├── workflow.dsl       ← 工作流定义
│   ├── agent_registry.json← Agent 注册表
│   └── scene_engine.json  ← 场景引擎配置
├── memory/
│   └── l0_hot.md          ← 热记忆（当前状态）
└── README.md              ← 本文件
```

---

## 使用示例

### 示例 1：游戏开发

**你：** "我要做一个回合制战斗系统"

**AI：**
1. 读取 `AGENTS.md` → 匹配 GAME_TASK 场景
2. 加载 `rules/project.md` + `game-studio/rules/gameplay-code.md`
3. 加载 `game-studio/agents/game-designer.md` + `game-studio/agents/lead-programmer.md`
4. 按规则设计并编写代码
5. 更新 `memory/l0_hot.md`

### 示例 2：UI 设计

**你：** "帮我设计一个背包界面"

**AI：**
1. 读取 `AGENTS.md` → 匹配 DESIGN 场景
2. 加载 `skills/huashu-design/SKILL.md`
3. 生成高保真 HTML 原型
4. 导出 MP4/GIF（可选）

### 示例 3：Bug 排查

**你：** "NPC 对话没反应"

**AI：**
1. 读取 `AGENTS.md` → 匹配 GAME_QA 场景
2. 加载 `.knowledge/mistakes/prevention.md`
3. 按常见错误清单排查
4. 记录问题到 `.learnings/ERRORS.md`

---

## 编码规则

| 文件类型 | 编码 | 说明 |
|---------|------|------|
| `data/*.txt` | **GBK** | 游戏数据文件 |
| 代码文件 | **UTF-8** | Lua / Python / JS |
| 规则文件 | **UTF-8** | Markdown |
| `registry.json` | **GBK** | 读取时用 GBK |

---

## Game Studio 能力

### 专业 Agent（35 个）

- **导演层**：创意总监、技术总监、制作人
- **负责人层**：游戏设计师、主程序、美术总监、QA 主管
- **专家层**：玩法/引擎/AI/网络/UI 程序员、关卡/经济/UX 设计师、技术美术等
- **引擎专家**：Godot / Unity / Unreal 专家

### 开发 Skill（72 个）

- **项目启动**：`start`、`brainstorm`、`design-system`
- **开发流程**：`dev-story`、`code-review`、`sprint-plan`
- **质量保证**：`qa-plan`、`bug-report`、`smoke-check`
- **发布运营**：`release-checklist`、`hotfix`、`launch-checklist`

---

## 贡献

欢迎提交 Issue 和 PR：

1. 添加新规则 → 修改 `rules/registry.json`
2. 添加新知识 → 放入 `.knowledge/verified/`
3. 修复错误 → 更新 `.knowledge/mistakes/`
4. 改进场景 → 修改 `index/global-index.json`

---

## 许可证

MIT License - 自由使用，自由修改。

---

> **记住**：规则的价值在于被执行。Chaonao 不仅定义规则，更确保规则被执行。
