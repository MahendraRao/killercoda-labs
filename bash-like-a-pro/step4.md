# Step 4: count with an associative array

🎯 **Situation.** `words.txt` has one dish per line. You want how many times each appears: `pasta 3`, `soup 1`, `tea 2`.

🍽️ **Restaurant.** A **menu board** with names, not numbers. You do not look up "slot 7", you look up "pasta". Each time a slip says pasta, you add one tick next to the word *pasta*.

💻 **Technical.** First look at the file, and look carefully at the last line:

```
cat words.txt
tail -c 20 words.txt | od -c | tail -3
```

The last word has **no newline** at the end. This is common in real files. A plain `while read` loop **skips** that last line. The fix is the guard `|| [ -n "$w" ]`.

Create `count.sh`. It reads a file (first argument, default `words.txt`) and prints `word count`, one per line, sorted by word:

```
pasta 3
soup 1
tea 2
```

Skeleton:

```
#!/usr/bin/env bash
file="${1:-words.txt}"
declare -A count

while read -r w || [ -n "$w" ]; do
  count[$w]=$(( ${count[$w]:-0} + 1 ))
done < "$file"

for w in "${!count[@]}"; do
  echo "$w ${count[$w]}"
done | sort
```

`declare -A` creates the menu board. `${!count[@]}` lists all the names on it. `${count[$w]:-0}` means "the tick count, or 0 if this word is new".

Run it: `bash count.sh`. Expected: `pasta 3`, `soup 1`, `tea 2`. If pasta shows `2`, you lost the last line. Press **Check** when it is right.
