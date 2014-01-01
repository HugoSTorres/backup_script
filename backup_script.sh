#!/bin/bash

# Author: Hugo Torres <hugo.torres1993@gmail.com>

# Copyright 2013 Hugo Torres

# This program is free software: you can redistribute it and/or 
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.

# This program is distributed in the hope that it will be 
# useful, but WITHOUT ANY WARRANTY; without even the implied 
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
# PURPOSE.  See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public 
# License along with this program.  If not, see 
# <http://www.gnu.org/licenses/>.

backupdate=$(date +%m)-$(date +%d)-$(date +%Y)
backupsrc=$HOME/*
backupdir="$HOME/Backup_$backupdate"

shopt -s dotglob

#check the date used for the archive name is correct
echo "Running backup_script.sh on: $backupdate"

#check if the backup directory exists
echo "Checking for backup directory"
if [ ! -d "$backupdir" ]; then
	echo "Backup directory not found"
	echo "Creating backup directory $backupdir"
	mkdir "$backupdir"
else
	echo "Backup directory found"
fi

#generate a list of explicityly installed packages
echo "Generating list of installed packages"
pacman -Qe > $backupdir/installed_packages.txt
echo "List of packages generated"

#copy all files in $HOME to the backup directory
echo "Copying files into backup directory: $backupdir"
for file in $backupsrc
do
	[[ "$file" = $backupdir ]] && continue
	echo "$file"
	cp -a "$file" $backupdir
done
echo "Done copying files into backup directory"

#create the backup tarball
echo "Creating backup archive"
cd $HOME
tar -czf backup_"$backupdate".tar.gz Backup_$backupdate/
echo "Backup archive successfully created"

#remove the copied contents
echo "Removing copied files"
rm -rf $backupdir
echo "Done removing copied files"
