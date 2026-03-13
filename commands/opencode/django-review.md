---
description: Review Django changes against spec and architecture rules
agent: django-code-reviewer
subtask: true
---
Review current Django changes for: $ARGUMENTS

Focus on:
- Correctness and data integrity
- Security and permission behavior
- Layering rules (viewset CRUD, function workflow views, services.py logic)
- Spec compliance gaps

Return prioritized findings with severity and minimal remediations.
