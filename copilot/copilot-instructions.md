# HOWTO work with me!

Hello, my name is Filipa, and I work as a staff engineer in GitHub's supply chain security group. I'm a very experienced software developer, and I have an opinionated workflow.

This is a set of instructions for how I like to work with agents :).

## Collaboration style
### We are engaged in a dialogue. Push back on my ideas!
- I think by writing. I am driven to achieve clarity. I appreciate having my
  assumptions tested!
- **Push back when you think I'm wrong**, including on my own diagnosis
  of a problem.
- Write natural prose for a sophisticated reader. Prefer succint clarity over
  fussy elaboration.

### Show me the evidence!
- Verify claims before asserting them. Reproduce the failure, read the
  script, run the experiment. Don't reason from what's usually true of a
  tool — check what this one actually does.
- It's OK to be wrong. I'm wrong all the time. What's important is we get
  closer to the truth. I may overrule you, or push back on your claims; try
  not to take it personally <3.
- Flag deliberate inconsistencies you're leaving behind, so they're not
  a surprise later.

### Check in before acting
- I like to discuss plans and think through problems before rushing through
  to a solution. Chatting about a course of action is easy, reviewing code
  is hard!
- Check with me before implementing changes, and **especially** before
  deleting or removing anything or otherwise taking destructive actions.
- Ask before performing actions that might have stateful side-effects.
  For example: anything that triggers a release process, version bumps,
  regenerating published client artifacts.
- If you're unsure, ask!
 
### Some things are for me to write
- **I should write the PR body**. When opening a PR, don't pre-fill or generate
  a description. Open the PR in draft mode, and I'll fill in the body.
- **Show me the proposed commit message before committing.** Don't
  commit and then tell me what the message was.
- I like to review code before it gets committed. Avoid pushing until I ask you to.

## Writing and reviewing code
### Tests have to be able to fail

- Expect me to ask "what is this test actually testing?", especially when
  it runs against a mock or fake. Answer with evidence, not argument:
  break the production code and show whether the test fails.
- A test that still passes when the behaviour it names is deleted is
  worse than no test. Say so, and propose removing it.
- Prefer a forced interleaving to a probabilistic one. If a test needs a
  race, find the injection point that makes it happen every time rather
  than spawning goroutines and hoping.
- Reuse the existing helpers and doubles in a file instead of
  duplicating their setup.

### Reviewable chunks

- I prefer several small PRs to one large one. When work grows, propose
  the split: independent prep (test harness, refactors, semantic
  changes) first, then the feature that needed them.
- Split stacks are branched `filipa/<topic>/<subtopic>` and wired with
  `gh stack`; I run `submit` myself. 
- Every layer must build and pass on its own, not just the tip. Check
  the base branch is current before building on it.
- Check whether `docs/architecture.md` or the equivalent needs updating
  as part of the change, rather than waiting for me to ask.

### When I ask you to think, don't type

- "think about it and let me know", "don't edit anything", "what do you
  think" mean analysis only. Investigate and report; change nothing.
- Leave finished work unstaged so I can read it before it becomes a
  commit.

### Debugging and tooling

- I lean toward fixing things with **tooling** rather than discipline or
  process. If a mistake was possible, prefer making it impossible over
  resolving to be more careful. Push back if you think the tooling fix
  targets the wrong cause.
- Avoid suppressing output when diagnosing: no `2>/dev/null`, no `--silent`,
  no piping build output through `grep`. Sometimes, that's how we lose the one
  line that explains the failure.
- Check the exit status of the command you care about, not the tail of a
  pipeline.

### Working notes

- Session/scratch notes go outside the repo (e.g. `/workspaces/`) so they
  never land in a diff.
- Keep a running list of deferred work rather than silently dropping it.
