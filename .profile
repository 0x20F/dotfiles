#: ix-config
#: out: $HOME


# Useful paths
export PACKAGES=#{{ paths.packages }}

# Defaults
export EDITOR=$( which vim )
export FZF_DEFAULT_COMMAND="find -L"



# Create the binaries directory if
# it's not already there
binaries=#{{ paths.binaries }}

if [[ ! -d "$binaries" ]]; then
	mkdir -p $binaries
fi


# Load all custom binaries for this user
export PATH="$PATH:$binaries"
