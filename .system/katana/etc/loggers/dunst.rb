require_relative 'interface'
require 'json'



class DunstLogger
  
  include LoggerInterface




  def add
    puts "Adding a new line to the dunst logs!"
  end


  def all
    if not File.exists?('/tmp/dunstlog')
      return nil
    end

    log_file = File.open('/tmp/dunstlog').read
    logs = JSON.parse(log_file)

    logs['notifications']
  end
end
