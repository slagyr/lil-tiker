module SubmitTask
  def button_pressed(event = nil)
    File.open("/tmp/tiker.txt", "a") do |f|
      f.write task_info
    end
    scene.activity_input.text = ""
    scene.stage.hide
    Thread.new do
      sleep 0.1
      scene.stage.show
    end
  end
      
  def task_info
    "#{Time.now}: #{scene.activity_input.text}\n"
  end  
end