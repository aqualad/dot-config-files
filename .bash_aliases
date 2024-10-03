# Overwrite standard commands
if which gls > /dev/null; then alias ls='gls --color=auto --group-directories-first'; fi
if which colordiff > /dev/null; then alias diff="colordiff --side-by-side --suppress-common-lines"; fi

# New helpful commands
alias dirsizes='ls | du -chd 1 | sort'
alias chrome="open -a 'Google Chrome.app'"
alias vscode="open -a 'Visual Studio Code.app'"
alias google-chrome="chrome"
alias ip-local="ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print \$2}'"

# Admin operations
alias clear-dns="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias ls-ports="sudo lsof -iTCP -sTCP:LISTEN -n -P"
alias network-restart="sudo ifconfig en6 down && echo 'Restarting...' && sleep 2 && sudo ifconfig en6 up && echo 'Success!'"
alias ls-sleep='pmset -g log|grep -e " Sleep  " -e " Wake  "'

# Programming helpers
alias docker-emu-reset="docker run --rm --privileged aptman/qus -- -r"
alias docker-emu-x86_64="docker-emu-reset && docker run --rm --privileged aptman/qus -s -- -p x86_64"
alias docker-login="docker login -u aqualad --password $DOCKER_ACCESS_TOKEN"
alias docker-stale-images="docker images | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3"
alias docker-vm-size="du -h ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2"
alias ipdb-help="echo '!import code; code.interact(local=vars())'" # Turns ipdb into a repl w multiline
alias remove-pyc-files="find . -name '*.pyc' -exec rm '{}' +"

# Go to specific directory aliases
alias go-be="cd ~/git/styleseat"
alias go-fe="cd ~/git/mobileweb"
alias go-srch="cd ~/git/search-api-2.0"

# SS Specific Helpers
alias ss-test-help='echo "ptw -v styleseat/schedule/tests/views/test_online_booking_payment_hold.py -- -s --sw"'
alias shweb='docker exec -e DEBUGPY_ADDRESS= -e DEBUGPY_TEST_WAIT= -it $(docker ps -f name=web -f status=running --latest --format {{.ID}}) sh'
alias shsearch='docker exec -it $(docker ps -f name=search-flask -f status=running --latest --format {{.ID}}) sh'
alias ss-shell="shweb -c 'python manage.py shell'"
alias ss-shell-debug=".vscode/bin/vscode-debug-manage-py.sh shell"
alias ss-rm-web='docker rm $(docker ps -a -f name=web --format {{.ID}})'
alias ss-stop-except-db='docker stop $(docker ps -f status=running -f status=created --format {{.ID}} | grep -v $(docker ps -f name=styleseat.db --format {{.ID}}) | tr "\n" " ")'
# alias ss-stop='docker stop $(docker ps --format {{.ID}} | grep -v $(docker ps -f name=styleseat.db --format {{.ID}}) | tr "\n" " ")'
alias ss-stop='ss-stop-except-db && ss-rm-web'
alias ss-test="docker compose run --service-ports web sh"
#alias ss-docker-login='$(aws --profile=dev ecr get-login --no-include-email)'
#alias ss-docker-login-aws='aws ecr get-login-password --region us-west-2 --profile dev | docker login --username AWS --password-stdin 788799692764.dkr.ecr.us-west-2.amazonaws.com'
alias ss-docker-login-aws='aws-vault exec styleseat-dev -- aws ecr get-login-password --region us-west-2 | docker login -u AWS --password-stdin https://788799692764.dkr.ecr.us-west-2.amazonaws.com'
alias ss-docker-login='docker-login && ss-docker-login-aws'
alias ss-up="go-be && ss-docker-login && docker compose up --build -d && docker compose logs -f web worker"
alias ss-up-kibana="go-srch && ss-docker-login && docker-emu-reset && aws-vault exec styleseat-dev -- docker compose up --build -d kibana"
# alias ss-search-up="go-srch && ss-up-kibana && docker-emu-x86_64 && aws-vault exec styleseat-dev -- docker compose up --build -d && docker compose logs -f"
alias ss-search-up="go-srch && docker-emu-reset && docker-emu-x86_64 && aws-vault exec styleseat-dev -- docker compose up --build -d && docker compose logs -f"
alias ss-up-debug="export DEBUGPY_ADDRESS=0.0.0.0:5679 && ss-up"
alias ss-web-debug="go-be && docker compose run --service-ports web sh -c 'pip install ipdb && python manage.py runserver 0.0.0.0:8000'"
alias ss-test-vscode="go-be && docker compose run -e TEST_MODE=1 -e DEBUGPY_ADDRESS=0.0.0.0:5680 -e DEBUGPY_TEST_WAIT=1 -e DJANGO_SETTINGS_MODULE=settings.test -p 5680:5680 web sh -c 'echo \"ptw -v styleseat/schedule/tests/views/test_online_booking_payment_hold.py -- -s --sw\" && sh'"
alias ss-migrate="go-be && docker compose run web python manage.py migrate --noinput"
alias ss-vpn="tunblkctl connect --wait $(tunblkctl ls) && ping -t 5 -o www.google.com && echo 'Success'"
alias ss-vpn-stop="tunblkctl disconnect $(tunblkctl ls) && network-restart && sleep 3 && ping -t 5 -o www.google.com && echo 'Success'"
alias ss-deploy-landing="pushd ~/git/mobileweb/landing && npm i && AWS_PROFILE=dev ./bin/deploy staging && popd"
alias ss-clean-mobileweb="pushd ~/git/mobileweb && npm run clean-phonegap && rm -rf dist/ app/bower_components/ tmp node_modules/ build/ js-cache/ && popd"
alias dc-run-web="cd ~/git/styleseat && docker compose stop web && docker compose run --service-ports web"
# alias build-ios="pushd ~/git/mobileweb && npm run build-app && cd phonegap && npx cordova build ios --buildFlag='-UseModernBuildSystem=0' && popd"
# alias _build-ios-webpack="echo 'Building Webpack $ENV_NAME' && npm run build-app:dev && echo '$ENV_NAME'"
# alias _build-ios-cordova="echo 'Building Cordova' && arch -x86_64 ./bin/build-ios.sh && echo 'Finished building Cordova'"
_build-ios-webpack() {
	echo "Building Webpack $ENV_NAME";
	npm run build-app:dev;
	echo "$ENV_NAME";
}
_build-ios-cordova() {
	echo "Building Cordova";
	arch -x86_64 ./bin/build-ios.sh;
	echo "Finished building Cordova";
}
alias build-ios-stage="pushd ~/git/mobileweb && ENV_NAME=staging _build-ios-webpack && _build-ios-cordova && cd phonegap && open platforms/ios/StyleSeat.xcworkspace && popd"
alias build-ios-stage-old='pushd ~/git/mobileweb && ENV_NAME=staging npm run build-app:dev && arch -x86_64 ./bin/build-ios.sh && cd phonegap && open platforms/ios/StyleSeat.xcworkspace && popd'
alias build-ios-stage-clean="pushd ~/git/mobileweb && npm run clean-phonegap && npm ci && ENV_NAME=staging _build-ios-webpack && pod repo update && arch -x86_64 ./bin/build-ios.sh && cd phonegap && open platforms/ios/StyleSeat.xcworkspace && popd"
alias rebuild-ios="pushd ~/git/mobileweb && ENV_NAME=staging _build-ios-webpack && cp -R phonegap/www/* phonegap/platforms/ios/www/ && cd phonegap && open platforms/ios/StyleSeat.xcworkspace && popd"
alias build-ios-clean-cache="rm -rf ~/Library/Developer/Xcode/DerivedData/ && open ~/git/mobileweb/phonegap/platforms/ios/StyleSeat.xcworkspace"
alias ss-stripe-startup="echo \"*** REMINDER: Login after 90 days, Only listening to necessary events ***\""
alias ss-stripe-payment-intent="ss-stripe-startup && stripe listen --forward-to loc.styleseat.com/api/v1/webhook/stripe.json -e payment_intent.amount_capturable_updated"
alias ss-stripe-payout="ss-stripe-startup && stripe listen --forward-to loc.styleseat.com/api/v1/webhook/stripe.json -e transfer.created,transfer.paid,balance.available"
alias ss-stripe-all-webhooks="ss-stripe-startup && stripe listen --forward-to loc.styleseat.com/api/v1/webhook/stripe.json -e account.updated,account.external_account.updated,charge.captured,charge.pending,charge.succeeded,charge.failed,charge.updated,charge.refunded,customer.source.deleted,customer.source.updated,payment_intent.amount_capturable_updated,payment_intent.canceled,payment_intent.payment_failed,transfer.created,transfer.failed,transfer.paid,transfer.reversed"
alias ss-stripe-no-account-webhooks="ss-stripe-startup && stripe listen --forward-to loc.styleseat.com/api/v1/webhook/stripe.json -e charge.captured,charge.pending,charge.succeeded,charge.failed,charge.updated,charge.refunded,customer.source.deleted,customer.source.updated,payment_intent.amount_capturable_updated,payment_intent.canceled,payment_intent.payment_failed,transfer.created,transfer.failed,transfer.paid,transfer.reversed"
alias ss-jiggle="while true; do cliclick -r w:570000 m:50,50; done"
alias ss-sleep="ss-jiggle & watch -n 5 -d --color 'pmset -g log|grep -e \" Sleep  \" -e \" Wake  \"' && fg"

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
