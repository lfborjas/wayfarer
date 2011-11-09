class HomeController < ApplicationController
  def index
    respond_to do |format|
      @mode = params[:mode] || 'full'
      @width = params[:width] || 500
      @height = params[:height] || 500
      format.js {render :template => 'home/embed' ,:layout => false}
      format.html do
        template = if @mode.eql?('full')
                     'home/index'
                   else
                     'home/small_embed'
                   end
        render :template => template
      end
    end
  end
end
