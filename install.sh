#!/bin/bash

installCommon ()
{
    message "Common"
    sudo apt install \
        tree \
        -y
}

addPPAs ()
{
    message "PPA's"
    sudo add-apt-repository ppa:ondrej/php -y
}

installPHP ()
{
	message $1
    sudo apt install \
        php$1-bcmath \
        php$1-curl \
        php$1-dev \
        php$1-gd \
        php$1-imagick \
        php$1-mbstring \
        php$1-pdo \
        php$1-sqlite3 \
        php$1-xml \
        php$1-zip \
        -y
}

message ()
{
    echo "####################################"
    echo "Installing $1"
    echo "####################################"
}

# sudo apt update

# sudo apt upgrade


installCommon
addPPAs
installPHP "7.3"
installPHP "7.4"