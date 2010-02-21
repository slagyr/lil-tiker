module SubmitTask

  def button_pressed(event = nil)
    activity = scene.activity_input.text.to_s
    if activity.empty?
      java.awt.Toolkit.getDefaultToolkit().beep
    else
      scene.process_activity(activity)
      scene.activity_input.text = ""
    end
  end
  
end