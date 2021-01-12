#!/bin/sh 

# If a command fails then the deploy ends
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo

# Go to the public folder.
cd public

# Add change to git.
git add .

# Commit message.
msg="rebuild site at $(date +"%Y-%m-%d %T")"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

# Push.
git push orign main
