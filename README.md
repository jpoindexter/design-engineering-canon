# Design Engineering Canon

**21 agent-agnostic skills** encoding the foundational canon of design engineering — usability heuristics, UX laws, product strategy, accessibility, performance, motion, software principles, design-system depth, and AI-native patterns — plus a routing dispatcher.

Each skill is a portable `SKILL.md` (YAML frontmatter + markdown body) — the de-facto format read by Claude Code, GitHub Copilot CLI, Gemini CLI, and Codex. Install once; the skills auto-activate whenever a design or engineering task matches.

## Why

LLM agents design and build interfaces from a thin, uneven slice of this knowledge. This canon makes the *whole* bedrock — Nielsen, Norman, Rams, Gestalt, the Laws of UX, JTBD, WCAG/POUR, Core Web Vitals, SOLID, three-tier tokens, agentic UX — available as always-on context, so the agent reasons from named principles instead of vibes.

## The `/dec` dispatcher

`dec` routes a task to 2–4 of the 20 canon skills instead of loading all of them — a routing table built from observed usage (build a UI → accessibility + core-principles + cognitive-load + css-architecture; review → nielsen-heuristics + accessibility + norman-principles; ship/defer → prioritization-frameworks + product-metrics + core-principles; and so on). `/dec full` runs the full canon sweep for major audits.

```
/dec                    # route the active work to the right 2-4 skills
/dec review this screen # explicit target
/dec full                # rare — full canon sweep
```

## The skills

| Vertical | Skill |
| --- | --- |
| **Dispatcher** | `dec` |
| **Principles & heuristics** | `dec-core-principles` · `dec-nielsen-heuristics` · `dec-norman-principles` · `dec-rams-principles` · `dec-krug-laws` · `dec-ux-laws` · `dec-gestalt-principles` · `dec-cognitive-load` |
| **Product & strategy** | `dec-discovery-validation` · `dec-prioritization-frameworks` · `dec-product-metrics` |
| **Engineering & delivery** | `dec-accessibility` · `dec-web-performance` · `dec-rendering-architecture` · `dec-css-architecture` · `dec-motion-animation` · `dec-software-principles` · `dec-quality-testing` |
| **Systems & AI** | `dec-design-system-depth` · `dec-ai-native-patterns` |

Each lives at `skills/<name>/SKILL.md`. The full source canon is in [`source/`](./source).

## Install

### Any agent (manual)

Copy the `skills/dec-*` folders (plus `skills/dec`, the dispatcher) into wherever your agent discovers skills:

| Agent | Skills directory |
| --- | --- |
| Claude Code | `~/.claude/skills/` |
| Copilot CLI | plugin/skills dir per its docs |
| Gemini CLI | skills dir per its docs |
| Codex / other | point your agent's context loader at `skills/` or `AGENTS.md` |

[`AGENTS.md`](./AGENTS.md) is the cross-agent always-on directive — drop its contents into your agent's root instruction file (`AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.cursorrules`, …) to make the canon fire on every design task.

### Claude Code (global, automatic)

```bash
./install.sh
```

Copies all 21 skills to `~/.claude/skills/` and registers them as always-on in `~/.claude/CLAUDE.md`. Idempotent — safe to re-run after `git pull`. Uninstall: `./install.sh --uninstall`.

## Format

```markdown
---
name: dec-<vertical>
description: <what it covers> — use when <trigger>.
tags: [...]
---
# Title
<principle list + How to apply>
```

The `description` drives auto-activation: agents load the skill when a task matches it.

## License

MIT — see [LICENSE](./LICENSE). Source canon authored by Jason Poindexter.
