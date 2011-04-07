require 'spec_helper'
require 'wordwrap'

describe Wordwrap do
  describe "new" do
    it "should take an integer parameter" do
      lambda {
        Wordwrap.new 4
      }.should_not raise_exception
    end

    it "should raise an exception for a non-numeric parameter" do
      lambda {
        Wordwrap.new
      }.should raise_exception

      lambda {
        Wordwrap.new "hello"
      }.should raise_exception
    end
  end
end
