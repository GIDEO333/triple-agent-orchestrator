#!/bin/bash
echo "🚀 Installing Triple Agent Orchestrator..."

# Directories
AGENT_DIR="$HOME/.agent/workflows"
TEMPLATE_DIR="$HOME/Projects/AI_Workflow_Templates"

# Create target directories if they don't exist
mkdir -p "$AGENT_DIR"
mkdir -p "$TEMPLATE_DIR"

# Source locations (Absolute path from where install.sh is located)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Function to safely create symlink (replaces if exists)
create_symlink() {
    src="$1"
    dest="$2"
    
    # Remove existing file/symlink if it exists
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        rm "$dest"
        echo "Removed existing $dest"
    fi
    
    ln -s "$src" "$dest"
    echo "✅ Linked: $(basename "$src") -> $dest"
}

# 1. Link Anti-gravity Workflows
create_symlink "$REPO_DIR/src/workflows/architect-planning.md" "$AGENT_DIR/architect-planning.md"
create_symlink "$REPO_DIR/src/workflows/triple-agent-orchestrator.md" "$AGENT_DIR/triple-agent-orchestrator.md"

# 2. Link AI Workflow Templates (Claude Configs & Manager)
create_symlink "$REPO_DIR/src/templates/claude_glm47_worker.json" "$TEMPLATE_DIR/claude_glm47_worker.json"
create_symlink "$REPO_DIR/src/templates/claude_glm47_qa.json" "$TEMPLATE_DIR/claude_glm47_qa.json"
create_symlink "$REPO_DIR/src/templates/agent_sprint.sh" "$TEMPLATE_DIR/agent_sprint.sh"

# Make sure agent_sprint is executable
chmod +x "$REPO_DIR/src/templates/agent_sprint.sh"

echo ""
echo "🎉 Installation Complete!"
echo "Your OS is now linked to this repository."
