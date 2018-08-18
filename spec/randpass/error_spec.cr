require "../spec_helper"
require "../../src/randpass/error"

describe Randpass::Error do
  describe "#show" do
    it "exists the program" do
      io = IO::Memory.new
      e = Randpass::Error.show("This is an error", 2, io)
      io.to_s.should eq "This is an error\n"
    end
  end
end
