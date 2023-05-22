#!/bin/bash

#Run from this directory
install_dir=~/.local/share/applications
search_dir=desktop_entries

echo "Installing desktop entries from \"./$search_dir\" in \"$install_dir\""

for entry in "$search_dir"/*
do
  echo "Validating $entry"
  desktop-file-validate $entry
  echo "Installing $entry"
  desktop-file-install --dir=$install_dir $entry
done

echo "Updating desktop database from directory $install_dir"
update-desktop-database $install_dir
