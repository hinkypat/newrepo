#! /bin/sh
repoName=$1

while [ -z "$repoName" ]
do
    echo 'Provide a repository name'
    read -r -p $'Repository name:' repoName
done

echo "# $repoName" >> README.md
git init
git add .
git commit -m "First commit"

curl -u <hinkypat> https://api.github.com/user/repos -d '{"name": "'"$repoName"'", "private":false}'

GIT_URL=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/<hinkypat>/"$repoName" | jq -r '.clone_url')

git remote add origin https://github.com/hinkypat/newrepo.git
git branch -M main
git push -u origin main

