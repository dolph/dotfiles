#!/bin/bash
set -e

ROLE=${1:-headless}

container_id=$(docker run --detach --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro --volume="$(pwd):/etc/ansible:ro" geerlingguy/docker-fedora31-ansible:latest)
function cleanup {
    docker rm -f $container_id
}
trap cleanup EXIT

if [ "$ROLE" == "headless" ]; then
    docker exec --tty $container_id env TERM=xterm ansible-playbook /etc/ansible/headless.yml
elif [ "$ROLE" == "desktop" ]; then
    until docker exec --tty $container_id dnf groupinstall -y "Xfce Desktop"; do :; done
    docker exec --tty $container_id env TERM=xterm ansible-playbook /etc/ansible/desktop.yml
fi
