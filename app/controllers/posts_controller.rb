class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      @post.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @post.user.id
      if @post.destroy
        redirect_to root_path
      else
        render :show
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
