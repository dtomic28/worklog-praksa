@echo off
set WORKLOG_DIR="PATH_TO_YOUR_WORKLOG_DIRECTORY"

cd /d %WORKLOG_DIR%

REM Run python script (creates folders + md)
python scripts\daily_log.py

REM Open VS Code and WAIT until closed
code . --wait

REM After VS Code is closed → git commit & push
git add .
git commit -m "worklog: %DATE%"
git push

echo Worklog saved and pushed.