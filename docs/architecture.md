# Architecture

## Overview

The Snowflake CI/CD Framework provides a controlled deployment path from source control to Snowflake.

## Deployment Flow

```text
Developer
    |
    v
Git Repository
    |
    v
Bitbucket Pipeline
    |
    +----------------------+
    |                      |
    v                      v
Environment          Snowflake CLI
Validation                 |
                           v
                  Secure Authentication
                           |
                           v
                      Snowflake
                           |
                           v
                    SQL Deployment
                           |
                           v
                  Deployment Validation
```

## Environment Strategy

The framework supports independent deployment configurations for:

- DEV
- STG
- PROD

Each environment should maintain its own:

- Service account
- Deployment role
- Authentication credentials
- Warehouse
- Target database/schema
- CI/CD variables

## Security Model

Credentials are not stored in source control.

Sensitive values are supplied through CI/CD environment variables.

The deployment process uses a dedicated service account and Snowflake role rather than individual developer credentials.

## Deployment Validation

The pipeline validates:

1. Required environment configuration
2. Snowflake authentication
3. Active Snowflake user and role
4. Database/schema access
5. SQL execution
6. Deployment object creation
7. Deployment result
