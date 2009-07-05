class PostsController < ApplicationController
  def index
    @posts = Post.all
    @latest_post = Post.latest
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end 

  def update
    @post = Post.find(params[:id])
    raise "TODO"
  end

  def destroy
  end

end
