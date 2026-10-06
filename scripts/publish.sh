#!/usr/bin/env bash
set -euo pipefail

REPO_NAME="${1:-claude-prompt-architect}"
VISIBILITY="${VISIBILITY:-public}"

echo "==> Checking GitHub CLI"
command -v gh >/dev/null 2>&1 || {
  echo "ERROR: gh is not installed."
  exit 1
}

echo "==> Checking git"
command -v git >/dev/null 2>&1 || {
  echo "ERROR: git is not installed."
  exit 1
}

echo "==> GitHub authentication"
gh auth status

if [[ ! -d .git ]]; then
  echo "==> Initializing Git repository"
  git init
fi

echo "==> Checking for obvious sensitive files"
if find . -type f \( -name '.env' -o -name '*.pem' -o -name '*.key' -o -name 'id_rsa' -o -name 'id_ed25519' \) \
  -not -path './.git/*' | grep -q .; then
  echo "ERROR: Potentially sensitive files found. Review before publishing:"
  find . -type f \( -name '.env' -o -name '*.pem' -o -name '*.key' -o -name 'id_rsa' -o -name 'id_ed25519' \) \
    -not -path './.git/*'
  exit 1
fi

echo "==> Staging repository"
git add .

echo
echo "==> Review staged files"
git status --short

echo
echo "==> Review staged diff"
git diff --cached --stat

if git diff --cached --quiet; then
  echo "Nothing new to commit."
else
  git commit -m "feat: publish Claude Prompt Architect"
fi

if git remote get-url origin >/dev/null 2>&1; then
  echo "==> Existing origin detected:"
  git remote get-url origin
  echo "Refusing to create or overwrite a remote automatically."
  echo "Inspect the remote and push manually if it is correct."
  exit 0
fi

echo "==> Checking whether GitHub repo already exists"
OWNER="$(gh api user --jq .login)"

if gh repo view "${OWNER}/${REPO_NAME}" >/dev/null 2>&1; then
  echo "ERROR: ${OWNER}/${REPO_NAME} already exists."
  echo "No remote was modified."
  exit 1
fi

echo "==> Creating GitHub repository"
gh repo create "${REPO_NAME}" \
  "--${VISIBILITY}" \
  --source=. \
  --remote=origin \
  --push \
  --description "Turn conversational engineering requirements into implementation-ready Claude and Claude Code prompts."

echo "==> Adding topics"
gh repo edit "${OWNER}/${REPO_NAME}" \
  --add-topic claude \
  --add-topic claude-code \
  --add-topic prompt-engineering \
  --add-topic developer-tools \
  --add-topic chatgpt \
  --add-topic ai-coding \
  --add-topic software-engineering \
  --add-topic angular \
  --add-topic android \
  --add-topic gcao

echo
echo "==> Repository created"
gh repo view "${OWNER}/${REPO_NAME}" --web=false
