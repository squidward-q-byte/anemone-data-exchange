#!/bin/bash

INPUT_DIR="./src"
CACHE_REF="./.cache/run.cache"
AVRO_BUILD_NEEDED=false

mkdir -p $PWD/.cache
mkdir -p $PWD/out

if [[ ! -d "$INPUT_DIR" ]]; then
    echo "Error: Input directory '$INPUT_DIR' not found."
    exit 1
fi

for file in "$INPUT_DIR"/*; do
    # Skip directories, check only regular files (optional, but safer)
    if [[ -f "$file" ]]; then
        
        # Check if the current file is newer than the cache reference file
        if [[ "$file" -nt "$CACHE_REF" ]]; then
            echo "Found changes: '$file' is newer than last compiled version."
            AVRO_BUILD_NEEDED=true
            break
        fi
    fi
done

if $AVRO_BUILD_NEEDED; then
  echo "--- Changes found in $INPUT_DIR. Executing section. ---"
  docker build -t avro-build -f avro/Dockerfile .
  docker run --rm \
    -v "$PWD/src:/work/avdl" \
    -v "$PWD/out:/work/out" \
    avro-build
  touch "$CACHE_REF"
else
  echo "No changes found, skipping compilation"
fi

for arg in "$@"; do
    if [[ "$arg" == "--python" ]]; then
        docker build -t avro-codegen-python  -f python/Dockerfile .
        mkdir -p $PWD/out/python/anemone_data_exchange
        docker run --rm \
          -v "$PWD/out/avsc:/app/schemas" \
          -v "$PWD/out/python/anemone_data_exchange:/app/types" \
          avro-codegen-python
    cp $PWD/python/setup.py  $PWD/out/python
    touch $PWD/out/python/anemone_data_exchange/__init__.py


    elif [[ "$arg" == "--typescript" ]]; then
        docker build -t avro-codegen-typescript -f typescript/Dockerfile .
        docker run --rm \
          -v "$PWD/out/avsc:/usr/src/app/schemas" \
          -v "$PWD/out/typescript:/usr/src/app/types" \
          avro-codegen-typescript
    fi
done