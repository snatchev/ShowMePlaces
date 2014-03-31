import config from require 'lapis.config'

config 'development', ->
  port 8080
  num_workers 4
  worker_connections 256
  code_cache 'off'

config 'production', ->
  port 8080
  num_workers 8
  worker_connections 256
  code_cache 'on'
