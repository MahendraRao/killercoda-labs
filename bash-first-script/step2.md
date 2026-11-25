# Step 2: the "approved to cook" stamp

🎯 **Situation.** Typing `bash hello.sh` every time is long. You want to run it directly.

🍽️ **Restaurant.** A new card is not trusted until the head chef stamps it "approved". Try cooking it without the stamp first.

💻 **Technical.** Run the script directly:

```
./hello.sh
```

🧪 **You should see:** `Permission denied`. That is not a bug. Linux does not trust new files to be programs.

Now add the stamp (`chmod` = change mode, `+x` = add *execute*) and run it again:

```
chmod +x hello.sh
./hello.sh
```

You should now see `Hello from my first script!`. Press **Check**.
