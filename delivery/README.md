# Delivery Assets

This folder contains source-controlled delivery assets for the next implementation phase of the project.

Use this area for infrastructure code, blueprint documentation, and reusable deployment configuration.

Guiding rules:
- Keep source assets here, not in `deliverables/`.
- Prefer provider-native IaC when the target cloud is already clear.
- Structure each delivery package so it can evolve into a production implementation without a major rework.

Current package:
- `azure-landing-zone/`: Azure landing-zone blueprint and modular Bicep implementation.
