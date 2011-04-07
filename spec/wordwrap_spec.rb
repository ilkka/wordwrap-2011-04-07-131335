require 'spec_helper'
require 'wordwrap'

describe Wordwrap do
  describe "new" do
    it "should instantiate" do
      lambda {
        Wordwrap.new
      }.should_not raise_exception
    end
  end
end
