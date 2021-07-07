require_relative 'logger'
require 'json'



class DunstLogger
  include Logger

  def file
    '/tmp/dunstlog'
  end

  def parse(contents)
    json = JSON.parse(contents)
    json['notifications']
  end

  def prepare(items)
    items.to_json
  end

  def mutate(*pieces)
    # Replace newlines with spaces
    clean = pieces.map do |p| p.split.join(' ') end

    hash = {
      appname => clean[0],
      summary => clean[1],
      body => clean[2],
      icon => clean[3],
      urgency => clean[4],
      timestamp => Time.now.strftime("%I:%M %p")
    }

    hash.to_json
  end
end
