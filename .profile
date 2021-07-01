#: ix-config
#: out: $HOME


# Useful paths
export PACKAGES=#{{ paths.packages }}
export SYSTEM=#{{ paths.system }}
export katana=#{{ paths.modules }} # Custom ruby modules


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
