class PostsController < ApplicationController
  #before execution, run this method but only for show action
  before_action :set_post, only: [:show, :edit, :update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    #Require brings in the post model and require is only whitelisting these parameters
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
    #This will cause rails to expect a 'show' page
      redirect_to @post, notice: 'Your post was created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Your post was created successfully'
    else
      render :edit
    end 
  end

  def show
  end

  private

    def post_params
      params.require(:post).permit(:date,:rationale)
    end

    def set_post
      @post = Post.find(params[:id])
    end

end
