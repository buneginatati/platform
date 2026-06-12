#!/usr/bin/env bash
set -e
cd /root/platform-deploy
git init -b main >/dev/null 2>&1 || git init >/dev/null 2>&1
git symbolic-ref HEAD refs/heads/main 2>/dev/null || true
git config user.name "Tatiana Bunegina"
git config user.email "info@bunegina.ru"
touch .nojekyll
printf '.DS_Store\nnode_modules\n' > .gitignore
git add -A
git commit -q -m "Лендинг: платформа Инвестиции просто (первая версия)" -m "Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"
git remote remove origin 2>/dev/null || true
git remote add origin git@github.com:buneginatati/platform.git
git push -u origin main 2>&1
echo "PUSH_DONE"
git log --oneline -1
