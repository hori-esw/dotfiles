#!/usr/bin/env bash

if ! [ `which ansible` ]; then
    # apt-get update -y
    # apt-get install -y ansible
    yum update -y
    yum localinstall -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    yum install -y ansible
fi

ansible-playbook -i /vagrant/ansible/hosts /vagrant/ansible/local-playbook_py.yml
