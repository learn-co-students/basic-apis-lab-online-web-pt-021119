class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  @resp= Faraday.get( "https://api.github.com/search/repositories") do |req|
    req.params['client_id'] = 'Iv1.fe78d0fc89e85b93'
      req.params['client_secret'] = 'abffa9a668106e8b5ebccc5f3cbc6f666e2311c1'
      req.params['q']= params[:query]
  end

  body = JSON.parse(@resp.body)
  @repos=  body['items']
  render :search 

end 
end
