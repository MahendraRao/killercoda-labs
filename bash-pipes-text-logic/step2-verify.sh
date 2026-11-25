#!/usr/bin/env bash
# Step 2 check: dishes.txt is the ranked count: 3 pasta, 2 tea, 1 soup.
cd ~ || exit 1

if [ ! -f dishes.txt ]; then
  echo "I cannot find dishes.txt in your home folder."
  echo "Build the pipe, then end it with: > dishes.txt"
  exit 1
fi

got=$(awk '{$1=$1; print}' dishes.txt)
want=$'3 pasta\n2 tea\n1 soup'

if [ "$got" = "$want" ]; then
  echo "Correct. Pasta is the best seller."
  exit 0
fi

echo "dishes.txt contains:"
cat dishes.txt
echo
if grep -q 'dish' dishes.txt; then
  echo "The header line was counted as a dish. Skip it with: tail -n +2 orders.csv"
elif ! grep -q 'pasta' dishes.txt; then
  echo "I do not see pasta. Did you cut column 2? Use: cut -d, -f2"
elif [ "$(wc -l < dishes.txt)" -gt 3 ]; then
  echo "More than 3 lines: the same dish is counted twice."
  echo "uniq only merges NEIGHBOURS. Put sort before uniq -c."
else
  echo "Counts or order look wrong. Expected, biggest first:"
  echo "3 pasta / 2 tea / 1 soup"
  echo "Finish the pipe with: | sort -rn > dishes.txt"
fi
exit 1
