require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'entry'

describe Entry do

  before(:each) do
  end

  it "should create with current time" do
    entry = Entry.new("blah")
    (Time.now - entry.time).should < 1 
  end

  it "should convert to string" do
    entry = Entry.new("blah")

    entry.to_s.should == "#{entry.time}:\tblah"
  end

end