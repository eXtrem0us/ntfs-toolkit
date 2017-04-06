#!/bin/bash

[ -z $(command -v ntfsclone) ] && echo -e "You may not have \e[96mroot\e[39m priviledge or the \e[96mntfsclone\e[39m command is not available on your system" && exit 1

for ntfspartition in $(fdisk -l | grep -i ntfs | cut -d' ' -f1)
do
    echo "found NTFS partition $ntfspartition"
done

read -p "Press enter to continue..."

for ntfspartition in $(fdisk -l | grep -i ntfs | cut -d' ' -f1)
do
    targetfile=$(echo $ntfspartition.tar.gz | sed 's/\//_/g')
    echo -e "\e[96mSaving $ntfspartition to $targetfile...\e[39m"
    ntfsclone --save-image -o - $ntfspartition | gzip -c > $targetfile
done
