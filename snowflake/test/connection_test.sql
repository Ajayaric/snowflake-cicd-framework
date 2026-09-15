-- Snowflake CI/CD Deployment Test
-- This script validates connectivity, permissions,
-- and basic SQL deployment capability.

SELECT
    CURRENT_USER() AS CURRENT_USER,
    CURRENT_ROLE() AS CURRENT_ROLE,
    CURRENT_ACCOUNT() AS CURRENT_ACCOUNT,
    CURRENT_DATABASE() AS CURRENT_DATABASE,
    CURRENT_SCHEMA() AS CURRENT_SCHEMA;

-- Validate database access
SHOW DATABASES;

-- Create a temporary demonstration object
CREATE TABLE IF NOT EXISTS CICD_DEPLOYMENT_TEST (
    TEST_ID NUMBER,
    TEST_MESSAGE VARCHAR,
    CREATED_AT TIMESTAMP
);

-- Insert deployment validation record
INSERT INTO CICD_DEPLOYMENT_TEST (
    TEST_ID,
    TEST_MESSAGE,
    CREATED_AT
)
VALUES (
    1,
    'Created by Snowflake CI/CD Framework',
    CURRENT_TIMESTAMP()
);

-- Validate deployed data
SELECT
    TEST_ID,
    TEST_MESSAGE,
    CREATED_AT
FROM CICD_DEPLOYMENT_TEST
ORDER BY CREATED_AT DESC;
