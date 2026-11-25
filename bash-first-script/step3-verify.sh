#!/usr/bin/env bash
# Step 3 check: broken.sh now prints "Hi Mahendra" with no errors.
f=~/broken.sh

if [ ! -f "$f" ]; then
  echo "broken.sh is not here yet. Wait a few seconds and press Check again."
  echo "If it is still missing, run: ls ~"
  exit 1
fi

out=$(bash "$f" 2>&1)
if [ "$out" = "Hi Mahendra" ]; then
  echo "Correct. You fixed it: no spaces around the = sign."
  exit 0
fi

echo "broken.sh printed:"
echo "$out"
case "$out" in
  *"command not found"*)
    echo "Bash still thinks 'name' is a command."
    echo "Hint: write name=\"Mahendra\" with NO spaces around the = sign." ;;
  *"Hi "|"Hi")
    echo "The greeting has no name. The variable is not set correctly."
    echo "Hint: name=\"Mahendra\" on its own line, then echo \"Hi \$name\"." ;;
  *)
    echo "Expected exactly: Hi Mahendra"
    echo "Keep the echo line as it is, and fix the name line." ;;
esac
exit 1
