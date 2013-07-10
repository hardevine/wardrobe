@Wardrobe.module "AccountApp", (AccountApp, App, Backbone, Marionette, $, _) ->

  class AccountApp.Router extends Marionette.AppRouter
    appRoutes:
      "account/new" : "new"
      "account/edit" : "edit"

  API =
    new: ->
      new AccountApp.New.Controller
        region: App.mainRegion

    edit: ->
      new AccountApp.Edit.Controller
        region: App.mainRegion

  App.vent.on "account:new:clicked", ->
    App.navigate "/account/new"
    API.new()

  App.vent.on "account:edit:clicked", ->
    App.navigate "/account/edit"
    API.edit()

  App.addInitializer ->
    new AccountApp.Router
      controller: API