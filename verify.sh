#!/bin/bash
# ==============================================================================
# The Verify Script (Required by /safe-push)
# v2.0 — Updated for prompt .md files + bash syntax check
# ==============================================================================

echo "🔍 Running pre-push verification tests..."
ERRORS=0

# 1. Check legacy JSON configs (kept for reference)
for f in src/templates/claude_glm47_worker.json src/templates/claude_glm47_qa.json; do
    if [ -f "$f" ]; then
        echo "✅ Found legacy config: $f"
    else
        echo "⚠️ Legacy config missing (non-critical): $f"
    fi
done

# 2. Check v2.0 prompt files (CRITICAL)
for f in src/templates/claude_glm47_worker_prompt.md src/templates/claude_glm47_qa_prompt.md; do
    if [ -f "$f" ]; then
        echo "✅ Found prompt file: $f"
    else
        echo "❌ CRITICAL: Prompt file missing: $f"
        ERRORS=$((ERRORS + 1))
    fi
done

# 3. Check manager script
if [ -f "src/templates/agent_sprint.sh" ]; then
    echo "✅ Found agent_sprint.sh"
else
    echo "❌ CRITICAL: agent_sprint.sh is missing."
    ERRORS=$((ERRORS + 1))
fi

# 4. Check GEMINI.md
if [ -f "GEMINI.md" ]; then
    echo "✅ Found GEMINI.md"
else
    echo "❌ CRITICAL: GEMINI.md is missing."
    ERRORS=$((ERRORS + 1))
fi

# 5. Bash syntax check on agent_sprint.sh
echo "🔬 Syntax Checking..."
bash -n src/templates/agent_sprint.sh 2>&1
if [ $? -eq 0 ]; then
    echo "✅ agent_sprint.sh syntax OK"
else
    echo "❌ agent_sprint.sh has syntax errors!"
    ERRORS=$((ERRORS + 1))
fi

# 6. Validate prompt files contain system_configuration tag
for f in src/templates/claude_glm47_worker_prompt.md src/templates/claude_glm47_qa_prompt.md; do
    if [ -f "$f" ] && grep -q "<system_configuration>" "$f"; then
        echo "✅ XML tag validated in $(basename $f)"
    elif [ -f "$f" ]; then
        echo "❌ XML wrapping tag missing in $f"
        ERRORS=$((ERRORS + 1))
    fi
done

# Final verdict
echo ""
if [ $ERRORS -eq 0 ]; then
    echo "✅ Verification Complete! Ready for Safe Push."
    exit 0
else
    echo "❌ Verification FAILED: $ERRORS error(s) found."
    exit 1
fi
