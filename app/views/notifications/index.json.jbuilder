json.array! @notifications do |notification|
  json.actor notification.actor.email
  json.action notification.action
  json.notifiable do
    json.type "a "#{notification.class.name}
  end
  json.url = "/"
end
