#!/bin/bash
function switch() {
  echo "$(cat ~/.ssh/keys/$1)" >| ~/.ssh/id_rsa
  echo "$(cat ~/.ssh/keys/$1.pub)"  >| ~/.ssh/id_rsa.pub
  echo "Switched Key to $1"
}

function switch-key-add() {
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/keys/$1
}

function switch-key-read() {
  echo $(cat ~/.ssh/keys/$1.pub)
}