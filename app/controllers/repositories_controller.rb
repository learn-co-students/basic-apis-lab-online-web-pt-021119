class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = ENV['GITHUB_ID']
        req.params['client_secret'] = ENV['GITHUB_SECRET']
        req.params['q'] = params[:query]
        # req.options.timeout = 0 #this is to test timeout text
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body['items']
      else
        @errors = body['errors']
      end

    rescue Faraday::ConnectionFailed
      @timeout = "There was a timeout. Please try again"
    end
    render 'search'
  end

end
