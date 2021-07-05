#: ix-config
#: out: $HOME


# For the system modules
export katana=#{{ paths.modules }}
export rofi_themes=#{{ configs.menus }}


# Defaults
export EDITOR=$( which nvim )
export FZF_DEFAULT_COMMAND="find -L"


# Create the binaries directory if
# it's not already there
binaries=#{{ paths.binaries }}


if [[ ! -d "$binaries" ]]; then
	mkdir -p $binaries
fi


# Load all custom binaries for this user
export PATH="$PATH:$binaries"
