#!/bin/bash
sudo apt update --yes
sudo apt install software-properties-common --yes
sudo add-apt-repository --yes --update ppa:ansible/ansible --yes
sudo apt install ansible --yes
