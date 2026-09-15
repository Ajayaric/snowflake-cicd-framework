# Deployment Guide

## Prerequisites

The deployment environment requires:

- Python
- Snowflake CLI
- Access to a Snowflake account
- A dedicated deployment service account
- Appropriate Snowflake role privileges
- Bitbucket repository access

## Authentication

The framework is designed to use key-pair authentication for automated deployments.

The private key must be stored securely as a CI/CD secret.

It must never be committed to the repository.

## Required CI/CD Variables

Example variables:

```text
SNOWFLAKE_ACCOUNT
SNOWFLAKE_USER
SNOWFLAKE_ROLE
SNOWFLAKE_WAREHOUSE
SNOWFLAKE_PRIVATE_KEY
```

## Deployment Process
1. Developer commits SQL changes.
2. Bitbucket Pipeline starts.
3. Required environment variables are validated.
4. Snowflake CLI is installed.
5. Secure authentication is configured.
6. Snowflake connection is validated.
7. SQL deployment scripts are executed.
8. Deployment smoke tests are executed.
9. Results are returned to the pipeline.

## Security Considerations
- Never commit private keys.
- Never commit passwords or access tokens.
- Use dedicated service accounts.
- Follow least-privilege RBAC.
- Use separate credentials for each environment.
- Remove temporary credential files after deployment.
