require 'sinatra'
require 'faraday'
require 'faraday-http-cache'

http = Faraday.new do |f|
  f.use :http_cache, shared_cache: false
  f.adapter Faraday.default_adapter
end

get '/:location' do
  body = http.get("http://wikitravel.org/en/#{params[:location]}").body
  img = body.match(/<a href="\/en\/File:.*>(<img.*\/>)<\/a>/)
  if img
    img[1]  #the first capture group
  else
    halt 404
  end
end
