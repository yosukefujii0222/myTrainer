class ChatController < ApplicationController

  before_action :authenticate_user,{only: [:show, :trainerCreate, :userCreate]}

  def show
    @chats = Chat.where(follower_id: params[:room_id])
    @follower = Follower.find_by(id: params[:room_id])
    respond_to do |format|
      format.html
      format.json{ @new_chat = Chat.where('id > ?', params[:chat][:id])}
    end

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
    respond_to do |format|
      format.html { redirect_to("/chat/#{params[:room_id]}") }
      format.json
    end
  end
end
