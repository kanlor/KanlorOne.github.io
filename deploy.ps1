param([switch]$DryRun)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

$allowed = @('index.html','price.html','.nojekyll','assets','help','products','update','workport')
$branch = (git rev-parse --abbrev-ref HEAD).Trim()
if ($branch -ne 'main') { throw "Current branch is '$branch', expected 'main'" }

$staged = @(git diff --cached --name-only)
$bad = @($staged | Where-Object {
    $name = $_
    -not ($allowed | Where-Object { $name -eq $_ -or $name.StartsWith($_ + '/') })
})
if ($bad.Count -gt 0) {
    $bad | ForEach-Object { Write-Host "DISALLOWED STAGED: $_" -ForegroundColor Red }
    throw 'Refusing to deploy while disallowed files are staged. Unstage them first.'
}

git add -A -- $allowed
$staged2 = @(git diff --cached --name-only)
if ($staged2.Count -eq 0) {
    Write-Host 'Nothing to deploy.' -ForegroundColor Yellow
    exit 0
}
Write-Host 'Files staged for public deployment:' -ForegroundColor Cyan
$staged2 | ForEach-Object { Write-Host "  $_" }

if ($DryRun) {
    Write-Host 'Dry run only; no commit/push performed.' -ForegroundColor Yellow
    exit 0
}

$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
git commit -m "Deploy update $timestamp"
if ($LASTEXITCODE -ne 0) { throw 'git commit failed' }
git push origin main
if ($LASTEXITCODE -ne 0) { throw 'git push failed; check GitHub authentication' }
Write-Host 'Deploy committed and pushed. Wait for the static site to rebuild.' -ForegroundColor Green