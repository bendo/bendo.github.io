---
---

doNothing = () ->

this.get = (url, onSuccess = doNothing, onFailure = doNothing) ->
  xhr = new XMLHttpRequest()
  xhr.open('GET', url)
  xhr.onload = () ->
    if xhr.status == 200
      onSuccess(JSON.parse xhr.responseText)
    else
      onFailure()
  xhr.send()
