class HomeController < ApplicationController
  def index
    @tag = TagAns.first
    @tags = TagAns.all  
  end

  def tags
    id = params[:id]
    id ||= 1
    tags = TagAns.where(["name LIKE ?", "#{params[:name].downcase}%"]).select("id, name")
    render json: tags
  end
  def tag
    id = params[:id]
    id ||= 1
    tag = TagAns.find(id)
    emr = TagEmr.find_by_name(tag.name)
    render json: {name: tag.name, ans_data: JSON.parse(tag.data), trend_data: JSON.parse(emr.stats) }
  end
end
