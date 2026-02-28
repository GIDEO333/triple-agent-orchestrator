---
description: How to run the Triple Agent Orchestrator (Architect -> Worker -> QA) local CLI workflow
---

# Triple Agent Orchestrator

This workflow delegates complex technical execution from Anti-gravity (The Architect) down to Claude Code (The Worker and QA) running directly inside your local terminal, optimizing the use of GLM-4.7 for large-scale operations.

## Prerequisites
Ensure the Triple Agent configuration files exist un-modified on your system:
- `~/Projects/AI_Workflow_Templates/claude_glm47_worker.json`
- `~/Projects/AI_Workflow_Templates/claude_glm47_qa.json`
- `~/Projects/AI_Workflow_Templates/agent_sprint.sh`

## How to Execute the Sprint

### 1. Act as the Architect (Anti-gravity)
*Run this step inside Anti-gravity.*
Ask Anti-gravity to design the specific feature using the `/architect-planning` workflow. 

**CRITICAL**: Tell Anti-gravity to output the final execution task list into a new file called `architecture_plan.md` in the root of your project directory using the `write_to_file` tool. 

Example Prompt to Anti-gravity:
> "Design a JWT Auth flow and write the strict Execution Task List into `architecture_plan.md`"

### 2. Formally Hand Off to the Manager
*Run these commands locally in your terminal inside the project directory.*

Review `architecture_plan.md` briefly. If it looks satisfactory, trigger the automatic CLI sprint by executing the Manager script.

```bash
# Ensure script is executable (only needed once)
chmod +x ~/Projects/AI_Workflow_Templates/agent_sprint.sh

# Run the manager in the current directory containing architecture_plan.md
~/Projects/AI_Workflow_Templates/agent_sprint.sh
```

### 3. Review the QA Report
The `agent_sprint.sh` script will run the Worker profile first, and automatically transition to the QA profile. 
Once the sprint finishes, the QA Agent will have generated a `qa_report.md`. Review this file.
- If it PASSES, the sprint is complete.
- If it FAILS, paste the contents of `qa_report.md` back into Anti-gravity and ask the Architect for a patch, thereby looping the process.
