class HomeController < ApplicationController
  def index
    @tag = TagEmr.first
    @tags = TagEmr.all  
  end

  def tag
    id = params[:id]
    id ||= 1
    tag = TagEmr.find(id)
    render json: {name: tag.name, data: JSON.parse(tag.stats)}
  end
end
