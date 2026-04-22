# 模拟对话测试 - 验证实际对话中的触发和调用

## 测试场景1：用户说"帮我开发一个修仙游戏"

### 预期执行链路：
1. AI读取 AGENTS.md（大脑）
2. AGENTS.md 指示读取 rules/registry.json
3. registry.json scenes 匹配 GAME_TASK（关键词：游戏+开发）
4. 加载规则：RULE-001,002,004,005,006,007,008,009,010,011,012,013,014,015
5. 加载知识：KNOW-012~022（含游戏工作流和入口Skill）
6. 加载错误预防：MIST-004
7. 激活Game Studio：agents + skills + rules
8. 执行游戏开发入口Skill（7阶段流程）

### 验证点：
- [x] AGENTS.md 存在且包含规则加载机制
- [x] registry.json 包含 GAME_TASK 场景
- [x] GAME_TASK 关键词包含 "游戏"+"开发"
- [x] 所有规则路径文件存在（77/77通过）
- [x] 所有知识路径文件存在
- [x] game-dev-workflow.md 包含完整工作流
- [x] game-start-skill.md 包含入口Skill

## 测试场景2：用户说"设计一个战斗系统"

### 预期执行链路：
1. 匹配 GAME_DESIGN 场景
2. 加载规则：RULE-001,002,011,016
3. 加载知识：KNOW-012,015,016,017,018,019,021,022
4. 激活设计模式→创意总监→游戏设计师

### 验证点：
- [x] GAME_DESIGN 场景存在
- [x] 关键词包含 "设计"+"GDD"+"关卡设计"
- [x] RULE-011（设计文档规则）路径正确
- [x] RULE-016（叙事规则）路径正确

## 测试场景3：用户说"测试游戏性能"

### 预期执行链路：
1. 匹配 GAME_QA 场景
2. 加载规则：RULE-001,002,013
3. 加载知识：KNOW-012,013,015,021,022
4. 激活QA模式→QA Lead→测试计划

### 验证点：
- [x] GAME_QA 场景存在
- [x] 关键词包含 "测试"+"qa"+"bug"+"性能"
- [x] RULE-013（测试标准规则）路径正确

## 测试场景4：用户说"帮我实现一个功能"

### 预期执行链路：
1. 匹配 TASK 场景（普通任务）
2. 加载规则：RULE-001,002,004,005
3. 加载错误预防：MIST-004
4. 执行：读注册表→匹配知识→先读后改→验证→记录经验

### 验证点：
- [x] TASK 场景存在
- [x] 关键词包含 "写"+"实现"+"修改"+"开发"
- [x] 不加载Game Studio（普通任务不需要）

## 测试场景5：用户说"你好"

### 预期执行链路：
1. 匹配 CHAT 场景
2. 不加载任何规则/知识（直接回答）

### 验证点：
- [x] CHAT 场景存在
- [x] load_rules 为空数组
- [x] load_knowledge 为空数组

## 关键问题检查

### 1. 编码一致性
- [x] AGENTS.md: UTF-8 无BOM（已修复）
- [x] registry.json: GBK（Windows PowerShell默认）
- [x] game-dev-workflow.md: UTF-8 无BOM（已修复）
- [x] game-start-skill.md: UTF-8 无BOM（已修复）
- [x] 所有规则文件: UTF-8 无BOM
- [x] 所有知识文件: UTF-8 无BOM

### 2. 路径一致性
- [x] registry.json 中所有 path 字段指向实际存在的文件
- [x] 77个路径全部验证通过

### 3. 场景覆盖度
- [x] 8个场景覆盖所有使用场景
- [x] GAME_TASK/GAME_DESIGN/GAME_QA 覆盖游戏开发全流程
- [x] TASK/LEARN/AUTO/META/CHAT 覆盖日常工作

### 4. 触发及时性
- [x] 场景识别基于关键词匹配，对话开始即可触发
- [x] AGENTS.md 每次对话先读取，确保规则加载机制执行
- [x] registry.json 作为统一索引，避免遗漏

## 潜在问题

### 1. registry.json 编码
registry.json 是 GBK 编码，AI读取时需要用正确编码。建议在 AGENTS.md 中注明编码。

### 2. 场景匹配优先级
如果用户输入同时匹配多个场景，需要按优先级处理。registry.json 中 rules 有 priority 字段，但 scenes 没有优先级。

### 3. 游戏场景关键词重叠
GAME_TASK 和 GAME_DESIGN 的关键词可能有重叠（都包含"游戏"）。需要更精确的匹配逻辑。
