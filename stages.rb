# This file (stages.rb) is used to define the stages within your production.
#
# Below is an example statge configuration.

stage "query" do
  default_scene "query"
  title "Tiker Query"
  location :center, :center
  size [600, 600]
  kiosk true
  framed false
end

stage "status" do
  default_scene "status"
  title "Tiker Status"
  location :right, :top
  size [150, 60]
  framed false
end

stage "devtool" do
  default_scene "devtool"
  title "Dev Tool"
  location [50, 25]
  size [100, 100]
  background_color "transparent"
  framed false
end

