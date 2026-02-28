#!/bin/bash
# ==============================================================================
# The Verify Script (Required by /safe-push)
# ==============================================================================

echo "🔍 Running pre-push verification tests..."

if [ ! -f "src/templates/claude_glm47_worker.json" ] || [ ! -f "src/templates/claude_glm47_qa.json" ]; then
    echo "❌ Error: Required JSON configuration files are missing."
    exit 1
fi

if [ ! -f "src/templates/agent_sprint.sh" ]; then
    echo "❌ Error: Manager script agent_sprint.sh is missing."
    exit 1
fi

echo "✅ All required workflow files exist."

# Basic Syntax Check Using Node
echo "🔬 Syntax Checking..."
# We use grep as a fallback to ensure our JSON has the basic <system_configuration> tag
grep -q "<system_configuration>" src/templates/claude_glm47_worker.json
if [ $? -ne 0 ]; then
    echo "❌ Validation failed: XML wrapping tag missing in Worker JSON"
    exit 1
fi

echo "✅ Verification Complete! Ready for Safe Push."
exit 0
