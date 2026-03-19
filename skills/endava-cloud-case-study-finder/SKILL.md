---
name: endava-cloud-case-study-finder
description: Search Endava knowledge sources for cloud case studies, delivery examples, migration precedents, platform engineering references, and transformation proof points to support advisory answers. Use when the user asks for examples, case studies, comparable client situations, or Endava-backed evidence. Also use before finalizing major cloud recommendations from Dave Cloud Pod Advisor.
---

# Endava Cloud Case Study Finder

Use this skill to ground recommendations in Endava precedent.

## Search workflow

1. Check local knowledge sources first:
   - `knowledge-base/`
   - `case-studies/`
   - exported notes or markdown files in this workspace
2. Read [source-priority.md](references/source-priority.md) to follow the preferred lookup order.
3. Search for terms matching:
   - client industry
   - cloud provider
   - platform engineering pattern
   - migration type
   - regulatory constraints
   - scale indicators
4. Summarize the best matches using this structure:
   - context
   - challenge
   - approach
   - outcome
   - why it is relevant now
5. Hand back no more than three examples unless the user asks for a broader survey.

## If no knowledge base is available

- State that no local or connected Endava case-study source was found.
- Provide search terms or folders that should be added later.
- Return control to the calling skill so it can continue with expert guidance and a clear evidence gap.

## Evidence handling

- Prefer concrete delivery patterns over marketing-style claims.
- Avoid inventing client names, scale figures, savings, or outcomes.
- When the source is partial, label the inference clearly.

## Reference files

- Read [source-priority.md](references/source-priority.md) before searching.
- Read [summary-template.md](references/summary-template.md) when formatting the final evidence block.
