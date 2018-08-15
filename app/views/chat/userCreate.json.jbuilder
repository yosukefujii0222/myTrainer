  json.id    @chat.id
  json.body  @chat.body
  json.user  @chat.user.name
  json.date  @chat.created_at.strftime('%Y/%m/%d %H:%M')
