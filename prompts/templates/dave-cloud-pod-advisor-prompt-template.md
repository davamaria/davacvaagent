# Dave Cloud Pod Advisor Prompt Template

Use this prompt structure to get the best output from Dave Cloud Pod Advisor.

## Recommended format

```text
Use $dave-cloud-pod-advisor for [client name].

Objective:
[What decision, strategy, migration, architecture, or deliverable is needed]

Business context:
- Industry:
- Business driver:
- Timeline:
- Budget posture:
- Executive priority:

Current estate:
- Cloud or on-prem footprint:
- Number of workloads or applications:
- Key platforms:
- Security or regulatory constraints:
- Dependencies or legacy concerns:

Target state:
- Preferred cloud:
- Preferred operating model:
- Modernization expectations:
- Required resilience or DR posture:

Required outputs:
- [List the deliverables required]
- [State whether to generate all deliverables or only selected outputs]

Special instructions:
- [Ask Dave to use Endava case studies if available]
- [Ask Dave to invoke Azure, AWS, platform, or architecture specialist skills if needed]
- [Ask Dave to use the Endava Word or PowerPoint templates for final outputs]
```

## Best-practice guidance

- Always name the client.
- State whether the goal is strategy, migration planning, architecture design, governance, or deliverable creation.
- Include scale: number of applications, VMs, teams, regions, or environments.
- Include constraints: compliance, timeline, budget, operational maturity, rollback needs, and outage tolerance.
- Ask for specific outputs instead of a generic recommendation.
- If you want client-ready deliverables, explicitly ask for `.docx` and `.pptx` outputs from the provided templates.

## Example

```text
Use $dave-cloud-pod-advisor for Enshite plc.

Objective:
Design an Azure migration program for 600 internal banking VMs.

Business context:
- Industry: Banking
- Business driver: Datacenter exit and platform standardization
- Timeline: 12 months
- Budget posture: Controlled transformation budget
- Executive priority: Reduce migration risk while maintaining auditability

Current estate:
- Cloud or on-prem footprint: Primarily on-prem
- Number of workloads or applications: 600 VMs across internal banking services
- Key platforms: Windows Server, middleware, internal applications, shared databases
- Security or regulatory constraints: High internal control and banking governance expectations
- Dependencies or legacy concerns: Mixed application dependencies and likely hidden integration points

Target state:
- Preferred cloud: Azure
- Preferred operating model: Landing-zone based, policy-driven, migration factory
- Modernization expectations: Rehost first, optimize and modernize later
- Required resilience or DR posture: Production-grade backup, restore, and rollback planning

Required outputs:
- Generate only selected outputs
- Migration roadmap
- Landing-zone target architecture
- Executive summary presentation

Special instructions:
- Use Endava case studies if available
- Invoke relevant Azure specialist skills
- Use the Endava Word and PowerPoint templates for final outputs
```
