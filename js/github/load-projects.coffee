---
---

user = new User "bendo"

onSuccess = (repos) ->
  repos.sort(_byScore)
  _addTile(createTile(repo, i)) for repo, i in repos

  _loadingImage().classList.add('hide')

onFailure = () ->
  alert "an error happened retrieving stuff"

_addTile = (tile) ->
  _projectsContainer().appendChild(tile)
  tile

_loadingImage = () ->
  document.getElementsByClassName('loading')[0]

_projectsContainer = () ->
  document.getElementsByClassName('projects')[0]

_byScore = (a, b) ->
  b.score() - a.score()

loadRepositories(user, onSuccess, onFailure)
