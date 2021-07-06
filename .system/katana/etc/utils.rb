# Aliases for ease of use
HOME = ENV['HOME']


# Get the directory for the user
# configuration files.
#
def configs
  "#{HOME}/.config"
end



module Utils
  # Get the log for system notifications
  # so far, parse it into a hash, and give
  # back that hash.
  #
  # If no log is available, nil.
  #
  def self.get_notifications
    if not File.exist?('/tmp/dunstlog')
      return nil
    end

    log_file = File.open('/tmp/dunstlog').read
    logs = JSON.parse(log_file)

    logs['notifications']
  end
end
