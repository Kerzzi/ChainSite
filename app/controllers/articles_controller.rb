class ArticlesController < ApplicationController
  def index
    @articles = Article.all.recent.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
    @userarticles = @article.user.articles.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to articles_path
      flash[:notice] = "文章已提交，待管理员审核后可发布"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path, notice: "文章更新成功！"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, alert: "文章已删除"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content,:summary,:image, :user_id, :author, :source, :article_category_id, :status)
  end

end
