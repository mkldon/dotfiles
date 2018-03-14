for f in .gitconfig .gitattributes .gitignore_global; do
  rm -i ~/$f
  ln -s `pwd`/$f ~/
done
