---
---

this.createTile = (repo, index) ->
  _projectDiv(repo, index)

_projectDiv = (repo, index) ->
  projectDiv = _div()
  projectDiv.classList.add('project')

  projectDiv.appendChild(_projectNameDiv(repo))
  projectDiv.appendChild(_projectDataDiv(repo))
  projectDiv.appendChild(_projectPageDiv(repo)) if repo.homepage?.length > 0

  projectDiv

# helpers to create sections
_projectNameDiv = (repo) ->
  itemDiv = _div()
  itemDiv.classList.add('header-link')
  itemDiv.appendChild(_a(repo.name, repo.url))
  itemDiv

_projectDataDiv = (repo) ->
  itemDiv = _div()
  itemDiv.classList.add('project-item')
  itemDiv.appendChild(_repoInfo(repo))
  itemDiv.appendChild(_repoDescription(repo))
  itemDiv

_projectPageDiv = (repo) ->
  itemDiv = _div()
  itemDiv.classList.add('bottom-links')
  itemDiv.appendChild(_repoPage(repo))
  itemDiv

# helpers to create details
_repoInfo = (repo) ->
  infoDiv = _div()

  infoDiv.classList.add('repo-info')

  infoDiv.appendChild(_repoStars(repo))
  infoDiv.appendChild(_repoForks(repo))
  infoDiv.appendChild(_repoLang(repo))

  infoDiv

_repoStars = (repo) ->
  starsSpan = _span()

  starsSpan.appendChild(_octicon('star'))
  starsSpan.appendChild(document.createTextNode(repo.stargazers))

  starsSpan

_repoForks = (repo) ->
  forksSpan = _span()

  forksSpan.appendChild(_octicon('repo-forked'))
  forksSpan.appendChild(document.createTextNode(repo.forks))

  forksSpan

htmlEncode = (str) ->
  str.replace(" ","")

_repoLang = (repo) ->
  langSpan = _span()
  langSpan.classList.add('language', htmlEncode(repo.language))
  langSpan.textContent = htmlEncode(repo.language)
  langSpan

_repoDescription = (repo) ->
  _p(repo.description)

_repoPage = (repo) ->
  a = _a('', repo.homepage)
  a.appendChild(_octicon('browser'))
  a.appendChild(document.createTextNode('Go to'))
  a

# helper to create components
_octicon = (iconName) ->
  oct = document.createElement('i')
  oct.classList.add('octicon', 'octicon-' + iconName)
  oct
_div = () ->
  document.createElement('div')
_span = () ->
  document.createElement('span')
_a = (text, url, target = '_blank') ->
  a = document.createElement('a')
  a.textContent = text
  a.href = url
  a.target = target
  a
_p = (text) ->
  p = document.createElement('p')
  p.textContent = text
  p
