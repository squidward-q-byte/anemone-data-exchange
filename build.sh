#!/usr/bin/env bash
# build.sh
set -euo pipefail

AVDL_DIR=${AVDL_DIR:-/work/avdl}
AVPR_DIR=${AVPR_DIR:-/work/out/avpr}
AVSC_DIR=${AVSC_DIR:-/work/out/avsc}
JAVA_GEN_DIR=${JAVA_GEN_DIR:-/work/gen/java}
TS_GEN_DIR=${TS_GEN_DIR:-/work/gen/ts}
PY_GEN_DIR=${PY_GEN_DIR:-/work/gen/py}
AVRO_TOOLS_JAR=/opt/avro-tools.jar

mkdir -p "$AVPR_DIR" "$AVSC_DIR" "$JAVA_GEN_DIR" "$TS_GEN_DIR" "$PY_GEN_DIR"

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

# # Optional: generate Java classes (official avro-tools)
# # Compiles every .avsc in AVSC_DIR to Java classes in JAVA_GEN_DIR
# if [ -n "${GENERATE_JAVA:-}" ]; then
#   echo "Generating Java classes from AVSC into: $JAVA_GEN_DIR"
#   java -jar "$AVRO_TOOLS_JAR" compile schema "$AVSC_DIR" "$JAVA_GEN_DIR"
# fi

# # Optional: generate TypeScript types (community: avro-ts)
# # avro-ts supports directory input; adjust flags as needed
# if command -v avro-ts >/dev/null 2>&1 && [ -n "${GENERATE_TS:-}" ]; then
#   echo "Generating TypeScript types from AVSC into: $TS_GEN_DIR"
#   avro-ts -i "$AVSC_DIR" -o "$TS_GEN_DIR"
# else
#   echo "Skip TypeScript generation (install avro-ts and set GENERATE_TS=1 to enable)."
# fi

# # Optional: generate Python classes (community: avro-gen)
# # Many tools expect file-by-file; here we loop all .avsc
# if command -v avro-gen >/dev/null 2>&1 && [ -n "${GENERATE_PY:-}" ]; then
#   echo "Generating Python classes from AVSC into: $PY_GEN_DIR"
#   mkdir -p "$PY_GEN_DIR"
#   for s in "$AVSC_DIR"/*.avsc; do
#     [ -e "$s" ] || continue
#     echo "  -> $s"
#     avro-gen --input "$s" --output "$PY_GEN_DIR"
#   done
# else
#   echo "Skip Python generation (install a generator and set GENERATE_PY=1 to enable)."
# fi

echo "Done."
