#: ix-config
#: prefix: &
#: to: $HOME



plugins=(
    git 
    colored-man-pages 
    zsh-syntax-highlighting 
    zsh-autosuggestions
)



ZSH_CUSTOM=$HOME/.config/oh-my-zsh
ZSH_THEME="afowler"



# Load oh-my-zsh as well
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"
# Source the normal .profile
source "$HOME/.profile"



# Aliases
# ========================= 
alias cat="bat"
alias vim="nvim"
alias ls="exa -ah --icons"
alias l="exa -halm --git --icons"
alias co2="carbon-cli"




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





# Enable the starship prompt
source <("/usr/local/bin/starship" init zsh --print-full-init)



# For using all installed cargo packages
export PATH="$PATH:$HOME/.cargo/bin"
