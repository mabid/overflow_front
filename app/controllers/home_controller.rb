class HomeController < ApplicationController
  def index
    @tag = Tag.first
    @tags = Tag.all  
  end

  def tag
    id = params[:id]
    id ||= 1
    tag = Tag.find(id)
    render json: {name: tag.name, data: JSON.parse(tag.stats)}
  end
end
