#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [[ ! -f .env ]]; then
  echo "ERROR: .env not found. Run:"
  echo "  cp .env.example .env"
  echo "  sed -i \"s/change-me-generate-your-own-secret/\$(openssl rand -hex 32)/\" .env"
  exit 1
fi

docker compose --env-file .env up -d
