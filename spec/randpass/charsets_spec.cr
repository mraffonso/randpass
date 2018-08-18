require "../spec_helper"
require "../../src/randpass/charsets"
require "../../src/randpass/version"

describe Randpass::Charsets do
  describe "#flatten" do
    it "returns Array(Char) containing all specified charsets" do
      b = ['0', '1']
      d = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
      l = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
           'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
      s = [' ', '!', '"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', ',',
           '-', '.', '/', ':', ';', '<', '=', '>', '?', '@', '[', '\\', ']',
           '^', '_', '`', '{', '|', '}', '~']
      u = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
           'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']

      bd = b + d
      dlu = d + l + u
      ulb = u + l + b

      Randpass::Charsets.new.flatten("b").should eq b
      Randpass::Charsets.new.flatten("d").should eq d
      Randpass::Charsets.new.flatten("l").should eq l
      Randpass::Charsets.new.flatten("s").should eq s
      Randpass::Charsets.new.flatten("u").should eq u

      Randpass::Charsets.new.flatten("bd").should eq bd
      Randpass::Charsets.new.flatten("dlu").should eq dlu
      Randpass::Charsets.new.flatten("ulb").should eq ulb
    end
  end

  describe "#list" do
    it "returns a multi line description" do
      desc = <<-DESC
        #{Randpass::VERSION_STRING}

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

        DESC
      Randpass::Charsets.new.list.should eq desc
    end
  end

  describe "#remove_duplicates" do
    it "returns a string with duplicate characters removed" do
      Randpass::Charsets.new.remove_duplicates("dllsssuuuu").should eq "dlsu"
    end
  end
end
