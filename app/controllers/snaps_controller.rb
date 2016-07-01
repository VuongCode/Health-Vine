class SnapsController < ApplicationController
  before_action :authorize_user

  def create
    @post = Post.find(params[:post_id])
    @snap = Snap.new(snap_params)
    @snap.user_id = current_user.id
    @snap.post_id = @post.id

    if @snap.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  private

  def snap_params
    params.require(:snap).permit(:photo, :video, :post_id, :user_id)
  end

  def authorize_user
    if !current_user
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
