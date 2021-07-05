#!/usr/bin/env ruby


require 'socket'




@parent, @child = UNIXSocket.pair


def show(data)
  pid = fork do
    @parent.close

    r, w = IO.pipe
    pid = Process::spawn('rofi -dmenu', :in => r, :out => @child)
    w.puts(data)

    @child.send("#{pid}", 0)
  end

  rofi_pid = @parent.recv(100).to_i

  return pid, rofi_pid
end


a, b = show('Loading...')

sleep 5

# Cleanup
puts "Killing"
Process::kill('INT', a)
Process::kill('INT', b)


puts "Recreating"
a, b = show("Everything\nHas\nLoaded")


puts "Output from rofi is: #{@parent.recv(100)}"

