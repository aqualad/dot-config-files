# Bash Completion Scripts (Manual)

This repo contains the bash completion scripts for various tools/programs that aren't included in `bash-completion` by default. Instead, they must be added (or symlinked) into the `bash_completion.d/` directory with the proper permissions (`755`)

Some completion scripts are included in the installation, along with other supporting files (lib, include, etc):

 * Docker: /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
 * Docker Compose: /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion

Other scripts are generated by running a command in the corresponding program:
 * NPM: `npm completion > ./npm.bash-completion`
 * Pipenv: `pipenv --completion > ./pipenv.bash-completion`