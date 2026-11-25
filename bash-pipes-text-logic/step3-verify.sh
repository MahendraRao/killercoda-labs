#!/usr/bin/env bash
# Step 3 check: revenue.txt holds 1530.
cd ~ || exit 1

if [ ! -f revenue.txt ]; then
  echo "I cannot find revenue.txt in your home folder."
  echo "End your awk command with: > revenue.txt"
  exit 1
fi

val=$(tr -d '[:space:]' < revenue.txt)
case "$val" in
  1530) echo "Correct. Revenue is 1530."; exit 0 ;;
  950)  echo "You got 950: that adds the prices only. Multiply by qty: sum += \$3 * \$4" ;;
  10)   echo "You got 10: that adds the quantities only. Multiply by price: sum += \$3 * \$4" ;;
  "")   echo "revenue.txt is empty. Did the awk command end with > revenue.txt ?" ;;
  *)    echo "revenue.txt holds: [$val]. Expected 1530."
        echo "Use: awk -F, '{ sum += \$3 * \$4 } END { print sum }'" ;;
esac
exit 1
