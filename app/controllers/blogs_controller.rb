class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update]
  def index
    # 全てのブログを取得する命令
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.create(blog_params)
    if @blog.save
      # 一覧画面へ遷移しブログ作成しました！のメッセージを表示する
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      # 入力フォーム再描画
      render :new
    end
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def show
  end
  def edit
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
