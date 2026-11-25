#!/usr/bin/env bash
# Step 2 check: hello.sh is executable and runs directly.
f=~/hello.sh

if [ ! -f "$f" ]; then
  echo "hello.sh is missing. Go back to step 1 and create it first."
  exit 1
fi

if [ ! -x "$f" ]; then
  echo "hello.sh is not executable yet (no approved stamp)."
  echo "Run: chmod +x hello.sh"
  exit 1
fi

out=$("$f" 2>&1)
if [ "$out" != "Hello from my first script!" ]; then
  echo "./hello.sh printed: [$out]"
  echo "It should print: Hello from my first script!"
  exit 1
fi

echo "Correct. The head chef approved your card."
exit 0
