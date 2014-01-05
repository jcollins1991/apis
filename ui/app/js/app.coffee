require 'bower_components/jquery/jquery.js'
require 'bower_components/handlebars/handlebars.js'
require 'bower_components/ember.js/ember.js'
require 'js/templates.js'

main = ->
  App = Ember.Application.create()

  App.Router.map ->
    a = 1

  App.IndexRoute = Ember.Route.extend
    model: ->
      return ['red', 'yellow', 'blue', "BLAH"]

  App.IndexController = Ember.Controller.extend
    login: ->
      window.open("https://www.facebook.com/dialog/oauth?client_id=269779866505260&" +
        "redirect_uri=https://localhost:3000/#login", "Login", "height=200,width=150")

localStorage.setItem("token", "blah")
window.addEventListener "storage", ->
  alert(1)

if (window.location.hash == "#_=_")
  localStorage.setItem("token", "11111")
  window.close()
else
  main()