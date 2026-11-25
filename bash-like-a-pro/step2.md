# Step 2: add options with `getopts`

🎯 **Situation.** Real tools take switches: `-v` for chatty, `-t 4` for table 4. Doing this by hand with `$1`, `$2` gets messy fast.

🍽️ **Restaurant.** The order slip has tick-boxes (**verbose**) and fill-in boxes (**table number**), and then the list of dishes underneath. The chef reads the boxes first, then the dishes.

💻 **Technical.** Create `opts.sh`:

| You run | It prints |
|---|---|
| `bash opts.sh pasta tea` | `table: 1` then `dish: pasta` then `dish: tea` |
| `bash opts.sh -v -t 4 pasta` | `verbose: on` then `table: 4` then `dish: pasta` |
| `bash opts.sh -x pasta` | usage message on **stderr**, exit code `2` |

Building blocks:

- `getopts ":vt:" opt` reads one option per loop. `v` is a switch. `t:` takes a value (in `$OPTARG`). The leading `:` lets you handle bad options yourself, as `\?`.
- After the loop, run `shift $((OPTIND - 1))`. That throws away the options so `"$@"` holds only the dishes.

Skeleton:

```
#!/usr/bin/env bash
verbose=0
table=1

while getopts ":vt:" opt; do
  case "$opt" in
    v) verbose=1 ;;
    t) table="$OPTARG" ;;
    \?) echo "usage: opts.sh [-v] [-t TABLE] DISH..." >&2; exit 2 ;;
    :)  echo "option -$OPTARG needs a value" >&2; exit 2 ;;
  esac
done
shift $((OPTIND - 1))

[ "$verbose" -eq 1 ] && echo "verbose: on"
echo "table: $table"
for dish in "$@"; do
  echo "dish: $dish"
done
```

Try the three rows from the table, then press **Check**.
