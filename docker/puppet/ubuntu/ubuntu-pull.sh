#!/bin/bash
#title		:ubuntu-pull.sh
#description	:Pulls Provisionous Docker/Puppet/Ubuntu images with
#		 `docker pull`.
#author		:lpalgarvio <"lp.algarvio@gmail.com">
#date		:20141229
#version	:0.4
#usage		:bash ubuntu-pull.sh
#notes		:Run docker-install.sh first to install the dependencies.
#bash_version	:4.1.5(1)-release
#==============================================================================

# Set formatting
bold=`tput bold`;
normal=`tput sgr0`;

# Set defaults
tag_10_04_lucid_status=true;
tag_10_04_lucid_title="Docker/Puppet/Ubuntu/10.04 (lucid)";
tag_10_04_lucid_url="solict/provisionous-puppet-ubuntu:lucid";
tag_12_04_precise_status=true;
tag_12_04_precise_title="Docker/Puppet/Ubuntu/12.04 (precise)";
tag_12_04_precise_url="solict/provisionous-puppet-ubuntu:precise";
tag_14_04_trusty_status=true;
tag_14_04_trusty_title="Docker/Puppet/Ubuntu/14.04 (trusty)";
tag_14_04_trusty_url="solict/provisionous-puppet-ubuntu:trusty";

# Pull tag_10_04_lucid image?
while true; do
    read -p "Pull Provisionous ${bold}${tag_10_04_lucid_title}${normal} image with Docker? [${bold}y${normal}/n] " yn;
    case $yn in
        [Yy]* ) tag_10_04_lucid_status=true; break;;
        [Nn]* ) tag_10_04_lucid_status=false; break;;
        * ) tag_10_04_lucid_status=true; break;;
    esac
done

# Pull tag_12_04_precise image?
while true; do
    read -p "Pull Provisionous ${bold}${tag_12_04_precise_title}${normal} image with Docker? [${bold}y${normal}/n] " yn;
    case $yn in
        [Yy]* ) tag_12_04_precise_status=true; break;;
        [Nn]* ) tag_12_04_precise_status=false; break;;
        * ) tag_12_04_precise_status=true; break;;
    esac
done

# Pull tag_14_04_trusty image?
while true; do
    read -p "Pull Provisionous ${bold}${tag_14_04_trusty_title}${normal} image with Docker? [${bold}y${normal}/n] " yn;
    case $yn in
        [Yy]* ) tag_14_04_trusty_status=true; break;;
        [Nn]* ) tag_14_04_trusty_status=false; break;;
        * ) tag_14_04_trusty_status=true; break;;
    esac
done

# Confirm pull
printf "\n${bold}Ready to pull images...${normal}\n";
read -p "Press [Enter] key to continue...";

# Run `docker pull` for tag_10_04_lucid image
if [ "$tag_10_04_lucid_status" = true ]; then
    printf "\n${bold}${tag_10_04_lucid_title}${normal}\n";
    sudo docker pull $tag_10_04_lucid_url;
fi;

# Run `docker pull` for tag_12_04_precise image
if [ "$tag_12_04_precise_status" = true ]; then
    printf "\n${bold}${tag_12_04_precise_title}${normal}\n";
    sudo docker pull $tag_12_04_precise_url;
fi;

# Run `docker pull` for tag_14_04_trusty image
if [ "$tag_14_04_trusty_status" = true ]; then
    printf "\n${bold}${tag_14_04_trusty_title}${normal}\n";
    sudo docker pull $tag_14_04_trusty_url;
fi;

