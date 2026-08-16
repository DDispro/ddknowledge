# 每周整理流程（Weekly Workflow）

目标：把 `source/` 里的零散资料，转化为**经审核的 Source of Truth**，并同步到 GitHub。
建议固定每周同一天执行，约 30–60 分钟。

## 阶段一：扫描（5 分钟）

```powershell
pwsh scripts/weekly-new.ps1
```

- 列出 `source/` 中近 7 天新增/修改的文件，形成本周处理清单。
- 可加参数调整窗口：`pwsh scripts/weekly-new.ps1 -Days 14`。

## 阶段二：整理（核心，20–40 分钟）

逐条处理清单上的资料：

1. **判断价值**：是否有长期复用价值？
   - 有 → 提炼成 `knowledge/` 条目（格式见 `knowledge/README.md`）。
   - 没有/已过时/重复 → 删除或归档。
2. **提炼要求**：用自己的话总结，保留 `source` 出处；保留关键数据与结论，
   去掉冗余与情绪化表达。
3. 处理完毕的资料从 `source/` 移走或删除。

> 若资料量大，可让 AI 辅助初稿，但**最终内容必须经你本人审核**（阶段三）。

## 阶段三：审核（5–10 分钟）

对本周新写入 `knowledge/` 的每条内容逐条过目：

- [ ] 内容准确、无事实错误
- [ ] 出处（source 字段）真实可追溯
- [ ] 语言精炼、无冗余
- [ ] 分类与标签合理
- [ ] 与既有条目无重复（重复则合并）
- [ ] `status: approved` 已标记

标准细则见 [REVIEW-GUIDE.md](REVIEW-GUIDE.md)。

## 阶段四：发布（5 分钟）

```powershell
# 1. 更新索引
pwsh scripts/update-index.ps1

# 2. 提交并推送
git add -A
git commit -m "knowledge: weekly digest YYYY-MM-DD"
git push
```

> 推送失败通常意味着网络/认证问题：先 `git remote -v` 确认地址，
> 再确认凭据（GitHub 建议用 Personal Access Token 作为密码）。

## 常见问题

- **本周太忙没空整理？** 允许顺延一周，但 `source/` 堆积越久整理成本越高。
- **资料太多一次整理不完？** 优先处理高价值/时效性强的，其余标注后留到下周期。
- **source/ 误删了怎么办？** 本目录不进 Git，建议重要原始材料另行备份
  （或取消 `.gitignore` 中的 `source/` 忽略）。
