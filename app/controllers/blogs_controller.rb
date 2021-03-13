class BlogsController < ApplicationController
  def index
  end
  def new
    @blog = Blog.new
  end
  def create
    Blog.create(params.require(:blog).permit(:title, :content))
    # new_blog_pathというPrefixを書くことで、"/blogs/new"というURLの指定をします、という意味になる。
    redirect_to new_blog_path
  end
end
