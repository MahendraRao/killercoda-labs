#!/usr/bin/env bash
# Step 1 check: errors.txt holds the number of ERROR lines (2).
cd ~ || exit 1

if [ ! -f kitchen.log ]; then
  echo "kitchen.log is not here yet. Wait a few seconds and press Check again."
  exit 1
fi

if [ ! -f errors.txt ]; then
  echo "I cannot find errors.txt in your home folder."
  echo "Run: grep ERROR kitchen.log | wc -l > errors.txt"
  exit 1
fi

val=$(tr -d '[:space:]' < errors.txt)
case "$val" in
  2) echo "Correct. Two ERROR lines, counted by a pipe, not by eye."; exit 0 ;;
  9) echo "You got 9: that is every line. Did you forget grep ERROR before wc -l?" ;;
  3) echo "You got 3: that is the WARN lines. Search for the word ERROR." ;;
  4) echo "You got 4: that is the INFO lines. Search for the word ERROR." ;;
  "") echo "errors.txt is empty. Make sure the command ends with: > errors.txt" ;;
  *) echo "errors.txt holds: [$val]. Expected a single number." 
     echo "Run: grep ERROR kitchen.log | wc -l > errors.txt" ;;
esac
exit 1
