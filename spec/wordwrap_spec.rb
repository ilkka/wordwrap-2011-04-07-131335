require 'spec_helper'
require 'wordwrap'

describe Wordwrap do
  describe "new" do
    it "should instantiate" do
      lambda {
        Wordwrap.new
      }.should_not raise_exception
    end

    it "should take an integer parameter" do
      lambda {
        Wordwrap.new 4
      }.should_not raise_exception
    end
  end
end
