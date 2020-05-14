class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    #find the post with the :id param in the http request
    @post = Post.find(params[:id])
  end
  
  def new
    #passing post for errors (if any)
    @post = Post.new
  end
  
  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)
    #saving post
    if(@post.save)
      #redirecting to post, after saved (will only save if meets requirements on post model)
      redirect_to @post
    else
      render 'new'
    end
  end

  #helper function to test post paramns
  private def post_params
    params.require(:post).permit(:title, :body, :categories)
  end

end
