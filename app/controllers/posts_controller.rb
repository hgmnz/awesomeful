class PostsController < ApplicationController

  # GET /posts/new                        HTML
  # ------------------------------------------
  def new
    @post = Post.new
  end

  # GET /posts                            HTML
  # ------------------------------------------
  def index
    @posts       = Post.published
    @latest_post = @posts.slice!(0)
    @three_posts = @posts.slice!(0..2)
    @post_drafts = Post.drafts
  end

  # GET /posts/:id                        HTML
  # ------------------------------------------
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/:id/edit                   HTML
  # ------------------------------------------
  def edit
    @post = Post.find(params[:id])
  end 

  # POST /posts/:id                       HTML
  # ------------------------------------------
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post updated successfully"
      render :action => 'show'
    else
      flash[:error] = "Something went wrong. Try again. Sorry."
      render :action => 'edit'
    end
  end

  # POST  /posts                          HTML
  # ------------------------------------------
  def create
    if Post.create!(params[:post])
      flash[:notice] = 'Post created successfully'
      redirect_to root_path
    else
      flash[:error] = 'Error creating post'
    end
  end

end
