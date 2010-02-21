module Status

  prop_reader :status_text

  def update_status
    entry = production.data.current
    time_str = entry.time.strftime("%H:%m")
    status_text.text = "#{time_str}: #{entry.activity}"
    panel.markAsDirty
  end

end