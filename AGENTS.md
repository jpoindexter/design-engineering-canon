# AGENTS.md — Design Engineering Canon (always-on)

Cross-agent instruction file. Drop these contents into your agent's root instruction file
(`AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `.cursorrules`, Copilot instructions, etc.) so the
canon applies to every design/engineering task without being asked.

## Always-on directive

When a task touches **anything design- or frontend-engineering-related** — a screen, component,
layout, color, type, motion, copy, flow, accessibility, performance, product scoping, design-system
work, or an AI/LLM-powered interface — consult and apply the relevant Design Engineering Canon
skills **before and while** doing the work. Reason from the named principles below, don't eyeball it.

Prefer routing through `dec` over hand-picking: it loads 2–4 skills per task from an
evidence-based routing table instead of the whole canon.

| Vertical | Skill | Fires when |
| --- | --- | --- |
| Core principles | `dec-core-principles` | deciding where complexity lives, what to reveal, where truth lives |
| Usability heuristics | `dec-nielsen-heuristics` | evaluating/reviewing any interface |
| Interaction | `dec-norman-principles` | a control isn't obvious; mental-model mismatch |
| Taste & restraint | `dec-rams-principles` | judging design quality; defending restraint |
| Clarity | `dec-krug-laws` | copy density, navigation, cognitive friction |
| UX laws | `dec-ux-laws` | justifying a UX decision; progress, CTAs, response budgets |
| Visual grouping | `dec-gestalt-principles` | layout; what reads as related |
| Mental effort | `dec-cognitive-load` | a screen feels overwhelming; what to simplify |
| Discovery | `dec-discovery-validation` | scoping what to build; validating before committing |
| Prioritization | `dec-prioritization-frameworks` | ranking a backlog; v0 vs later |
| Metrics | `dec-product-metrics` | defining success; what to optimize |
| Accessibility | `dec-accessibility` | any interactive UI; ARIA, keyboard, focus |
| Performance | `dec-web-performance` | budgets; slow/janky pages |
| Rendering | `dec-rendering-architecture` | rendering strategy; state placement |
| CSS | `dec-css-architecture` | stylesheet scale; responsive technique |
| Motion | `dec-motion-animation` | animating a transition; easing/duration |
| Software | `dec-software-principles` | code structure; resisting over-abstraction |
| Testing | `dec-quality-testing` | what kind of tests for UI |
| Design systems | `dec-design-system-depth` | tokens, component APIs, governance |
| AI-native | `dec-ai-native-patterns` | any AI/LLM-powered or agentic interface |

**Rule:** match the skill(s) to the task and apply them. Name which you applied. This is conditional-
always-on — it fires on design/engineering work, not on unrelated backend/infra tasks.
