#!/bin/bash

while read -r src dst; do
  ln -sn "$(pwd)/$src" "$HOME/$dst"
done < install.txt
