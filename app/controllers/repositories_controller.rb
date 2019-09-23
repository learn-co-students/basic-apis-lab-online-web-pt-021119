class RepositoriesController < ApplicationController

  def search

  end

  def github_search

  resp = Faraday.get("https://api.github.com/search/repositories") do |req|
    req.params["q"] = params[:query]
    req.params["client_id"] = "Iv1.0ef03a7bac4edb75e417"
    req.params["client_secret"] = "02942fd75ad97490a57c99268b178b8492b34a70"
  end

  body = JSON.parse(resp.body)
  @results = body["items"]
  render :search
  end
end
