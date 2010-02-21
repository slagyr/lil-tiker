require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require File.expand_path(File.dirname(__FILE__) + "/../mock_store")

describe "Query Scene" do

  uses_limelight :scene => "query", :hidden => false
  
  before(:each) do
    production.interval = 0.1
    @data = MockStore.new
    production.data = @data
  end
  
  it "asks what you are doing?" do
    activity_label = scene.find("activity_label")
    activity_label.text.should == "What are you doing?"
    activity_prop = scene.find("activity_input")
    activity_prop.should_not be_nil
  end
  
  it "has a button to 'submit' what you were doing" do
    button = scene.find("save_task")
    
    button.text.should == "Now Go Away!"
  end
  
  it "has a button which is a button" do
    button = scene.find("save_task")
    
    button.players.should == "Button"
  end
  
  it "has a text input which is a text box" do
    activity_input = scene.find("activity_input")
    
    activity_input.players.should == "text_box"
  end
  
  it "uses the input when storing the task" do
    scene.find("activity_input").text = "something else"

    scene.find("save_task").button_pressed

    @data.entries.include?("something else").should == true
  end
  
  it "should write something to a tmp file when you click the button" do
    scene.activity_input.text = "something"

    scene.find("save_task").button_pressed

    @data.entries.include?("something").should == true
  end
  
  it "should append new tasks" do
    scene.find("activity_input").text = "task one"
    scene.find("save_task").button_pressed
    scene.find("activity_input").text = "task two"
    scene.find("save_task").button_pressed
    
    @data.entries.include?("task one").should == true
  end
  
  it "clears the text box on submit" do
    scene.find("activity_input").text = "task one"
    scene.find("save_task").button_pressed
    scene.find("activity_input").text.should == ""
  end

  it "should do nothing when you don't provide an activity" do
    scene.find("activity_input").text = ""
    scene.find("save_task").button_pressed

    @data.entries.empty?.should == true
  end
  
#  it "go away for a while on submit" do
#    scene.find("activity_input").text = "task one"
#    scene.find("save_task").button_pressed
#    scene.stage.visible?.should == false
#
#    sleep(0.2)
#    scene.stage.visible?.should == true
#  end
  
end