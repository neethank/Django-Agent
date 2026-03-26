---
description: Run local Django lint and sanity checks
agent: senior-django-engineer
subtask: true
---
Run local lint checks only:

`bash ./.opencode/tools/python_quality_gate.sh --lint-only`

If prerequisites or required checks fail, mark the result as blocked and report the minimal next action.
