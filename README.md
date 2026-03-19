# Dave Cloud Pod Advisor

An Endava-branded Codex CLI agent package for cloud advisory work across platform engineering, landing zones, modernization, and large-scale enterprise migration programs.

Current version: `v0.2`

## What is included

- `skills/dave-cloud-pod-advisor/`
  - Primary cloud advisory skill
  - Endava-focused consulting workflow
  - Hook for importing your own cloud advisory skills later
- `skills/endava-cloud-case-study-finder/`
  - Supporting skill for grounding recommendations in Endava case studies and delivery precedents
- `skills/`
  - Additional cloud, platform, Azure, AWS, modernization, and document-output skills that Dave can call when relevant
- `RELEASE_NOTES.md`
  - Versioned release history and changed summaries

## Core capabilities

- Platform engineering and internal developer platform guidance
- Cloud foundations and landing zone design
- Enterprise migration strategy, sequencing, and governance
- Modernization planning for legacy and hybrid estates
- Reliability, security, observability, and cost advisory
- Endava case-study lookup for precedent-backed recommendations

## Install In Codex CLI

Codex discovers reusable skills from your local skills directory. Install these two skill folders into `~/.codex/skills`.

### Option 1: Symlink during development

```bash
mkdir -p ~/.codex/skills
ln -sfn /Users/stu2/Projects/dava-cva-agent/skills/dave-cloud-pod-advisor ~/.codex/skills/dave-cloud-pod-advisor
ln -sfn /Users/stu2/Projects/dava-cva-agent/skills/endava-cloud-case-study-finder ~/.codex/skills/endava-cloud-case-study-finder
```

### Option 2: Copy the skill folders

```bash
mkdir -p ~/.codex/skills
cp -R /Users/stu2/Projects/dava-cva-agent/skills/dave-cloud-pod-advisor ~/.codex/skills/
cp -R /Users/stu2/Projects/dava-cva-agent/skills/endava-cloud-case-study-finder ~/.codex/skills/
```

Restart Codex after installation so the skills are picked up cleanly.

If you want Dave to use the additional skills in this repository, copy or symlink the full `skills/` directory contents into `~/.codex/skills`, not only the two base skills.

## How To Use

Invoke the main advisor directly:

```text
Use $dave-cloud-pod-advisor to recommend an Azure platform engineering operating model for a regulated enterprise with 200 product teams.
```

Ask for migration planning:

```text
Use $dave-cloud-pod-advisor to design a phased AWS migration plan for a large on-prem estate with strict rollback requirements.
```

Ask for precedent-backed advice:

```text
Use $dave-cloud-pod-advisor to propose a landing-zone strategy and include Endava case-study examples for similar enterprise migrations.
```

Invoke the case-study helper directly when you only want evidence gathering:

```text
Use $endava-cloud-case-study-finder to find Endava case studies related to platform engineering or cloud migration for financial services clients.
```

Use a specialist directly when you want to bypass Dave and go straight to a domain expert:

```text
Use $platform-engineer to design a Backstage-based internal developer platform with golden paths for Kubernetes services.
Use $cloud-architect to compare AWS, Azure, and GCP tradeoffs for a regulated enterprise migration.
Use $azure-infra-engineer to propose an Azure landing zone using CAF and Bicep.
Use $aws-serverless-eda to design an event-driven Lambda and EventBridge architecture.
```

## Expected Operating Model

`$dave-cloud-pod-advisor` is the lead skill. It should:

1. Understand the business and delivery context.
2. Form a recommendation with clear tradeoffs.
3. Pull in `$endava-cloud-case-study-finder` when examples or proof points are useful.
4. Pull in the relevant installed extension skills from [skills/dave-cloud-pod-advisor/references/custom-skill-imports.md](/Users/stu2/Projects/dava-cva-agent/skills/dave-cloud-pod-advisor/references/custom-skill-imports.md) before finalizing the answer.

`$endava-cloud-case-study-finder` should:

1. Search local knowledge-base exports or connected sources.
2. Return only the most relevant case studies.
3. Clearly separate sourced evidence from inference.

Specialist skills should be used selectively:

- invoke architecture specialists for target-state, migration, and tradeoff work
- invoke platform and Kubernetes specialists for developer platform or cluster operating model questions
- invoke AWS or Azure specialists when provider-specific depth is needed
- invoke document skills only when the requested output format is a document, PDF, presentation, or spreadsheet

## Installed Skills Dave Can Use

The following skills are now present in this repository and should be considered part of the advisor ecosystem.

### Core Endava skills

- `dave-cloud-pod-advisor`: primary Endava cloud advisory interface
- `endava-cloud-case-study-finder`: searches Endava case-study and knowledge sources for supporting evidence

### Core strategy and architecture

- `cloud-architect`: multi-cloud architecture, migration strategy, disaster recovery, and cost tradeoffs
- `solution-architect`: enterprise solution framing and business-to-technology alignment
- `technical-advisory`: deep technical review for security, performance, and complex engineering decisions

### Platform and modernization

- `platform-engineer`: internal developer platforms, golden paths, Backstage, and Crossplane
- `kubernetes-specialist`: Kubernetes architecture and operations across EKS, AKS, GKE, and on-prem
- `legacy-modernizer`: strangler-pattern and incremental modernization strategies
- `microservices-architect`: service boundaries, service mesh, and event-driven distributed systems
- `mlops-engineer`: MLOps platforms, model deployment, and feature-store architecture

### AWS specialists

- `aws-agentic-ai`: AWS Bedrock AgentCore and agent-platform architecture
- `aws-cdk-development`: AWS CDK and infrastructure-as-code delivery
- `aws-cost-operations`: AWS cost, observability, audit, and operational optimization
- `aws-mcp-setup`: AWS MCP setup for docs and API access
- `aws-serverless-eda`: serverless and event-driven AWS architecture

### Azure specialists

- `azure-infra-engineer`: Azure landing zones, CAF, and Bicep or ARM delivery
- `azure-architecture`: Azure architecture patterns and workload design
- `azure-migrate`: Azure migration planning and discovery workflows
- `azure-well-architected`: Azure design and optimization reviews
- `azure-monitor`: Azure observability and monitoring architecture
- `azure-advisor`: Azure Advisor workflows and remediation planning
- `azure-automation`: runbooks, DSC, and automation patterns
- `azure-blueprints`: blueprint-driven governance and compliance packaging
- `azure-cloud-services`: legacy Azure Cloud Services support
- `azure-vmware-solution`: AVS and VMware migration on Azure
- `azure-ai-services`: Azure AI service architecture
- `azure-anomaly-detector`: anomaly-detection workloads on Azure

### Enterprise and domain specialists

- `windows-infra-admin`: Windows Server, Active Directory, Entra hybrid identity, and PowerShell
- `it-ops-orchestrator`: cross-domain operational coordination across Windows, Azure, M365, and infrastructure
- `fintech-engineer`: regulated financial systems, ledgers, and payments architecture

### Output and packaging skills

- `docx`: Word document creation and editing
- `pdf`: PDF extraction, generation, OCR, and manipulation
- `pptx`: presentation and slide deck creation or editing
- `xlsx`: spreadsheet creation, cleanup, and formatting

### Meta skill

- `find-skills`: discover and install additional skills later

## How To Use The Installed Skills

Use Dave as the default interface:

- `Use $dave-cloud-pod-advisor to recommend a cloud operating model for a global enterprise and pull in any relevant specialist skills.`
- `Use $dave-cloud-pod-advisor to plan an Azure landing zone, invoke the right Azure specialist, and include Endava case studies.`
- `Use $dave-cloud-pod-advisor to design a platform engineering roadmap and call $platform-engineer if deeper IDP guidance is needed.`

Use specialists directly when the request is already narrow:

- `Use $cloud-architect to compare multi-cloud versus Azure-first options for this migration.`
- `Use $technical-advisory to review the target architecture and highlight key tradeoffs and risks.`
- `Use $legacy-modernizer to create an incremental modernization path for this monolith.`
- `Use $kubernetes-specialist to define the AKS or EKS cluster model, add-ons, and operations boundaries.`

Use provider-specific specialists directly when the user already knows the target cloud:

- `Use $aws-cdk-development to propose the CDK stack structure for this AWS platform.`
- `Use $aws-cost-operations to review spend controls, monitoring, and CloudTrail audit coverage.`
- `Use $azure-infra-engineer to propose an enterprise Azure landing zone in Bicep.`
- `Use $azure-monitor to define observability for this Azure workload.`

Use output-format skills when the deliverable format matters:

- `Use $docx to turn this cloud advisory output into a branded Word document.`
- `Use $pptx to create an executive presentation from this migration strategy.`
- `Use $xlsx to build a migration wave tracker spreadsheet.`
- `Use $pdf to extract and summarize case-study details from uploaded PDFs.`

## Add Your Own Cloud Advisory Skills

Dave is designed to be extensible. Install your own skills into `~/.codex/skills`, then register them in [skills/dave-cloud-pod-advisor/references/custom-skill-imports.md](/Users/stu2/Projects/dava-cva-agent/skills/dave-cloud-pod-advisor/references/custom-skill-imports.md).

### Example entry

```text
- enterprise-finops-advisor: invoke for deep cost optimization, budget guardrails, and cloud unit economics
```

### Recommended approach

1. Create or install the custom skill under `~/.codex/skills/<skill-name>`.
2. If you want a starting point, copy the template from [templates/custom-cloud-advisory-skill/SKILL.md.example](/Users/stu2/Projects/dava-cva-agent/templates/custom-cloud-advisory-skill/SKILL.md.example) and [templates/custom-cloud-advisory-skill/agents.openai.yaml.example](/Users/stu2/Projects/dava-cva-agent/templates/custom-cloud-advisory-skill/agents.openai.yaml.example).
3. Add a line for that skill in [skills/dave-cloud-pod-advisor/references/custom-skill-imports.md](/Users/stu2/Projects/dava-cva-agent/skills/dave-cloud-pod-advisor/references/custom-skill-imports.md).
4. Restart Codex if you added a new skill.
5. Ask for advice through `$dave-cloud-pod-advisor`; it will check the import list and pull in the relevant skill when needed.

## Knowledge Base Conventions

The case-study skill looks for Endava knowledge locally first. Recommended workspace folders:

- `knowledge-base/`
- `case-studies/`
- `notes/`
- `exports/`

Place markdown, text, PDF, spreadsheet, or similar exports in one of those locations so the case-study skill has something concrete to search.

## Suggested Prompt Patterns

- `Use $dave-cloud-pod-advisor to compare AWS Control Tower against a custom landing-zone approach for a global enterprise.`
- `Use $dave-cloud-pod-advisor to define a platform engineering roadmap with 30-60-90 day actions.`
- `Use $dave-cloud-pod-advisor to assess migration waves, cutover risks, and rollback design for a hybrid estate.`
- `Use $dave-cloud-pod-advisor to recommend governance guardrails and FinOps controls for a multi-account cloud foundation.`
- `Use $dave-cloud-pod-advisor to design an Azure enterprise platform and invoke any relevant Azure specialist skills before finalizing the recommendation.`
- `Use $dave-cloud-pod-advisor to produce an executive-ready slide deck by using $pptx after the advisory content is complete.`

## Repository Layout

```text
dava-cva-agent/
├── case-studies/
├── exports/
├── knowledge-base/
├── notes/
├── README.md
├── templates/
│   └── custom-cloud-advisory-skill/
└── skills/
    ├── aws-*/
    ├── azure-*/
    ├── cloud-architect/
    ├── dave-cloud-pod-advisor/
    ├── endava-cloud-case-study-finder/
    ├── platform-engineer/
    ├── technical-advisory/
    └── ...
```

## Notes

- The skills are intentionally lightweight and composable.
- Endava case-study quality depends on the knowledge sources you make available.
- Custom skills are optional overlays; the main advisor remains the primary interface.
- Future changes should be recorded in [RELEASE_NOTES.md](/Users/stu2/Projects/dava-cva-agent/RELEASE_NOTES.md) with both a release note and a changed summary.
- Several Azure specialist skills note that they require network-backed documentation access when used interactively.
