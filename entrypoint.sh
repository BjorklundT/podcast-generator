#!/bin/bash
# Tell the system to use Bash to run this script

echo "====================="
# Print a visual divider (optional, just for clarity in the logs)

# Configure Git user name using GitHub-provided environment variable
git config --global user.name "${GITHUB_ACTOR}"

# Configure Git user email from an input variable (likely passed into the action)
git config --global user.email "${INPUT_EMAIL}"

# Allow Git to operate in the GitHub Actions workspace (avoids safety warnings)
git config --global --add safe.directory /github/workspace

# Run the Python script that generates the podcast feed XML
python3 /usr/bin/feed.py

# Add all changed files, commit with a message, and push to the main branch
git add -A && git commit -m "Update Feed"
git push --set-upstream origin main

echo "====================="
# Another visual divider (optional)