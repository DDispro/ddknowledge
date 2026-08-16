# weekly-new.ps1 - List files added/modified in source/ during the last N days.
param(
    [int]$Days = 7,
    [switch]$IncludeOld
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$sourceDir = Join-Path $root 'source'

if (-not (Test-Path $sourceDir)) {
    Write-Host "[warn] source dir not found: $sourceDir" -ForegroundColor Yellow
    exit 0
}

$cutoff = (Get-Date).AddDays(-$Days)
$files = Get-ChildItem -Path $sourceDir -Recurse -File |
    Where-Object { $_.FullName -notmatch '\\README\.md$' }

$recent = $files | Where-Object { $_.LastWriteTime -ge $cutoff } |
    Sort-Object LastWriteTime -Descending

Write-Host ""
Write-Host "======================================================"
Write-Host "  Weekly triage list (source/)  -  last $Days days"
Write-Host "  Window: $($cutoff.ToString('yyyy-MM-dd HH:mm')) -> now"
Write-Host "======================================================"

if ($recent.Count -eq 0) {
    Write-Host "  (no new files in the last $Days days)" -ForegroundColor Green
} else {
    $i = 0
    foreach ($f in $recent) {
        $i++
        $rel = $f.FullName.Substring($sourceDir.Length + 1)
        Write-Host ("  {0,3}. {1,-45}  {2,8:N1} KB  {3}" -f `
            $i, $rel, ($f.Length / 1KB), $f.LastWriteTime.ToString('yyyy-MM-dd'))
    }
    Write-Host ""
    Write-Host "  Total: $($recent.Count) file(s) to process this week." -ForegroundColor Cyan
}

if ($IncludeOld) {
    $old = $files | Where-Object { $_.LastWriteTime -lt $cutoff } | Sort-Object LastWriteTime
    Write-Host ""
    Write-Host "  -- Older files (outside window) --"
    foreach ($f in $old) {
        $rel = $f.FullName.Substring($sourceDir.Length + 1)
        Write-Host ("      {0,-45}  {1}" -f $rel, $f.LastWriteTime.ToString('yyyy-MM-dd'))
    }
}

Write-Host ""
