#!/bin/bash

[ -z $(command -v ntfsclone) ] && echo -e "You may not have \e[96mroot\e[39m priviledge or the \e[96mntfsclone\e[39m command is not available on your system" && exit 1

for sourcefile in $(ls _*.tar.gz)
do
    echo "Found $sourcefile as a backup"
done

read -p "Press enter to continue..."

for sourcefile in $(ls _*.tar.gz)
do
    targetpartition=$(echo $sourcefile | sed 's/_/\//g' | sed 's/\.tar\.gz//g')
    echo -e "\e[96mRestoring $sourcefile to $targetpartition...\e[39m"
    gunzip -c $sourcefile | ntfsclone --restore-image --overwrite $targetpartition -
done
