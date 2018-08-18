require "../spec_helper"
require "../../src/randpass/charset"

def charset
  Randpass::Charset.new("Test Charset", "t", "abc")
end

describe Randpass::Charset do
  describe "#chararray" do
    it "returns an array of characters in the charset" do
      charset.chararray.should eq ["a", "b", "c"]
    end
  end

  describe "#charstring" do
    it "returns a string of characters in the charset" do
      charset.charstring.should eq "abc"
    end
  end

  describe "#description" do
    it "returns a multi line description including a spaced charstring" do
      desc = <<-DESC
        Test Charset (t)
        a b c

        DESC
      charset.description.should eq desc
    end
  end
end
