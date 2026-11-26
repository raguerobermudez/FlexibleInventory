#!/usr/bin/env bash

set -euo pipefail

SQLCMD="/opt/mssql-tools/bin/sqlcmd"
HOST="${MSSQL_HOST:-sqlserver}"
PORT="${MSSQL_PORT:-1433}"
USER="${MSSQL_USER:-sa}"
PASS="${MSSQL_SA_PASSWORD:?Missing MSSQL_SA_PASSWORD}"
DB="${MSSQL_DB_NAME:-FlexibleInventoryDb}"


if [[ ! "$DB" =~ ^[A-Za-z0-9_-]+$ ]]; then
  echo "MSSQL_DB_NAME may contain only letters, numbers, underscores, and hyphens." >&2
  exit 1
fi

READY=0

for i in {1..30}; do
  if "$SQLCMD" -S "${HOST},${PORT}" -U "$USER" -P "$PASS" -C -d master -Q "SELECT 1" >/dev/null 2>&1; then
    READY=1
    break
  fi
  sleep 2
done

if [[ "$READY" -ne 1 ]]; then
  echo "SQL Server did not become ready after 60 seconds." >&2
  exit 1
fi

echo "Recreating database '${DB}'..."
"$SQLCMD" -S "${HOST},${PORT}" -U "$USER" -P "$PASS" -C -b -d master \
  -Q "IF DB_ID(N'${DB}') IS NOT NULL BEGIN ALTER DATABASE [${DB}] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE [${DB}]; END; CREATE DATABASE [${DB}];"

"$SQLCMD" -S "${HOST},${PORT}" -U "$USER" -P "$PASS" -C -b -d "$DB" \
  -i /Database/Scripts/DatabaseInitialization/FlexibleInventoryDatabaseDeploy.sql