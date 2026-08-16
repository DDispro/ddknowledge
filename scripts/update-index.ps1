# update-index.ps1 - Rebuild knowledge/_INDEX.md from front-matter of entries.
param()

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$kbDir = Join-Path $root 'knowledge'

if (-not (Test-Path $kbDir)) {
    Write-Host "[error] knowledge dir not found: $kbDir"
    exit 1
}

$files = Get-ChildItem -Path $kbDir -Recurse -Filter '*.md' -File |
    Where-Object { $_.Name -ne '_INDEX.md' -and $_.Name -ne 'README.md' }

# Parse simple front-matter: lines between leading '---' and trailing '---'
function Get-FrontMatter {
    param([string]$Path)
    $lines = Get-Content -Path $Path -Encoding UTF8
    $meta = @{ title = ''; category = ''; tags = ''; date = ''; source = '' }
    if ($lines.Count -ge 3 -and $lines[0].Trim() -eq '---') {
        $end = -1
        for ($i = 1; $i -lt $lines.Count; $i++) {
            if ($lines[$i].Trim() -eq '---') { $end = $i; break }
        }
        if ($end -gt 0) {
            for ($i = 1; $i -lt $end; $i++) {
                $line = $lines[$i]
                if ($line -match '^\s*([A-Za-z_]+)\s*:\s*(.+?)\s*$') {
                    $meta[$matches[1].ToLower()] = $matches[2].Trim('"', "'")
                }
            }
        }
    }
    return $meta
}

$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine('# 知识索引（自动生成，勿手改）')
[void]$sb.AppendLine('')
[void]$sb.AppendLine("> 更新于 $(Get-Date -Format 'yyyy-MM-dd HH:mm')，共 $($files.Count) 个条目。")
[void]$sb.AppendLine('')

$grouped = $files | Group-Object { (Get-FrontMatter $_.FullName).category }

if ($grouped.Count -eq 0) {
    [void]$sb.AppendLine('_暂无条目。_')
} else {
    foreach ($g in ($grouped | Sort-Object Name)) {
        $cat = if ($g.Name) { $g.Name } else { '(未分类)' }
        [void]$sb.AppendLine("## $cat")
        [void]$sb.AppendLine('')
        foreach ($f in ($g.Group | Sort-Object Name)) {
            $m = Get-FrontMatter $f.FullName
            $title = if ($m.title) { $m.title } else { $f.BaseName }
            $rel = $f.FullName.Substring($kbDir.Length + 1).Replace('\', '/')
            $extra = @()
            if ($m.date)  { $extra += "date: $($m.date)" }
            if ($m.tags)  { $extra += "tags: $($m.tags)" }
            if ($m.source){ $extra += "src: $($m.source)" }
            $suffix = if ($extra.Count) { '  —  ' + ($extra -join ' | ') } else { '' }
            [void]$sb.AppendLine("- [$title]($rel)$suffix")
        }
        [void]$sb.AppendLine('')
    }
}

$indexPath = Join-Path $kbDir '_INDEX.md'
[System.IO.File]::WriteAllText($indexPath, $sb.ToString(), [System.Text.UTF8Encoding]::new($false))
Write-Host "[ok] index updated: $indexPath ($($files.Count) entries)"
