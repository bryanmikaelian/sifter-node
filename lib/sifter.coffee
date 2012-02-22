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
          callback JSON.parse(data)
        catch err
          callback null, data or { }

  Projects: (callback) ->
    @get "https://#{@company}.sifterapp.com/api/projects", callback

  Project: (id, callback) ->
    @get "https://#{@company}.sifterapp.com/api/projects/#{id}", callback

  Milestones: (project_id , callback) ->
    @get "https://#{@company}.sifterapp.com/api/projects/#{project_id}/milestones", callback

  Categories: (project_id, callback) ->
    @get "https://#{@company}.sifterapp.com/api/projects/#{project_id}/categories", callback

  People: (project_id, callback) ->
    @get "https://#{@company}.sifterapp.com/api/projects/#{project_id}/people", callback

  Issues: (project_id, callback) ->
    @get "https://#{@company}.sifterapp.com/api/projects/#{project_id}/issues", callback

  Issue: (project_id, issue_id, callback) ->
    @get "https://#{@company}.sifterapp.com/api/projects/#{project_id}/issues/#{issue_id}", callback

  Statuses: ->
    @get "https://#{@company}.sifterapp.com/api/statuses", callback

  Priorities: ->
    @get "https://#{@company}.sifterapp.com/api/priorities", callback

  Get: (api_url, callback) ->
    @get api_url, callback

 module.exports = Sifter
