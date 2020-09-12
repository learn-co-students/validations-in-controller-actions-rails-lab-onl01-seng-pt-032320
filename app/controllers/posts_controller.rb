class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @post.title = post_params(:title)[:title]
    @post.category = post_params(:category)[:category]
    @post.content = post_params(:content)[:content]
    puts "#{@post.inspect}"
    if @post.valid? 
      @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params(*args)
    params.permit(*args)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
