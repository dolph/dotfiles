#!/bin/bash
set -e

ROLE=${1:-headless}
FEDORA=${2:-$(curl -s 'https://bodhi.fedoraproject.org/releases/?state=current&rows_per_page=20' \
    | python3 -c "
import sys, json
d = json.load(sys.stdin)
releases = [r for r in d['releases'] if r['id_prefix'] == 'FEDORA' and not r['version'].startswith('E')]
print(sorted(set(r['version'] for r in releases), key=int, reverse=True)[0])
")}

docker pull geerlingguy/docker-fedora${FEDORA}-ansible:latest

container_id=$(docker run --detach --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --volume="$(pwd):/etc/ansible:ro" geerlingguy/docker-fedora${FEDORA}-ansible:latest)
function cleanup {
    docker rm -f $container_id
}
trap cleanup EXIT

docker exec --tty "$container_id" env TERM=xterm /etc/ansible/bootstrap.sh

if [ "$ROLE" == "headless" ]; then
    docker exec --tty "$container_id" env TERM=xterm ansible-playbook /etc/ansible/headless.yml
elif [ "$ROLE" == "desktop" ]; then
    until docker exec --tty "$container_id" dnf groupinstall -y "Xfce Desktop"; do :; done
    docker exec --tty "$container_id" env TERM=xterm ansible-playbook /etc/ansible/desktop.yml
fi
