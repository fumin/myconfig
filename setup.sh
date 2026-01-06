FIREFOX_PROFILE=
if [[ ! -n $FIREFOX_PROFILE ]]; then
	echo Please declare variables
	exit 1
fi

ln -s $PWD/bashrc $HOME/.mybash
ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/lxc.conf $HOME/.config/lxc/default.conf
for FNAME in `ls $PWD/autostart`; do
	ln -s $PWD/autostart/$FNAME $HOME/.config/autostart/$FNAME
done

mkdir -p $FIREFOX_PROFILE/chrome/distribution
ln -s $PWD/firefox/userChrome.css $FIREFOX_PROFILE/chrome/userChrome.css
ln -s $PWD/firefox/userContent.css $FIREFOX_PROFILE/chrome/userContent.css
ln -s $PWD/firefox/distribution/policies.json $FIREFOX_PROFILE/chrome/distribution/policies.json
