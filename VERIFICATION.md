# Chaonao 规则系统自验证提示词

> **用途**：让AI自己验证chaonao系统是否完整可用
> **执行方式**：复制本提示词，发给AI执行

---

## 开始验证

### 第一步：读取入口文件

请依次读取以下文件，验证文件是否存在：

1. `AGENTS.md` - AI大脑入口
2. `index/global-index.json` - 场景路由表
3. `rules/registry.json` - 规则注册表

---

### 第二步：从registry.json提取所有path

从 `registry.json` 中提取所有 `path` 字段，统计：
- rules数组中的路径
- knowledge数组中的路径  
- mistakes数组中的路径

---

### 第三步：验证每个文件是否存在

对每个路径执行文件存在性检查，格式：
```
Test-Path "chaonao/路径"
```

---

### 第四步：验证文件关联

检查以下关键链路：

**链路1：设计场景**
```
用户说"设计" → AGENTS.md → global-index.json → DESIGN场景 → skills/huashu-design/SKILL.md
```

**链路2：游戏开发场景**
```
用户说"游戏" → AGENTS.md → global-index.json → GAME_TASK场景 → rules/project.md + .knowledge/verified/api/cgmsv-lua-core.md
```

**链路3：数据配置场景**
```
用户说"NPC" → AGENTS.md → global-index.json → DATA场景 → .knowledge/verified/api/data-script-core.md + .knowledge/verified/api/cgmsv-lua-core.md
```

---

### 第五步：执行模拟对话

模拟以下场景，让AI按规则执行：

**模拟1：设计任务**
```
用户：请帮我设计一个装备强化的UI界面

预期行为：
1. 读取AGENTS.md
2. 匹配DESIGN场景
3. 加载skills/huashu-design/SKILL.md
4. 加载skills/huashu-design/references/design-styles.md
5. 使用huashu-design能力生成HTML原型
```

**模拟2：游戏开发任务**
```
用户：我要给寻仙游戏添加一个商店NPC

预期行为：
1. 读取AGENTS.md
2. 匹配GAME_TASK场景
3. 加载rules/project.md
4. 加载.knowledge/verified/api/cgmsv-lua-core.md
5. 加载.knowledge/verified/api/data-script-core.md
6. 理解NPC配置格式（npc.txt）
7. 使用GBK编码编写脚本
```

**模拟3：记忆读取任务**
```
用户：上次我们做了什么？

预期行为：
1. 读取memory/l0_hot.md
2. 返回当前项目状态和历史记录
```

---

### 第六步：输出验证报告

```markdown
## 验证报告

### 文件完整性
- 总引用文件数：X
- 实际存在数：X
- 缺失数：X
- 缺失列表：[...]

### 关联链路验证
- 链路1（设计）：✅/❌
- 链路2（游戏）：✅/❌
- 链路3（数据）：✅/❌

### 模拟对话验证
- 模拟1（设计）：✅/❌
- 模拟2（游戏）：✅/❌
- 模拟3（记忆）：✅/❌

### 问题列表
1. ...
2. ...

### 结论
✅ 系统完整 / ❌ 需要修复
```

---

## 执行命令模板

```powershell
# 验证文件存在性
$base = "C:\Users\Administrator\Desktop\hglua\修仙创意\chaonao"
$files = @(
    "AGENTS.md",
    "index/global-index.json",
    "rules/registry.json"
)
foreach($f in $files) {
    $p = Join-Path $base $f
    if(Test-Path $p) { Write-Host "✓ $f" }
    else { Write-Host "✗ MISSING: $f" }
}

# 验证知识文件
$knowledge = @(
    ".knowledge/verified/api/cgmsv-lua-core.md",
    ".knowledge/verified/api/data-script-core.md",
    ".knowledge/mistakes/encoding-mistake.md",
    "skills/huashu-design/SKILL.md"
)
foreach($f in $knowledge) {
    $p = Join-Path $base $f
    if(Test-Path $p) { Write-Host "✓ $f" }
    else { Write-Host "✗ MISSING: $f" }
}
```

---

**验证完成后，将结果追加到本文件末尾。**
