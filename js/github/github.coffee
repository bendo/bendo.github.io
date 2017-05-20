---
---

class this.User
  constructor: (@name) ->

class this.Repository
  constructor: (repo) ->
    @name = repo.name
    @url = repo.html_url
    @description = repo.description
    @homepage = repo.homepage
    @language = repo.language
    @forks = repo.forks_count
    @stargazers = repo.stargazers_count
    @watchers = repo.watchers_count

  score: () =>
    @stargazers + @forks

this.loadRepositories = (user, onSuccessProcessRepos, onFailure) ->
  onSuccess = (result) ->
    onSuccessProcessRepos(new Repository ghRepo for ghRepo in result)

  get('https://api.github.com/users/' + user.name + '/repos', onSuccess, onFailure)
