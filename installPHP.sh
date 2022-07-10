#!/bin/bash

installPHP7 ()
{
	message "PHP $1"
    sudo apt install \
        php$1-bcmath \
        php$1-common \
        php$1-curl \
        php$1-dev \
        php$1-gd \
        php$1-imagick \
        php$1-json \
        php$1-mbstring \
        php$1-mongodb \
        php$1-mysql \
        php$1-pdo \
        php$1-redis \
        php$1-sqlite3 \
        php$1-xml \
        php$1-zip \
        -y
}

installPHP8 ()
{
	message "PHP $1"
    sudo apt install \
        php8.0-bcmath \
        php8.0-common \
        php8.0-curl \
        php8.0-dev \
        php8.0-gd \
        php8.0-imagick \
        php8.0-mbstring \
        php8.0-mongodb \
        php8.0-mysql \
        php8.0-pdo \
        php8.0-redis \
        php8.0-sqlite3 \
        php8.0-xml \
        php8.0-zip \
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

installPHP7 "7.3"
installPHP7 "7.4"
installPHP8 "8.0"
# installPHP8 "8.1"