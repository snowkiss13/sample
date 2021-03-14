class BlogsController < ApplicationController
  def index
    # 全てのブログを取得する命令
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.create(blog_params)
    # new_blog_pathというPrefixを書くことで、"/blogs/new"というURLの指定をします、という意味になる。
    redirect_to new_blog_path
  end
  def show
    @blog = Blog.find(params[:id])
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
