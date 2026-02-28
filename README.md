# Triple Agent Orchestrator

This repository contains the architecture, configurations, and scripts for a highly constrained, autonomous Tri-Agent software factory for local terminal usage.

## Architecture

The system is composed of:
1. **The Architect (Anti-gravity):** Designed via meta-prompt to outline strict markdown execution task lists.
2. **The Worker (Claude Code + GLM-4.7):** A highly constrained worker agent that builds features with zero hallucination.
3. **The QA Tester (Claude Code + GLM-4.7):** An autonomous testing agent that executes and reports terminal bugs.
4. **The Manager Script:** A bash script that seamlessly orchestrates the Worker and QA agents.

## Installation / Zero-Gap Setup

If you are cloning this to a new Mac or environment, you can set up the entire ecosystem with just two commands:

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/triple-agent-orchestrator.git ~/Projects/triple-agent-orchestrator

# 2. Run the installer to create symlinks automatically
cd ~/Projects/triple-agent-orchestrator
chmod +x install.sh
./install.sh
```

## Step-by-Step Usage Guide

Once installed, here is your daily lifecycle for building features:

### Step 1: Brainstorming with The Architect
1. Open up Anti-gravity (your primary AI interface).
2. Type `/architect-planning` to load the Lead Architect system prompt.
3. Give it a feature request and ask it to output the result to `architecture_plan.md` in your target project directory. Example:
   > *"Tolong buatkan scraper Python CLI untuk mengambil harga Bitcoin, dan cetak blueprint Execution Task List-nya ke file `~/Projects/Scraper/architecture_plan.md`."*

### Step 2: Running The Software Factory
1. Open your native terminal or IDE terminal.
2. Navigate to the project directory where the `architecture_plan.md` was saved:
   ```bash
   cd ~/Projects/Scraper
   ```
3. Trigger the fully autonomous Agent Sprint:
   ```bash
   ~/Projects/AI_Workflow_Templates/agent_sprint.sh
   ```
4. Sit back. The script will automatically load the **Worker Agent** to write the code based on the plan, and then swap to the **QA Tester Agent** to verify the functionality and print a report.

### Step 3: Review and Escalate
1. Once the terminal sprint finishes, open the newly generated `qa_report.md` in your project folder.
2. If tests pass, your feature is complete!
3. If it fails (triggering an Escalation Protocol), copy the provided stack trace from the report and feed it back to The Architect in Anti-gravity to get a revised `architecture_plan.md` patch.

## History

Check `history/source_seed.md` for the original historical brain dump between the developer and AI that spawned this architecture.
