class ChatsController < ApplicationController
  before_action :authenticate_user!

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

  def destroy
    @chat = Chat.find(params[:id])
    if current_user.id == @chat.user.id
      if @chat.destroy
        redirect_to chats_path(@chat)
      else
        render :index
      end
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:text).merge(user_id: current_user.id)
  end

end
