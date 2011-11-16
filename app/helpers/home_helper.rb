module HomeHelper
  def render_jst
    Dir.entries("#{Rails.root}/app/views/home/jst").select{|s| s["erb"]}.reduce("") do |result, name|
      name =~ /_(\w+).*/
      result + render("home/jst/#{$1}")
    end
  end
end
