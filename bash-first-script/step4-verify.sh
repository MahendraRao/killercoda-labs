#!/usr/bin/env bash
# Step 4 check: size.sh prints big for >10 and small otherwise.
f=~/size.sh

if [ ! -f "$f" ]; then
  echo "I cannot find size.sh in your home folder."
  echo "Create it with: nano size.sh"
  exit 1
fi

if [ "$(head -n 1 "$f")" != "#!/usr/bin/env bash" ]; then
  echo "Start size.sh with the shebang line: #!/usr/bin/env bash"
  exit 1
fi

check() {
  local arg="$1" want="$2" got
  got=$(bash "$f" "$arg" 2>&1)
  if [ "$got" != "$want" ]; then
    echo "bash size.sh $arg printed: [$got]"
    echo "It should print exactly: $want"
    case "$got" in
      *"syntax error"*|*"unexpected"*)
        echo "That looks like a syntax error. Did you forget 'then' or 'fi'?
Remember: if [ ... ]; then ... else ... fi" ;;
    esac
    return 1
  fi
}

check 50 big   || exit 1
check 5 small  || exit 1
check 10 small || exit 1

echo "Correct. Your script decides: 50 is big, 5 and 10 are small."
exit 0
