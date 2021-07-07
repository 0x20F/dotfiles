module Logger
  # ----------------------------------------
  # Methods that will be available to all the
  # users of a logger that implements this
  # interface.
  # ----------------------------------------

  # Get all the items from the log file,
  # fully parsed using the custom parsing method
  def all
    c = contents
    c ? parse(c) : []
  end

  # Add a new entry to the existing entries
  def append(*args)
    line = mutate(args)
    items = contents.push(line)
    file = prepare(items)

    save(file)
  end

  # Clear the log file of all entries
  def clear
    File.open(file, 'w') do |f| f.truncate(0) end
  end



  # ----------------------------------------
  # Methods that will need to be implemented
  # by each logger.
  # ----------------------------------------

  # Define how the logger should parse
  # the given log file into an array of items
  def parse(_contents)
    raise 'Logger has not defined how to parse the logs'
  end

  # Define how the logger should take
  # the array of items that has been created
  # and turn it back into something that can
  # be stored inside a file
  def prepare(_items)
    raise 'Logger has not defined how to rewire everything back'
  end

  # Define how the logger should add a new
  # log to the given log file
  def add(_line, _to)
    raise 'Logger has not defined how to add new items to the logs'
  end

  def mutate(*_pieces)
    raise 'Logger has not defined how to handle new data'
  end

  # Define where the log file for a
  # specific logger is located
  def file
    raise 'No log file defined'
  end



  # ----------------------------------------
  # Private methods that are only used within
  # the interface
  # ----------------------------------------
  private

  # Open up the defined log file and read all
  # of its contents
  def contents
    nil unless File.exists?(file)
    contents = IO::read(file)
    contents == '' ? nil : contents
  end

  # Save new data to the original file by either
  # overwriting everything within it or appending
  # to it
  def save(new_contents, append = nil)
    flag = append ? 'a' : 'w'

    File.open(file, flag) do |file|
      file.write(new_contents)
    end
  end
end
