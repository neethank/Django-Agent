#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

list_dir() {
  local title="$1"
  local dir="$2"
  echo "${title}:"
  if compgen -G "${dir}/*.md" > /dev/null; then
    for f in "${dir}"/*.md; do
      echo "- $(basename "${f}")"
    done
  else
    echo "- (none)"
  fi
  echo
}

list_dir "Agents" "${REPO_ROOT}/agents"
list_dir "OpenCode commands" "${REPO_ROOT}/commands/opencode"
list_dir "Skills" "${REPO_ROOT}/skills"
list_dir "Meta docs (not installed)" "${REPO_ROOT}/meta"
