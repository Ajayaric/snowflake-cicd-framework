# Snowflake CI/CD Framework

A production-style CI/CD framework for securely validating and deploying SQL workloads to Snowflake using Bitbucket Pipelines, Python, and Snowflake CLI.

## Overview

This project demonstrates an end-to-end CI/CD workflow for Snowflake deployments.

The framework is designed around:

- Secure service-account authentication
- Key-pair authentication
- Role-based access control
- Automated Snowflake connection validation
- SQL deployment from source control
- Deployment smoke testing
- Environment-specific configuration
- DEV, STG, and PROD deployment patterns
- CI/CD-ready architecture

## Architecture

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
Python / Tests       Snowflake CLI
                           |
                           v
                  Secure Authentication
                           |
                           v
                      Snowflake
                           |
             +-------------+-------------+
             |             |             |
             v             v             v
            DEV           STG           PROD
             |
             v
      Deployment Validation
```

# Key Features

## Secure Authentication

The pipeline uses key-pair authentication with a dedicated Snowflake service account.

Sensitive credentials are stored outside source control and injected into the pipeline through secure CI/CD variables.

## Role-Based Deployment

Snowflake deployments are executed using a dedicated deployment role with explicitly assigned permissions.

## SQL Deployment

SQL scripts are maintained in source control and executed through the CI/CD pipeline.

## Deployment Validation

The pipeline validates:

1. Snowflake authentication
2. Active user and role
3. Database/schema access
4. SQL execution
5. Deployment object creation
6. Deployment result
   
## Environment Strategy

The framework supports separate deployment configurations for:

- DEV
- STG
- PROD

## Technology Stack
- Python
- SQL
- Snowflake
- Snowflake CLI
- Bitbucket Pipelines
- Git
- CI/CD
- Role-Based Access Control (RBAC)
- Key-Pair Authentication

## Project Structure

```text
snowflake-cicd-framework/
|
├── scripts/
│   └── ci_smoke_test.py
|
├── snowflake/
│   └── test/
│       └── connection_test.sql
|
├── docs/
│   ├── architecture.md
│   ├── deployment-guide.md
│   └── environments.md
|
├── tests/
│   └── test_configuration.py
|
├── bitbucket-pipelines.yml
├── requirements.txt
├── .gitignore
├── .env.example
└── README.md
```
## Security

This repository intentionally contains no real credentials, private keys, passwords, tokens, or production infrastructure details.

Secrets should be provided through CI/CD environment variables or an appropriate secrets-management system.

Example:

```text
SNOWFLAKE_PRIVATE_KEY
SNOWFLAKE_ACCOUNT
SNOWFLAKE_USER
SNOWFLAKE_ROLE
SNOWFLAKE_WAREHOUSE
```

## Deployment Flow

```text
Code Change
    |
    v
Git Commit
    |
    v
Bitbucket Pipeline
    |
    v
Environment Validation
    |
    v
Snowflake Authentication
    |
    v
SQL Deployment
    |
    v
Smoke Test
    |
    v
Deployment Result
```

## Portfolio Project

This repository is an independent portfolio implementation demonstrating Snowflake CI/CD architecture and deployment practices.

The implementation uses synthetic/demo configuration and does not contain proprietary company or client information.

## Future Enhancements

- Automated SQL linting
- Unit and integration testing
- Pull request validation
- Automated DEV deployment
- Controlled STG deployment
- Production approval workflow
- Deployment audit logging
- Rollback strategy
- GitHub Actions integration
- Infrastructure-as-code integration
