class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = Chat.all.order(id: 'DESC').take(100)
  end

  def create
    chat = Chat.new(chat_params)
    if chat.valid?
      chat.save
      render json: { chat: chat }
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    if current_user.id == @chat.user.id
      if @chat.destroy
        redirect_to action: :index
      else
        render :index
      end
    end
  end

  private

  def chat_params
    params.permit(:text).merge(user_id: current_user.id)
  end
end
