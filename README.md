# Triple Agent Orchestrator

This repository contains the architecture, configurations, and scripts for a highly constrained, autonomous Tri-Agent software factory for local terminal usage.

## Architecture

The system is composed of:
1. **The Architect (Anti-gravity):** Designed via meta-prompt to outline strict markdown execution task lists.
2. **The Worker (Claude Code + GLM-4.7):** A highly constrained worker agent that builds features with zero hallucination.
3. **The QA Tester (Claude Code + GLM-4.7):** An autonomous testing agent that executes and reports terminal bugs.
4. **The Manager Script:** A bash script that seamlessly orchestrates the Worker and QA agents.

## Installation

This repository uses symlinks so that your OS can correctly discover the agent profiles and workflows while you manage versions purely from this directory.

Run the installer:
```bash
chmod +x install.sh
./install.sh
```

## How to used

1. In Anti-gravity, trigger the architect workflow by typing `/architect-planning` and providing your feature request. The architect will produce an `architecture_plan.md`.
2. Open your terminal in the target project folder.
3. Run `agent_sprint.sh` from your `AI_Workflow_Templates` folder (default).

## History

Check `history/source_seed.md` for the original brain dump between the developer and AI that spawned this architecture.
