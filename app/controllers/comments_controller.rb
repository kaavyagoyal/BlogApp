class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
    @comment.save
  redirect_to "/blogs/#{@comment.blog_id}", notice: "Comment created"

  end

  private 
  def comment_params
  	params.require(:comment).permit(:blog_id, :body)
  end
end












