# 📚 knowledge —— Source of Truth（知识真源）

这是知识库的**正式沉淀区**：只有经过**每周整理 + 人工审核**的内容才能进入这里。
此处内容随仓库开源同步到 GitHub。

## 初始分类建议（随内容增长可增删）

| 分类目录 | 说明 |
|----------|------|
| `general/` | 通用知识、常识类 |
| `tech/` | 技术、工具、开发实践 |
| `business/` | 商业、市场、管理 |
| `consulting/` | 咨询方法论、行业研究 |
| `personal/` | 个人经验、复盘、决策记录 |
| `reference/` | 速查表、清单、模板 |

> 分类目录在首次写入内容时创建（`scripts/update-index.ps1` 会自动发现新目录）。

## 条目规范（每条知识 = 一个 Markdown 文件）

文件顶部使用统一 front-matter：

```markdown
---
title: 条目标题
category: tech
tags: [标签1, 标签2]
source: 原始出处（链接/文件名/口述来源）
date: 2025-01-01        # 整理日期
status: approved        # approved = 已审核
---

正文：用你自己的话总结，力求**准确、精炼、可复用**。
```

- 一篇文章/主题 → 一个文件；命名建议 `YYYY-MM-DD-主题slug.md` 或 `主题slug.md`。
- 必须保留 `source` 字段，保证可追溯。
- 未经审核的草稿**不要**放进本目录（请留在 `source/` 或加 `status: draft` 并尽快处理）。

## 索引

`_INDEX.md` 由 `scripts/update-index.ps1` 自动生成/更新，按分类列出全部条目。
