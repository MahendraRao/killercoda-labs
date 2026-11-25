# Step 4: make a decision with `if`

🎯 **Situation.** Your script should behave differently depending on what it is given.

🍽️ **Restaurant.** The waiter asks "Spicy?". **If** the answer is very spicy, add extra chilli. **Else**, cook it mild. The chef checks the answer and follows one path.

💻 **Technical.** Write a script `size.sh` that takes a number as its first argument (`$1`) and prints:

- `big` if the number is **greater than 10**
- `small` otherwise (so `10` is `small`)

Example of how it will be used:

```
bash size.sh 50
```

should print `big`, and `bash size.sh 5` should print `small`.

Hints:
- Start with the shebang line, as always.
- The test is `[ "$1" -gt 10 ]`. Spaces inside `[ ]` matter.
- Shape: `if [ ... ]; then ... else ... fi`. Do not forget `then`.

Test it yourself on a few numbers, then press **Check**.
