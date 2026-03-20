# Azure Landing Zone Delivery Package

This delivery package adds a practical cloud blueprint and starter infrastructure code for an Azure landing zone.

## Why Bicep

Bicep is the best fit for this requirement because the repository already treats Azure landing zones as a first-class scenario, and the local Azure infrastructure guidance in this project recommends Bicep as the default IaC choice for Azure-specific implementations.

Terraform would be the stronger default only if this package had to manage multiple cloud providers from a single state model. CDK would be a better fit for AWS-centric delivery. Neither is the primary match for this phase.

## Package Layout

- `blueprint.md`: architecture and deployment intent
- `bicep/main.bicep`: subscription-scope entry point
- `bicep/modules/`: composable Azure foundation modules
- `bicep/parameters/`: example environment parameter files

## What This Blueprint Deploys

The starter blueprint focuses on the foundational controls needed before workload onboarding:

- separate resource groups for connectivity, management, and security
- a hub virtual network with dedicated subnets for firewall, bastion, shared services, and private endpoints
- central observability with Log Analytics and Application Insights
- security baseline services including Key Vault and Recovery Services Vault
- private DNS zones for common Azure PaaS private-link integrations

This is intentionally a strong subscription-level baseline. It is designed to be extended later with management-group hierarchy, policy assignments, RBAC, private endpoints, spoke VNets, CI/CD, and workload-specific modules.

## Deployment Notes

The entry point is subscription-scoped, so deploy it with `az deployment sub create`.

Example:

```bash
az deployment sub create \
  --location uksouth \
  --template-file delivery/azure-landing-zone/bicep/main.bicep \
  --parameters delivery/azure-landing-zone/bicep/parameters/dev.bicepparam
```

Review the sample IP allow list and naming values in the parameter files before use.
