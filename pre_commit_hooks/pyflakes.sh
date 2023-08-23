#!/bin/bash

echo "[INFO] Checking if pyflakes is installed.."
pyflakes_is_installed="$(pip list | grep -F pyflakes)"

if [[ -n $pyflakes_is_installed ]]
then
    echo "[INFO] Pyflakes module is already installed"
else
    pip install pyflakes
fi

echo "[INFO] Running pyflakes.sh from pre-commit-hooks on working directory.."
find_cmd="find $PWD -type d -name '.env' -prune -o -type f -name '*.py' -print"
xargs_cmd="xargs pyflakes"

stdout_find=$(eval "$find_cmd")
stdout_xargs=$(echo "$stdout_find" | eval "$xargs_cmd" 2>&1)

if [ $? -ne 0 ]; then
    echo -e "\e[33m[WARN]\e[0m Pyflakes found some violations. Please fix them or force the commit with --no-verify"
    echo "$stdout_xargs"
    exit 1
fi