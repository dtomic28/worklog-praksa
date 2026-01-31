#!/bin/bash

WORKLOG_DIR="/path/to/worklog-praksa"
cd "$WORKLOG_DIR" || exit 1

LOGFILE=$(python3 scripts/daily_log.py)

code "$LOGFILE" --wait

git add .
if git diff --cached --quiet; then
    echo "No changes to commit."
else
    git commit -m "worklog: $(date +%Y-%m-%d)"
    git push
fi

echo "Worklog saved and pushed."
