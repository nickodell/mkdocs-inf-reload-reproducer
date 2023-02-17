#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <mkdocs_simple_version>"
	exit 1
fi

mkdocs_simple_version="$1"

# Delete virtualenv if present, create new one, and activate it
rm -rf venv/
python3 -m venv venv
source venv/bin/activate

pip install mkdocs==1.4.2 mkdocs-simple-plugin=="$mkdocs_simple_version"


# modify a file three seconds from now
(sleep 3; echo "CHANGING README!!!"; touch README.md) &

# Start live-reload server
mkdocs serve
