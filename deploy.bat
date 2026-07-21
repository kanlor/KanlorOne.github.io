@echo off
setlocal

echo ============================================
echo   KanlorOne Deploy to GitHub
echo ============================================
echo.

cd /d "%~dp0"

echo [1/4] Checking git status...
git status --short
echo.

echo [2/4] Adding all changes to staging area...
git add -A
if errorlevel 1 (
    echo ERROR: git add failed
    pause
    exit /b 1
)
echo Done.
echo.

echo [3/4] Committing changes...
for /f "delims=" %%t in ('powershell -NoProfile -Command "Get-Date -Format \"yyyy-MM-dd HH:mm:ss\""') do set "timestamp=%%t"
git commit -m "Deploy update %timestamp%"
if errorlevel 1 (
    echo NOTICE: Nothing to commit, or commit failed
    pause
    exit /b 1
)
echo Done.
echo.

echo [4/4] Pushing to GitHub...
git push origin
if errorlevel 1 (
    echo ERROR: Push failed, check network or permissions
    pause
    exit /b 1
)
echo Done.
echo.

echo ============================================
echo   Deploy success!
echo   GitHub Pages will update in 1-5 minutes
echo   Visit: https://kanlorone.github.io
echo ============================================
echo.
pause
