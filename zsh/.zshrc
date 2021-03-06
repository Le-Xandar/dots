if [ -f ~/.config/sh_vars/variables.sh ]; then  .  $HOME/.config/sh_vars/variables.sh ;fi
if [ -f ~/.config/sh_vars/aliases.sh ]; then  .  $HOME/.config/sh_vars/aliases.sh ;fi
if [ -f ~/.config/sh_vars/functions.sh ]; then  .  $HOME/.config/sh_vars/functions.sh ;fi

# check update

typeset -U PATH path
BINPATH="$HOME/bin"
path+=("$BINPATH" ${BINPATH}/*/)
export PATH

eval "$(starship init zsh)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="bira"
#ZSH_THEME="blinks"
#ZSH_THEME="dogenpunk"
#ZSH_THEME="fino"
ZSH_THEME="fox"
#ZSH_THEME="jonathan"
alias sc="zathura $HOME/schedule.pdf"
alias mo="feh --randomize $HOME/Pictures/motivation"
alias mov="mpv $HOME/Videos/NO\ EXCUSES\ -\ Best\ Motivational\ Video.mp4"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  emacs
  flatpak
  fzf
  fancy-ctrl-z
  jump
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
  z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Cutom cursor
function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; #line cursor 
      viins|main) print -n '\033[6 q';; # block cursor
  esac
}

#disable url globbing (for mpv) # https://superuser.com/questions/649635/zsh-says-no-matches-found-when-trying-to-download-video-with-youtube-dl
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic


zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

bindkey jk vi-cmd-mode
bindkey -M vicmd '^V' edit-command-line
bindkey '^V' edit-command-line


# exit on partianl command with Ctrl-D
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

#paleofetch | lolcat --random
if [ -f ~/bin/progs/is-reboot-needed ]; then   $HOME/bin/progs/is-reboot-needed ;fi

bin/progs/cutefetch $(printf 'kitty\nbunny' | shuf -n 1) $( shuf -i 1-13  -n 1 )
