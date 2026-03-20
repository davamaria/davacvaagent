# Cloud Blueprint

## Objective

Provide a production-shaped Azure landing-zone baseline that can be used as the next delivery phase for platform setup and future migration workstreams.

## Architecture Summary

The blueprint assumes Azure is the target platform and establishes a subscription-level foundation aligned to common landing-zone practice:

- `connectivity` resource group for the hub network and private DNS
- `management` resource group for monitoring services
- `security` resource group for core secrets and recovery services

The network topology is hub-oriented and reserves space for:

- `AzureFirewallSubnet`
- `AzureBastionSubnet`
- `shared-services`
- `private-endpoints`

This keeps the initial shape compatible with later spoke onboarding, inspection, and private access patterns.

## Delivery Decisions

### IaC choice

Use Bicep for this package because:

- the current repository leans heavily toward Azure landing-zone scenarios
- the included Azure guidance explicitly recommends Bicep for new Azure work
- a native Azure template keeps the blueprint easier to reason about for tenant and subscription rollout

### Scope choice

Use subscription scope for the first implementation because it allows the blueprint to create its own resource-group boundaries and then delegate resource-level deployments to focused modules.

### Structure choice

Split the template into modules so the delivery package can grow without turning into a single monolithic template:

- `resource-groups`
- `hub-network`
- `observability`
- `security-baseline`
- `private-dns`

## Expected Extension Points

The current package is a landing-zone foundation, not a full enterprise platform. Extend it next with:

- management groups and policy assignments
- platform identity and RBAC group mappings
- spoke network modules
- private endpoints for platform services
- CI/CD deployment pipeline definitions
- workload onboarding templates

## Deployment Sequence

1. Deploy subscription-level resource groups.
2. Deploy the hub network in the connectivity group.
3. Deploy observability into the management group.
4. Deploy the security baseline into the security group.
5. Deploy private DNS zones into the connectivity group.

## Guardrails

- No public backend network exposure is created by default.
- Key Vault is configured for RBAC and purge protection.
- Monitoring resources are centralized.
- The template expects explicit parameterization for environment, tags, and allowed admin IP ranges.
