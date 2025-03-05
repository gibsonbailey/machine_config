#!/bin/bash

shopt -s dotglob

for f in ~/machine_config/.[^.]*; do
  name=$(basename "$f")
  if [ $name != .git ]; then
    ln -s $f ~/$name
    ls -la ~
  fi
done
