class PostsController < ApplicationController
  before_filter :authenticate, :except => [:show, :index, :tags]

  # GET /posts/new                        HTML
  # ------------------------------------------
  def new
    @post = Post.new
  end

  # GET /posts                            HTML
  # ------------------------------------------
  def index
    respond_to do |wants|
      wants.html {
        @posts       = Post.published
        @tag_counts  = Post.post_tag_counts
        @latest_post = @posts.slice!(0)
        @three_posts = @posts.slice!(0..2)
        @post_drafts = Post.drafts
      }
      wants.atom {
        @posts      = Post.published.limited(5)
      }
    end
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

  # GET /posts/tags/:tags         HTML + AJAX
  # -------------------------------------------
  def tags
    render :action => 'index' unless params[:tags]
    @posts = Post.tagged_with(params[:tags], :on => 'tags')
    @tag_counts = Post.post_tag_counts
    @tags = []
    params[:tags].each do |t|
      @tags << t
    end
    respond_to do |wants|
      wants.js do
        render :partial => 'post_list', :locals => { :posts => @posts }
      end
      wants.html
    end
  end

end
