# Custom Skill Imports

Add user-installed cloud advisory skills here so Dave can pull them in when relevant.

## How to use this file

- Add one line per installed Codex skill.
- Use the exact skill name as it appears in the skill folder or frontmatter.
- Describe when it should be invoked.
- Keep entries short so the routing decision stays clear.

## Format

`- skill-name: when to invoke it`

## Installed extensions

- cloud-architect: invoke for multi-cloud architecture, migration strategy, governance, disaster recovery, and cost tradeoff decisions
- solution-architect: invoke for enterprise solution framing, business-to-technology tradeoffs, and high-level target-state design
- technical-advisory: invoke for critical architecture reviews, difficult technical tradeoffs, security concerns, and deep engineering analysis
- platform-engineer: invoke for internal developer platforms, golden paths, Backstage, Crossplane, and self-service infrastructure design
- kubernetes-specialist: invoke for EKS, AKS, GKE, Helm, operators, cluster design, and Kubernetes operating model decisions
- legacy-modernizer: invoke for monolith decomposition, strangler-pattern planning, incremental modernization, and anti-corruption layer design
- microservices-architect: invoke for service decomposition, event-driven architecture, service mesh, and distributed systems boundaries
- mlops-engineer: invoke for ML platforms, feature stores, model deployment, and production MLOps operating models
- aws-agentic-ai: invoke for AWS Bedrock AgentCore, agent runtime, memory, identity, and MCP target deployment decisions
- aws-cdk-development: invoke for AWS CDK patterns, construct design, and infrastructure-as-code implementation guidance
- aws-cost-operations: invoke for AWS spend analysis, FinOps controls, observability, alerting, and operational cost optimization
- aws-mcp-setup: invoke when AWS documentation MCP or API-access setup is required before advisory or implementation work
- aws-serverless-eda: invoke for Lambda, API Gateway, Step Functions, EventBridge, SQS, SNS, and event-driven serverless architecture
- azure-infra-engineer: invoke for Azure landing zones, Bicep, ARM, CAF, and enterprise Azure infrastructure design
- azure-architecture: invoke for Azure reference architectures, migration patterns, and service selection decisions
- azure-migrate: invoke for Azure migration planning, discovery tooling, migration waves, and modernization paths
- azure-well-architected: invoke for Azure workload assessments, design reviews, and optimization against Well-Architected principles
- azure-monitor: invoke for Azure observability, Log Analytics, Application Insights, alerts, and operational monitoring design
- azure-advisor: invoke for Azure Advisor recommendation workflows, RBAC, workbooks, and remediation planning
- azure-automation: invoke for runbooks, DSC, Hybrid Runbook Workers, and operational automation patterns
- azure-blueprints: invoke for policy-aligned Azure blueprints, compliance mapping, and governance packaging
- azure-cloud-services: invoke for legacy Azure Cloud Services extended-support workloads and related operational concerns
- azure-vmware-solution: invoke for AVS private clouds, HCX migration design, and VMware modernization on Azure
- azure-ai-services: invoke for Azure AI service architecture, content services, and AI platform integration
- azure-anomaly-detector: invoke for anomaly detection workloads, predictive maintenance patterns, and related Azure AI design
- windows-infra-admin: invoke for Windows Server, Active Directory, hybrid identity, and PowerShell-heavy enterprise infrastructure work
- it-ops-orchestrator: invoke for cross-domain Windows, Azure, M365, PowerShell, and infrastructure coordination tasks
- fintech-engineer: invoke for regulated financial workloads, ledger design, payments architecture, and precision-sensitive systems
- docx: invoke when the requested deliverable is a Word document or structured `.docx` output
- pdf: invoke when the request involves reading, generating, merging, annotating, or extracting content from PDF files
- pptx: invoke when the deliverable is a presentation or any `.pptx` file needs to be read or modified
- xlsx: invoke when the deliverable is a spreadsheet or tabular data needs to be structured in `.xlsx`, `.csv`, or `.tsv`
- find-skills: invoke when the user wants to discover or install additional skills beyond the current package
