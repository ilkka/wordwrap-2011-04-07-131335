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
      Wordwrap.new(4).wrap("").should == ""
    end

    it "should not modify one word shorter than wrap length" do
      Wordwrap.new(6).wrap("word").should == "word"
    end

    it "should wrap two words at word boundary" do
      Wordwrap.new(5).wrap("word word").should == "word\nword"
    end

    it "should wrap three words at word boundaries" do
      Wordwrap.new(5).wrap("word word word").should == "word\nword\nword"
    end

    it "should wrap at the last word boundary before wrap length" do
      Wordwrap.new(10).wrap("word word word").should == "word word\nword"
    end

    it "should break one short word at the wrap length" do
      Wordwrap.new(2).wrap("word").should == "wo\nrd"
    end

    it "should not touch whitespace other than at the place it wraps at" do
      Wordwrap.new(12).wrap("word   word word").should == "word   word\nword"
    end
  end
end
