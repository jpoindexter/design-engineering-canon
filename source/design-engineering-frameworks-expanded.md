# Design Engineering — The Missing Canon

Additions to the base list. Organized to slot into the same sections, plus new categories Gemini omitted entirely (foundational usability heuristics, accessibility, performance, prioritization, discovery, motion, software principles, design-system depth, and AI-native patterns).

---

## 1. Additional Core Principles

* **Conservation of Complexity (Tesler's Law):** Every system has irreducible complexity. The only question is who absorbs it — the user or the engineer. Good design engineering pulls complexity *into* the system so the user never sees it.
* **Progressive Disclosure:** Show only what's needed now; reveal advanced options on demand. Defeats Hick's Law without removing capability.
* **Progressive Enhancement / Graceful Degradation:** Build a working baseline (semantic HTML, core flow) that functions everywhere, then layer on enhancement for capable clients. The inverse — degrade gracefully when JS/network/features are missing.
* **Recognition over Recall:** Surface options visibly rather than forcing users to remember them. Menus over command memorization.
* **Optimistic UI:** Update the interface immediately on user action, assuming success, then reconcile with the server. Makes latency invisible.
* **Perceived Performance > Actual Performance:** Skeleton screens, instant feedback, and staged loading often matter more than raw milliseconds.
* **Single Source of Truth:** State, tokens, and content each live in exactly one canonical place and propagate outward. The data-layer version of the token principle.
* **Constraints as a Feature:** Deliberately limiting options (fixed type scale, spacing grid, color ramp) produces consistency and speed. Freedom is the enemy of systems.

---

## 2. Foundational Usability Heuristics (entirely missing)

This is the bedrock layer Gemini skipped.

### Nielsen's 10 Usability Heuristics
1. Visibility of system status
2. Match between system and the real world
3. User control and freedom (undo/escape hatches)
4. Consistency and standards
5. Error prevention
6. Recognition rather than recall
7. Flexibility and efficiency of use (accelerators for experts)
8. Aesthetic and minimalist design
9. Help users recognize, diagnose, and recover from errors
10. Help and documentation

### Don Norman's Principles of Interaction
* **Affordances & Signifiers:** What an object *can* do vs the perceptible cue telling the user it can.
* **Mapping:** Spatial/logical correspondence between controls and their effects (stove knobs → burners).
* **Feedback:** Every action gets a visible, immediate response.
* **Constraints:** Physical, logical, semantic, and cultural limits that prevent error.
* **Conceptual Model:** The user's mental picture must match how the system actually behaves.
* **Gulf of Execution / Gulf of Evaluation:** The gap between intention→action, and between system-state→understanding. Design closes both.

### Dieter Rams — 10 Principles of Good Design
Good design is: innovative, useful, aesthetic, understandable, unobtrusive, honest, long-lasting, thorough to the last detail, environmentally friendly, and *as little design as possible.*

### Krug's Laws (Don't Make Me Think)
* "Don't make me think" — self-evident is the goal.
* It doesn't matter how many clicks, as long as each is mindless.
* Get rid of half the words on each page, then half of what's left.

---

## 3. Additional UX Laws & Cognitive Heuristics

Gemini gave 5 of the ~21 Laws of UX. The rest:

| Law | Principle |
| --- | --- |
| **Doherty Threshold** | System response under **400ms** keeps users in a productive, engaged state. |
| **Goal-Gradient Effect** | Motivation increases as users near a goal — show progress, pre-fill early steps. |
| **Zeigarnik Effect** | People remember incomplete tasks better than completed ones — use progress bars and "unfinished" cues. |
| **Peak-End Rule** | Users judge an experience by its most intense moment and its ending, not the average. |
| **Serial Position Effect** | First and last items in a list are best remembered — place key nav at the ends. |
| **Von Restorff (Isolation) Effect** | The item that differs visually is the one remembered — use for primary CTAs. |
| **Postel's Law (Robustness)** | Be liberal in what you accept (forgiving inputs), conservative in what you send (predictable output). |
| **Parkinson's Law** | Tasks expand to fill the time allowed — impose deadlines and constraints. |
| **Pareto Principle (80/20)** | ~80% of effects come from ~20% of causes — optimize the vital few flows. |
| **Occam's Razor** | Remove elements until breaking point; the simplest solution that works wins. |
| **Flow (Csikszentmihalyi)** | Match challenge to skill to keep users in an absorbed, low-friction state. |
| **Banner Blindness / Selective Attention** | Users ignore anything that looks like an ad or is irrelevant to their goal. |

### Gestalt Principles of Grouping
How the eye assembles individual elements into wholes — the visual logic behind layout.
* **Proximity** — near things are perceived as related.
* **Similarity** — alike things group together.
* **Common Region** — shared container = shared meaning (cards).
* **Continuity** — the eye follows lines and curves.
* **Closure** — the mind completes incomplete shapes.
* **Figure/Ground** — separating subject from background.
* **Common Fate** — things moving together are seen as a unit.
* **Prägnanz (Simplicity)** — we interpret ambiguity in the simplest form.
* **Uniform Connectedness** — visually linked elements (a line, a border) read as connected.

### Cognitive Load Theory
* **Intrinsic** (inherent task difficulty) — reduce by chunking and progressive disclosure.
* **Extraneous** (poor design overhead) — eliminate; this is the designer's job.
* **Germane** (effort building useful mental models) — preserve.

---

## 4. Additional Product & Strategy Frameworks

### Discovery & Validation
* **Jobs To Be Done (JTBD):** Users "hire" a product to make progress in a specific circumstance. Focus on the job, not the demographic. ("When ___, I want to ___, so I can ___.")
* **Continuous Discovery / Opportunity Solution Tree (Teresa Torres):** Outcome → opportunities → solutions → experiments, mapped as a tree. Weekly customer contact, not quarterly research.
* **Lean UX / Build-Measure-Learn:** Hypothesis-driven design; ship the smallest testable thing, measure, iterate.
* **Design Sprint (GV 5-day):** Map → Sketch → Decide → Prototype → Test. Compress months of debate into a week with a validated prototype.
* **Working Backwards (Amazon):** Write the press release and FAQ *before* building. If you can't write a compelling PR, don't build it.
* **Story Mapping:** Arrange user activities horizontally (journey) and details vertically (priority) to slice releases.
* **Crazy 8s:** 8 sketches in 8 minutes — forces divergent ideation past the obvious first idea.

### Prioritization
* **RICE:** (Reach × Impact × Confidence) ÷ Effort. A defensible priority score.
* **Kano Model:** Features map to Basic (expected), Performance (linear satisfaction), and Delighters (exciters). Delighters become Basics over time.
* **MoSCoW:** Must / Should / Could / Won't have.
* **Value vs Effort (2×2):** Quick wins vs big bets vs time-sinks.

### Metrics & Outcomes
* **North Star Framework:** One metric capturing the core value delivered, with input metrics that move it.
* **Google HEART:** Happiness, Engagement, Adoption, Retention, Task success — paired with Goals → Signals → Metrics.
* **AARRR (Pirate Metrics):** Acquisition → Activation → Retention → Referral → Revenue.
* **OKRs:** Objectives (qualitative direction) + Key Results (measurable outcomes). Outcomes, not output.

---

## 5. Additional Engineering & Delivery Frameworks

### Accessibility (a critical omission for a design engineer)
* **WCAG / POUR:** Content must be **P**erceivable, **O**perable, **U**nderstandable, **R**obust. Target AA conformance.
* **Semantic HTML first, ARIA second:** Native elements carry built-in accessibility; ARIA patches only what HTML can't express. "No ARIA is better than bad ARIA."
* **Keyboard & Focus Management:** Full keyboard operability, visible focus rings, logical tab order, focus traps in modals, restored focus on close.
* **Inclusive Design:** Designing for permanent, temporary, and situational constraints (one-armed, broken-armed, holding-a-baby).

### Performance
* **Core Web Vitals:** **LCP** (loading, largest contentful paint), **INP** (interactivity — replaced FID in 2024), **CLS** (visual stability, layout shift).
* **RAIL Model:** Response (<100ms), Animation (60fps / ~16ms frames), Idle (chunk work), Load (interactive fast). Performance budgets keyed to human perception thresholds.

### Rendering & Architecture
* **Rendering Strategies:** CSR, SSR, SSG, ISR, streaming SSR, and React Server Components — chosen per route by data freshness and interactivity needs.
* **State Colocation & Derived State:** Keep state as close to where it's used as possible; derive rather than duplicate. Server state (cache) vs client state (UI) are different problems.
* **Suspense & Error Boundaries:** Declarative loading and failure states as first-class architecture, not afterthoughts.

### CSS / Styling Architecture
* **Methodologies:** BEM, ITCSS, and CUBE CSS for scaling stylesheets (when not on a utility-first system).
* **Fluid & Responsive:** Mobile-first, `clamp()` for fluid type/space, **container queries** for component-level responsiveness (vs viewport-only media queries).

### Motion & Animation
* **12 Principles of Animation (Disney → UI):** Especially easing, anticipation, follow-through, and staging applied to interface transitions.
* **Easing & Spring Physics:** Natural motion uses ease-out for entrances, ease-in for exits; spring-based motion (stiffness/damping) reads more physical than fixed-duration curves.
* **FLIP Technique:** First, Last, Invert, Play — performant layout animations by animating transforms, not layout-triggering properties.
* **Motion as Feedback:** Animation should communicate state change and spatial relationships, never decorate.

### Software Principles (the engineering half)
* **SOLID:** Single responsibility, Open/closed, Liskov substitution, Interface segregation, Dependency inversion.
* **DRY / KISS / YAGNI:** Don't repeat yourself; keep it simple; you aren't gonna need it.
* **Conway's Law:** Systems mirror the communication structure of the org that builds them — team topology *is* an architecture decision.
* **Principle of Least Astonishment:** Components should behave the way their name and appearance imply.

### Quality & Testing
* **Visual Regression Testing:** Snapshot diffing (Chromatic, Percy) to catch unintended UI changes.
* **Testing Trophy (Kent C. Dodds):** Favor integration tests over the classic pyramid for UI — test behavior users experience, not implementation.

---

## 6. Design System Depth (beyond "tokens are data")

* **Three-Tier Token Architecture:**
  1. **Primitive / Global** — raw values (`blue-500`, `space-4`).
  2. **Semantic / Alias** — intent-mapped (`color-action-primary`, `space-inset-md`).
  3. **Component-Specific** — scoped (`button-bg-hover`). Components only ever consume semantic/component tiers, never primitives.
* **W3C DTCG Format & Tooling:** Design Tokens Community Group spec; Style Dictionary and Tokens Studio to transform one source into CSS/iOS/Android/JSON.
* **Scales as Systems:** 4pt/8pt spacing grid, modular type scale (e.g. 1.25 ratio), constrained color ramps. Decisions become lookups.
* **Component API Design:** Props as the contract; variants, sizes, and states as enumerable options; **compound components** and **slots** for composition; sensible defaults so the easy thing is the right thing.
* **Headless / Unstyled Primitives:** Radix, React Aria, Ark — accessibility and behavior solved in the primitive, styling left to the system. The modern foundation for design-system components.
* **Documentation as Product:** Storybook for live component docs; usage guidelines, do/don't, and props tables treated as part of the deliverable.
* **Governance & Versioning:** Contribution models, semver for breaking changes, deprecation paths, adoption metrics.

---

## 7. AI-Native Design Engineering (the new layer)

Largely absent from the canon Gemini drew on, increasingly central to the role.

* **Generative / Adaptive UI:** Interfaces assembled or personalized at runtime by a model rather than fully predetermined.
* **Streaming as Interaction:** Token-by-token output, partial results, and stop/regenerate controls become core interaction patterns, not edge cases.
* **Prompt-as-Interface:** Natural language as an input modality alongside (not replacing) direct manipulation — with affordances that teach users what the system can do.
* **Human-in-the-Loop / Agentic UX:** Designing review, approval, correction, and undo around autonomous actions; surfacing confidence and provenance.
* **Eval-Driven Development:** Treating model behavior like a testable surface — eval sets and regression checks for AI features, analogous to visual regression for UI.
* **Designing for Uncertainty:** Probabilistic outputs need graceful failure, transparent limitations, and easy escape hatches. The system will be wrong; the UX plans for it.
* **Latency & Cost as Design Constraints:** Model choice, caching, and streaming are UX decisions, not just infra ones.
