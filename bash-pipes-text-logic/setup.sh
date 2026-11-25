#!/usr/bin/env bash
# Runs in the background when the lab starts: create the two practice files.
cd ~ || exit 1

cat > kitchen.log <<'LOG'
2026-11-25 12:01:10 INFO  order 101 received (pasta)
2026-11-25 12:01:45 INFO  order 102 received (soup)
2026-11-25 12:03:02 WARN  stove 2 running hot
2026-11-25 12:04:30 ERROR order 101 burnt
2026-11-25 12:05:12 INFO  order 103 received (tea)
2026-11-25 12:06:40 ERROR order 102 out of salt
2026-11-25 12:07:15 INFO  order 104 received (pasta)
2026-11-25 12:07:50 WARN  oven needs cleaning
2026-11-25 12:08:20 WARN  fridge door open
LOG

cat > orders.csv <<'CSV'
table,dish,qty,price
4,pasta,2,250
2,soup,1,120
4,tea,3,40
7,pasta,1,250
2,tea,1,40
4,pasta,2,250
CSV
