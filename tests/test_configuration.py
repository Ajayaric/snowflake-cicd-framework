from scripts.ci_smoke_test import REQUIRED_VARIABLES


def test_required_variables_are_defined():
    expected = {
        "SNOWFLAKE_ACCOUNT",
        "SNOWFLAKE_USER",
        "SNOWFLAKE_ROLE",
        "SNOWFLAKE_WAREHOUSE",
    }

    assert set(REQUIRED_VARIABLES) == expected
