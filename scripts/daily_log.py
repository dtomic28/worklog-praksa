from datetime import datetime, timedelta
from pathlib import Path

# ==========================
# CONFIG
# ==========================
PRAKSA_START_DATE = "2026-03-16"  # MUST be a Monday
BASE_DIR = Path(__file__).resolve().parent.parent

# ==========================
# DATE CALCULATIONS
# ==========================
today = datetime.now().date()
start_date = datetime.strptime(PRAKSA_START_DATE, "%Y-%m-%d").date()

# Ensure praksa start is Monday
if start_date.weekday() != 0:
    raise ValueError("PRAKSA_START_DATE must be a Monday")

# Calculate week of praksa (starting at 1)
days_since_start = (today - start_date).days
week_of_praksa = days_since_start // 7 + 1

# Monday of current week
monday = today - timedelta(days=today.weekday())
friday = monday + timedelta(days=4)

# ==========================
# FOLDER STRUCTURE
# ==========================
year_month = today.strftime("%m-%Y")
date_str = today.strftime("%d-%m-%Y")

month_dir = BASE_DIR / year_month
week_dir = month_dir / f"week-{week_of_praksa:02d}"
week_dir.mkdir(parents=True, exist_ok=True)

friday_str = friday.strftime("%d-%m-%Y")
monday_str = monday.strftime("%d-%m-%Y")

md_file = week_dir / f"{date_str}.md"

# ==========================
# FILE TEMPLATE
# ==========================
if not md_file.exists():
    md_file.write_text(
        f"""# {date_str}
**Week {week_of_praksa:02d} ({monday_str} - {friday_str})**

## 🧩 Context
- Project / Module:
- Focus of the day:

## 🎟️ Tickets
- 

## 📅 Meetings
- 

## 🛠️ Work done
- 

## 🧠 Problems / Notes
- 

## 📌 Decisions
- 

## 🔜 Next steps
- 
""",
        encoding="utf-8",
    )

print(f"{md_file}")
