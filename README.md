# Worklog Praksa – Automated Daily Practice Logging

This repository provides a **simple, automated, and low-friction system** for documenting daily work during practical training (_praksa_).  
It is designed for students who want **structured logs**, **easy summaries**, and **ready material for reports or diploma work**.

---

## 🎯 What problem does this solve?

- You don’t want to forget what you worked on
- You don’t want to manually organize files
- You don’t want to rewrite reports from memory
- You want something you can run in **5 seconds before going home**

This system solves that with **one command**.

---

## 🚀 What happens when you run `worklog`?

1. Current date is detected
2. Week of practice (Monday → Sunday) is calculated
3. Folder structure is created automatically:
   ```
   YYYY-MM/
     week-XX/
       YYYY-MM-DD.md
   ```
4. A Markdown daily log is generated from a template
5. VS Code opens and waits
6. When VS Code is closed:
   - changes are committed
   - changes are pushed to Git

You just write. Everything else is automatic.

---

## 📁 Example folder structure

```
worklog-praksa/
├── scripts/
│   └── daily_log.py
├── .vscode/
│   └── tasks.json
├── worklog.bat
├── worklog.sh
└── YYYY-MM/
    └── week-03/
        └── YYYY-MM-DD.md
```

---

## 🛠 Requirements

- Python 3.8+
- Git
- VS Code
- Windows (CMD / PowerShell) **or** Linux / macOS
- `code` command available in PATH

---

## ⚙️ Setup Instructions

### 1️⃣ Clone or download the project

```bash
git clone <repository-url>
cd worklog-praksa
```

---

### 2️⃣ Configure practice start date

Open:

```
scripts/daily_log.py
```

Set the start date of your practice (**must be a Monday**):

```python
PRAKSA_START_DATE = "2025-02-17"
```

This date defines **Week 01 of practice**.

---

## 🪟 Windows Setup

### 3️⃣ Configure `worklog.ps1`

Open `worklog.ps1` and update:

```bat
$WORKLOG_DIR = "C:\PathToWorklogFolder"
```

---

### 4️⃣ Create PowerShell alias (recommended)

This setup uses **PowerShell profile (`profile.ps1`)**, so the `worklog` command is available in every PowerShell session.

#### 1. Open your PowerShell profile

Run in PowerShell:

```powershell
notepad $PROFILE
```

If the file does not exist, PowerShell will ask to create it — choose **Yes**.

#### 2. Add the alias

Add the following line to `profile.ps1`:

```powershell
Set-Alias worklog "C:\path\to\worklog-praksa\worklog.ps1"
```

Replace `C:\path\to\worklog-praksa` with the actual path to your project.

Save and close the file.

#### 3. Reload the profile

Either restart PowerShell, or run:

```powershell
. $PROFILE
```

#### 4. Use the command

From now on, you can simply run:

```powershell
worklog
```

PowerShell will:

- execute the worklog script
- open VS Code
- commit & push on close

> **Note**  
> If script execution is blocked, allow it for the current user:
>
> ```powershell
> Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
> ```

---

## 🐧 Linux / macOS Setup

### 3️⃣ Configure `worklog.sh`

Open `worklog.sh` and update:

```sh
WORKLOG_DIR="/full/path/to/worklog-praksa"
```

Make it executable:

```bash
chmod +x worklog.sh
```

---

### 4️⃣ Add alias

Add to `~/.bashrc` or `~/.zshrc`:

```bash
alias worklog="/full/path/to/worklog.sh"
```

Reload shell:

```bash
source ~/.bashrc
```

Now you can run:

```bash
worklog
```

---

## 📝 Daily log template

Each day a Markdown file is created:

```md
# YYYY-MM-DD

Week XX (Monday – Sunday)

## Context

- Project / Module:
- Focus of the day:

## Tickets

-

## Meetings

-

## Work done

-

## Problems / Notes

-

## Decisions

-

## Next steps

-
```

Writing bullet points for **5 minutes per day is enough**.

---

## 📊 How to analyze your work later

Recommended workflow:

- Daily logs → raw data
- Weekly summaries → overview
- Monthly summaries → practice report
- Thematic grouping → diploma chapters

Suggested tags:

```
[ADAS], [Validation], [Bugfix], [Testing], [Infra]
```

---

## 🎓 Why this works

- Removes friction
- Enforces consistency
- Produces objective proof of work
- Makes report and diploma writing trivial

---

## 🧠 Final advice

- Write **what you did**, not how you felt
- Log tickets and meetings
- Consistency beats detail
- One bullet point is better than none

---

Happy logging 👌
