#!/usr/bin/env bash
# Install the Design Engineering Canon skills globally for Claude Code.
# Copies skills/dec-* into ~/.claude/skills and registers them always-on in ~/.claude/CLAUDE.md.
# Idempotent. Uninstall with: ./install.sh --uninstall
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/skills"
CLAUDE_DIR="${CLAUDE_HOME:-$HOME/.claude}"
SKILLS_DST="$CLAUDE_DIR/skills"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
BEGIN="<!-- BEGIN design-engineering-canon (managed by install.sh) -->"
END="<!-- END design-engineering-canon -->"

skills() { find "$SKILLS_SRC" -mindepth 1 -maxdepth 1 -type d -name 'dec-*' -exec basename {} \; | sort; }

strip_block() {
  # Remove the managed block from CLAUDE.md if present (portable awk, no in-place sed).
  [ -f "$CLAUDE_MD" ] || return 0
  awk -v b="$BEGIN" -v e="$END" '
    $0==b {skip=1} skip && $0==e {skip=0; next} !skip' "$CLAUDE_MD" > "$CLAUDE_MD.tmp"
  mv "$CLAUDE_MD.tmp" "$CLAUDE_MD"
}

uninstall() {
  for s in $(skills); do rm -rf "${SKILLS_DST:?}/$s"; done
  strip_block
  echo "Uninstalled Design Engineering Canon (skills removed, CLAUDE.md block stripped)."
}

install() {
  mkdir -p "$SKILLS_DST" "$CLAUDE_DIR"
  local n=0
  for s in $(skills); do
    rm -rf "${SKILLS_DST:?}/$s"
    cp -R "$SKILLS_SRC/$s" "$SKILLS_DST/$s"
    n=$((n+1))
  done

  # Rewrite the managed always-on block (strip old, append fresh) so re-runs stay clean.
  strip_block
  {
    printf '\n%s\n' "$BEGIN"
    echo "## Design Engineering Canon — always on"
    echo
    echo "On ANY design or frontend-engineering task (screen, component, layout, color, type, motion,"
    echo "copy, flow, accessibility, performance, product scoping, design-system, or AI/LLM interface),"
    echo "apply the matching \`dec-*\` skill(s) before and while working. Reason from named principles,"
    echo "don't eyeball it. Name which you applied. Conditional-always-on — fires on design/eng work only."
    echo
    for s in $(skills); do echo "- \`$s\`"; done
    printf '%s\n' "$END"
  } >> "$CLAUDE_MD"

  echo "Installed $n skills to $SKILLS_DST"
  echo "Registered always-on block in $CLAUDE_MD"
  echo "Start a new Claude Code session to pick them up."
}

case "${1:-}" in
  --uninstall|-u) uninstall ;;
  ""|--install)   install ;;
  *) echo "usage: $0 [--install|--uninstall]" >&2; exit 2 ;;
esac
