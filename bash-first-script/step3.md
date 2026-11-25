# Step 3: break it, then fix it

🎯 **Situation.** A script that looks fine but fails. This is the number one beginner mistake.

🍽️ **Restaurant.** Someone wrote on the box *"TOMATO = 5"* with gaps. The chef reads it as an order: "do the thing called TOMATO, using ingredients `=` and `5`". He has no idea what dish that is.

💻 **Technical.** A script called `broken.sh` was just placed in your home folder (give it a few seconds). Look at it, then run it:

```
cat broken.sh
bash broken.sh
```

🧪 **You should see** an error like `name: command not found`, and a greeting with no name.

Bash thought `name` was a **command**. Fix the script so it prints `Hi Mahendra`. Edit it with `nano broken.sh`.

Hint: variables are written with **no spaces** around `=`.

Run `bash broken.sh` again. When it prints `Hi Mahendra`, press **Check**.
