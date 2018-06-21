# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Notifications
  constructor: ->
    @notifications = $("[data-behaviour='notifications']")
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
      "<a href='#{notification.url}' class='collection-item avatar'>
        <i class='material-icons circle green'>insert_chart</i>
        <span class='title'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</span>
      </a>"
    $("[data-behaviour='notifications']").html('')
    $("[data-behaviour='notifications']").append('<li class="collection-header center-align"><h4>Notifiche</h4></li>')
    $("[data-behaviour='notifications']").append(items)

jQuery ->
  new Notifications
