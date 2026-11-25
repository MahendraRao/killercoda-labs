# Step 2: loop over files, even with spaces in the name

🎯 **Situation.** You want to do something with every file in the `menu` folder. One file has a **space** in its name, and that breaks the common beginner approach.

🍽️ **Restaurant.** The box labelled *"main course"* is two words. If you read the label out loud and split on the space, you get a box called "main" and a box called "course". Neither exists.

💻 **Technical.** First look at the folder:

```
ls menu
```

Now see the trap. This splits the names at spaces:

```
for f in $(ls menu); do echo "Item: $f"; done
```

You get `main` and `course.txt` as **separate** items. Do not use `$(ls ...)` in a loop.

Instead, let the shell match the files itself with a **glob** (`menu/*`), and **quote** the variable:

Create `list.sh` that prints one line per file, in this form:

```
Item: menu/main course.txt
Item: menu/mains.txt
Item: menu/starters.txt
```

Skeleton:

```
#!/usr/bin/env bash
for f in menu/*; do
  echo "Item: $f"
done
```

Run `bash list.sh`, check it looks like the three lines above, then press **Check**.
