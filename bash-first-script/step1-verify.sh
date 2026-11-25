#!/usr/bin/env bash
# Step 1 check: hello.sh exists, has the right shebang, prints the right line.
f=~/hello.sh

if [ ! -f "$f" ]; then
  echo "I cannot find hello.sh in your home folder."
  echo "Run 'pwd' to see where you are, then create the file there with: nano hello.sh"
  exit 1
fi

first=$(head -n 1 "$f")
if [ "$first" != "#!/usr/bin/env bash" ]; then
  echo "The first line of hello.sh must be exactly: #!/usr/bin/env bash"
  echo "Yours is: $first"
  exit 1
fi

out=$(bash "$f" 2>&1)
if [ "$out" != "Hello from my first script!" ]; then
  echo "Running hello.sh printed: [$out]"
  echo "It should print exactly: Hello from my first script!"
  echo "Check the spelling, the quotes, and that echo is on line 2."
  exit 1
fi

echo "Correct. Your recipe card works."
exit 0
