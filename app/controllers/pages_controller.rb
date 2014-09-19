class PagesController < ApplicationController
  def index
  end

  def advanced_search
  	respond_to do |format|
  		format.html
  	end
  end

  def result
    @captures = nil
    if params[:search_type].to_i == 0
      text = params[:text_to_search]
      @captures = Capture.find_by_word(text)
    else
      @captures = Capture.advanced_search(params[:latitude], params[:longitude], params[:altitude], params[:temperature], params[:humidity], params[:season], params[:capture_type])
    end

  	respond_to do |format|
  		format.js
  	end
  end

  def random

    #Do not use this code for production
    ids = Capture.pluck(:id)
    @capture = Capture.find(ids.sample)

  	respond_to do |format|
  		format.js
  	end
  end

  def around
  	respond_to do |format|
  		format.js
  	end
  end

end