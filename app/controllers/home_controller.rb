class HomeController < ApplicationController
  def index
    respond_to do |format|
      @mode = params[:mode] || 'full'
      @width = params[:width] || 1265 
      @height = params[:height] || 800
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

  def demo_feed
    respond_to do |format|
      format.json do
        render :json => DemoFeed.items
      end
    end
  end

  def demo_comments
    respond_to do |format|
     format.json {render :json => DemoFeed.comments.sample(4)} 
    end
  end
end
