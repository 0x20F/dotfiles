# Wrapper around functionality used
# to send data to a notification daemom.
#
# This greatly simplifies the work a script
# needs to do just to send out a notification.
class Notification
  def initialize(id)
    @message_id = id
  end


  def appname(name)
    @appname = "-a '#{name}'"
    self
  end


  def summary(text)
    @summary = "'#{text}'"
    self
  end


  def icon(name)
    @icon = "-i '#{name}'"
    self
  end


  # :low
  # :high
  # :critical
  #
  # FIXME: There's probably more
  def urgency(level)
    @urgency = "-u #{level.to_s}"
    self
  end


  def hint(value)
    # We're probably going to want an array here later
    @hint = "-h '#{value}'"
  end


  def replace
    @replace = "-r '#{@message_id}'"
    self
  end


  def send
    `dunstify #{@appname} #{@urgency} #{@icon} #{@replace} #{@hint} #{@summary}`
  end
end

