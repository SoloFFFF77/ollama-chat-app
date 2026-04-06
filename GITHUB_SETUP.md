# GitHub Setup Instructions

## How to Push This Project to GitHub

### 1. Create a GitHub Repository

1. Go to https://github.com/new
2. Enter repository name: `ollama-chat-app`
3. Add description: "A modern chat application powered by Ollama - runs locally on Termux"
4. Choose: **Public** (for easy sharing and installation)
5. Click "Create repository"

### 2. Initialize Git in Your Local Project

```bash
cd /path/to/ollama-chat-app
git init
```

### 3. Add GitHub Remote

Replace `yourusername` with your actual GitHub username:

```bash
git remote add origin https://github.com/yourusername/ollama-chat-app.git
```

### 4. Configure Git User (First Time Only)

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### 5. Stage All Files

```bash
git add .
```

### 6. Create Initial Commit

```bash
git commit -m "Initial commit: Ollama Chat App with Termux support"
```

### 7. Push to GitHub

```bash
git branch -M main
git push -u origin main
```

## Complete One-Time Setup Commands

```bash
# Navigate to project
cd ~/ollama-chat-app

# Initialize git
git init

# Add remote (replace yourusername)
git remote add origin https://github.com/yourusername/ollama-chat-app.git

# Configure git
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Stage files
git add .

# Commit
git commit -m "Initial commit: Ollama Chat App"

# Push
git branch -M main
git push -u origin main
```

## After Initial Push - Future Updates

```bash
# Make changes
# ... edit files ...

# Stage changes
git add .

# Commit
git commit -m "Description of changes"

# Push
git push origin main
```

## Update Installation URLs

After pushing to GitHub, update these URLs in your documentation:

**In README.md:**
```markdown
curl -fsSL https://raw.githubusercontent.com/yourusername/ollama-chat-app/main/install-termux.sh | bash
```

**In quick-install.sh:**
```bash
REPO_URL="https://github.com/yourusername/ollama-chat-app.git"
```

Replace `yourusername` with your actual GitHub username.

## Verify Everything

### Check Remote Setup
```bash
git remote -v
```

Should show:
```
origin  https://github.com/yourusername/ollama-chat-app.git (fetch)
origin  https://github.com/yourusername/ollama-chat-app.git (push)
```

### Check Commit History
```bash
git log
```

### Check Repository Status
```bash
git status
```

## Installation from GitHub

Once pushed, users can install with:

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/ollama-chat-app/main/quick-install.sh | bash
```

Or clone directly:
```bash
git clone https://github.com/yourusername/ollama-chat-app.git
cd ollama-chat-app
chmod +x install-termux.sh
./install-termux.sh
```

## Troubleshooting

### Authentication Error
```bash
# Use personal access token for HTTPS
git remote set-url origin https://yourusername:your_token@github.com/yourusername/ollama-chat-app.git
```

### File Permissions Lost
```bash
# Reapply execute permissions
chmod +x install-termux.sh quick-install.sh start-*.sh

# Commit the changes
git add -A
git commit -m "Fix script permissions"
git push
```

### Files Not Appearing on GitHub
```bash
# Check what files git knows about
git ls-files

# If files are missing, ensure they're added
git add .
git commit -m "Add missing files"
git push
```

## GitHub Pages (Optional)

Deploy README as a website:

1. Go to repository Settings
2. Scroll to "GitHub Pages"
3. Select "main" branch
4. Your README will be at: `https://yourusername.github.io/ollama-chat-app`

## Adding Contributors

1. Go to Settings → Collaborators
2. Add GitHub usernames of team members
3. They can push directly to main branch

## Creating Releases

Tag important versions:

```bash
# Create a tag
git tag -a v1.0.0 -m "Version 1.0.0 - Initial Release"

# Push tags
git push origin --tags
```

Then go to GitHub → Releases → Draft New Release to create changelog.

## GitHub Actions (Optional)

Automate testing and deployment with `.github/workflows/main.yml`:

```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm install
      - run: npm test
```

## License

Add LICENSE file (MIT recommended):

```bash
curl https://opensource.org/licenses/MIT > LICENSE
```

Then commit:
```bash
git add LICENSE
git commit -m "Add MIT license"
git push
```

## Project Badges

Add to README.md top:

```markdown
![Node.js Version](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Platform: Termux](https://img.shields.io/badge/Platform-Termux-blue)
```

## Success!

Your project is now on GitHub and ready for:
- ✅ Easy installation from GitHub
- ✅ Version control and backup
- ✅ Community contributions
- ✅ Issue tracking
- ✅ Pull requests
- ✅ Releases and versions
- ✅ GitHub Pages documentation

---

**Need help?** Visit: https://docs.github.com
