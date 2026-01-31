@echo off
set WORKLOG_DIR=C:\Users\danijel\Documents\Programing\Projects\worklog-praksa

cd /d %WORKLOG_DIR%

REM Run python script and capture output (file path)
for /f "delims=" %%i in ('python scripts\daily_log.py') do set LOGFILE=%%i

REM Open the generated markdown file and WAIT
code "%LOGFILE%" --wait

REM Git commit & push
git add .
git commit -m "worklog: %DATE%"
git push

echo Worklog saved and pushed.
