# 🧠 skill —— 咨询 SKILL

## 目标

将 `knowledge/`（Source of Truth）封装为**咨询类 SKILL**：用户下载后，调用该 SKILL 提出问题即可获得基于知识库的专业回答。回答内容由内嵌知识卡（蒸馏自知识库）保障，不依赖外部方法论。

## 当前状态

- ✅ **dd 品牌营销方法论 SKILL（MarketingPro v3.0）已构建**：`skill/dd/`
  - 通用 SKILL.md 格式（无需插件配置），15 个模块（Deep/Middle/Surface 三层）
  - 内嵌标准知识卡（`skill/dd/knowledge/`，从 44 条知识库条目蒸馏，无机构品牌、无案例）
  - 四件套能力：品牌诊断 / 咨询问答 / 物料生成 / 战略全案

## 使用方式

- 将 `skill/dd/` 目录作为 SKILL 加载到支持 SKILL.md 规范的 AI 工具；
- 调用 `/dd [问题]` 或 `/dd-brand`、`/dd-growth`、`/dd-naming` 等 15 个子指令（详见 `dd/SKILL.md`）。

## 维护约定

- 知识库每周更新后，需同步刷新 `skill/dd/knowledge/` 中受影响的方法卡（保持与 Source of Truth 一致）。
- 所有 skill 内容继承知识库净化原则：不出现咨询机构品牌名、不保留案例、不出现品牌名举例。
