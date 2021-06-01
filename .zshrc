#: ix-config
#: to: $HOME



plugins=(
    git 
    colored-man-pages 
    #zsh-syntax-highlighting 
    #zsh-autosuggestions
)




ZSH_THEME="robbyrussell"



# Load oh-my-zsh as well
source "$ZSH/oh-my-zsh.sh"


# Source the normal .profile
source "$HOME/.profile"



# Aliases
# ========================= 
alias cat="bat"
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





