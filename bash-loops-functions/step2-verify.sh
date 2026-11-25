#!/usr/bin/env bash
# Step 2 check: list.sh prints one 'Item: menu/<name>' line per file, including the name with a space.
cd ~ || exit 1
f=list.sh

if [ ! -f "$f" ]; then
  echo "I cannot find list.sh in your home folder."
  echo "Create it with: nano list.sh"
  exit 1
fi

out=$(bash "$f" 2>&1 | LC_ALL=C sort)
want=$'Item: menu/main course.txt\nItem: menu/mains.txt\nItem: menu/starters.txt'

if [ "$out" = "$want" ]; then
  if grep -qE '\$\(ls|`ls' "$f"; then
    echo "The output is right, but you used ls inside the loop. That breaks on other names."
    echo "Use the glob instead: for f in menu/*; do"
    exit 1
  fi
  echo "Correct. The glob keeps 'main course.txt' as one item."
  exit 0
fi

echo "list.sh printed:"
bash "$f" 2>&1
echo
if printf '%s\n' "$out" | grep -qx 'Item: course.txt'; then
  echo "'main course.txt' was split into two items. Use: for f in menu/*; do"
  echo "and quote the variable: \"\$f\""
else
  echo "Expected one 'Item: menu/<name>' line for each of the 3 files:"
  echo "$want"
fi
exit 1
