#!/usr/bin/env bash
set -euo pipefail

LINT_ONLY=0
if [[ "${1:-}" == "--lint-only" ]]; then
  LINT_ONLY=1
fi

ROOT_PREREQ="./.opencode/tools/check_local_prereqs.sh"
LOCAL_PREREQ="./tools/check_local_prereqs.sh"

if [[ -x "${ROOT_PREREQ}" ]]; then
  "${ROOT_PREREQ}"
elif [[ -x "${LOCAL_PREREQ}" ]]; then
  "${LOCAL_PREREQ}"
else
  echo "[block] prerequisite checker script not found"
  exit 2
fi

status=0
warn=0

run_required() {
  local label="$1"
  shift
  echo "[run] ${label}: $*"
  if "$@"; then
    echo "[ok] ${label}"
  else
    echo "[block] ${label} failed"
    status=2
  fi
}

run_optional() {
  local label="$1"
  shift
  echo "[run] ${label}: $*"
  if "$@"; then
    echo "[ok] ${label}"
  else
    echo "[warn] ${label} failed (advisory)"
    warn=1
  fi
}

run_required "ruff" ruff check .
run_required "black" black --check .
run_required "django-check" python manage.py check

if [[ "${LINT_ONLY}" -eq 0 ]]; then
  run_required "pytest" pytest -q
fi

if command -v mypy >/dev/null 2>&1; then
  run_optional "mypy" mypy .
else
  echo "[info] mypy not found (optional, not blocking)"
fi

if [[ "${status}" -eq 2 ]]; then
  echo "[result] blocked: required quality checks failed"
  exit 2
fi

if [[ "${warn}" -eq 1 ]]; then
  echo "[result] pass-with-warnings: optional checks reported issues"
  exit 1
fi

echo "[result] pass: all required quality checks passed"
exit 0
