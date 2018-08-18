require "./charset"
require "./error"
require "./version"

class Randpass::Charsets
  def initialize
    @defaults = {
      b: Charset.new("Binary", "b", "01"),
      d: Charset.new("Digits", "d", "0123456789"),
      l: Charset.new("Lowercase", "l", "abcdefghijklmnopqrstuvwxyz"),
      s: Charset.new("Special Chars", "s", " !\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"),
      u: Charset.new("Uppercase", "u", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
    }
  end

  def flatten(sets : String)
    flattened = [] of Char
    remove_duplicates(sets).split("").each do |k|
      begin
        flattened += @defaults[k.to_s].charstring.chars
      rescue e : KeyError
        Randpass::Error.show "Unknown charset: #{k}"
      end
    end
    flattened
  end

  def list
    lst = <<-LIST
      #{Randpass::VERSION_STRING}

      Charsets
      ---------

      LIST

    @defaults.keys.each { |k| lst += "\n#{@defaults[k].description}" }

    lst
  end

  def remove_duplicates(sets : String)
    filtered_sets : String = ""

    sets.split("").each do |c|
      filtered_sets += c unless filtered_sets.includes? c
    end

    filtered_sets
  end
end
