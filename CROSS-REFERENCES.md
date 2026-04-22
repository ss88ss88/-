# 文件双向引用关系图

> 本文档定义所有文件之间的调用关系和回溯路径。
> 每个文件都必须知道"我从哪里来"和"我要到哪里去"。

## 核心执行链路

```
用户输入
  ↓
AGENTS.md (大脑)
  ↓ "读取 rules/registry.json"
registry.json (注册表)
  ↓ "场景匹配 → 加载对应文件"
┌─────────────────────────────────────────────────┐
│ 场景匹配结果                                      │
│ GAME_TASK → 16条规则 + 11条知识 + Game Studio   │
│ GAME_DESIGN → 4条规则 + 8条知识 + Game Studio   │
│ GAME_QA → 3条规则 + 5条知识 + Game Studio       │
│ TASK → 4条规则 + 0条知识                         │
│ LEARN → 1条规则                                 │
│ META → 0条规则 + 1条知识                         │
│ CHAT → 无加载                                    │
└─────────────────────────────────────────────────┘
  ↓
规则文件 + 知识文件 + Game Studio文件
  ↓ "执行任务"
输出结果
  ↓ "记录经验"
.learnings/LEARNINGS.md 或 ERRORS.md
```

## 文件关系矩阵

### 1. AGENTS.md (大脑)
- **调用者**: 无（入口文件）
- **被调用者**: registry.json
- **关联文件**: 所有规则/知识/记忆文件
- **回溯**: 无（最高优先级）

### 2. registry.json (注册表)
- **调用者**: AGENTS.md
- **被调用者**: 所有规则/知识/记忆/Game Studio文件
- **关联文件**: AGENTS.md
- **回溯**: parent字段指向AGENTS.md

### 3. 规则文件 (RULE-001 ~ RULE-016)
- **调用者**: AGENTS.md → registry.json → 场景匹配
- **被调用者**: 无（执行规则）
- **关联文件**: 其他规则文件（通过registry.json关联）
- **回溯**: 文件头注释指向registry.json条目

### 4. 知识文件 (KNOW-001 ~ KNOW-022)
- **调用者**: AGENTS.md → registry.json → 场景匹配
- **被调用者**: 无（提供知识）
- **关联文件**: 其他知识文件（通过registry.json关联）
- **回溯**: 文件头注释指向registry.json条目

### 5. 错误预防文件 (MIST-001 ~ MIST-004)
- **调用者**: AGENTS.md → registry.json → 场景匹配
- **被调用者**: 无（预防错误）
- **关联文件**: 相关规则文件
- **回溯**: 文件头注释指向registry.json条目

### 6. Game Studio文件
- **调用者**: AGENTS.md → registry.json → GAME_*场景匹配
- **被调用者**: 无（执行开发任务）
- **关联文件**: game-dev-workflow.md, game-start-skill.md
- **回溯**: 文件头注释指向registry.json条目

## 双向引用示例

### 正向链路（AGENTS.md → 规则文件）
```
AGENTS.md: "读取 rules/registry.json"
registry.json: RULE-001 → rules/project.md
rules/project.md: "调用者：AGENTS.md → registry.json(RULE-001)"
```

### 反向链路（规则文件 → AGENTS.md）
```
rules/project.md: "本规则从属于 AGENTS.md（AI大脑）"
rules/project.md: "注册表索引：rules/registry.json RULE-001"
registry.json: "parent: ../AGENTS.md"
```

## 完整文件清单

### 核心文件 (3)
| 文件 | 编码 | 指向关系 | 状态 |
|------|------|---------|------|
| AGENTS.md | UTF-8 | → registry.json | ? |
| registry.json | GBK | → AGENTS.md, 所有规则/知识 | ? |
| test-integration.ps1 | UTF-8 | 验证所有路径 | ? |

### 规则文件 (16)
| ID | 文件 | 编码 | 指向关系 | 状态 |
|----|------|------|---------|------|
| RULE-001 | rules/project.md | UTF-8 | → AGENTS.md, registry.json | ? |
| RULE-002 | rules/security.md | UTF-8 | → AGENTS.md, registry.json | ? |
| RULE-003 | rules/collaboration.md | UTF-8 | → AGENTS.md, registry.json | ? |
| RULE-004 | .trae/rules/project_rules.md | UTF-8 | → AGENTS.md, registry.json | ? |
| RULE-005 | core/workflow.dsl | ? | 待添加 | ? |
| RULE-006 | game-studio/.claude/rules/gameplay-code.md | ? | 待添加 | ? |
| RULE-007 | game-studio/.claude/rules/engine-code.md | ? | 待添加 | ? |
| RULE-008 | game-studio/.claude/rules/ai-code.md | ? | 待添加 | ? |
| RULE-009 | game-studio/.claude/rules/network-code.md | ? | 待添加 | ? |
| RULE-010 | game-studio/.claude/rules/ui-code.md | ? | 待添加 | ? |
| RULE-011 | game-studio/.claude/rules/design-docs.md | ? | 待添加 | ? |
| RULE-012 | game-studio/.claude/rules/data-files.md | ? | 待添加 | ? |
| RULE-013 | game-studio/.claude/rules/test-standards.md | ? | 待添加 | ? |
| RULE-014 | game-studio/.claude/rules/prototype-code.md | ? | 待添加 | ? |
| RULE-015 | game-studio/.claude/rules/shader-code.md | ? | 待添加 | ? |
| RULE-016 | game-studio/.claude/rules/narrative.md | ? | 待添加 | ? |

### 知识文件 (22)
| ID | 文件 | 编码 | 指向关系 | 状态 |
|----|------|------|---------|------|
| KNOW-005 | .knowledge/verified/rules/file-encoding-standard.md | UTF-8 | → AGENTS.md, registry.json | ? |
| KNOW-006 | .knowledge/verified/rules/memory-palace-rule-engine.md | UTF-8 | → AGENTS.md, registry.json | ? |
| KNOW-007 | .knowledge/verified/rules/memory-palace-understanding.md | UTF-8 | → AGENTS.md, registry.json | ? |
| KNOW-021 | .knowledge/verified/rules/game-dev-workflow.md | UTF-8 | → AGENTS.md, registry.json, game-start-skill.md | ? |
| KNOW-022 | .knowledge/verified/rules/game-start-skill.md | UTF-8 | → AGENTS.md, registry.json, game-dev-workflow.md | ? |
| 其他 | ... | ? | 待添加 | ? |

## 待完成工作

1. 给所有Game Studio规则文件添加指向关系（RULE-006 ~ RULE-016）
2. 给所有Game Studio知识文件添加指向关系（KNOW-012 ~ KNOW-020）
3. 给其他知识文件添加指向关系（KNOW-001, KNOW-003, KNOW-004, KNOW-008~011）
4. 验证所有文件的双向引用完整性
