#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

mkdocs_simple_version="$1"

rm -rf venv/
python3 -m venv venv
pip install mkdocs==1.4.2 mkdocs-simple-plugin=="$mkdocs_simple_version"


# modify a file three seconds from now
(sleep 3; echo "CHANGING README!!!"; touch README.md) &

# Start live-reload server
mkdocs serve
