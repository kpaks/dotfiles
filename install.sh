#!/bin/bash

echo 'if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi' >> ~/.bash_profile

sym() {
    dotdir="$1"

    for filename in $(find $dotdir -name "*.symlink"); do
      ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
    done
}

dotfs=$(cd $(dirname $0) && pwd)

sym "$dotfs"