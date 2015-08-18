class Blog::PostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]


  def my_journey
    @blog_posts = Blog::Post.where(tag: "My Journey")
    @top_posts = Blog::Post.last(5)
  end

  def sacred_corner
    @blog_posts = Blog::Post.where(tag:"Sacred Corner")
    @top_posts = Blog::Post.last(5)
  end
  # GET /blog/posts
  # GET /blog/posts.json
  def index
    @blog_posts = Blog::Post.all.order("created_at DESC")
    @tags = Tag.all
    @top_posts = Blog::Post.last(5)
  end

  # GET /blog/posts/1
  # GET /blog/posts/1.json
  def show
    @blog_post = Blog::Post.find(params[:id])
    @top_posts = Blog::Post.last(5)
  end

  # GET /blog/posts/new
  def new
    if current_user.admin?
      @tags = Tag.all
      @blog_post = Blog::Post.new
    else
      redirect_to root_path
    end
  end

  # GET /blog/posts/1/edit
  def edit
    @blog_post = Blog::Post.find(params[:id])
    @tags = Tag.all
    @top_posts = Blog::Post.last(5)
  end

  # POST /blog/posts
  # POST /blog/posts.json
  def create
    if current_user.admin?
    @blog_post = Blog::Post.new(blog_post_params)
    @tags = Tag.all
    @blog_post.user_id = current_user.id

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to @blog_post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @blog_post }
      else
        format.html { render :new }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  else
    redirect_to root_path
  end
  end

  # PATCH/PUT /blog/posts/1
  # PATCH/PUT /blog/posts/1.json
  def update
    if current_user.admin?
      @blog_post = Blog::Post.find(params[:id])
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to @blog_post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog_post }
      else
        format.html { render :edit }
        format.json { render json: @blog_post.errors, status: :unprocessable_entity }
      end
    end
  else
    redirect_to root_path
  end
  end

  # DELETE /blog/posts/1
  # DELETE /blog/posts/1.json
  def destroy
    if current_user.admin?
      @blog_post = Blog::Post.find(params[:id])
      @blog_post.destroy
      respond_to do |format|
        format.html { redirect_to blog_posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = Blog::Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_post_params
      params.require(:blog_post).permit(:user_id, :title, :content, :image, :tag)
    end
end
