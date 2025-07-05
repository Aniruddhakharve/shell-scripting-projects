# 🔒 GitHub Read Access Checker 🔍

A Shell script to **list users with read-only access (pull permission)** to a specific GitHub repository. This tool leverages the GitHub REST API and is perfect for auditing collaborators across repositories.

---

## 📜 About

This script uses the GitHub API to:
- Authenticate using a GitHub Personal Access Token (PAT)
- Fetch all collaborators of a specified repository
- Filter and list users who have **read access only** (i.e., `pull: true` permission)

> ✅ Owner: [Aniruddha Kharve](https://www.linkedin.com/in/aniruddhakharve)  
> 📁 Repo: [`batch-b9`](https://github.com/Aniruddhakharve/batch-b9)

---

## 🚀 Features

- Lists collaborators with **read-only access**
- Uses `curl` and `jq` for clean API interaction
- Easily customizable and extendable
- Simple CLI usage with input validation

---

## 📂 Requirements

- GitHub account
- [Personal Access Token (PAT)](https://github.com/settings/tokens)
- `jq` installed (for JSON parsing)
- Linux-based shell (Bash)

---

## 🛠️ Usage

### 1. Export your GitHub credentials:

```bash
export username="your-github-username"
export token="your-personal-access-token"
```

2. Run the script:
```bash
./check_read_access.sh REPO_OWNER REPO_NAME
```
🔍 Example:
```bash
export username="aniruddhakharve"
export token="ghp_abcd1234xyz"

./check_read_access.sh aniruddhakharve batch-b9
```
💡 Output
```bash
Listing users with read access to aniruddhakharve/batch-b9...
Users with read access to aniruddhakharve/batch-b9:
devuser1
qaengineer
```
If no users with read access are found:
```bash
No users with read access found for aniruddhakharve/batch-b9.
```
---
 How It Works
---
 
Makes a GET request to:
https://api.github.com/repos/<owner>/<repo>/collaborators

Filters users where .permissions.pull == true using jq

Displays only those collaborators who have read-only rights

---

🔐 Security Notes
---

Never hardcode tokens into the script

Use environment variables or prompt-based input

Rotate your tokens regularly

---

🙋‍♂️ Author
---

Aniruddha Kharve

Linux & DevOps Enthusiast
