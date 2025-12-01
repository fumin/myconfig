FIREFOX_PROFILE=
if [[ ! -n $FIREFOX_PROFILE ]]; then
	echo Please declare variables
	exit 1
fi

ln -s $PWD/bashrc $HOME/.mybash
ln -s $PWD/vimrc $HOME/.vimrc

mkdir -p $FIREFOX_PROFILE/chrome/distribution
ln -s $PWD/firefox/userChrome.css $FIREFOX_PROFILE/chrome/userChrome.css
ln -s $PWD/firefox/distribution/policies.json $FIREFOX_PROFILE/chrome/distribution/policies.json
