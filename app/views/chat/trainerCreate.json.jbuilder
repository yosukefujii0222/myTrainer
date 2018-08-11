  json.body     @chat.body
  json.trainer  @chat.trainer.name
  json.date     @chat.created_at.strftime('%Y/%m/%d %H:%M')
