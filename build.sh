#!/bin/bash
set -Eeuxo pipefail
mkdir "$OUTPUT_DIR"
cp index.html "$OUTPUT_DIR"
cp -r dist "$OUTPUT_DIR"
curl -sSLo specs.zip "$SPEC_ZIP_URL"
unzip -j specs.zip "$SPEC_EXTRACT_FILTER" -d "$OUTPUT_DIR/specs"
(
    echo 'urls:'
    ls -1 "$OUTPUT_DIR/specs" | sed -ne 's|^\(.*\)\.\([^.]*\)$|  - url: "specs/\1.\2"\n    name: "\1"|p'
) > _site/generated-swagger-config.yaml