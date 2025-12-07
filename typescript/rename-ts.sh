#!/bin/sh
for file in types/*.avsc.ts; do
    mv "$file" "$(echo "$file" | sed 's/\.avsc/\.d/')"
done