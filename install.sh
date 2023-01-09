#!/bin/bash

installCommon ()
{
    message "Common"
    sudo apt install \
        curl \
        htop \
        git \
        ruby-full \
        tree \
        vim \
        zsh \
        -y
}

message ()
{
    echo "####################################"
    echo "Installing $1"
    echo "####################################"
}

sudo apt update
sudo apt upgrade -y

installCommon
