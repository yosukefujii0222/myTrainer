if @new_chat.present?
  json.array! @new_chat do |chat|
    json.id       chat.id
    json.sender   chat.sender
    json.trainer  chat.trainer.name
    json.user     chat.user.name
    json.body     chat.body
    json.date     chat.created_at.strftime('%Y/%m/%d %H:%M')
  end
end
