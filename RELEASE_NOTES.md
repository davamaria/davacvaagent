# Release Notes

## v0.9 - 2026-03-20

Added a source-controlled Azure landing-zone delivery package and aligned the repository metadata to a release-linked workflow.

### What changed

- Added [delivery/README.md](/Users/stu2/Projects/dava-cva-agent/delivery/README.md) to define the new source-controlled delivery area.
- Added [delivery/azure-landing-zone/README.md](/Users/stu2/Projects/dava-cva-agent/delivery/azure-landing-zone/README.md) with the rationale for using Azure Bicep and guidance for deploying the package.
- Added [delivery/azure-landing-zone/blueprint.md](/Users/stu2/Projects/dava-cva-agent/delivery/azure-landing-zone/blueprint.md) describing the landing-zone architecture, scope, sequencing, and extension points.
- Added [delivery/azure-landing-zone/bicep/main.bicep](/Users/stu2/Projects/dava-cva-agent/delivery/azure-landing-zone/bicep/main.bicep) as the subscription-scope entry point for the Azure blueprint.
- Added modular Bicep components under [delivery/azure-landing-zone/bicep/modules](/Users/stu2/Projects/dava-cva-agent/delivery/azure-landing-zone/bicep/modules) for resource groups, hub networking, observability, security baseline, and private DNS.
- Added example parameter files under [delivery/azure-landing-zone/bicep/parameters](/Users/stu2/Projects/dava-cva-agent/delivery/azure-landing-zone/bicep/parameters) for `dev` and `prod`.
- Updated [README.md](/Users/stu2/Projects/dava-cva-agent/README.md) to `v0.9` and added direct links for every release entry in this file.
- Updated [\.gitignore](/Users/stu2/Projects/dava-cva-agent/.gitignore) to ignore Python cache artifacts.

### Changed summary

This release introduces a properly structured delivery-code area for Azure landing-zone work, chooses Bicep as the provider-native IaC for that scenario, and standardizes release tracking by linking every README release entry back to its detailed release note.

## v0.8 - 2026-03-19

Generated the first `Blind IT plc` template-based client outputs for the Azure transformation scenario.

### What changed

- Added [deliverables/blind-it-plc-migration-roadmap.docx](/Users/stu2/Projects/dava-cva-agent/deliverables/blind-it-plc-migration-roadmap.docx) with a phased Azure transformation roadmap for 600 internal banking VMs.
- Added [deliverables/blind-it-plc-landing-zone-target-architecture.docx](/Users/stu2/Projects/dava-cva-agent/deliverables/blind-it-plc-landing-zone-target-architecture.docx) with the Azure target-state landing-zone architecture.
- Added [deliverables/blind-it-plc-executive-summary.pptx](/Users/stu2/Projects/dava-cva-agent/deliverables/blind-it-plc-executive-summary.pptx) with a presentation-ready executive summary.

### Changed summary

This release adds a second client example using the template-first output model, producing Word and PowerPoint deliverables for a mixed .NET, WebSphere, and SQL banking migration scenario.

## v0.7 - 2026-03-19

Added reusable template-rendering support for client outputs and introduced a clickable prompt template in the README.

### What changed

- Added [scripts/render_endava_docx.py](/Users/stu2/Projects/dava-cva-agent/scripts/render_endava_docx.py) for generating client-facing `.docx` files from the Endava Word template without extra document libraries.
- Added [scripts/render_endava_pptx.py](/Users/stu2/Projects/dava-cva-agent/scripts/render_endava_pptx.py) for generating client-facing `.pptx` files from the Endava PowerPoint template without extra presentation libraries.
- Added [prompts/templates/dave-cloud-pod-advisor-prompt-template.md](/Users/stu2/Projects/dava-cva-agent/prompts/templates/dave-cloud-pod-advisor-prompt-template.md) as a reusable prompt format for users.
- Updated [README.md](/Users/stu2/Projects/dava-cva-agent/README.md) to `v0.7` and linked the prompt template directly from the usage section.
- Recreated [deliverables/output-selection-checklist.md](/Users/stu2/Projects/dava-cva-agent/deliverables/output-selection-checklist.md) after the earlier deliverables cleanup.

### Changed summary

This release adds the plumbing needed to regenerate client-facing `.docx` and `.pptx` outputs from the provided Endava templates and gives users a clickable prompt format in the README to drive better agent requests.

## v0.6 - 2026-03-19

Switched the agent to use the provided Endava Word and PowerPoint templates as the default basis for client-facing outputs instead of Markdown deliverables.

### What changed

- Added [templates/README.md](/Users/stu2/Projects/dava-cva-agent/templates/README.md) documenting the default `.docx` and `.pptx` templates.
- Updated [skills/dave-cloud-pod-advisor/SKILL.md](/Users/stu2/Projects/dava-cva-agent/skills/dave-cloud-pod-advisor/SKILL.md) so the agent prefers template-based `.docx` and `.pptx` outputs over Markdown for client-facing deliverables.
- Updated [deliverables/output-selection-checklist.md](/Users/stu2/Projects/dava-cva-agent/deliverables/output-selection-checklist.md) to map standard deliverables to Word and PowerPoint outputs.
- Updated [deliverables/README.md](/Users/stu2/Projects/dava-cva-agent/deliverables/README.md) to document the new template-first output convention.
- Updated [README.md](/Users/stu2/Projects/dava-cva-agent/README.md) to `v0.6` and documented the client output template rules.

### Changed summary

This release changes the default output model from Markdown-first to template-first, using the provided Endava `.docx` and `.pptx` files as the standard basis for client-facing deliverables.

## v0.5 - 2026-03-19

Added a deliverable-selection checklist feature so Dave can generate either the full client output set or only selected deliverables.

### What changed

- Added [deliverables/output-selection-checklist.md](/Users/stu2/Projects/dava-cva-agent/deliverables/output-selection-checklist.md) with checkbox-driven selection for standard client outputs.
- Updated [deliverables/README.md](/Users/stu2/Projects/dava-cva-agent/deliverables/README.md) to document the selection workflow.
- Updated [skills/dave-cloud-pod-advisor/SKILL.md](/Users/stu2/Projects/dava-cva-agent/skills/dave-cloud-pod-advisor/SKILL.md) so the agent respects the checklist when generating deliverables.
- Updated [README.md](/Users/stu2/Projects/dava-cva-agent/README.md) to `v0.5` and documented how to use the checklist feature.

### Changed summary

This release adds a practical selection mechanism for delivery outputs, allowing users to generate all standard deliverables or only the specific files they want for a client engagement.

## v0.4 - 2026-03-19

Created the first client delivery outputs for the Enshite plc Azure migration test scenario.

### What changed

- Added [deliverables/enshite-plc-migration-roadmap.md](/Users/stu2/Projects/dava-cva-agent/deliverables/enshite-plc-migration-roadmap.md) with a phased Azure migration roadmap for 600 internal banking VMs.
- Added [deliverables/enshite-plc-landing-zone-target-architecture.md](/Users/stu2/Projects/dava-cva-agent/deliverables/enshite-plc-landing-zone-target-architecture.md) with the target landing-zone architecture and governance model.
- Added [deliverables/enshite-plc-wave-plan.md](/Users/stu2/Projects/dava-cva-agent/deliverables/enshite-plc-wave-plan.md) with an initial migration wave structure and readiness criteria.

### Changed summary

This release turns the Enshite plc test prompt into reusable client-prefixed deliverables that can be used as working outputs for migration planning and further refinement.

## v0.3 - 2026-03-19

Updated the Dave Cloud Pod Advisor banner to a new ASCII design and applied it consistently to the README and agent behavior.

### What changed

- Added the new ASCII banner to the top of [README.md](/Users/stu2/Projects/dava-cva-agent/README.md).
- Updated [README.md](/Users/stu2/Projects/dava-cva-agent/README.md) to `v0.3`.
- Updated [skills/dave-cloud-pod-advisor/SKILL.md](/Users/stu2/Projects/dava-cva-agent/skills/dave-cloud-pod-advisor/SKILL.md) so the agent prints the new banner at the start of every user-facing response.

### Changed summary

This release standardizes the visible Dave Cloud Pod Advisor branding with a new banner and ensures both the repository documentation and the runtime agent output use the same ASCII header.

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
