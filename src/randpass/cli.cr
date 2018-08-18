require "./charsets"
require "./generator"

class Randpass::Cli
  USAGE = <<-USAGE
    Usage: randpass [length] [charsets] [count] | [option]

    Password options:
        length             length of password (integer)
        charsets           charsets passwords use (string)
        count              passwords to be generated (int followed by x)

        NOTE: Password options can be specified in any order.

    Options:
        --charsets, -c     show charsets
        --help, -h         show this help
        --version, -v      show version

    USAGE

  def self.run(args = ARGV)
    new(args).run
  end

  private getter args

  def initialize(@args : Array(String), @io : IO = STDOUT)
    @charsets = Charsets.new
    @password_options = {"length" => 8, "sets" => "dlsu", "count" => 1}
  end

  def run
    command = args.first?
    case
    when !command
      generate
    when "--charsets" == command, "-c" == command
      @io << "#{@charsets.list}\n"
    when "--help" == command, "-h" == command
      @io << USAGE
    when "--version" == command, "-v" == command
      @io.puts Randpass::VERSION_STRING
    when command.match /^(\d+|[a-z]+|\d+x)$/
      set_pw_opts
    else
      error "Unknown command: #{command}"
    end
  end

  private def set_pw_opts
    arg = args.first?
    case
    when !arg
      generate
    when arg.match /^\d+$/
      @password_options["length"] = arg.to_i
      args.shift
      set_pw_opts
    when arg.downcase.match /^[a-z]+$/
      @password_options["sets"] = arg
      args.shift
      set_pw_opts
    when arg.downcase.match /^[0-9]+x$/
      @password_options["count"] = arg.chomp("x").to_i
      args.shift
      set_pw_opts
    else
      error "Sorry, I can't figure this one out: #{arg}"
    end
  end

  private def generate
    flattened = @charsets.flatten(@password_options["sets"].to_s)
    @password_options["count"].to_i.times do
      @io.puts Generator.run @password_options["length"].to_i, flattened
    end
  end

  private def error(msg, exit_code = 1)
    Randpass::Error.show msg, exit_code: exit_code
  end
end
