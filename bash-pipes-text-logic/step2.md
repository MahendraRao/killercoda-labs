# Step 2: rank the dishes

🎯 **Situation.** Which dish sells best? `orders.csv` has one row per order. Count how many times each dish appears.

🍽️ **Restaurant.** Collect all the order slips, **sort them into piles by dish**, count each pile, then put the biggest pile first.

💻 **Technical.** Look at the file:

```
cat orders.csv
```

The dish is **column 2**. The first line is a header, so skip it. Build the belt one tool at a time and look at the output after each piece:

```
tail -n +2 orders.csv
tail -n +2 orders.csv | cut -d, -f2
tail -n +2 orders.csv | cut -d, -f2 | sort
tail -n +2 orders.csv | cut -d, -f2 | sort | uniq -c
```

`uniq -c` counts **neighbouring** equal lines, which is why `sort` must come first. Finish by sorting the counts from biggest to smallest with `sort -rn`, and save the result in `dishes.txt`.

🧪 **You should see** three lines, biggest first, like `3 pasta`.

Press **Check** when `dishes.txt` is ready.
