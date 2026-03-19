# Release Notes

## v0.2 - 2026-03-19

Expanded the Dave Cloud Pod Advisor package to document and register the additional installed specialist skills now available in the repository.

### What changed

- Updated the main advisor extension registry in [skills/dave-cloud-pod-advisor/references/custom-skill-imports.md](/Users/stu2/Projects/dava-cva-agent/skills/dave-cloud-pod-advisor/references/custom-skill-imports.md) to include the installed AWS, Azure, platform, architecture, modernization, enterprise, and document-output skills.
- Updated [README.md](/Users/stu2/Projects/dava-cva-agent/README.md) to `v0.2`.
- Added README guidance for using the full `skills/` directory, not just the two base skills.
- Added a detailed catalog of the installed skills Dave can use.
- Added concrete prompt examples for invoking Dave, provider-specific specialists, architecture specialists, and output-format skills.
- Added notes about selective specialist invocation and network-backed Azure documentation skills.

### Changed summary

This release turns the repository from a two-skill starter package into a documented multi-skill advisory toolkit, with the main Dave advisor now explicitly wired to the installed specialist skills and with clear usage examples for each category.

## v0.1 - 2026-03-19

Initial release of the Endava-branded Dave Cloud Pod Advisor Codex CLI package.

### What changed

- Added the primary `dave-cloud-pod-advisor` skill for Endava cloud advisory work across platform engineering, cloud foundations, modernization, governance, and enterprise migration planning.
- Added the `endava-cloud-case-study-finder` skill to search local Endava knowledge sources for case studies and delivery precedents that can strengthen recommendations.
- Added Endava-branded agent metadata and icons for both skills.
- Added a custom skill import mechanism so future cloud advisory skills can be layered into the main advisor workflow.
- Added a starter template for future custom cloud advisory skills.
- Added knowledge-base placeholder folders for `knowledge-base/`, `case-studies/`, `notes/`, and `exports/`.
- Added a full usage and installation guide in the project README for Codex CLI users.

### Changed summary

This release establishes the initial agent package, the supporting case-study lookup skill, the extension path for future cloud advisory skills, and the repository documentation needed to run the agent in Codex CLI.

### Notes for future releases

- Every future version should add a new top-level section to this file.
- Each release entry should include:
  - version and date
  - what changed
  - changed summary
