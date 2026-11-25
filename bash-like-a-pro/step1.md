# Step 1: take arguments, with a default and a usage message

🎯 **Situation.** Your script has a dish name written inside it. A colleague wants another dish, and should not have to edit your file.

🍽️ **Restaurant.** The card says: *"Cook ____, ____ portions."* The waiter fills the blanks on each slip. If the dish blank is empty, the chef sends the slip back with a note on how to fill it.

💻 **Technical.** Create `portion.sh` that behaves like this:

| You run | It prints | Exit code |
|---|---|---|
| `bash portion.sh` | `usage: portion.sh DISH [QTY]` (to **stderr**) | `2` |
| `bash portion.sh pasta` | `1 x pasta` | `0` |
| `bash portion.sh pasta 3` | `3 x pasta` | `0` |
| `bash portion.sh "iced tea" 2` | `2 x iced tea` | `0` |

Building blocks:

- `$1` is the first argument, `$2` the second, `$#` is how many there are.
- `${2:-1}` means "`$2`, or `1` if it is empty".
- `echo "..." >&2` sends text to stderr, the error channel.
- Always quote: `"$dish"`. The last row has a space in the name.

Skeleton:

```
#!/usr/bin/env bash
if [ $# -lt 1 ]; then
  echo "usage: portion.sh DISH [QTY]" >&2
  exit 2
fi
dish="$1"
qty="${2:-1}"
echo "$qty x $dish"
```

Test all four rows from the table, then press **Check**.
