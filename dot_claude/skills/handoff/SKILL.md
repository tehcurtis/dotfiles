---
name: handoff
description: Hand off an approved implementation plan to the Sonnet implementer subagent, then review its work. Use after a plan is approved in plan mode, when the user wants implementation delegated (e.g. "hand this off", "have sonnet implement this", "/handoff").
---

# Handoff: delegate an approved plan to the implementer

You are the planner. Use this skill after a plan has been approved to
delegate the mechanical implementation to the Sonnet-pinned `implementer`
subagent, then review its work before it's considered done.

## 1. Pre-flight gate

Before handing off, check the plan itself:

- It names concrete files to change (not just areas of the codebase).
- It includes verification steps (tests, lint, manual checks) to run.
- It contains no unresolved questions, open decisions, or "TBD"s.

If any of these are missing, fix the plan first. A vague brief produces
improvisation downstream, which defeats the point of delegating.

## 2. Assemble a self-contained brief

The implementer subagent starts with zero context from this conversation.
Inline everything the plan implicitly assumes:

- Absolute file paths for every file to touch.
- Relevant code snippets or exact current contents where helpful.
- Decisions made in conversation that never made it into the written plan.
- Constraints (style, scope boundaries, things not to touch).
- The target git branch.
- Commit message conventions, if the subagent should commit.
- The verification steps to run.

Rule of thumb: if the brief mentions something that was discussed but not
written down, write it down now.

## 3. Launch

Spawn the `implementer` agent (it is pinned to Sonnet) with the brief.

- Run it synchronously for short tasks so you can review the result
  immediately.
- Run it in the background for long tasks and continue other work.
- If the plan has genuinely independent workstreams, multiple implementer
  agents may run in parallel — but default to a single agent per handoff.

## 4. Review loop

When the implementer reports back:

- Review the actual diff (`git diff`), not just its summary — the report
  describes intent, not necessarily what happened.
- Run or check the verification steps yourself; don't take "tests passed"
  on faith.
- If fixes are needed, send the request to the SAME agent (via SendMessage)
  so it keeps its context, rather than respawning a fresh one.
- Iterate until the diff matches the plan and verification passes.

## 5. Close out

Summarize the outcome to the user in your own words — what changed and what
was verified. Commit and push only as the plan or the user directs.
