# Django Review Severity Gates

Use this skill to classify review findings and enforce release gates.

Severity policy:
- `critical`: block immediately (data loss, auth bypass, severe security, irreversible migration risk)
- `high`: block until fixed (likely correctness/security/integrity failure)
- `medium`: proceed only with explicit follow-up
- `low`: minor improvement or maintainability note

Gate rule:
- No merge/deploy recommendation when any `critical` or `high` finding remains.
