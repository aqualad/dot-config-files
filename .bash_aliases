alias ls='gls --color=auto --group-directories-first'
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log|ccze'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias dirsizes='ls | du -chd 1 | sort'
alias chrome="open -a 'Google Chrome.app'"
alias vscode="open -a 'Visual Studio Code.app'"
alias google-chrome="chrome"
alias docker-stale-images="docker images | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3"
alias docker-vm-size="du -h ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2"
alias ls-ports="sudo lsof -iTCP -sTCP:LISTEN -n -P"
alias ipdb-help="echo '!import code; code.interact(local=vars())'" # Turns ipdb into a repl w multiline

alias sqitch_test_migration='sqitch deploy docker && sqitch verify docker && sqitch_run_revert_test' # Use this

# Git Help
alias push_tags='echo "Push a tag to a remote: git push <remote> :refs/tags/<tag>"'

# AWS
alias dyn='aws dynamodb'

# Docker
dexec() {
	docker exec -it $1 bash
}

# Run Ansible using the internal hostnames
alias ansible-playbook='ansible-playbook -e use_pvt_dns=true'
