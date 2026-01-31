# ==========================
# CONFIG
# ==========================
$WORKLOG_DIR = "C:\Users\danijel\Documents\Programing\Projects\worklog-praksa"

# ==========================
# SCRIPT
# ==========================
Set-Location $WORKLOG_DIR

# Run python script and capture output (path to md file)
$logFile = python scripts\daily_log.py

Write-Host "Daily log file: $logFile"

# Open VS Code and wait until it is closed
code "$logFile" --wait

# Git commit & push (allow empty commits)
git add .
git commit --allow-empty -m "worklog: $(Get-Date -Format yyyy-MM-dd)"
git push

Write-Host "Worklog done. Go home."
