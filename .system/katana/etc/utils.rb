# Aliases for ease of use
HOME = ENV['HOME']


# Get the directory for the user
# configuration files.
#
def configs
  "#{HOME}/.config"
end



# Generate a string of a specific
# length.
#
def string(length)
  o = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
  (0..length).map { o[rand(o.length)] }.join
end
