# ntfs-toolkit
Backup and Restore NTFS Partitions

I have a dual boot system with Windows and Linux. As you know, installing and also updating Windows 10 is waste of time, specially in countries with poor internet and irresponsible governments! So, I wrote these simple shell scripts to backup and restore the NTFS partitions on my system.

Each script uses both ntfsclone and gzip for its functionalities.

I used ntfsclone instead of dd, becase dd includes all empty space on partitions, which are neither allocated to files nor truly empty spaces, i.e. they may have the contents of deleted files. So, in the case of using dd, the result gziped file becomes bigger than usual and expectation.

### make it simple
run ntfs-backup.sh an ntfs-restore.sh in order to backup and restore your ntfs partitions.

Have a Happy Backup!
