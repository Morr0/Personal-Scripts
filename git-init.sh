# Get current branch
alias gcurr='git branch --show-current'

# push branch
alias gup='git push origin $(git branch --show-current)'

# pull branch
alias gdown='git pull origin $(git branch --show-current)'

# git reset last commit to staging area
alias grsoft='git reset --soft HEAD~1'

# git reset hard last commit
alias grhard='git reset --hard HEAD~1'

# git log last 10
alias glog='git log -10 --oneline'

#git status
alias gstat='git status'
