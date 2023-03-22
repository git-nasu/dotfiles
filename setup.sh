DOTFILES_REPO="$HOME/.dotfiles"
if [ ! -e "$DOTFILES_REPO" ];then
  echo 'Cloning Dotfiles_Repo From GitHub ....'
  git clone https://github.com/git-nasu/dotfiles.git
fi

cd "$DOTFILES_REPO"
git ls-files | grep -e '^\.' | while read DOTFILE; do
 echo "Pasting Symbolic Link ... $DOTFILE"
 ln -sf "$DOTFILES_REPO/$DOTFILE" "$HOME/$DOTFILE"
done
