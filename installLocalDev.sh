#!/bin/bash

# Colours
endColor="\e[0m\e[0m"
redColor="\e[0;31m\e[1m"
cyanColor="\e[01;96m\e[1m"
greenColor="\e[0;32m\e[1m"
yellowColor="\e[0;33m\e[1m"
dot="${redColor}[${endColor}${yellowColor}*${endColor}${redColor}] ${endColor}"

# CTRL + C
trap ctrl_c INT

function ctrl_c() {
    echo -e "\n\n${dot}${yellowColor}Exiting...${endColor}"
    message "${yellowColor}RUN ${greenColor}omz reload${endColor} to register commands${endColor}"
    exit
}

# Prompt
prompt=$(echo -e "${redColor}\n┌─[${cyanColor}Please select the PHP version you want to switch to${endColor}${redColor}]\n└──╼ ${endColor}")

message ()
{
    echo -e "\n\n####################################"
    echo -e "$1"
    echo -e "####################################\n"
}

function menu() {
	echo -e "\n${yellowColor}1) ${endColor}${yellowColor}Install NVM${endColor}"
	echo -e "${yellowColor}2) ${endColor}${yellowColor}Install Yarn${endColor}"
	echo -e "${yellowColor}3) ${endColor}${yellowColor}Install Docker${endColor}"
	echo -e "${yellowColor}4) ${endColor}${yellowColor}Install Lando${endColor}"
	echo -e "${yellowColor}5) ${endColor}${yellowColor}Install Lagoon CLI${endColor}"
    echo -e "${yellowColor}6) ${endColor}${yellowColor}Install Platform CLI${endColor}"
    echo -e "${yellowColor}q) ${endColor}${redColor}Exit${endColor}"

	if [ "$error" == "0" ]; then
	echo -e "\n\n${dot}${yellowColor}Option does not exist, retry${endColor}";
	fi;

	read -p "$prompt" option
}



commandExists () {
    # which "$1"
    command -v "$1" >/dev/null 2>&1
}

installNvm () 
{   
    message "Installing NVM"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    source $HOME/.zshrc 
    message "Installing node"
    nvm install --lts
}

installYarn () 
{
    message "Installing Yarn"
    npm install --global yarn
    zsh source $HOME/.zshrc
}

installDocker () 
{
    message "Installing Docker"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    rm get-docker.sh
    zsh source $HOME/.zshrc
}

installLando () 
{
    message "Installing Lando"
    wget https://files.lando.dev/installer/lando-x64-stable.deb -P /tmp
    sudo dpkg -i /tmp/lando-x64-stable.deb
    source $HOME/.zshrc
}

installLagoonCLI () 
{
    message "Installing Lagoon CLI"
    sudo curl -L "https://github.com/uselagoon/lagoon-cli/releases/download/v0.16.0/lagoon-cli-v0.16.0-linux-amd64" -o /usr/local/bin/lagoon && sudo chmod +x /usr/local/bin/lagoon
    source $HOME/.zshrc
}

installPlatformShCLI () 
{
    message "Installing PlatformShCli"
    wget https://github.com/platformsh/cli/releases/download/4.0.2/platformsh-cli_4.0.2_linux_amd64.deb -P /tmp
    sudo dpkg -i /tmp/platformsh-cli_4.0.2_linux_amd64.deb
    source $HOME/.zshrc
}

function run() {
	menu
	case $option in
		1) installNvm;
		;;

		2) installYarn
		;;

        3) installDocker
        ;;

        4) installLando
        ;;

        5) installLagoonCLI
        ;;

        6) installPlatformShCLI
        ;;

        q) ctrl_c
        ;;

		*)
		error="0"
		menu
		;;
	esac
}

run