#!/bin/bash

echo "[INFO] Checking if pyflakes is installed.."
alias python=python3 
if python -c "import pyflakes" &> /dev/null; then
    echo "[INFO] Pyflakes is already installed"
else 
    echo "[INFO] Installing pyflakes:"
    pip install pyflakes
fi

echo "[INFO] Running pyflakes.sh on working directory.."

find_cmd="find $PWD -type d -name '.env' -prune -o -type f -name '*.py' -print"
xargs_cmd="xargs pyflakes"

stdout_find=$(eval "$find_cmd")
stdout_xargs=$(echo "$stdout_find" | eval "$xargs_cmd" 2>&1)


if [ $? -ne 0 ]; then
    echo -e "\e[33m[WARN]\e[0m Pyflakes found some violations. Please fix them or force the commit with --no-verify"
    echo "$stdout_xargs"
    exit 1
fi