# Environment Strategy

The framework supports separate CI/CD configurations for development, staging, and production environments.

## DEV

Development is used for:

- Initial development
- Developer testing
- Deployment validation
- Smoke testing

## STG

Staging is used for:

- Integration testing
- Pre-production validation
- Release verification

## PROD

Production is used for:

- Approved releases
- Production workloads
- Controlled deployments

## Environment Isolation

Each environment should use separate:

- Snowflake service accounts
- Deployment roles
- Authentication credentials
- Warehouses
- Target schemas
- CI/CD deployment variables

## Recommended Promotion Flow

```text
DEV
 |
 | Validation
 v
STG
 |
 | Approval
 v
PROD
```

Production deployments should include appropriate approval controls before execution.
