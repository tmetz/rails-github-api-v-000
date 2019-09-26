class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.body = { 'token': session[:token], 'Accept': 'application/json' }
      #req.headers['Accept'] = 'application/json'
    end
    @repos_array = JSON.parse(resp.body)
  end

  def create
    resp = Faraday.post("https://api.github.com/user/repos") do |req|
      req.body = { 'token': session[:token], 'name': params[:name].to_json, 'Accept': 'application/json' }
      #req.headers['Accept'] = 'application/json'
    end
    redirect_to '/'
  end

end
