#!/bin/sh

for f in .gitconfig .gitattributes .gitignore_global; do
  rm -i ~/$f
  ln -s `pwd`/$f ~/
done

rm ~/.config/fish/config.fish
ln -s `pwd`/config.fish ~/.config/fish/config.fish

cp `pwd`/bin/test_branch.rb /usr/local/bin/
chmod +x /usr/local/bin/test_branch.rb
