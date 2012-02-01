class Sifter
  constructor: (company, token) ->
    @company = company
    @token = token
    @httpclient = require 'scoped-http-client'

  http: (url) ->
    @httpclient.create(url)
