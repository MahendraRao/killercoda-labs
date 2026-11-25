#!/usr/bin/env bash
# Runs in the background when step 3 starts: place the leaky script.
cat > ~/job.sh <<'SCRIPT'
#!/usr/bin/env bash
tmp=$(mktemp /tmp/job.XXXXXX)
echo "TMP=$tmp"
echo "working on something big..." > "$tmp"
exit 3
SCRIPT
