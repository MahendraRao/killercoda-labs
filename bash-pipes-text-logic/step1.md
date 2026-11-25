# Step 1: count the burnt orders

🎯 **Situation.** The manager asks: "How many ERROR lines are in today's diary?" You should not count them by eye.

🍽️ **Restaurant.** One person picks out the red-flagged pages. The next person counts them. A **conveyor belt** passes the pages between them.

💻 **Technical.** Look at the diary first:

```
cat kitchen.log
```

`grep ERROR kitchen.log` prints only the lines that contain the word `ERROR`. `wc -l` counts lines. Join them with a pipe, and save the answer in a file called `errors.txt` using `>`:

```
grep ERROR kitchen.log | wc -l > errors.txt
cat errors.txt
```

🧪 **You should see** one number in `errors.txt`.

When you have it, press **Check**.
