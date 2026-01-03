export LC_ALL=C.UTF-8

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
# Set the BROWSER environment so that `go tool pprof -web` uses our browser instead of the default chrome.
export BROWSER=/usr/local/firefox/firefox

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

open() {
        nautilus $1 &
}

# Fix no sound.
# https://bugs.launchpad.net/ubuntu/+source/linux-oem-osp1/+bug/1864061/
# /etc/modprobe.d/alsa-base.conf
# options snd-hda-intel dmic_detect=0

ayt-dlp () {
	yt-dlp -f "bv[height<=720]+ba/b[height<=720]" -o "%(id)s.%(ext)s" $1
}
