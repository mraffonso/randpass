require "../spec_helper"
require "../../src/randpass/cli"
require "../../src/randpass/version"

describe Randpass::Cli do
  describe "#run" do
    it "has correct defaults" do
      io = IO::Memory.new
      Randpass::Cli.new([] of String, io).run
      io.to_s.chomp("\n").size.should eq 8
      io.to_s.chomp("\n").should match /^[a-zA-Z0-9 !"#$%&'()*+,-.\/:;<=>\?@\[\\\]\^_`{|}~]+$/
      io.to_s.count("\n").should eq 1
    end

    it "responds with correct length" do
      io = IO::Memory.new
      Randpass::Cli.new(["20"], io).run
      io.to_s.chomp("\n").size.should eq 20
    end

    it "responds with correct characters" do
      io = IO::Memory.new
      Randpass::Cli.new(["d"], io).run
      io.to_s.chomp("\n").should match /^\d+$/
    end

    it "responds to --charsets and -c" do
      output = <<-OUTPUT
        Randpass #{Randpass::VERSION}

        Charsets
        ---------

        Binary (b)
        0 1

        Digits (d)
        0 1 2 3 4 5 6 7 8 9

        Lowercase (l)
        a b c d e f g h i j k l m n o p q r s t u v w x y z

        Special Chars (s)
          ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ \\ ] ^ _ ` { | } ~

        Uppercase (u)
        A B C D E F G H I J K L M N O P Q R S T U V W X Y Z


        OUTPUT

      io = IO::Memory.new
      Randpass::Cli.new(["--charsets"], io).run
      io.to_s.should eq output

      io = IO::Memory.new
      Randpass::Cli.new(["-c"], io).run
      io.to_s.should eq output
    end

    it "responds to --help and -h" do
      io = IO::Memory.new
      Randpass::Cli.new(["--help"], io).run
      io.to_s.should eq Randpass::Cli::USAGE

      io = IO::Memory.new
      Randpass::Cli.new(["-h"], io).run
      io.to_s.should eq Randpass::Cli::USAGE
    end

    it "responds to --version and -v" do
      io = IO::Memory.new
      Randpass::Cli.new(["--version"], io).run
      io.to_s.should eq "#{Randpass::VERSION_STRING}\n"

      io = IO::Memory.new
      Randpass::Cli.new(["-v"], io).run
      io.to_s.should eq "#{Randpass::VERSION_STRING}\n"
    end
  end
end
