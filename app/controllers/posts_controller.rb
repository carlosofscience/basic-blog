class PostsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password:'1234', except: [:index, :show]

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

  def edit
    @post = Post.find(params[:id])
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
  
  def destroy
    @post = Post.find(params[:id])
    Comment.where(:post_id == :id).destroy_all
    @post.destroy

    redirect_to posts_path
  end
  
  def update
    @post = Post.find(params[:id])
      if(@post.update(post_params))
        #redirecting to post, after saved (will only save if meets requirements on post model)
        redirect_to @post
      else
        render 'edit'
      end
  end
  
  #helper function to test post paramns
  private def post_params
    params.require(:post).permit(:title, :body, :categories)
  end

end
