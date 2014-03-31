lapis = require 'lapis'
http = require 'lapis.nginx.http'

lapis.serve class extends lapis.Application
  "/:location": =>
    body, status, headers = http.simple "http://wikitravel.org/en/#{@params.location}"
    img = string.match(body, '<a href="/en/File:.->(<img.-/>)</a>')
    if img
      img
    else
      status: 404
