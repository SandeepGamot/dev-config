# GIT

# alias

  # 1. status
	alias gs="git status"
  # 2. diff
	alias staged="git diff --cached --name-only --diff-filter=AM"
  # 3. commit
	alias gc="git commit"
  # 4. push
	alias gp="git push"
  # 5. pull
	alias gl="git pull"
  # 6. pull main/master
	alias glm="git pull origin main --no-rebase"
  # 7. branch
	alias gb="git branch"

# Functions	

set-wip() {
	git symbolic-ref refs/wip $(git symbolic-ref HEAD)
}

gco() {
    if [ "$1" = "wip" ]; then
        echo "Switching to WIP branch"
        git checkout $(git symbolic-ref refs/wip | sed 's|^refs/heads/||')
    else
        git checkout "$@"
    fi
}
