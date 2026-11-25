#!/usr/bin/env bash
# Step 1 check: portion.sh handles usage, default qty, qty, and a name with a space.
cd ~ || exit 1
f=portion.sh

if [ ! -f "$f" ]; then
  echo "I cannot find portion.sh in your home folder."
  echo "Create it with: nano portion.sh"
  exit 1
fi

fail=0

out=$(bash "$f" 2>/dev/null); code=$?
err=$(bash "$f" 2>&1 >/dev/null)
if [ "$code" -ne 2 ]; then
  echo "With no arguments I expected exit code 2, I got $code."
  echo "Hint: if [ \$# -lt 1 ]; then ... exit 2; fi"
  fail=1
elif [ -n "$out" ]; then
  echo "The usage message went to stdout. Send it to stderr: echo \"usage...\" >&2"
  fail=1
elif [ "$err" != "usage: portion.sh DISH [QTY]" ]; then
  echo "With no arguments the usage line should be exactly: usage: portion.sh DISH [QTY]"
  echo "I got on stderr: [$err]"
  fail=1
fi

out=$(bash "$f" pasta 2>&1); code=$?
if [ "$out" != "1 x pasta" ] || [ "$code" -ne 0 ]; then
  echo "'bash portion.sh pasta' should print: 1 x pasta (exit 0)"
  echo "I got: [$out] (exit $code). Hint: qty=\"\${2:-1}\""
  fail=1
fi

out=$(bash "$f" pasta 3 2>&1)
if [ "$out" != "3 x pasta" ]; then
  echo "'bash portion.sh pasta 3' should print: 3 x pasta"
  echo "I got: [$out]"
  fail=1
fi

out=$(bash "$f" "iced tea" 2 2>&1)
if [ "$out" != "2 x iced tea" ]; then
  echo "'bash portion.sh \"iced tea\" 2' should print: 2 x iced tea"
  echo "I got: [$out]. Did you quote \"\$dish\" ?"
  fail=1
fi

if [ "$fail" -eq 0 ]; then
  echo "Correct. Arguments, a default, and a usage message that goes to stderr."
  exit 0
fi
exit 1
