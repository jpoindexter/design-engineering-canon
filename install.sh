#!/usr/bin/env bash
# Install the Design Engineering Canon skills for SKILL.md-aware agents.
# Copies skills/dec-* into each agent's skills dir and registers an always-on
# directive block in its root instruction file (where one exists).
#
#   ./install.sh [target ...]              install (default target: claude)
#   ./install.sh all                       install for claude, codex, and cursor
#   ./install.sh --uninstall [target ...]  remove skills + managed block
#
# Idempotent. Targets: claude | codex | cursor | all
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/skills"
BEGIN="<!-- BEGIN design-engineering-canon (managed by install.sh) -->"
END="<!-- END design-engineering-canon -->"

skills() { find "$SKILLS_SRC" -mindepth 1 -maxdepth 1 -type d \( -name 'dec-*' -o -name 'dec' \) -exec basename {} \; | sort; }

# target -> "skills_dir|instruction_file"   (instruction_file empty = no rules file to edit)
target_paths() {
  case "$1" in
    claude) echo "$HOME/.claude/skills|$HOME/.claude/CLAUDE.md" ;;
    codex)  echo "$HOME/.codex/skills|$HOME/.codex/AGENTS.md" ;;
    cursor) echo "$HOME/.cursor/skills-cursor|" ;;
    *) echo "unknown target: $1" >&2; return 1 ;;
  esac
}

strip_block() { # $1 = instruction file
  [ -n "$1" ] && [ -f "$1" ] || return 0
  awk -v b="$BEGIN" -v e="$END" '
    $0==b {skip=1} skip && $0==e {skip=0; next} !skip' "$1" > "$1.tmp"
  mv "$1.tmp" "$1"
}

append_block() { # $1 = instruction file
  [ -n "$1" ] || return 0
  mkdir -p "$(dirname "$1")"; touch "$1"
  strip_block "$1"
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
  } >> "$1"
}

do_install() { # $1 = target
  local dst instr; IFS='|' read -r dst instr <<<"$(target_paths "$1")"
  mkdir -p "$dst"
  local n=0
  for s in $(skills); do rm -rf "${dst:?}/$s"; cp -R "$SKILLS_SRC/$s" "$dst/$s"; n=$((n+1)); done
  append_block "$instr"
  printf '[%s] installed %d skills -> %s%s\n' "$1" "$n" "$dst" \
    "${instr:+; registered block in $instr}"
}

do_uninstall() { # $1 = target
  local dst instr; IFS='|' read -r dst instr <<<"$(target_paths "$1")"
  for s in $(skills); do rm -rf "${dst:?}/$s"; done
  strip_block "$instr"
  printf '[%s] uninstalled (skills removed%s)\n' "$1" "${instr:+; block stripped}"
}

# --- arg parsing ---
MODE=install; TARGETS=()
for a in "$@"; do
  case "$a" in
    --uninstall|-u) MODE=uninstall ;;
    --install)      MODE=install ;;
    all)            TARGETS=(claude codex cursor) ;;
    claude|codex|cursor) TARGETS+=("$a") ;;
    *) echo "usage: $0 [--uninstall] [claude|codex|cursor|all ...]" >&2; exit 2 ;;
  esac
done
[ ${#TARGETS[@]} -eq 0 ] && TARGETS=(claude)

for t in "${TARGETS[@]}"; do "do_$MODE" "$t"; done
[ "$MODE" = install ] && echo "Start a new agent session to pick up the skills."
