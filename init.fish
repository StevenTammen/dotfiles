# Add dotfiles/bin to PATH
set PATH $PATH ~/dotfiles/bin

# Also add ox-hugo-publish to PATH
set PATH $PATH ~/dotfiles/bin/ox-hugo-publish/windows

# Pretty colors. Toggle between day/night with sh scripts in dotfiles/bin
day
# eval (dircolors -c ~/dotfiles/dir_colors | sed 's/>&\/dev\/null$//')

# Use vim as editor
set VISUAL vim
set EDITOR $VISUAL

# Movement aliases
alias dbox "cd /mnt/c/Users/steve/Dropbox"
alias dboxr "cd /mnt/c/Users/steve/Dropbox; ranger"

alias pj "cd /mnt/c/Users/steve/Desktop/Projects"
alias pjr "cd /mnt/c/Users/steve/Desktop/Projects; ranger"

alias stc "cd /mnt/c/Users/steve/Desktop/Projects/steventammen.com"
alias stcr "cd /mnt/c/Users/steve/Desktop/Projects/steventammen.com; ranger"

alias chc "cd /mnt/c/Users/steve/Desktop/Projects/chrya.com"
alias chcr "cd /mnt/c/Users/steve/Desktop/Projects/chrya.com; ranger"

alias hieam "cd /mnt/c/Users/steve/Desktop/Projects/hieam"
alias hieamr "cd /mnt/c/Users/steve/Desktop/Projects/hieam; ranger"

# Rsync aliases
alias p1 "rsync -a --delete /mnt/c/Users/steve/Desktop/Projects/Tammen-Steven-p1/ tammen@nike.cs.uga.edu:/home/ugrads/tammen/Tammen-Steven-p1"
alias p2 "rsync -a --delete /mnt/c/Users/steve/Desktop/Projects/Tammen-Steven-p2/ tammen@nike.cs.uga.edu:/home/ugrads/tammen/Tammen-Steven-p2"
alias p3 "rsync -a --delete /mnt/c/Users/steve/Desktop/Projects/Tammen-Steven-p3/ tammen@nike.cs.uga.edu:/home/ugrads/tammen/Tammen-Steven-p3"
alias final-p "rsync -a --delete /mnt/c/Users/steve/Desktop/Projects/Tammen-Steven-final/ tammen@nike.cs.uga.edu:/home/ugrads/tammen/Tammen-Steven-final"

# Hugo aliases

alias sup "hugo.exe server -D --navigateToChanged" # "start up server"

