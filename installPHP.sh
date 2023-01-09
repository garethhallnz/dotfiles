#!/bin/bash


if ! grep -q "ondrej/php" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
  add-apt-repository ppa:ondrej/php -y
fi

addPPA ()
{
    if ! grep -q "ondrej/php" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
        add-apt-repository ppa:ondrej/php -y
        sudo apt update
    fi
}

installPHP7 ()
{
    installPHP $1
    addPPA
    sudo apt install php$1-json -y
}

installPHP ()
{
	message "PHP $1"
    addPPA
    sudo apt install \
        php$1-bcmath \
        php$1-common \
        php$1-curl \
        php$1-dev \
        php$1-gd \
        php$1-imagick \
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

message ()
{
    echo "####################################"
    echo "Installing $1"
    echo "####################################"
}

installPHP7 "7.3"
installPHP7 "7.4"
installPHP "8.0"
installPHP "8.1"
installPHP "8.2"