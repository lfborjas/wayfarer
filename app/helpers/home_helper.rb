module HomeHelper
  def render_jst
    Dir.entries("#{Rails.root}/app/views/home/jst").select{|s| s["erb"]}.reduce("") do |result, name|
      name =~ /_(\w+).*/
      result + %Q|
        <script type="text/template" id="#{$1}-template">
          #{render("home/jst/#{$1}")}
        </script>
      |
    end
  end
end
