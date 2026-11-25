#!/usr/bin/env bash
# Step 1 check: tables.sh prints 5 lines using a for loop.
cd ~ || exit 1
f=tables.sh

if [ ! -f "$f" ]; then
  echo "I cannot find tables.sh in your home folder."
  echo "Create it with: nano tables.sh"
  exit 1
fi

out=$(bash "$f" 2>&1)
want=$'Table 1 is ready\nTable 2 is ready\nTable 3 is ready\nTable 4 is ready\nTable 5 is ready'
if [ "$out" != "$want" ]; then
  echo "tables.sh printed:"
  echo "$out"
  echo
  echo "Expected exactly 5 lines, from 'Table 1 is ready' to 'Table 5 is ready'."
  echo "Hint: for i in {1..5}; do echo \"Table \$i is ready\"; done"
  exit 1
fi

if ! grep -qE '(^|[[:space:];])for[[:space:]]' "$f"; then
  echo "The output is right, but I do not see a for loop in tables.sh."
  echo "Use a loop instead of five echo lines."
  exit 1
fi

echo "Correct. One loop, five tables."
exit 0
