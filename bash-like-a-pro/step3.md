# Step 3: clean up even when the script fails

🎯 **Situation.** Your script makes a temporary file. When the script fails halfway, the file stays behind. Run it nightly for a year and `/tmp` fills with junk.

🍽️ **Restaurant.** A chef who washes the pan only when the dish turns out well. Burnt dish? The dirty pan stays on the stove. A **trap** is the rule: *"however this shift ends, wash the pan first."*

💻 **Technical.** A script `job.sh` was just placed in your home folder (give it a few seconds). Look at it, then run it:

```
cat job.sh
bash job.sh
echo $?
ls /tmp/job.*
```

🧪 **You should see** a line `TMP=/tmp/job.xxxxxx`, the exit code `3`, and the temp file still sitting in `/tmp`. That is the leak.

Fix `job.sh` so the temp file is **deleted when the script exits**, and the exit code is **still `3`**. Edit it with `nano job.sh`.

Hint: right after the `tmp=$(mktemp ...)` line, add

```
trap 'rm -f "$tmp"' EXIT
```

The single quotes matter: `$tmp` is read when the trap **runs**, not when it is set. The `EXIT` trap runs on success and on failure, and it does not change the exit code.

Remove the old leftovers by hand (`rm -f /tmp/job.*`), run `bash job.sh` again, and check that `ls /tmp/job.*` finds nothing. Then press **Check**.
