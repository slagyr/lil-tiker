cell :horizontal_alignment => :left do
  small_icon :players => "image", :image => "images/small_icon.png"
end
cell :horizontal_alignment => :right do
  quit_button :text => "Quit", :on_mouse_clicked => "production.close"
end 
status_text :id => "status_text", :text => "No activity entered yet."