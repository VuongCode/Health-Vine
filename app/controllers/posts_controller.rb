class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:index, :edit, :show, :new, :create, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comments = Comment.where(post_id: @post)
    @snaps = Snap.where(post_id: @post)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :description)
  end

  def authorize_user
    if !current_user
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
