#!/usr/bin/env bash
# build.sh
set -euo pipefail

AVDL_DIR=${AVDL_DIR:-/work/avdl}
AVPR_DIR=${AVPR_DIR:-/work/out/avpr}
AVSC_DIR=${AVSC_DIR:-/work/out/avsc}
AVRO_TOOLS_JAR=/opt/avro-tools.jar

mkdir -p "$AVPR_DIR" "$AVSC_DIR"

echo "Discovering .avdl files in: $AVDL_DIR"
shopt -s nullglob globstar
AVDL_FILES=("$AVDL_DIR"/**/*.avdl)
if [ ${#AVDL_FILES[@]} -eq 0 ]; then
  echo "No .avdl files found in $AVDL_DIR"
  exit 1
fi

# Convert each AVDL -> AVPR (protocol JSON)
for f in "${AVDL_FILES[@]}"; do
  base=$(basename "$f" .avdl)
  echo "Generating protocol for: $f -> $AVPR_DIR/${base}.avpr"
  java -jar "$AVRO_TOOLS_JAR" idl "$f" > "$AVPR_DIR/${base}.avpr"
done

# Extract individual schemata from AVDL -> AVSC files
# This emits one .avsc per named type found in the IDL
for f in "${AVDL_FILES[@]}"; do
  echo "Extracting schemata for: $f -> $AVSC_DIR"
  java -jar "$AVRO_TOOLS_JAR" idl2schemata "$f" "$AVSC_DIR"
done

echo "Done."
