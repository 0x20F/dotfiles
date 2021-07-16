$: << ENV['katana']


require 'utils'


use 'notify'



module Screenshot

  # Take a screenshot of whatever is on screen
  # at this very moment, making sure to:
  #   1. add the screenshot to clipboard
  #   2. save the image in /tmp (by default)
  #   3. show a nice notification with the saved image
  def self.take(path: '/tmp', delay: 0)
    sleep(delay)

    filename = "#{path}/#{string(25)}.png"

    # Take the screenshot
    `maim --format png #{filename}`

    
    Notification::new(123123)
      .appname('Screenshot')
      .summary("Screenshot saved at #{filename}")
      .icon(filename)
      .urgency(:low)
      .send()
  end
end
