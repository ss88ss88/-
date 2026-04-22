# 对话执行链路演示

## 场景：用户说"帮我开发一个修仙游戏"

### 步骤1：读取大脑（AGENTS.md）
```
AI行为：读取 c:\Users\Administrator\Desktop\hglua\修仙创意\chaonao\AGENTS.md
验证：文件存在 ?
内容关键部分：
  - "每次对话必须先读取本文件"
  - "步骤1：读取 rules/registry.json（GBK编码）"
  - "步骤2：场景识别（按优先级匹配）"
  - "GAME_TASK - 包含'游戏+开发/做/写/game/游戏功能/游戏系统'"
```

### 步骤2：读取注册表（registry.json）
```
AI行为：读取 c:\Users\Administrator\Desktop\hglua\修仙创意\chaonao\rules\registry.json
编码：GBK（Windows PowerShell默认）
验证：
  - JSON格式有效 ?
  - version: 4 ?
  - parent: "../AGENTS.md" ?（回溯到大脑）
  
场景匹配：
  用户输入："帮我开发一个修仙游戏"
  关键词匹配：
    - GAME_QA: 测试/qa/bug/质量/性能/平衡 → 不匹配
    - GAME_DESIGN: 设计/策划/游戏设计/gdd/系统设计 → 不匹配
    - GAME_TASK: 游戏/开发/game/开发游戏/做游戏 → ? 匹配！
  
加载配置：
  load_rules: [RULE-001, RULE-002, RULE-004, RULE-005, RULE-006, RULE-007, 
               RULE-008, RULE-009, RULE-010, RULE-011, RULE-012, RULE-013, 
               RULE-014, RULE-015, RULE-016]
  load_knowledge: [KNOW-012, KNOW-013, KNOW-014, KNOW-015, KNOW-016, KNOW-017, 
                   KNOW-018, KNOW-019, KNOW-020, KNOW-021, KNOW-022]
  load_mistakes: [MIST-004]
  load_game_studio: [agents, skills, rules]
```

### 步骤3：加载规则文件（16个）
```
AI行为：按registry.json中的path字段加载每个规则文件

RULE-001: rules/project.md
  编码：UTF-8
  指向关系：
    - 调用者：AGENTS.md → registry.json(RULE-001) ?
    - 注册表索引：rules/registry.json RULE-001 ?
    - 触发场景：TASK, AUTO ?
    - 关联文件：security.md(RULE-002), encoding-standard.md(RULE-005) ?

RULE-002: rules/security.md
  编码：UTF-8
  指向关系：
    - 调用者：AGENTS.md → registry.json(RULE-002) ?
    - 注册表索引：rules/registry.json RULE-002 ?
    - 触发场景：所有场景 ?
    - 关联文件：project.md(RULE-001), encoding-standard.md(RULE-005) ?

RULE-004: .trae/rules/project_rules.md
  编码：UTF-8
  指向关系：
    - 调用者：AGENTS.md → registry.json(RULE-004) ?
    - 注册表索引：rules/registry.json RULE-004 ?
    - 触发场景：TASK, GAME_TASK ?
    - 关联文件：project.md(RULE-001), security.md(RULE-002) ?

... (其他13个规则文件同理)
```

### 步骤4：加载知识文件（11个）
```
AI行为：按registry.json中的path字段加载每个知识文件

KNOW-021: .knowledge/verified/rules/game-dev-workflow.md
  编码：UTF-8
  指向关系：
    - 调用者：AGENTS.md → registry.json(KNOW-021) ?
    - 注册表索引：rules/registry.json KNOW-021 ?
    - 被调用者：game-start-skill.md（入口Skill）在阶段4路由后引用本工作流 ?
    - 同级文件：game-start-skill.md（入口Skill）、registry.json（场景配置） ?

KNOW-022: .knowledge/verified/rules/game-start-skill.md
  编码：UTF-8
  指向关系：
    - 调用者：AGENTS.md → registry.json(KNOW-022) ?
    - 注册表索引：rules/registry.json KNOW-022 ?
    - 被调用者：game-dev-workflow.md（工作流）在阶段3后引用本入口Skill的路由结果 ?
    - 同级文件：game-dev-workflow.md（工作流）、registry.json（场景配置） ?

... (其他9个知识文件同理)
```

### 步骤5：加载Game Studio
```
AI行为：按registry.json中的game_studio配置加载

Agents (49个):
  - Tier 1: creative-director.md, technical-director.md, producer.md
  - Tier 2: game-designer.md, lead-programmer.md, art-director.md, ...
  - Tier 3: gameplay-programmer.md, engine-programmer.md, ...

Skills (72个):
  - /start, /brainstorm, /design-system, /dev-story, ...

Rules (11个):
  - gameplay-code.md, engine-code.md, ai-code.md, ...

Hooks (12个):
  - 自动化验证钩子
```

### 步骤6：执行任务
```
AI行为：按加载的规则和知识执行任务

1. 应用RULE-001（项目核心规则）：先读后改，精准修改
2. 应用RULE-002（安全规则）：不提交密钥，不可逆操作必确认
3. 应用KNOW-021（游戏开发工作流）：按阶段执行
4. 应用KNOW-022（游戏开发入口Skill）：7阶段流程
5. 激活Game Studio Agent：Creative Director + Producer
6. 执行Skill：/brainstorm → /setup-engine → ...
```

### 步骤7：记录经验
```
AI行为：任务完成后记录经验

成功 → .learnings/LEARNINGS.md [GAME_BEST]
失败 → .learnings/ERRORS.md [GAME_ERROR]
更好做法 → .learnings/LEARNINGS.md [GAME_IMPROVE]
变更 → .learnings/CHANGELOG.md (JSONL追加)
```

## 双向引用验证

### 正向链路（调用者 → 被调用者）
```
AGENTS.md → registry.json → rules/project.md ?
AGENTS.md → registry.json → game-dev-workflow.md ?
AGENTS.md → registry.json → game-start-skill.md ?
```

### 反向链路（被调用者 → 调用者）
```
rules/project.md → "调用者：AGENTS.md → registry.json(RULE-001)" ?
game-dev-workflow.md → "调用者：AGENTS.md → registry.json(KNOW-021)" ?
game-start-skill.md → "调用者：AGENTS.md → registry.json(KNOW-022)" ?
registry.json → "parent: ../AGENTS.md" ?
```

## 问题发现

### 1. 缺失双向引用的文件
- RULE-005 ~ RULE-016（Game Studio规则）
- KNOW-001, KNOW-003, KNOW-004, KNOW-008~020（其他知识）
- MIST-001 ~ MIST-004（错误预防）

### 2. 编码不一致
- registry.json: GBK
- 规则文件: UTF-8
- 知识文件: UTF-8
- Game Studio文件: 未知（需要检查）

### 3. 场景匹配优先级
- GAME_QA (1) > GAME_DESIGN (2) > GAME_TASK (3) > LEARN (4) > AUTO (5) > META (6) > TASK (7) > CHAT (8)
- 已验证优先级正确 ?
