#!/usr/bin/env bash
# Step 4 check: alarm.sh has the three required behaviours.
cd ~ || exit 1
f=alarm.sh

if [ ! -f "$f" ]; then
  echo "I cannot find alarm.sh in your home folder."
  echo "Create it with: nano alarm.sh"
  exit 1
fi

fail=0
tmp=$(mktemp -d)
printf '2026-11-25 12:00:00 INFO  all good\n' > "$tmp/clean.log"

out=$(bash "$f" kitchen.log 2>&1); code=$?
if [ "$out" != "ALERT: 2 error(s) found" ] || [ "$code" -ne 1 ]; then
  echo "On kitchen.log I expected: ALERT: 2 error(s) found, exit code 1"
  echo "I got: [$out], exit code $code"
  fail=1
fi

out=$(bash "$f" "$tmp/clean.log" 2>&1); code=$?
if [ "$out" != "All clear" ] || [ "$code" -ne 0 ]; then
  echo "On a file with no errors I expected: All clear, exit code 0"
  echo "I got: [$out], exit code $code"
  fail=1
fi

bash "$f" "$tmp/does-not-exist.log" >/dev/null 2>&1; code=$?
if [ "$code" -ne 2 ]; then
  echo "On a missing file I expected exit code 2, I got $code"
  echo "Hint: [ -f \"\$file\" ] || { echo \"no such file\"; exit 2; }"
  fail=1
fi

out=$(cd "$HOME" && bash "$f" 2>&1); code=$?
if [ "$code" -ne 1 ]; then
  echo "With no argument it should use kitchen.log and exit 1. I got exit code $code."
  echo "Hint: file=\"\${1:-kitchen.log}\""
  fail=1
fi

rm -rf "$tmp"
if [ "$fail" -eq 0 ]; then
  echo "Correct. Your script decides, and other tools can read its exit code."
  exit 0
fi
exit 1
