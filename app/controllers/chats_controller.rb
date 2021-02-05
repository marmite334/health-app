class ChatsController < ApplicationController

  def index
    @chat = Chat.order('created_at DESC')
  end

end
