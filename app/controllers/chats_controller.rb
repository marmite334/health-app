class ChatsController < ApplicationController

  def index
    @chat = Chat.new
    @category = Category.new
  end

end
