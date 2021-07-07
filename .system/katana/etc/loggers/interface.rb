module LoggerInterface
  @output = '/tmp/log_name_here'
  @name = 'LoggerInterface'

  

  def name
    @name
  end


  def output
    @output
  end


  def add
    raise 'Not implemented'
  end


  def all
    raise 'Not implemented'
  end
end
