---
description: Run full local Django quality gate
agent: senior-django-engineer
subtask: true
---
Run the full local quality gate:

`bash ./.opencode/tools/python_quality_gate.sh`

Interpret results using gate policy:
- blocked if required checks fail or prerequisites are missing
- pass-with-warnings allowed only for optional checks
