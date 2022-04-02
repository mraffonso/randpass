class Randpass::Generator
  def self.run(length : Int32, charmap : Array(Char))
    new(length, charmap).run
  end

  private getter length, charmap

  def initialize(@length : Int32, @charmap : Array(Char))
  end

  def run : String
    password : String = ""
    @length.times do
      password = password + @charmap.sample(Random::Secure)
    end
    password
  end
end
