alias d='docker $*'
alias d-c='docker-compose $*'
alias dps='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"'

alias docker-nuke='docker rm -f $(docker ps -a -q) & docker rmi -f $(docker images -a -q) & docker volume rm $(docker volume ls -q) & docker network rm $(docker network ls | tail -n+2 | awk "{if($2 !~ /bridge|none|host/){ print $1 }}")'
