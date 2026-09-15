"""
CI/CD Smoke Test

Performs basic validation before a Snowflake deployment.
"""

import os
import sys


REQUIRED_VARIABLES = [
    "SNOWFLAKE_ACCOUNT",
    "SNOWFLAKE_USER",
    "SNOWFLAKE_ROLE",
    "SNOWFLAKE_WAREHOUSE",
]


def validate_environment():
    """Validate that required CI/CD variables are available."""

    missing = [
        variable
        for variable in REQUIRED_VARIABLES
        if not os.getenv(variable)
    ]

    if missing:
        print("ERROR: Missing required environment variables:")
        for variable in missing:
            print(f"  - {variable}")
        return False

    print("Environment validation successful.")

    for variable in REQUIRED_VARIABLES:
        print(f"  ✓ {variable}")

    return True


if __name__ == "__main__":
    if not validate_environment():
        sys.exit(1)

    print("CI/CD smoke test passed.")
