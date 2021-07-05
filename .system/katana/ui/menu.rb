require 'socket'



class Menu

  # Set menu to a specific type.
  #
  # Available types are:
  #   :custom
  #   :default
  #
  def initialize(type = :default)
    @type = type
   
    @lines = []
    @loading = false

    @parent, @child = UNIXSocket.pair
    @process = {
      :rofi => nil,
      :fork => nil
    }
  end


  # Create a new process with separate pipes
  # and run the menu inside that process so
  # the script can sit and work on other things
  # while the menu shows up.
  #
  # This gives us the ability to show a loading
  # menu while we calculate anything heavier
  # in the background for the actual menu we
  # want to display
  #
  def show(message = nil)
    @process[:fork] = fork do
      @parent.close

      r, w = IO.pipe
      command = build_command()

      pid = Process::spawn(
        command, 
        :in => r, 
        :out => @child
      )
      
      message = @lines if not message
      w.puts(message)

      @child.send("#{pid}", 0)
    end

    @process[:rofi] = @parent.recv(100).to_i
  end


  # Display a placeholder menu with
  # the same specific theme where only
  # a line that indicates that the other
  # lines are loading is visible.
  #
  # Basically a "loading screen" for menus
  # that might do some heavier lifting in
  # the background.
  #
  # The wifi menu is one such example.
  #
  def loading(status, message = 'Loading...')
    if status == :on
      @loading = true

      destroy()
      show(message) 
      return
    end

    @loading = false

    destroy()
    show()
  end


  # Await for a value from the menu,
  # this is blocking so when it's called,
  # nothing after it will run unless the 
  # used chooses an option from the currently
  # visible menu.
  #
  # Will not run at all if no menu is currently visible
  #
  def value
    return nil if not @process[:rofi]

    @parent.recv(65535).split.join(' ')
  end


  # Add a new line to the final payload
  # that rofi will display.
  #
  def add_line(line)
    @lines.push(line)
  end


  # Make sure to clear all the created processes
  # as well as cleanup any other things that 
  # might linger after the script has finished
  # running.
  #
  # Since rofi runs in a separate, forked process
  # those can't be left alive after the script
  # is finished. They'll just be zombies.
  #
  def destroy
    kill_fork
    kill_rofi
    
    @process = { :rofi => nil, :fork => nil }
  end


  # Sometimes, the parent script might
  # want to finish early and not wait
  # for a response from rofi.
  #
  # That script will need to explicitly
  # destroy all of its child processes
  # on exit while leaving the rofi processes
  # alive.
  #
  def kill_fork
    pid = @process[:fork]
    Process::kill('INT', pid) if pid
  end


  # Usually after a loading 'screen' is done,
  # the entire forked process along with rofi
  # needs to be cleaned up so a new rofi can
  # be reopened.
  #
  def kill_rofi
    pid = @process[:rofi]
    Process::kill('INT', pid) if pid
  end


  # Compose the command that will run
  # when the menu is toggled on
  #
  def build_command
    mode = '-dmenu'

    if @type == :default and not @loading
      mode = '-show drun'
    end

    "rofi #{mode} #{@prompt} #{@max_lines} #{@markup} #{@separator} #{@theme} #{@insensitive}"
  end


  # Tell the menu what to show as 
  # the prompt text when it spawns
  #
  def prompt(text)
    @prompt = "-p #{text}"
    self
  end


  # Tell the menu how many lines
  # it should display
  #
  def max_lines(max)
    @max_lines = "-lines #{max}"
    self
  end


  # Tell the menu whether to interpret
  # the rows as markup language
  #
  def markup
    @markup = '-markup-rows'
    self
  end


  # Tell the menu what theme to use.
  # Theme directory must be defined inside
  # the 'rofi_themes' environment variable
  #
  def theme(theme)
    directory = ENV['rofi_themes']
    @theme = "-theme '#{directory}/#{theme}'"
    self
  end


  # Tell the menu what the line separator is,
  # in case you don't want to use the default
  # newline character
  #
  def line_separator(sep)
    @separator = "-sep #{sep}"
  end


  # Tell the menu that it shouldn't care
  # about casing when matching search queries
  #
  def insensitive
    @insensitive = '-i'
  end


  private :build_command

end


