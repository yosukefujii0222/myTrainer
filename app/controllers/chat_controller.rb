class ChatController < ApplicationController
  def show
    @chats = Chat.where(follower_id: params[:room_id])
    @follower = Follower.find_by(id: params[:room_id])
  end

  def trainerCreate
    @chat = Chat.new(sender: 1, body: params[:body], follower_id: params[:room_id])
    @chat.save
    respond_to do |format|
      format.html { redirect_to("/chat/#{params[:room_id]}") }
      format.json
    end
  end

  def userCreate
    @chat = Chat.new(sender: 2, body: params[:body], follower_id: params[:room_id])
    @chat.save
    redirect_to("/chat/#{params[:room_id]}")
  end


end
