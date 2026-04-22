# AGENTS.md - AI速查卡

> 每次对话先读这张卡，按场景加载对应文件，然后解决问题。

---

## 场景速查（看到关键词就加载）

| 用户说什么 | 加载这些文件 | 用途 |
|-----------|------------|------|
| **设计/UI/原型/mockup** | `skills/huashu-design/SKILL.md` | 高保真设计、动画、导出 |
| **写游戏代码/做功能** | `rules/project.md` + `.trae/rules/project_rules.md` | 项目规范、代码规则 |
| **游戏设计/策划/GDD** | `game-studio/rules/design-docs.md` + `game-studio/docs/coding-standards.md` | 设计文档规范 |
| **配NPC/物品/怪物/地图** | `.knowledge/verified/api/data-script-core.md` | 数据配置API |
| **报错/bug/怎么错了** | `.knowledge/mistakes/prevention.md` | 常见错误预防 |
| **问API/函数怎么用** | `.knowledge/verified/api/cgmsv-lua-core.md` | Lua核心API文档 |
| **自主工作/自动执行** | `core/workflow.dsl` + `rules/project.md` | 工作流定义 |
| **学习/研究/探索** | `core/workflow.dsl` | 学习流程 |
| **优化/整理/检查知识库** | `index/global-index.json` + `rules/registry.json` | 系统元数据 |
| **记忆/经验/学到了** | `memory/l0_hot.md` | 当前状态和近期经验 |
| **随便聊聊/你好** | 不用加载，直接回答 | - |

---

## 编码（别搞错）

| 文件类型 | 编码 |
|---------|------|
| `data/` 下的 .txt | **GBK** |
| 代码 .lua .py .js | **UTF-8** |
| 规则/知识 .md | **UTF-8** |
| `registry.json` | **GBK**（读取时用GBK） |

## Game Studio 按需调用（212个文件，按场景加载）

当用户需要**专业游戏开发能力**时，从 `rules/registry.json` 的 `game_studio` 中按需选择：

### 选择Agent（看到角色就加载）

| 用户需要什么 | 加载哪个Agent | 文件路径 |
|------------|-------------|---------|
| 创意/玩法设计 | creative-director | `game-studio/agents/creative-director.md` |
| 技术架构 | technical-director | `game-studio/agents/technical-director.md` |
| 项目管理 | producer | `game-studio/agents/producer.md` |
| 系统设计 | game-designer | `game-studio/agents/game-designer.md` |
| 主程序 | lead-programmer | `game-studio/agents/lead-programmer.md` |
| 美术 | art-director | `game-studio/agents/art-director.md` |
| 音频 | audio-director | `game-studio/agents/audio-director.md` |
| 叙事 | narrative-director | `game-studio/agents/narrative-director.md` |
| QA | qa-lead | `game-studio/agents/qa-lead.md` |
| 玩法程序员 | gameplay-programmer | `game-studio/agents/gameplay-programmer.md` |
| 引擎程序员 | engine-programmer | `game-studio/agents/engine-programmer.md` |
| AI程序员 | ai-programmer | `game-studio/agents/ai-programmer.md` |
| 网络程序员 | network-programmer | `game-studio/agents/network-programmer.md` |
| 工具程序员 | tools-programmer | `game-studio/agents/tools-programmer.md` |
| UI程序员 | ui-programmer | `game-studio/agents/ui-programmer.md` |
| 关卡设计 | level-designer | `game-studio/agents/level-designer.md` |
| 经济系统 | economy-designer | `game-studio/agents/economy-designer.md` |
| 技术美术 | technical-artist | `game-studio/agents/technical-artist.md` |
| 音效设计 | sound-designer | `game-studio/agents/sound-designer.md` |
| 编剧 | writer | `game-studio/agents/writer.md` |
| 世界观 | world-builder | `game-studio/agents/world-builder.md` |
| UX设计 | ux-designer | `game-studio/agents/ux-designer.md` |
| 原型 | prototyper | `game-studio/agents/prototyper.md` |
| 性能分析 | performance-analyst | `game-studio/agents/performance-analyst.md` |
| DevOps | devops-engineer | `game-studio/agents/devops-engineer.md` |
| 数据分析 | analytics-engineer | `game-studio/agents/analytics-engineer.md` |
| 安全 | security-engineer | `game-studio/agents/security-engineer.md` |
| 测试 | qa-tester | `game-studio/agents/qa-tester.md` |
| 无障碍 | accessibility-specialist | `game-studio/agents/accessibility-specialist.md` |
| 运营 | live-ops-designer | `game-studio/agents/live-ops-designer.md` |
| 社区 | community-manager | `game-studio/agents/community-manager.md` |
| Godot专家 | godot-specialist | `game-studio/agents/godot-specialist.md` |
| Unity专家 | unity-specialist | `game-studio/agents/unity-specialist.md` |
| UE专家 | unreal-specialist | `game-studio/agents/unreal-specialist.md` |

### 选择Skill（看到流程就加载）

| 用户要做什么 | 加载哪个Skill | 文件路径 |
|------------|-------------|---------|
| 开始项目 | start | `game-studio/skills/start/SKILL.md` |
| 头脑风暴 | brainstorm | `game-studio/skills/brainstorm/SKILL.md` |
| 系统设计 | design-system | `game-studio/skills/design-system/SKILL.md` |
| 创建架构 | create-architecture | `game-studio/skills/create-architecture/SKILL.md` |
| 开发故事 | dev-story | `game-studio/skills/dev-story/SKILL.md` |
| 代码审查 | code-review | `game-studio/skills/code-review/SKILL.md` |
| QA计划 | qa-plan | `game-studio/skills/qa-plan/SKILL.md` |
| 原型 | prototype | `game-studio/skills/prototype/SKILL.md` |
| 设置引擎 | setup-engine | `game-studio/skills/setup-engine/SKILL.md` |
| 创建Epics | create-epics | `game-studio/skills/create-epics/SKILL.md` |
| 创建Stories | create-stories | `game-studio/skills/create-stories/SKILL.md` |
| Sprint计划 | sprint-plan | `game-studio/skills/sprint-plan/SKILL.md` |
| 门控检查 | gate-check | `game-studio/skills/gate-check/SKILL.md` |
| 设计审查 | design-review | `game-studio/skills/design-review/SKILL.md` |
| 系统映射 | map-systems | `game-studio/skills/map-systems/SKILL.md` |
| 美术圣经 | art-bible | `game-studio/skills/art-bible/SKILL.md` |
| UX设计 | ux-design | `game-studio/skills/ux-design/SKILL.md` |
| 测试报告 | playtest-report | `game-studio/skills/playtest-report/SKILL.md` |
| 架构决策 | architecture-decision | `game-studio/skills/architecture-decision/SKILL.md` |
| 架构审查 | architecture-review | `game-studio/skills/architecture-review/SKILL.md` |
| 阶段检测 | project-stage-detect | `game-studio/skills/project-stage-detect/SKILL.md` |
| 完成检查 | story-done | `game-studio/skills/story-done/SKILL.md` |
| 准备度检查 | story-readiness | `game-studio/skills/story-readiness/SKILL.md` |
| 估算 | estimate | `game-studio/skills/estimate/SKILL.md` |
| Sprint状态 | sprint-status | `game-studio/skills/sprint-status/SKILL.md` |
| 平衡检查 | balance-check | `game-studio/skills/balance-check/SKILL.md` |
| 性能分析 | perf-profile | `game-studio/skills/perf-profile/SKILL.md` |
| 技术债 | tech-debt | `game-studio/skills/tech-debt/SKILL.md` |
| Bug报告 | bug-report | `game-studio/skills/bug-report/SKILL.md` |
| Bug分类 | bug-triage | `game-studio/skills/bug-triage/SKILL.md` |
| 回顾 | retrospective | `game-studio/skills/retrospective/SKILL.md` |
| 里程碑审查 | milestone-review | `game-studio/skills/milestone-review/SKILL.md` |
| 发布清单 | release-checklist | `game-studio/skills/release-checklist/SKILL.md` |
| 启动清单 | launch-checklist | `game-studio/skills/launch-checklist/SKILL.md` |
| 变更日志 | changelog | `game-studio/skills/changelog/SKILL.md` |
| 补丁说明 | patch-notes | `game-studio/skills/patch-notes/SKILL.md` |
| 热修复 | hotfix | `game-studio/skills/hotfix/SKILL.md` |
| 本地化 | localize | `game-studio/skills/localize/SKILL.md` |
| 入职 | onboard | `game-studio/skills/onboard/SKILL.md` |
| 快速设计 | quick-design | `game-studio/skills/quick-design/SKILL.md` |
| 审查GDD | review-all-gdds | `game-studio/skills/review-all-gdds/SKILL.md` |
| 传播设计变更 | propagate-design-change | `game-studio/skills/propagate-design-change/SKILL.md` |
| 资产审计 | asset-audit | `game-studio/skills/asset-audit/SKILL.md` |
| 资产规格 | asset-spec | `game-studio/skills/asset-spec/SKILL.md` |
| UX审查 | ux-review | `game-studio/skills/ux-review/SKILL.md` |
| 一致性检查 | consistency-check | `game-studio/skills/consistency-check/SKILL.md` |
| 内容审计 | content-audit | `game-studio/skills/content-audit/SKILL.md` |
| 范围检查 | scope-check | `game-studio/skills/scope-check/SKILL.md` |
| 冒烟测试 | smoke-check | `game-studio/skills/smoke-check/SKILL.md` |
| 浸泡测试 | soak-test | `game-studio/skills/soak-test/SKILL.md` |
| 回归测试 | regression-suite | `game-studio/skills/regression-suite/SKILL.md` |
| 测试设置 | test-setup | `game-studio/skills/test-setup/SKILL.md` |
| 测试助手 | test-helpers | `game-studio/skills/test-helpers/SKILL.md` |
| 测试证据 | test-evidence-review | `game-studio/skills/test-evidence-review/SKILL.md` |
| 不稳定性 | test-flakiness | `game-studio/skills/test-flakiness/SKILL.md` |
| Skill测试 | skill-test | `game-studio/skills/skill-test/SKILL.md` |
| Skill改进 | skill-improve | `game-studio/skills/skill-improve/SKILL.md` |
| 反向文档 | reverse-document | `game-studio/skills/reverse-document/SKILL.md` |
| 团队战斗 | team-combat | `game-studio/skills/team-combat/SKILL.md` |
| 团队叙事 | team-narrative | `game-studio/skills/team-narrative/SKILL.md` |
| 团队UI | team-ui | `game-studio/skills/team-ui/SKILL.md` |
| 团队发布 | team-release | `game-studio/skills/team-release/SKILL.md` |
| 团队打磨 | team-polish | `game-studio/skills/team-polish/SKILL.md` |
| 团队音频 | team-audio | `game-studio/skills/team-audio/SKILL.md` |
| 团队关卡 | team-level | `game-studio/skills/team-level/SKILL.md` |
| 团队运营 | team-live-ops | `game-studio/skills/team-live-ops/SKILL.md` |
| 团队QA | team-qa | `game-studio/skills/team-qa/SKILL.md` |
| 安全审计 | security-audit | `game-studio/skills/security-audit/SKILL.md` |
| 首日补丁 | day-one-patch | `game-studio/skills/day-one-patch/SKILL.md` |

### 选择规则文件

| 写什么代码 | 加载哪个规则 | 文件路径 |
|----------|------------|---------|
| 玩法代码 | gameplay-code | `game-studio/rules/gameplay-code.md` |
| 引擎代码 | engine-code | `game-studio/rules/engine-code.md` |
| AI代码 | ai-code | `game-studio/rules/ai-code.md` |
| 网络代码 | network-code | `game-studio/rules/network-code.md` |
| UI代码 | ui-code | `game-studio/rules/ui-code.md` |
| 设计文档 | design-docs | `game-studio/rules/design-docs.md` |
| 数据文件 | data-files | `game-studio/rules/data-files.md` |
| 测试标准 | test-standards | `game-studio/rules/test-standards.md` |
| 原型代码 | prototype-code | `game-studio/rules/prototype-code.md` |
| 着色器 | shader-code | `game-studio/rules/shader-code.md` |
| 叙事 | narrative | `game-studio/rules/narrative.md` |

## 通用规则索引（需要时查阅）

**rules/** - 通用规则
- `rules/project.md` - 项目核心规则
- `rules/security.md` - 安全规则
- `rules/collaboration.md` - 协作规则

**.knowledge/verified/** - 验证过的知识
- `api/cgmsv-lua-core.md` - Lua核心API
- `api/data-script-core.md` - 数据脚本格式
- `patterns/equipment-enhance.md` - 装备强化设计
- `patterns/thinking-frameworks.md` - 思维框架
- `rules/file-encoding-standard.md` - 文件编码标准
- `rules/game-dev-workflow.md` - 游戏开发工作流
- `rules/game-start-skill.md` - 游戏入口Skill

---

## 做完后（必须）

1. **更新** `memory/l0_hot.md`
   - 修改"最后更新时间"
   - 追加"本次工作记录"
   - 有新教训追加到"经验教训"
2. **检查** 修改的文件引用还正确吗？
3. **勾选** 下面清单：
   - [ ] 日志更新了？（时间戳 + 工作内容）
   - [ ] 编码没搞错？（data/用GBK，代码用UTF-8）
   - [ ] 有新经验要记？（错误、发现、优化点）
   - [ ] 文件引用检查过？（没引用不存在的文件）

漏了？停下来补上。
