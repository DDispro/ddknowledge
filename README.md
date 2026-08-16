# DD Knowledge Base (ddknowledge)

个人知识库 · 开源项目 · 持续更新

将日常收集的零散资料，通过**每周一次整理 + 人工审核**，沉淀为结构化的
**Source of Truth（知识真源）**，并同步存档到 GitHub 开源。

> 仓库地址：https://github.com/DDispro/ddknowledge.git

---

## 目录结构

```
DDknowledge/
├── source/        # 📥 原始资料倾倒区 —— 日常所有资料无脑丢这里
├── knowledge/     # 📚 Source of Truth —— 每周整理 + 审核后的正式知识
├── skill/         # 🧠 咨询 SKILL（规划中，低优先级占位）
├── scripts/       # ⚙️ 每周整理辅助脚本
├── docs/          # 📖 流程与规范文档
├── .gitignore
└── README.md
```

## 工作流程（周循环）

```
日常：随手把资料丢进 source/
  ↓
每周整理：scripts/weekly-new.ps1 列出新资料
  ↓
提炼：整理为 knowledge/ 下的结构化条目
  ↓
人工审核：确认内容准确、来源可追溯（Source of Truth 的核心）
  ↓
发布：scripts/update-index.ps1 更新索引 → git commit → git push
```

详细流程见 [docs/WORKFLOW.md](docs/WORKFLOW.md)，审核标准见 [docs/REVIEW-GUIDE.md](docs/REVIEW-GUIDE.md)。

## 快速上手

### 日常（每天）
- 任何资料（文章、笔记、PDF、链接、截图）直接复制/保存到 `source/`，
  无需整理、无需命名规范。

### 每周（固定一天，约 1 小时）
1. `pwsh scripts/weekly-new.ps1` —— 查看本周新增资料清单
2. 逐条提炼成 `knowledge/` 条目（格式见 [knowledge/README.md](knowledge/README.md)）
3. 审核后运行 `pwsh scripts/update-index.ps1` 刷新索引
4. 提交并推送：
   ```powershell
   git add -A
   git commit -m "knowledge: weekly digest YYYY-MM-DD"
   git push
   ```

## 开源与隐私说明

- 同步到 GitHub 的是 **knowledge/（Source of Truth）**。
- `source/` 原始资料默认**不进入 Git**（未经审核，可能含版权/敏感内容），
  如需一并开源，修改 `.gitignore` 即可。
- `skill/` 为未来咨询 SKILL 的占位目录，规划见 [skill/README.md](skill/README.md)。
