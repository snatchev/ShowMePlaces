require 'sinatra'
require 'faraday'
require 'active_support'
require 'logger'

http = Faraday.new do |f|
  f.adapter Faraday.default_adapter
end

cache = ActiveSupport::Cache::MemoryStore.new

get '/:location' do
  body = cache.fetch(params[:location]) do
    http.get("http://wikitravel.org/en/" + params[:location]).body
  end

  img = body.match(/<a href="\/en\/File:.*?>(<img.*?\/>)<\/a>/)
  if img
    img[1]  #the first capture group
  else
    halt 404
  end
end
