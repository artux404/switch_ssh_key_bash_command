#!/bin/bash
function switch() {
	if [ ! -z "$1" ]; then
	  if [ ! -f ~/.ssh/keys/$1 ]; then
	  	  echo "No key $1 found!"
	  else
		  echo "$(cat ~/.ssh/keys/$1)" >| ~/.ssh/id_rsa
		  echo "$(cat ~/.ssh/keys/$1.pub)"  >| ~/.ssh/id_rsa.pub
		  echo "Switched key to $1"
      fi
	else
	  echo "No arguments given! Correct syntax is: switch KEYNAME"
	fi
}

function switch-key-add() {
	if [ ! -z "$1" ]; then
		if [ ! -f ~/.ssh/keys/$1 ]; then
			ssh-keygen -t rsa -b 4096 -f ~/.ssh/keys/$1
		else
		  echo "Key $1 already exists!"
		fi
	else
	  echo "No arguments given! Correct syntax is: switch-key-add KEYNAME"
	fi
}

function switch-key-read() {
	if [ ! -z "$1" ]; then
  		echo $(cat ~/.ssh/keys/$1.pub)
	else
	  echo "No arguments given! Correct syntax is: switch-key-read KEYNAME"
	fi
}