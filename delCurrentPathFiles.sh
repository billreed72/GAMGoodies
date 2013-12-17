#!/bin/bash
while true; do
    read -p "Would you like to list the files in this directory? " yn
    case $yn in
        [Yy]* ) ls -lh;
            read -p "Enter a search string to delete files: (i.e. *part-of-name*) " userInput
				echo "Files containing "$userInput" are being deleted now. ";
				ls -lh $userInput;
	            rm -fv $userInput; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
