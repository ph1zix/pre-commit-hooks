#!/bin/bash

echo "Running hook-pyflakes.sh..."

find_cmd="find $PWD -type d -name '.env' -prune -o -type f -name '*.py' -print"
xargs_cmd="xargs pyflakes"

stdout_find=$(eval "$find_cmd")
stdout_xargs=$(echo "$stdout_find" | eval "$xargs_cmd" 2>&1)

if [ $? -ne 0 ]; then
echo "[INFO] Pyflakes found some violations. Please fix them or force the commit with --no-verify"
echo "$stdout_xargs"
exit 1
fi