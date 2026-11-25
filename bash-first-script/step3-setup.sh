#!/usr/bin/env bash
# Runs in the background when step 3 starts: place the broken script.
cat > ~/broken.sh <<'SCRIPT'
#!/usr/bin/env bash
name = "Mahendra"
echo "Hi $name"
SCRIPT
