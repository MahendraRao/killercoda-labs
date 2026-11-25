#!/usr/bin/env bash
# Step 2 check: opts.sh parses -v, -t VALUE, and treats the rest as dishes.
cd ~ || exit 1
f=opts.sh

if [ ! -f "$f" ]; then
  echo "I cannot find opts.sh in your home folder."
  echo "Create it with: nano opts.sh"
  exit 1
fi

fail=0

out=$(bash "$f" pasta tea 2>&1); code=$?
want=$'table: 1\ndish: pasta\ndish: tea'
if [ "$out" != "$want" ] || [ "$code" -ne 0 ]; then
  echo "'bash opts.sh pasta tea' should print:"
  echo "$want"
  echo "I got (exit $code):"
  echo "$out"
  fail=1
fi

out=$(bash "$f" -v -t 4 pasta 2>&1)
want=$'verbose: on\ntable: 4\ndish: pasta'
if [ "$out" != "$want" ]; then
  echo "'bash opts.sh -v -t 4 pasta' should print:"
  echo "$want"
  echo "I got:"
  echo "$out"
  if printf '%s' "$out" | grep -q 'dish: -t'; then
    echo "The options were treated as dishes. After the loop you need: shift \$((OPTIND - 1))"
  fi
  fail=1
fi

bash "$f" -x pasta >/dev/null 2>&1; code=$?
err=$(bash "$f" -x pasta 2>&1 >/dev/null)
if [ "$code" -ne 2 ] || [ -z "$err" ]; then
  echo "'bash opts.sh -x pasta' should print a usage message on stderr and exit 2."
  echo "I got exit code $code. Hint: the \\? case in your getopts loop."
  fail=1
fi

if [ "$fail" -eq 0 ]; then
  echo "Correct. Options first, dishes after, bad switches rejected."
  exit 0
fi
exit 1
