# 
# Example of getting data for all the projects
#
Sifter = require '../lib/sifter'

sifter = new Sifter 'abc', '123'

sifter.Projects (data) ->
  for project in data.projects
    do(project) -> 
      console.log project.name
