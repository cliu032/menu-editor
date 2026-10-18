#!/bin/sh
# Writes the same build stamp into index.html (meta build) and version.txt. Run before each commit.
cd "$(dirname "$0")"
v=$(date -u +%Y%m%d-%H%M%S)
sed -i -E "s/<meta name=\"build\" content=\"[^\"]*\">/<meta name=\"build\" content=\"$v\">/" index.html
printf '%s\n' "$v" > version.txt
echo "$v"
