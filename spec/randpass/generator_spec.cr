require "../spec_helper"
require "../../src/randpass/generator"

describe Randpass::Generator do
  describe "#run" do
    it "returns a password with correct length and values" do
      Randpass::Generator.run(3, ['a', 'b', 'c']).should match /^[a-c][a-c][a-c]$/
      Randpass::Generator.run(4, ['0', '1']).should match /^[0-1][0-1][0-1][0-1]$/
    end
  end
end
