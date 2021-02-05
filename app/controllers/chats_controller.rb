class ChatsController < ApplicationController

  def index
    @chat = Chat.order('created_at DESC')
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.valid?
      @chat.save
    else
      render :index
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:text).merge(user_id: current_user.id)
  end

end
