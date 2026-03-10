default:
    @echo "available: push1(add, commit, push), push2(add, commit, switch, merge, push), branch(pull, switch, status)"

push1:
    @bash -c 'read -p "commit: " commit && git add . && git commit -m "$commit" && git push'

push2:
    @bash -c 'branch=$(git branch --show-current) || exit 1; if [ "$branch" = "main" ]; then echo "현재 브랜치가 main이라 중단합니다."; exit 1; fi; read -p "commit: " msg || exit 1; git add . && git commit -m "$msg" && git switch main && git pull --rebase && git merge --no-edit "$branch" && git push'

branch:
    @bash -c 'read -p "branch name: " name && git pull && git switch -c "$name" && git status'
    