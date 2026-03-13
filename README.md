# Django Agent Suite

This repository contains a markdown-only Django agent suite.

## Location

- All agent files live in `agents/`.
- Start with `agents/senior-django-engineer.md` as the orchestrator.
- See `agents/AGENT_CATALOG.md` for agent roles.
- See `agents/PROMPT_PACK.md` for starter prompts.

## Core Rules

- CRUD endpoints: class-based DRF viewsets.
- Business workflow endpoints: function-based views.
- Business logic: `services.py` (or `services/`).
- Permissions: built-in Django/DRF permissions only.
