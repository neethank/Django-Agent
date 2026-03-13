# Django Permissions Builtins Only

Use this skill to enforce permission policy.

Rules:
- Use built-in Django/DRF permission mechanisms only.
- Allowed examples: `IsAuthenticated`, `IsAdminUser`, `DjangoModelPermissions`, Django groups, model permissions.
- Do not create custom permission classes or bespoke permission frameworks unless explicitly requested.

Checks:
- Access control maps to model permissions and groups.
- Object access checks are explicit where objects are fetched manually.
- Permission behavior is covered by tests.
