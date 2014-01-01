backup_script
=============

Simple script that facilitates making backup archives written in Bash.

As of writing the script, I'm using Arch Linux (although I change distros
often so I wouldn't be surprised if this changes). It's designed to copy
all of the current user's $HOME into a directory, make a gzipped tarball
out of it, and then delete the directory used to make the tarball. From
there you can move it to wherever you want.

By default, the tarball is in $HOME and is named backup_(dd/mm/yyyy).tar.gz

The script serves two purposes. I just bought an external hard drive which
I'll be using to store periodic backups of all my stuff. Whenever I want to
do a backup I can do it with one line in my shell compared to doing it all
command by command. The second purpose is that I'm not very fluent with Bash
and I'm trying to learn.
