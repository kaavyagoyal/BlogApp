class BlogsController < ApplicationController

respond_to :js, :html, :json

  def index
    @blogs = Blog.all.includes(:user)
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to @blog

    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

     redirect_to root_path
  end

  # def like
  #   @blog = Blog.find(params[:id])
  #   if params[:format] == 'like'
  #     @blog.liked_by current_user
  #   elseif params:[:format] == 'unlike'
  #   @blog.unliked_by current_user
  #   end
  # end

  def upvote
    @blog = Blog.find(params[:id])
    @blog.upvote_from current_user
    redirect_to blogs_path
  end

  def downvote
    @blog = Blog.find(params[:id])
    @blog.downvote_from current_user
    redirect_to blogs_path
    
  end

  # def upvote
  #   @blog = Blog.find(params[:id])
  #   @blog.upvote_by current_user
  #   respond_to do |format|
  #     format.js
  # end 
# end
  private
   def blog_params  
     params.require(:blog).permit(:title, :description, :image,)
   end 

 end


