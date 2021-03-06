class SiteController < ApplicationController

  def index
    @title = t(:start_page) 
    @user = User.find_by_username('admin')
    @post = Post.find(:first, :order => "created_at DESC", :conditions => ["user_id = ? AND deleted = 0", @user.id]) 
    @concept = Concept.find_by_title("goout_start")
    @renderer = PageRenderer.new(@concept.revisions.last)
  end

  def about
     @title = t(:about)
     @concept = Concept.find_by_title("goout_about")
     @renderer = PageRenderer.new(@concept.revisions.last)
  end

  def help
     @title = t(:help) 
     @concept = Concept.find_by_title("goout_help")
     @renderer = PageRenderer.new(@concept.revisions.last)
  end

  def blog
     @title = t(:project_blog) 
     @user = User.find_by_username('admin')

     @title = t(:blog_posts, :username => @user.username )
     @blog_url = @user.blog_url 

     if (params[:tag_id])
         @posts = @user.posts.find_tagged_with(params[:tag_id], :order => "created_at DESC", :conditions => "deleted = 0" )
         @posts = @posts.paginate(:per_page => 20)
     else
         @posts = Post.find_all_by_user_id(@user.id, :order => "created_at DESC", :conditions => "deleted = 0") 
         @posts = @posts.paginate(:per_page => 20)
     end

     @tags = @user.posts.tag_counts

     render 'posts/index'
  end

end
