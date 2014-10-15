class HomeController < ApplicationController
  def index
    @tag = TagAns.first
    @tags = TagAns.all  
  end

  def tags
    id = params[:id]
    id ||= 1
    tags = TagAns.where(["name LIKE ?", "#{params[:name]}%"]).select("id, name")
    render json: tags
  end
  def tag
    id = params[:id]
    id ||= 1
    tag = TagAns.find(id)
    render json: {name: tag.name, data: JSON.parse(tag.data)}
  end
end
