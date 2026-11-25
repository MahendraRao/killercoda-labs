# Step 3: total the day's revenue

🎯 **Situation.** Each row has a quantity and a price. Revenue is `qty × price`, added up over every row.

🍽️ **Restaurant.** For each slip, multiply "how many" by "price each", then drop the result into a running total jar. At the end, read the jar.

💻 **Technical.** `awk` reads a line at a time and splits it into columns: `$1`, `$2`, `$3`, `$4`. Tell it the separator is a comma with `-F,`. Columns 3 and 4 are qty and price. Try just the multiplication first:

```
tail -n +2 orders.csv | awk -F, '{ print $3 * $4 }'
```

Now keep a running total in a variable `sum`, and print it once at the end with `END`:

```
tail -n +2 orders.csv | awk -F, '{ sum += $3 * $4 } END { print sum }'
```

Save the single number in `revenue.txt` using `>`.

🧪 **You should see** one number in `revenue.txt`.

Press **Check** when it is ready.
