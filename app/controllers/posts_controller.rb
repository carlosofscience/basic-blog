class PostsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password:'1234', except: [:index, :show]

  def index
    #send all posts to display at index 
    @posts = Post.all
  end
  
  def show
    #find the post with the :id param in the http request
    @post = Post.find(params[:id])
  end
  
  def new
    #passing post for errors (if any) whens serving new (client page)
    @post = Post.new
  end

    #serving post to be edited according to the :id sent on the request
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    # creates a post using the helper method post_params, to validate form
    @post = Post.new(post_params)
    #saving post
    if(@post.save)
      #on save, redirecting to post (client view)
      redirect_to @post
    else
      #after saved (will only save if meets requirements on post model)
      #render new, which if there is any issue it will render errors (check "def new")
      render 'new'
    end
  end
  
  def destroy
    # finds post with id, and destroy all comments where id (FK) matches the post id (PK)
    @post = Post.find(params[:id])
    Comment.where(:post_id == :id).destroy_all
    #then destroy post, and redirect to /posts index, to show posts
    @post.destroy
    redirect_to posts_path
  end
  
  def update
    #find post by id sent on request, then use post_params helper to validate form, and update
    @post = Post.find(params[:id])
      if(@post.update(post_params))
        #redirecting to post, after saved (will only save if meets requirements on post model)
        redirect_to @post
      else
        #send back to edit to render errors, and try again
        render 'edit'
      end
  end
  
  #helper function to test post paramns, the permit depends on the configuration of the model at models>post.rb
  private def post_params
    params.require(:post).permit(:title, :body, :categories)
  end

end
