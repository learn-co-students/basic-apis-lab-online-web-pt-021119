class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'client id here'
      req.params['client_secret'] = 'client secret here'
      req.params['q'] = params[:query]
      #req.options.timeout = 1000
    end

    body = JSON.parse(@resp.body)

    if @resp.success?
      @results = body["items"]
    else
      @error = body["message"]
    end
    
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render 'search'
  end

end
