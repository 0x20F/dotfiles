export ZSH="$HOME/.oh-my-zsh"       # Path to 'oh-my-zsh' -> symlink to dotfiles repo
ZSH_THEME="robbyrussell"




# Load oh-my-zsh as well
source "$ZSH/oh-my-zsh.sh"




plugins=(
    git
    colored-man-pages
    zsh-syntax-highlighting
    zsh-autosuggestions
)
# Load antigen
#source "$HOME/antigen/antigen.zsh"

#antigen use oh-my-zsh

#antigen bundle git
#antigen bundle colored-man-pages

#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle darrintisdale/zsh-aliases-exa

#antigen apply




# Aliases
# ========================= 
alias server="node ~/repo/moscow/server.js"
alias mozzie="php ~/repo/journal_sys/bin/mozart.php"
alias rdrestart="rundocker restart --no-post-checkout"

alias cat="bat" # Rust equivalent
# Override some exa aliases from the zsh package
alias ls="exa"
alias l="exa -halm --git"




# Useful functions
# ========================= 
function flag() {
    alias $1="cd '$PWD'";
}

function showerThought {
    curl -s --connect-timeout 1 -A '/u/A858DE45F56D9BC9' \
        'https://www.reddit.com/r/showerthoughts/top.json?sort=top&t=week&limit=100' | \
        jq -c -r '.d = .data.children['$((RANDOM%100))'].data | "\"\(.d.title)\" \n - u/\(.d.author)" '
}

function banner {
    NAME="$(figlet -f slant 'snowwhite')"
    DATE="$(date)"

    echo "\n\t\t$DATE\n$NAME\n\n" | lolcat -F 0.4
    echo "$(showerThought)"
}




export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"





