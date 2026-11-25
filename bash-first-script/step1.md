# Step 1: write and run `hello.sh`

🎯 **Situation.** You want the same message printed every time, without retyping it.

🍽️ **Restaurant.** You are writing a recipe card with one step: "say hello".

💻 **Technical.** Create a file called `hello.sh` in your current folder with exactly these two lines:

```
#!/usr/bin/env bash
echo "Hello from my first script!"
```

The first line is the **shebang**. It tells the system which chef reads this card.

Create it with the editor `nano`:

```
nano hello.sh
```

Type the two lines, then press `Ctrl+O`, `Enter` (save), and `Ctrl+X` (exit).

Prefer one command? This does the same thing:

```
printf '#!/usr/bin/env bash\necho "Hello from my first script!"\n' > hello.sh
```

Now hand the card to the chef:

```
bash hello.sh
```

🧪 **You should see:** `Hello from my first script!`

When you do, press **Check**.
