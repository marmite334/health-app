class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]

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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      @post.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id, :image).merge(user_id: current_user.id)
  end
end
