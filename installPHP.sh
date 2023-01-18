#!/bin/bash

message ()
{
    echo -e "\n\n####################################"
    echo -e "Installing $1"
    echo -e "####################################\n"
}

addPPA ()
{
    if ! grep -q "ondrej/php" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
        sudo add-apt-repository ppa:ondrej/php -y
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

installComposer ()
{
	message "Composer"
    EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

    if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
    then
        >&2 message 'ERROR: Invalid installer checksum'
        rm composer-setup.php
        exit 1
    fi

    php composer-setup.php --quite
    RESULT=$?
    rm composer-setup.php
    sudo mv composer.phar /usr/local/bin/composer
}

installSymfonyCLI ()
{
	message "Symfony CLI"
    curl -sL https://get.symfony.com/cli/installer | bash
    sudo mv "$HOME/.symfony5/bin/symfony" /usr/local/bin/symfony
}

sudo apt update

installPHP7 "7.3"
installPHP7 "7.4"
installPHP "8.0"
installPHP "8.1"
installPHP "8.2"
installComposer
installSymfonyCLI