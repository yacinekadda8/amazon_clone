# Remove the files from the Git history
git rm -r --cached server/node_modules

# Update the Git index
git add .

# Commit the changes
git commit -m "Remove node_modules from Git history"
