FIREFOX_PROFILE=
if [[ ! -n $FIREFOX_PROFILE ]]; then
	echo Please declare variables
	exit 1
fi

# sudo mv /usr/bin/update-notifier /usr/bin/update-notifier-xxx
# sudo mv /usr/bin/update-manager /usr/bin/update-manager-xxx

ln -s $PWD/bashrc $HOME/.mybash
ln -s $PWD/vimrc $HOME/.vimrc
ln -s $PWD/fonts.conf $HOME/.config/fontconfig/fonts.conf
sudo ln -s $PWD/touchpad.sh /usr/local/bin/
# Set icons for apps.
for FNAME in `ls $PWD/appdesktops`; do
	ln -s $PWD/appdesktops/$FNAME $HOME/.local/share/applications/$FNAME
done
# Setup autostart.
mkdir -p $HOME/.config/autostart
for FNAME in `ls $PWD/autostart`; do
	ln -s $PWD/autostart/$FNAME $HOME/.config/autostart/$FNAME
done

# Lxc.
# Configure /etc/lxc/lxc-usernet.
LXC_NET_PATH=/etc/lxc/lxc-usernet
LXC_NET_CONF="$(id -un) veth lxcbr0 10"
if ! grep -q -F -x "$LXC_NET_CONF" $LXC_NET_PATH; then
	echo "$(id -un) veth lxcbr0 10" | sudo tee -a $LXC_NET_PATH > /dev/null
fi
# lxc maps the rootfs under $HOME/.local, so setup permissions for it.
chmod +x $HOME
chmod +x $HOME/.local
chmod +x $HOME/.local/share
# Setup our local config.
mkdir -p $HOME/.config/lxc
ln -s $PWD/lxc.conf $HOME/.config/lxc/default.conf

# Firefox.
mkdir -p $FIREFOX_PROFILE/chrome
ln -s $PWD/firefox/userChrome.css $FIREFOX_PROFILE/chrome/userChrome.css
ln -s $PWD/firefox/userContent.css $FIREFOX_PROFILE/chrome/userContent.css
sudo ln -s $PWD/firefox/distribution/policies.json /usr/local/firefox/distribution/policies.json
