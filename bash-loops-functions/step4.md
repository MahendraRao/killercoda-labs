# Step 4: build the bill with a function

🎯 **Situation.** `bill.txt` has a dish and a quantity on each line. You want a priced bill with a total. The prices should live in **one** place, so fixing a price means changing one line.

🍽️ **Restaurant.** The cashier reads each slip, looks the dish up on the **menu board**, multiplies by how many, and keeps a running total on the till.

💻 **Technical.** Look at the file:

```
cat bill.txt
```

Prices: `tea` 10, `samosa` 15, `pasta` 120, `coffee` 25. Anything else costs 0.

Create `bill.sh` with a **function** `price` that gives back the price of one dish. It must read the file named in the first argument, or `bill.txt` if there is none. Expected output:

```
tea x2 = 20
samosa x3 = 45
pasta x1 = 120
coffee x4 = 100
Total: 285
```

New idea: **`case`** is a menu board. It checks one value against several choices. `*)` means "anything else", `;;` ends each choice.

Skeleton:

```
#!/usr/bin/env bash
price() {
  case "$1" in
    tea)    echo 10 ;;
    samosa) echo 15 ;;
    pasta)  echo 120 ;;
    coffee) echo 25 ;;
    *)      echo 0 ;;
  esac
}

file="${1:-bill.txt}"
total=0
while read -r item qty || [ -n "$item" ]; do
  cost=$(( $(price "$item") * qty ))
  echo "$item x$qty = $cost"
  total=$((total + cost))
done < "$file"
echo "Total: $total"
```

Two things to remember:

- **Define the function before you call it.** Bash reads top to bottom. Call `price` on line 1 and you get `price: command not found`.
- `$(price "$item")` captures what the function printed with `echo`.

Run `bash bill.sh`, then press **Check**. It will also test your script on a second bill file.
