class BlogsController < ApplicationController
  def index
  end
  def new
    @blog = Blog.new
  end
  def create
    Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    # new_blog_pathというPrefixを書くことで、"/blogs/new"というURLの指定をします、という意味になる。
    redirect_to new_blog_path
  end
  end
end
