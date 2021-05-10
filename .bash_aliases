# Overwrite standard commands
alias ls='gls --color=auto --group-directories-first'

# New helpful commands
alias dirsizes='ls | du -chd 1 | sort'
alias chrome="open -a 'Google Chrome.app'"
alias vscode="open -a 'Visual Studio Code.app'"
alias google-chrome="chrome"

# Admin operations
alias clear-dns="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias ls-ports="sudo lsof -iTCP -sTCP:LISTEN -n -P"

# Programming helpers
alias docker-stale-images="docker images | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3"
alias docker-vm-size="du -h ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2"
alias ipdb-help="echo '!import code; code.interact(local=vars())'" # Turns ipdb into a repl w multiline
alias remove-pyc-files="find . -name '*.pyc' -exec rm '{}' +"

# SS Specific Helpers
alias shweb='docker exec -it $(docker ps -f name=web --format {{.ID}}) sh'
alias ss-stop='docker stop $(docker ps --format {{.ID}} | grep -v $(docker ps -f name=styleseat_db --format {{.ID}}) | tr "\n" " ")'
alias ss-test="docker-compose run --service-ports web sh -c 'pip install ipdb pytest-watch && sh'"
alias ss-up="docker-compose up --build -d && docker-compose logs -f web worker"
alias ss-web-debug="docker-compose run --service-ports web sh -c 'pip install ipdb && python manage.py runserver 0.0.0.0:8000'"
alias ss-test-vscode="docker-compose run -e TEST_MODE=1 -e DEBUGPY_ADDRESS=0.0.0.0:5680 -e DEBUGPY_TEST_WAIT=1 -e DJANGO_SETTINGS_MODULE=settings.test -p 5680:5680 web sh -c 'pip install pytest-watch && sh'"
alias ss-deploy-landing="pushd ~/git/mobileweb/landing && npm i && AWS_PROFILE=dev ./bin/deploy staging && popd"
alias dc-run-web="cd ~/git/styleseat && docker-compose stop web && docker-compose run --service-ports web"
alias build-ios="pushd ~/git/mobileweb && nvm use && npm run build-app && cd phonegap && npx cordova build ios --buildFlag='-UseModernBuildSystem=0' && popd"

# Old
alias nginx.logs.error='tail -250f /usr/local/etc/nginx/logs/error.log|ccze'
alias nginx.logs.access='tail -250f /usr/local/etc/nginx/logs/access.log'
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
