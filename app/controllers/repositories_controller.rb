class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["client_id"] = '45a9159cb289d9309b97'
      req.params["client_secret"] = '426b97ed49aef2ec42e916462a53c3c49e88f7c0'
      req.params["q"] = params[:query]
    end
    response_body = JSON.parse(@resp.body)
    @results = response_body["items"]
    render :search
  end
end
