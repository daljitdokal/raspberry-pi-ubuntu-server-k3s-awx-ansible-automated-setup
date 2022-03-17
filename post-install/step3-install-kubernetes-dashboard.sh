#!/bin/bash

# Run kubernetes dashboard installation playbook
ansible-playbook playbook/kubernetes-dashboard/playbook-install-kubernetes-dashboard.yml -i inventory/geeky-server-build/hosts.ini
