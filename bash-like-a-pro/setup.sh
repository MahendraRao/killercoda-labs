#!/usr/bin/env bash
# Runs in the background when the lab starts: create the practice file for step 4.
# The last word has NO newline at the end on purpose. That is a real-world trap.
cd ~ || exit 1
printf 'pasta\ntea\npasta\nsoup\ntea\npasta' > words.txt
