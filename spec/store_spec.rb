require File.expand_path(File.dirname(__FILE__) + "/spec_helper")
require 'store'

describe Store do

  before(:each) do
    @data = Store.new("/tmp/tiker.txt")
  end

  def content
    return IO.read("/tmp/tiker.txt")
  end

  it "should write entry" do
    @data.enter("blah")

    last_entry = @data.current
    last_entry.activity.should == "blah"
    content.include?(last_entry.to_s)
  end

end