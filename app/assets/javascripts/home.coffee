# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Notifications
  constructor: ->
    @notifications = $("[data-behaviour='notifications]'")
    @setup() if @notifications.length > 0

  setup: ->
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )
  handleSuccess: (data) =>
    console.log(data)
    items = $.map data, (notification) ->
      "<a class='' href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable} </a>"
    $("[data-behaviour='notifications-items]'").html(items)

jQuery ->
  new Notifications
