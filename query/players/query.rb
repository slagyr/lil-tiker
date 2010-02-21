module Query
  prop_reader :activity_input

  def hide()
    scene.stage.kiosk = false
    scene.stage.hide
  end

  def show()
    scene.stage.show
    scene.stage.kiosk = true
  end

  def process_activity(activity)
    production.data.enter(activity)
    hide()
    production.theater["status"].current_scene.update_status
    Thread.new do
      sleep scene.production.interval
      show()
    end
  end
end