class Admin::ArticlesController < Admin::BaseController

  def index
    @articles = Article.all.recent.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to admin_articles_path
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
      redirect_to admin_articles_path, notice: "文章更新成功！"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path, alert: "文章已删除"
  end

  def bulk_update
    total = 0
    Array(params[:ids]).each do |article_id|
      article = Article.find(article_id)
      article.destroy
      total += 1
    end

    flash[:alert] = "成功完成 #{total} 笔"
    redirect_to admin_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content,:summary,:image, :author, :source, :user_id, :status, :article_category_ids =>[])
  end

end
