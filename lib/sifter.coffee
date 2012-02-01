class Sifter
  constructor: (company, token) ->
    @company = company
    @token = token
    @httpclient = require 'scoped-http-client'

  http: (url) ->
    @httpclient.create(url)

  get: (url, callback) ->
    @http(url)
      .header('X-Sifter-Token', @token)
      .header('Accept', 'application/json')
      .get() (err, res, data) ->
        try
          callback null, JSON.parse(data)
        catch err
          callback null, data or { }

  Projects: (callback) ->
    @get "https://#{@company}.sifterapp.com/api/projects", callback

  Project: (id, callback) ->
    @get "https://#{company}.sifterapp.com/api/projects/#{id}", callback
