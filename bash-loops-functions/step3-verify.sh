#!/usr/bin/env bash
# Step 3 check: orders.sh prints all 4 orders including the last line without newline.
cd ~ || exit 1
f=orders.sh

if [ ! -f "$f" ]; then
  echo "I cannot find orders.sh in your home folder."
  echo "Create it with: nano orders.sh"
  exit 1
fi

out=$(bash "$f" 2>&1)
want=$'Order 1: tea\nOrder 2: samosa\nOrder 3: tea\nOrder 4: pasta\nTotal orders: 4'

if [ "$out" = "$want" ]; then
  echo "Correct. No order lost, even the one without a newline."
  exit 0
fi

echo "orders.sh printed:"
echo "$out"
echo
if printf '%s\n' "$out" | grep -qx 'Total orders: 3'; then
  echo "The total is 3, so the last line (pasta) was skipped."
  echo "The file has no newline at the end. Use: while IFS= read -r order || [ -n \"\$order\" ]; do"
else
  echo "Expected:"
  echo "$want"
fi
exit 1
