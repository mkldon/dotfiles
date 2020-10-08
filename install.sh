for f in .gitconfig .gitattributes .gitignore_global; do
  rm -i ~/$f
  ln -s `pwd`/$f ~/
done

ln -s `pwd`/config.fish ~/.config/fish/config.fish

cp `pwd`/test_branch.rb /usr/local/bin/
chmod +x /usr/local/bin/test_branch.rb
