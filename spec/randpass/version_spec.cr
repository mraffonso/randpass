require "../spec_helper"
require "../../src/randpass/version"

describe Randpass::VERSION do
  it "returns semver version number" do
    Randpass::VERSION.should match /\d+.\d+.\d+/
  end
end

describe "Randpass::VERSION_STRING" do
  it "returns program name and version number" do
    Randpass::VERSION_STRING.should eq "Randpass #{Randpass::VERSION}"
    Randpass::VERSION_STRING.should match /^Randpass \d+.\d+.\d+$/
  end
end
