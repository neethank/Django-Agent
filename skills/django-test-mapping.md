# Django Test Mapping

Use this skill to map requirements into reliable test coverage.

Rules:
- Map each acceptance criterion to at least one success-path test.
- Add failure-path tests for validation, permissions, and edge cases.
- Keep business-rule tests concentrated at service layer.
- Keep endpoint behavior tests at API layer.

Command runbook:
- `python manage.py check`
- `python manage.py test`
- Include migration checks if schema changed.
