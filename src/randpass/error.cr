class Randpass::Error
  def self.show(msg : String, exit_code : Int32 = 1, io : IO = STDERR)
    io << msg << "\n"
    exit unless typeof(io) == IO::Memory
  end
end
