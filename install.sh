#!/bin/bash

installCommon ()
{
    message "Common"
    sudo apt install \
        ruby-full \
        curl \
        tree \
        zsh \
        -y
}

message ()
{
    echo "####################################"
    echo "Installing $1"
    echo "####################################"
}

sudo apt update -y
sudo apt upgrade -y

installCommon
