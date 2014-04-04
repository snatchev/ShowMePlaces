import Lapis from require 'lapis'
import Http from require 'lapis/nginx/http'

Lapis.serve class extends Lapis.Application
  "/:location": =>
    body, status, headers = Http.request("http://wikitravel.org/en/#{@params.location}")
    if img = body.match('<a href="/en/File:.->(<img.-/>)</a>')
      img
    else
      status: 404
