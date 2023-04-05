export TERM=xterm-256color
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export EDITOR=vim
export VISUAL=$EDITOR
export MYTERM=alacritty
#export DOTFILES=~/.dotfiles
# Make systemctl output colorful
export SYSTEMD_COLORS=true
export MOZ_X11_EGL=1
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"/ssh-agent.socket
# Perl fuckery
PATH="/home/aryzhkov/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/aryzhkov/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/aryzhkov/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/aryzhkov/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/aryzhkov/perl5"; export PERL_MM_OPT;
# User Scripts
if [ -d "$HOME/.scripts" ] ; then
    export PATH="$HOME/.scripts:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "/var/lib/snapd/snap/bin" ] ; then
    PATH="/var/lib/snapd/snap/bin:$PATH"
fi
if [ -x "$(command -v keychain)" ]; then
    eval `keychain --eval --quiet id_rsa`
fi
# Mount google drive (need to make sure the network is up before using rclone)
#if [[ ! -f ~/sync/gdrive/is-mounted ]]; then
#    rclone mount gdrive:gdrive ~/sync/gdrive/ --daemon
#fi
