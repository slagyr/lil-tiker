require 'entry'

class Store

  def initialize(filename)
    @filename = File.expand_path(filename)
    @entries = []
  end

  def enter(activity)
    entry = Entry.new(activity)
    @entries << entry
    write(entry)
  end

  def current
    return @entries.last
  end

  private #################################################

  def write(entry)
    File.open(@filename, "a") { |f| f.puts entry.to_s }
  end

end