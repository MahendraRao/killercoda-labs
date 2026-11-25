#!/usr/bin/env bash
# Runs in the background when the lab starts: create the practice files.
# orders.txt and bill.txt have NO newline after the last line on purpose.
cd ~ || exit 1

mkdir -p menu
: > menu/starters.txt
: > menu/mains.txt
: > "menu/main course.txt"

printf 'tea\nsamosa\ntea\npasta' > orders.txt
printf 'tea 2\nsamosa 3\npasta 1\ncoffee 4' > bill.txt
