require 'sinatra'
require 'faraday'

http = Faraday.new

get '/:location' do
  body = http.get("http://wikitravel.org/en/" + params[:location]).body
  if img = body.match(%r(<a href="/en/File:.*?>(<img.*?/>)</a>))
    img[1]
  else
    halt(404)
  end
end
