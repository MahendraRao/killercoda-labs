# Step 1: repeat a job with a `for` loop

🎯 **Situation.** You want five tables announced as ready. Writing five `echo` lines is slow and does not scale to a hundred tables.

🍽️ **Restaurant.** The manager says: "For each table from 1 to 5, ring the bell." You do not write five separate notes.

💻 **Technical.** Create `tables.sh` that prints exactly:

```
Table 1 is ready
Table 2 is ready
Table 3 is ready
Table 4 is ready
Table 5 is ready
```

Use a `for` loop. `{1..5}` expands to `1 2 3 4 5`:

```
#!/usr/bin/env bash
for i in {1..5}; do
  echo "Table $i is ready"
done
```

Run it with `bash tables.sh`, then press **Check**.
