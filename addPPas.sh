#!/bin/bash

addPPAs ()
{
    message "PPA's"
    sudo add-apt-repository ppa:ondrej/php -y
}

message ()
{
    echo "####################################"
    echo "Installing $1"
    echo "####################################"
}

addPPAs

sudo apt update -y
sudo apt upgrade -y