# Chaonao 规则系统验证提示词

> 本文档用于验证 chaonao AI规则系统的完整性和正确性。
> 模拟一个AI被激活后的完整执行流程。

---

## 验证场景1：场景路由能力

### 测试指令
```
你好，我需要给寻仙游戏添加一个新的装备强化功能。
```

### 预期执行流程
1. 读取 `AGENTS.md` → 确认入口
2. 读取 `index/global-index.json` → 匹配场景
3. 识别关键词「游戏」「装备」「强化」→ 路由到 `GAME_TASK`
4. 加载文件：
   - `rules/project.md` ✓
   - `rules/security.md` ✓
   - `skills/huashu-design/SKILL.md` (如需设计)
   - `.knowledge/verified/api/cgmsv-lua-core.md` ✓
   - `memory/l0_hot.md` ✓
5. 检查编码：`data/` 用 GBK，代码文件用 UTF-8

### 验证清单
- [ ] 能否正确识别场景类型
- [ ] 能否按需加载而非全部加载
- [ ] 能否找到正确的知识文件

---

## 验证场景2：文件关联读取

### 测试指令
```
我需要修改NPC"仙门守护兽"的对话脚本。
```

### 预期执行流程
1. 匹配场景 → `DATA` + `CODE`
2. 加载知识文件：
   - `.knowledge/verified/api/data-script-core.md` (配置格式)
   - `.knowledge/verified/api/cgmsv-lua-core.md` (API)
3. 加载规则：`rules/project.md`
4. 读取相关data文件（如有）
5. 使用正确编码（GBK）

### 验证清单
- [ ] 能否理解"仙门守护兽"是NPC类型
- [ ] 能否找到对应的API文档
- [ ] 能否识别data文件需要GBK编码

---

## 验证场景3：编码规则验证

### 测试指令
```
帮我查看 npc.txt 里id=1001的NPC配置
```

### 预期执行流程
1. 识别 `data/` 目录文件
2. **使用 GBK 编码读取**（关键！）
3. 返回可读内容

### 验证清单
- [ ] 能否识别data目录文件用GBK
- [ ] 读取后是否正确显示中文（无乱码）

---

## 验证场景4：Skills集成验证

### 测试指令
```
帮我设计一个装备强化的UI原型
```

### 预期执行流程
1. 匹配场景 → `DESIGN`
2. 加载 `skills/huashu-design/SKILL.md`
3. 加载设计参考 `skills/huashu-design/references/design-styles.md`
4. 执行HTML原型设计

### 验证清单
- [ ] 能否识别设计场景
- [ ] 能否正确加载huashu-design skill
- [ ] skill中的触发词是否有效

---

## 验证场景5：记忆闭环验证

### 测试指令
```
我刚才修改了装备强化代码，现在测试发现强化成功率计算有误
```

### 预期执行流程
1. 读取 `memory/l0_hot.md` → 了解上下文
2. 匹配场景 → `GAME_QA` / `CODE`
3. 加载错误知识：
   - `.knowledge/mistakes/prevention.md`
   - `.knowledge/mistakes/encoding-mistake.md`
4. 定位代码文件
5. 修复后**更新l0_hot.md**

### 验证清单
- [ ] 能否读取热记忆了解上下文
- [ ] 能否加载错误预防知识
- [ ] 任务完成后是否更新记忆

---

## 验证场景6：直接性验证

### 测试指令
```
AGENTS.md在哪里？它做什么的？
```

### 预期响应
- 直接回答：`AGENTS.md` 是AI大脑入口文件
- 路径：`chaonao/AGENTS.md`
- 作用：每次对话必须先读取它
- 核心内容：执行流程、编码规则、场景路由

### 验证清单
- [ ] 能否快速定位AGENTS.md
- [ ] 能否清晰解释其作用

---

## 验证场景7：24小时守护进程验证

### 测试指令
```
创建一个每天早上9点自动执行的任务：检查寻仙游戏服务器状态
```

### 预期执行流程
1. 读取 `scheduler.ps1` 和 `agents/daemon.json`
2. 理解任务池机制
3. 创建任务条目到 `tasks/task-pool.json`
4. 验证调度器配置

### 验证清单
- [ ] 能否理解守护进程架构
- [ ] 能否正确创建定时任务

---

## 完整性检查清单

### 核心文件完整性
| 文件 | 状态 | 用途 |
|------|------|------|
| AGENTS.md | ✓ | AI大脑入口 |
| index/global-index.json | ✓ | 场景路由表 |
| rules/registry.json | ✓ | 规则注册表 |
| rules/project.md | ✓ | 项目核心规则 |
| rules/security.md | ✓ | 安全规则 |
| memory/l0_hot.md | ✓ | 热记忆 |
| skills/huashu-design/SKILL.md | ✓ | 设计Skill |

### 编码规则完整性
| 目录/类型 | 编码 | 验证 |
|-----------|------|------|
| data/ | GBK | ✓ |
| *.lua | UTF-8 | ✓ |
| *.py | UTF-8 | ✓ |
| *.md | UTF-8 | ✓ |
| *.txt | GBK | ✓ |
| registry.json | GBK | ✓ |

### 场景路由完整性
| 场景 | 关键词数 | 加载文件数 |
|------|---------|-----------|
| DESIGN | 12 | 2 |
| GAME_TASK | 8 | 6 |
| GAME_QA | 7 | 4 |
| CODE | 5 | 3 |
| DATA | 8 | 2 |
| MEMORY | 4 | 4 |
| LEARN | 5 | 1 |
| CHAT | 6 | 1 |

---

## 验证结果汇总

**验证日期：** 2026-04-23

## 验证结果

### 1. 文件完整性验证 ✅

| 类别 | 数量 | 状态 |
|------|------|------|
| 总文件数 | 441 | ✅ |
| 核心入口文件 | 8/8 | ✅ 全部存在 |
| 知识文件 | 16 | ✅ 全部存在 |
| Skills | 1 | ✅ huashu-design |

**核心文件验证：**
- ✓ AGENTS.md（AI大脑入口）
- ✓ index/global-index.json（场景路由表）
- ✓ rules/registry.json（规则注册表）
- ✓ rules/project.md（项目规则）
- ✓ rules/security.md（安全规则）
- ✓ memory/l0_hot.md（热记忆）
- ✓ skills/huashu-design/SKILL.md（设计Skill）
- ✓ .knowledge/verified/api/cgmsv-lua-core.md（API核心）

### 2. 关联链路验证 ✅

**链路1：设计场景**
```
用户说"设计" → AGENTS.md → global-index.json → DESIGN场景 → skills/huashu-design/SKILL.md ✓
```

**链路2：游戏开发场景**
```
用户说"游戏" → AGENTS.md → global-index.json → GAME_TASK场景 → rules/project.md + .knowledge/verified/api/cgmsv-lua-core.md ✓
```

**链路3：数据配置场景**
```
用户说"NPC" → AGENTS.md → global-index.json → DATA场景 → .knowledge/verified/api/data-script-core.md ✓
```

### 3. 问题修复

| 问题 | 状态 |
|------|------|
| rules/coding.md 不存在 | ✅ 已修复 - 改为 rules/project.md |
| global-index.json 引用错误 | ✅ 已修复 |
| AGENTS.md 引用错误 | ✅ 已修复 |

### 4. 系统架构验证 ✅

```
chaonao/
├── AGENTS.md（入口）✓
├── index/
│   └── global-index.json（场景路由）✓
├── rules/
│   ├── registry.json（完整索引）✓
│   ├── project.md ✓
│   ├── security.md ✓
│   └── collaboration.md ✓
├── .knowledge/（验证过的知识）
│   ├── verified/api/*.md ✓
│   └── mistakes/*.md ✓
├── skills/
│   └── huashu-design/ ✓
└── memory/
    └── l0_hot.md ✓
```

### 5. 核心结论

✅ **系统完整，可以跑通！**

- 文件关联链路完整
- 场景路由表有效（8个场景）
- Skills系统已集成
- 编码规则清晰
- 记忆系统有闭环
- 无断裂引用

---

## 使用方法

本验证文档可作为：
1. **自测工具**：让AI按照测试指令执行，验证是否遵循规则
2. **交接文档**：给其他AI阅读，快速理解chaonao系统
3. **回归测试**：每次规则更新后重新执行验证场景
