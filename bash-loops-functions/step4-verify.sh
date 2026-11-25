#!/usr/bin/env bash
# Step 4 check: bill.sh uses a price function and totals correctly on two files.
cd ~ || exit 1
f=bill.sh

if [ ! -f "$f" ]; then
  echo "I cannot find bill.sh in your home folder."
  echo "Create it with: nano bill.sh"
  exit 1
fi

fail=0

out=$(bash "$f" 2>&1)
want=$'tea x2 = 20\nsamosa x3 = 45\npasta x1 = 120\ncoffee x4 = 100\nTotal: 285'
if [ "$out" != "$want" ]; then
  echo "On bill.txt I expected:"
  echo "$want"
  echo "I got:"
  echo "$out"
  if printf '%s\n' "$out" | grep -q 'command not found'; then
    echo "'command not found': define the price function ABOVE the loop that calls it."
  fi
  if ! printf '%s\n' "$out" | grep -q 'coffee'; then
    echo "The coffee line is missing. The last line of bill.txt has no newline."
    echo "Use: while read -r item qty || [ -n \"\$item\" ]; do"
  fi
  fail=1
fi

tmp=$(mktemp)
printf 'pasta 2\ntea 1\nbiryani 3' > "$tmp"
out=$(bash "$f" "$tmp" 2>&1)
want=$'pasta x2 = 240\ntea x1 = 10\nbiryani x3 = 0\nTotal: 250'
if [ "$out" != "$want" ]; then
  echo "On another bill file ('pasta 2', 'tea 1', 'biryani 3') I expected:"
  echo "$want"
  echo "I got:"
  echo "$out"
  echo "Does your script read the file name from \$1 (file=\"\${1:-bill.txt}\")?"
  echo "And does the * case in your function print 0 for unknown dishes?"
  fail=1
fi
rm -f "$tmp"

if ! grep -qE '(^|[[:space:]])price[[:space:]]*\(\)|function[[:space:]]+price' "$f"; then
  echo "I do not see a function called price. Define it with: price() { ... }"
  fail=1
fi

if [ "$fail" -eq 0 ]; then
  echo "Correct. A loop, a function and a running total, all working together."
  exit 0
fi
exit 1
