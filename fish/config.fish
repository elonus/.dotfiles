# Configure bobthefish prompt
#set -g theme_newline_cursor yes
#set -g theme_newline_cursor no

# Set vi-mode
fish_vi_key_bindings

# Abbreviations
abbr -a ... cd ../..
abbr -a .... cd ../../..

function ls
	command ls --color=auto $argv
end

function pacman
	command pacman --color=auto $argv
end

function grep
	command grep --color=auto $argv
end

function mkdir
	command mkdir -p -v $argv
end

function cal
	command cal -wm3 $argv
end

function scroff
	xset dpms force off
end

function touch_on
	xinput enable 10
end

function touch_off
	xinput disable 10
end 

function aur-sync
	PKGEXT='.pkg.tar' aur sync $argv
end

function mv
	/usr/bin/mv -i $argv
end

function cp
	/usr/bin/cp -i $argv
end

# Make left ctrl escape when pressed and ctrl when holding it
#xcape -t 150

# Emacs keybindings in vi mode
function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings

# Change default colors for ls
#eval (dircolors ~/.dircolors)

# Path
#set -Ua fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/.emacs.d/bin
fish_add_path $HOME/.bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.emacs.d/bin

# Dircolors for ls
set -x LS_COLORS (dircolors ~/.dircolors | grep -o 'r.*:')

#zoxide init fish | source

#thefuck --alias | source

#function rsyncnetBackup
#	BORG_REMOTE_PATH="borg1" /usr/bin/borg create -x --exclude-caches\
#    --exclude '*.avi'\
#    --exclude '*.mkv'\
#    --exclude '*.mp4'\
#    --exclude '/home/andreas/.cache'\
#    --exclude '/home/andreas/.config/*/Cache'\
#    --exclude '/home/andreas/.config/chromium' \
#    #--exclude '/home/andreas/.local/Steam'\
#    #--exclude '/home/andreas/.local/lutris'\
#    --exclude '/home/andreas/.local/baloo'\
#    rsyncnet:niflheimBackup::home-{now:%Y-%m-%d} /home
#
#	BORG_REMOTE_PATH="borg1" /usr/bin/borg create -x --exclude-caches\
#    #--exclude /var/cache\
#    --exclude /var/cache/pacman/*/*.pkg.tar.zst\
#    --exclude /var/lib/aurbuild\
#    rsyncnet:niflheimBackup::root-{now:%Y-%m-%d} /
#end
