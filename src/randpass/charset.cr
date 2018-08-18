class Randpass::Charset
  @name : String
  @shortcut : String
  @characters : Array(String)

  def initialize(name : String, shortcut : String, charstring : String)
    @name = name
    @shortcut = shortcut
    @characters = charstring.split("")
  end

  def chararray
    @characters
  end

  def charstring
    @characters.join("")
  end

  def description
    desc = <<-DESC
      #{@name} (#{@shortcut})
      #{@characters.join(" ")}

      DESC

    desc
  end
end
