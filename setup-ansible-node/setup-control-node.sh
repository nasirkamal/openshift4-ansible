#!/usr/bin/env bash

source vars.txt

cnode_username=${cnode_username:-"ansible"}
cnode_password=${cnode_password:-"ansible"}
tnode_username=${tnode_username:-"ansible"}
tnode_password=${tnode_password:-"ansible"}
tnode_hostname=${tnode_hostname:-"localhost"}


./scripts/create-pwless-sudoer-user.sh $cnode_username $cnode_password
./scripts/gen-ssh-key.sh $cnode_username
cp ./scripts/copy-ssh-id.sh /home/${cnode_username}/

sudo su - $cnode_username -c "~/copy-ssh-id.sh ${tnode_username} ${tnode_password} ${tnode_hostname}"
./scripts/install-python.sh
./scripts/install-ansible.sh