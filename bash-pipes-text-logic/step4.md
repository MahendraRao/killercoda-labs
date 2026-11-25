# Step 4: write an alarm script

🎯 **Situation.** You want a script the shift manager can run any time. It should shout only when the diary has errors, and it should tell other tools about it through its **exit code**.

🍽️ **Restaurant.** A smoke alarm. Silent and green when all is fine. Loud and red when not. Other machines (the sprinkler) only look at red or green.

💻 **Technical.** Create `alarm.sh`. It takes an optional file name (default `kitchen.log`) and must behave like this:

| Situation | It prints | Exit code |
|---|---|---|
| file has ERROR lines | `ALERT: 2 error(s) found` (the real count) | `1` |
| file has no ERROR lines | `All clear` | `0` |
| file does not exist | any message | `2` |

Building blocks:

- `file="${1:-kitchen.log}"` uses the first argument, or `kitchen.log` if none.
- `[ -f "$file" ]` tests that a file exists.
- `grep -c ERROR "$file"` prints how many lines match.
- `exit 1` stops the script with that exit code.

Skeleton, fill in the blanks:

```
#!/usr/bin/env bash
file="${1:-kitchen.log}"

[ -f "$file" ] || { echo "no such file: $file"; exit 2; }

count=$(grep -c ERROR "$file")
if [ "$count" -gt 0 ]; then
  echo "ALERT: ... error(s) found"
  exit ...
fi
echo "All clear"
```

Test it, then look at the exit code with `echo $?`:

```
bash alarm.sh
echo $?
```

🧪 **You should see** `ALERT: 2 error(s) found` and then `1`.

Press **Check** when it works. It will also test it against a clean file.
