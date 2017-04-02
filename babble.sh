#!/bin/bash


os=`uname`
if [[ "$os" == 'Linux' ]]; then 
    hash cowsay > /dev/null 2>&1
    if [ "$?" != "0" ]; then
	echo "You don't have cowsay installed"
	echo "Run: sudo apt-get install cowsay"
	exit 0
    fi

    hash fortune > /dev/null 2>&1
    if [ "$?" != "0" ]; then
	echo "You don't have fortune installed"
	echo "Run: sudo apt-get install fortune"
	exit 0
    fi
    echo "Done"
    echo 'cowsay -f $(ls /usr/share/cowsay/cows | shuf -n 1) $"$(echo $USER), $(fortune)"' >> ~/.bashrc 
    echo 'cowsay -f $(ls /usr/local/share/cows | shuf -n 1) $"$(echo $USER), $(fortune)"' >> ~/.bash_profile 
fi

if [[ "$os" == 'Darwin' ]]; then 
    hash cowsay > /dev/null 2>&1
    if [ "$?" != "0" ]; then
	echo "You don't have cowsay installed"
	echo "Run: brew install cowsay"
	exit 0
    fi

    hash fortune > /dev/null 2>&1
    if [ "$?" != "0" ]; then
	echo "You don't have fortune installed"
	echo "Run: brew install fortune"
	exit 0
    fi
    echo "Done"
    echo 'cowsay -f $(ls /usr/local/share/cows/ | gshuf -n 1) $"$(echo $USER), $(fortune)"' >> ~/.bashrc 
    echo 'cowsay -f $(ls /usr/local/share/cows/ | gshuf -n 1) $"$(echo $USER), $(fortune)"' >> ~/.bash_profile 
fi
