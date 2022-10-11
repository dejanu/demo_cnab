#!/usr/bin/env bash

# create docker group
sudo groupadd docker

# add user to the docker group
sudo usermod -aG docker ${USER}

# log out so that your group membership is re-evaluated or just
su -s ${USER}

# problems with ~/.docker permission denied
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R