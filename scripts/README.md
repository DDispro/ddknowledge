# ⚙️ scripts —— 每周整理辅助脚本

纯 PowerShell，无第三方依赖，可在 Windows PowerShell 5.1 / PowerShell 7 运行。

| 脚本 | 作用 |
|------|------|
| `weekly-new.ps1` | 列出 `source/` 近 N 天（默认 7）新增/修改的文件，生成本周整理清单 |
| `update-index.ps1` | 扫描 `knowledge/`，自动生成/更新 `knowledge/_INDEX.md` |

## 用法

```powershell
# 本周新资料清单
pwsh scripts/weekly-new.ps1
pwsh scripts/weekly-new.ps1 -Days 14        # 自定义窗口
pwsh scripts/weekly-new.ps1 -IncludeOld     # 同时列出全部历史文件

# 重建知识索引（发布前运行）
pwsh scripts/update-index.ps1
```

## 约定

- 脚本在仓库根目录运行即可（会自动定位项目根，不依赖当前工作目录）。
- 索引解析条目 front-matter 中的 `title` / `category` / `tags` / `date` / `source`。
- 无 front-matter 的文件也会被列出（`title` 取文件名），便于发现不合规条目。
