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

  describe "wrap" do
    it "should take a string parameter" do
      lambda {
        Wordwrap.new(5).wrap "word"
      }.should_not raise_exception
    end

    it "should raise an exception for a non-string parameter" do
      lambda {
        Wordwrap.new(5).wrap
      }.should raise_exception
      lambda {
        Wordwrap.new(5).wrap [1, 2, 3]
      }.should raise_exception
    end

    it "should return the empty string for the empty string" do
      WordWrap.new(4).wrap("").should == ""
    end
  end
end
