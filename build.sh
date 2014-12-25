#!/bin/bash

# Set formatting
bold=`tput bold`
normal=`tput sgr0`

# Set defaults
build_debian=false;
build_ubuntu=false;
build_centos=false;
build_fedora=false;

# Build Debian images?
while true; do
    read -p "Build ${bold}Debian${normal} images with Docker? [${bold}y${normal}/n] " yn
    case $yn in
        [Yy]* ) build_debian=true; break;;
        [Nn]* ) build_debian=false; break;;
        * ) build_debian=true; break;;
    esac
done

# Build Ubuntu images?
while true; do
    read -p "Build ${bold}Ubuntu${normal} images with Docker? [${bold}y${normal}/n] " yn
    case $yn in
        [Yy]* ) build_ubuntu=true; break;;
        [Nn]* ) build_ubuntu=false; break;;
        * ) build_ubuntu=true; break;;
    esac
done

# Build CentOS images?
while true; do
    read -p "Build ${bold}CentOS${normal} images with Docker? [${bold}y${normal}/n] " yn
    case $yn in
        [Yy]* ) build_centos=true; break;;
        [Nn]* ) build_centos=false; break;;
        * ) build_centos=true; break;;
    esac
done

# Build Fedora images?
while true; do
    read -p "Build ${bold}Fedora${normal} images with Docker? [y/${bold}n${normal}] " yn
    case $yn in
        [Yy]* ) build_fedora=true; break;;
        [Nn]* ) build_fedora=false; break;;
        * ) build_fedora=false; break;;
    esac
done

# Run Docker build for Debian images
if [ "$build_debian" = true ]; then
    printf "\n\n${bold}Building Debian images with Docker...${normal}\n";
    read -p "Press [Enter] key to continue...";
    # Debian 6 (squeeze)
    printf "${bold}Debian 6 (squeeze)${normal}\n";
    sudo docker build -t docker_puppet/debian_06 Docker/Debian/06_squeeze;
    # Debian 7 (wheezy)
    printf "${bold}Debian 7 (wheezy)${normal}\n";
    sudo docker build -t docker_puppet/debian_07 Docker/Debian/07_wheezy;
    # Debian 8 (jessie)
    printf "${bold}Debian 8 (jessie)${normal}\n";
    sudo docker build -t docker_puppet/debian_08 Docker/Debian/08_jessie;
fi;

# Run Docker build for Ubuntu images
if [ "$build_ubuntu" = true ]; then
    printf "\n\n${bold}Building Ubuntu images with Docker...${normal}\n";
    read -p "Press [Enter] key to continue...";
    # Ubuntu 10.04 (lucid)
    printf "${bold}Ubuntu 10.04 (lucid)${normal}\n";
    sudo docker build -t docker_puppet/ubuntu_10.04 Docker/Ubuntu/10.04_lucid;
    # Ubuntu 12.04 (precise)
    printf "${bold}Ubuntu 12.04 (precise)${normal}\n";
    sudo docker build -t docker_puppet/ubuntu_12.04 Docker/Ubuntu/12.04_precise;
    # Ubuntu 14.04 (trusty)
    printf "${bold}Ubuntu 14.04 (trusty)${normal}\n";
    sudo docker build -t docker_puppet/ubuntu_14.04 Docker/Ubuntu/14.04_trusty;
fi;

# Run Docker build for CentOS images
if [ "$build_centos" = true ]; then
    printf "\n\n${bold}Building CentOS images with Docker...${normal}\n";
    read -p "Press [Enter] key to continue...";
    # CentOS 5 (centos5)
    printf "${bold}CentOS 5 (centos5)${normal}\n";
    sudo docker build -t docker_puppet/centos_05 Docker/CentOS/05_centos5;
    # CentOS 6 (centos6)
    printf "${bold}CentOS 6 (centos6)${normal}\n";
    sudo docker build -t docker_puppet/centos_06 Docker/CentOS/06_centos6;
    # CentOS 7 (centos7)
    printf "${bold}CentOS 7 (centos7)${normal}\n";
    sudo docker build -t docker_puppet/centos_07 Docker/CentOS/07_centos7;
fi;

# Run Docker build for Fedora images
if [ "$build_fedora" = true ]; then
    printf "\n\n${bold}Building Fedora images with Docker...${normal}\n";
    read -p "Press [Enter] key to continue...";
    # Fedora 6 (zod)
    printf "${bold}Fedora 6 (zod)${normal}\n";
    sudo docker build -t docker_puppet/fedora_06 Docker/Fedora/06_zod;
    # Fedora 12 (constantine)
    printf "${bold}Fedora 12 (constantine)${normal}\n";
    sudo docker build -t docker_puppet/fedora_12 Docker/Fedora/12_constantine;
    # Fedora 19 (schrodinger)
    printf "${bold}Fedora 19 (schrodinger)${normal}\n";
    sudo docker build -t docker_puppet/fedora_19 Docker/Fedora/19_schrodinger;
fi;

