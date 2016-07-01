class CommentsController < ApplicationController
  before_action :authorize_user
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rating, :post_id, :user_id)
  end

  def authorize_user
    if !current_user
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
