#!/bin/bash

# ==========================
# CONFIG
# ==========================
WORKLOG_DIR="/path/to/your/worklog-praksa"

# ==========================
# SCRIPT
# ==========================
cd "$WORKLOG_DIR" || exit 1

# Run python script (creates folders + md)
python3 scripts/daily_log.py

# Open VS Code and WAIT until closed
code . --wait

# After VS Code is closed → git commit & push
git add .

# Prevent empty commits
if git diff --cached --quiet; then
    echo "No changes to commit."
else
    git commit -m "worklog: $(date +%Y-%m-%d)"
    git push
fi

echo "Worklog saved and pushed."
