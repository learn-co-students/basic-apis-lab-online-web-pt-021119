class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '80fbebcedebb8800a3f1'
        req.params['client_secret'] = '937ca6e47f1bc8a68753c7dc17888738ae9d00ba'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      @repos = body["items"]
      binding.pry
      render 'search'
  end
end
