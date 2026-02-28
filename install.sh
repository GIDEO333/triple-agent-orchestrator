#!/bin/bash
echo "🚀 Installing Triple Agent Orchestrator..."

# Directories
AGENT_DIR="$HOME/.agent/workflows"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Create target directories if they don't exist
mkdir -p "$AGENT_DIR"
mkdir -p "$HOME/.gemini"

# Function to safely create symlink (replaces if exists)
create_symlink() {
    src="$1"
    dest="$2"
    
    # Remove existing file/symlink if it exists
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        rm "$dest"
        echo "  Removed existing $dest"
    fi
    
    ln -s "$src" "$dest"
    echo "✅ Linked: $(basename "$src") -> $dest"
}

# 1. Link Anti-gravity Workflows
echo ""
echo "📎 Linking Anti-gravity Workflows..."
create_symlink "$REPO_DIR/src/workflows/architect-planning.md" "$AGENT_DIR/architect-planning.md"
create_symlink "$REPO_DIR/src/workflows/triple-agent-orchestrator.md" "$AGENT_DIR/triple-agent-orchestrator.md"

# 2. Link GEMINI.md to ~/.gemini/
echo ""
echo "📎 Linking GEMINI.md..."
create_symlink "$REPO_DIR/GEMINI.md" "$HOME/.gemini/GEMINI.md"

# 3. Link agent-sprint command to /usr/local/bin (global PATH access)
echo ""
echo "📎 Linking agent-sprint command..."
chmod +x "$REPO_DIR/src/templates/agent_sprint.sh"
create_symlink "$REPO_DIR/src/templates/agent_sprint.sh" "/usr/local/bin/agent-sprint"

echo ""
echo "🎉 Installation Complete!"
echo ""
echo "Your ecosystem is now linked:"
echo "  • ~/.gemini/GEMINI.md          → repo GEMINI.md"
echo "  • ~/.agent/workflows/          → repo workflows"
echo "  • agent-sprint (global cmd)    → repo agent_sprint.sh"
echo ""
echo "Usage: cd your-project/ && agent-sprint"
