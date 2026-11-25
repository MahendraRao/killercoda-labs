#!/usr/bin/env bash
# Step 3 check: job.sh removes its temp file on exit and still exits 3.
f=~/job.sh

if [ ! -f "$f" ]; then
  echo "job.sh is not here yet. Wait a few seconds and press Check again."
  echo "If it is still missing, run: ls ~"
  exit 1
fi

out=$(bash "$f" 2>&1); code=$?
tmp=$(printf '%s\n' "$out" | sed -n 's/^TMP=//p' | head -n 1)

if [ -z "$tmp" ]; then
  echo "I could not find the 'TMP=...' line in the output. Keep the echo \"TMP=\$tmp\" line."
  echo "Output was: $out"
  exit 1
fi

if [ -e "$tmp" ]; then
  rm -f "$tmp"
  echo "The temp file $tmp was still there after the script ended."
  echo "Add this right after the mktemp line:  trap 'rm -f \"\$tmp\"' EXIT"
  exit 1
fi

if [ "$code" -ne 3 ]; then
  echo "The script exited with $code. It must still exit with 3."
  echo "Keep the 'exit 3' line, and put the trap on EXIT (not a function that changes the code)."
  exit 1
fi

echo "Correct. The pan gets washed even when the dish burns, and the exit code is still 3."
exit 0
