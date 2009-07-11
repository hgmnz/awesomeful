class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def index
    @posts       = Post.published
    @latest_post = @posts.slice!(0)
    @post_drafts = Post.drafts
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end 

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post updated successfully"
      render :action => 'show'
    else
      flash[:error] = "Something went wrong. Try again. Sorry."
    end
  end

  def create
    if Post.create!(params[:post])
      flash[:notice] = 'Post created successfully'
      redirect_to root_path
    else
      flash[:error] = 'Error creating post'
    end

  end

  def destroy
  end

end
