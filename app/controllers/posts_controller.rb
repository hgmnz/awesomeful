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
    @post_drafts = Post.drafts
  end

  # GET /posts/:post_id                   HTML
  # ------------------------------------------
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/:post_id/edit              HTML
  # ------------------------------------------
  def edit
    @post = Post.find(params[:id])
  end 

  # POST /posts/:post_id                  HTML
  # ------------------------------------------
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post updated successfully"
      render :action => 'show'
    else
      flash[:error] = "Something went wrong. Try again. Sorry."
    end
  end

  # POST  /posts                         HTML
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
