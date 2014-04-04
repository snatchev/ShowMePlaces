from flask import Flask, abort
from httplib2 import Http
import re

app = Flask(__name__)
http = Http('.cache')

@app.route("/<location>")
def show_location(location):
    (response, body) = http.request("http://wikitravel.org/en/" + location, "GET")
    img = re.search('<a href="/en/File:.*?>(<img.*?/>)</a>', body)
    if img:
        return img.group(1)
    else:
        abort(404)

#if __name__ == '__main__':
#    app.run()
