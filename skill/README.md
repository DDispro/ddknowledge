# 🧠 skill —— 咨询 SKILL（规划中 · 低优先级）

## 目标

将 `knowledge/`（Source of Truth）封装为一个**咨询类 SKILL**：
用户下载该 SKILL 后，向其提问即可获得基于知识库的专业回答。

## 当前状态

- ⏸️ **占位阶段**：知识库内容尚在积累，SKILL 开发优先级**低于**知识库建设优化。
- 只有当 `knowledge/` 达到一定规模（建议 ≥ 50 条且覆盖多个分类）后，再启动本目录的正式开发。

## 设计草案（供未来参考）

```
skill/ddknowledge-consultant/
├── SKILL.md          # SKILL 定义：名称、用途、调用方式、回答规范
└── references/       # 可选：挂载 knowledge/ 快照或索引
```

- 回答规范要点：基于 `knowledge/` 内容作答、引用具体条目、不确定时明确说明。
- 知识库更新后需同步刷新 SKILL 的引用快照（可通过 `scripts/` 生成）。
- 原型草案见 `ddknowledge-consultant/SKILL.md`（仅占位，勿作为正式交付）。
