#!/usr/bin/env bash
# Step 4 check: count.sh counts words with an associative array, incl. the last line without newline.
cd ~ || exit 1
f=count.sh

if [ ! -f "$f" ]; then
  echo "I cannot find count.sh in your home folder."
  echo "Create it with: nano count.sh"
  exit 1
fi

fail=0

out=$(bash "$f" 2>&1); code=$?
want=$'pasta 3\nsoup 1\ntea 2'
if [ "$out" != "$want" ] || [ "$code" -ne 0 ]; then
  echo "'bash count.sh' should print:"
  echo "$want"
  echo "I got (exit $code):"
  echo "$out"
  if printf '%s\n' "$out" | grep -qx 'pasta 2'; then
    echo "pasta is 2, not 3: the last line has no newline, so 'while read' skipped it."
    echo "Fix: while read -r w || [ -n \"\$w\" ]; do"
  fi
  fail=1
fi

tmp=$(mktemp)
printf 'b\na\nb\nc\nb\na\nc' > "$tmp"
out=$(bash "$f" "$tmp" 2>&1)
want=$'a 2\nb 3\nc 2'
if [ "$out" != "$want" ]; then
  echo "On a different file ('b a b c b a c') I expected:"
  echo "$want"
  echo "I got:"
  echo "$out"
  echo "Does your script read the file name from \$1 (file=\"\${1:-words.txt}\")?"
  fail=1
fi
rm -f "$tmp"

if [ "$fail" -eq 0 ]; then
  echo "Correct. A menu board with names, and no line lost."
  exit 0
fi
exit 1
