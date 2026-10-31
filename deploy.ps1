param([switch]$DryRun)
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

$allowed = @('index.html','price.html','.nojekyll','assets','help','products','update','workport')
$branch = (git rev-parse --abbrev-ref HEAD).Trim()
if ($branch -ne 'main') { throw "Current branch is '$branch', expected 'main'" }

$factsCheck = Join-Path (Split-Path $PSScriptRoot -Parent) 'tools\check_wordsuite_public_facts.py'
python $factsCheck
if ($LASTEXITCODE -ne 0) { throw 'WordSuite public facts check failed.' }

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
if ($staged2.Count -gt 0) {
    Write-Host 'Files staged for public deployment:' -ForegroundColor Cyan
    $staged2 | ForEach-Object { Write-Host "  $_" }
}

$upstream = "origin/$branch"
git rev-parse --verify $upstream 2>$null | Out-Null
if ($LASTEXITCODE -ne 0) { throw "Missing upstream '$upstream'." }
$pendingBefore = [int](git rev-list --count "${upstream}..HEAD")

if ($DryRun) {
    Write-Host ("Dry run only; staged={0}, pending_push={1}; no commit/push performed." -f $staged2.Count, $pendingBefore) -ForegroundColor Yellow
    exit 0
}

if ($staged2.Count -gt 0) {
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    git commit -m "Deploy update $timestamp"
    if ($LASTEXITCODE -ne 0) { throw 'git commit failed' }
}

$pending = [int](git rev-list --count "${upstream}..HEAD")
if ($pending -eq 0) {
    Write-Host 'Nothing to deploy.' -ForegroundColor Yellow
    exit 0
}

Write-Host ("Pushing {0} pending commit(s) to {1}..." -f $pending, $upstream) -ForegroundColor Cyan
$env:GIT_TERMINAL_PROMPT = '0'
git -c credential.helper= -c credential.helper=manager push origin $branch
if ($LASTEXITCODE -ne 0) {
    throw 'git push failed. Pending commits remain local; check GitHub connectivity/proxy and rerun deploy.bat to retry.'
}
Write-Host 'Deploy pushed. Wait for the static site to rebuild.' -ForegroundColor Green