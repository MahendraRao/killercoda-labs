# Step 3: read a file line by line

🎯 **Situation.** `orders.txt` has one order per line. You want to number them and count them.

🍽️ **Restaurant.** The orders are slips on a rail. You take one slip at a time, read it, add one to the tally, and move on until the rail is empty. That is a **`while` loop**.

💻 **Technical.** Look at the file:

```
cat orders.txt
```

Create `orders.sh` that prints:

```
Order 1: tea
Order 2: samosa
Order 3: tea
Order 4: pasta
Total orders: 4
```

The standard way to read a file line by line:

```
#!/usr/bin/env bash
n=0
while IFS= read -r order; do
  n=$((n + 1))
  echo "Order $n: $order"
done < orders.txt
echo "Total orders: $n"
```

Run it with `bash orders.sh`. Look closely at the output.

🧪 **Something is off.** The last order, `pasta`, is **missing**, and the total says 3. The last line of `orders.txt` has no newline at the end, and `read` refuses a line without one. This happens in real files all the time.

**Fix:** keep the loop going while `read` succeeded **or** the variable still holds text:

```
while IFS= read -r order || [ -n "$order" ]; do
```

Run it again. When all 4 orders show, press **Check**.
