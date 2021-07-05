#!/usr/bin/env ruby
$: << ENV['katana']


require 'ui/menu'



m = Menu::new()
  .hint('Biggie')
  .theme('app-runner')

m.loading(:on, 'Loading something real big...')

sleep 5
for n in 0..20 do
  m.add_line("This is a new line yoooo!")
end

m.loading(:off)


# Make sure to cleanup
at_exit do
  m.kill_fork()
end
