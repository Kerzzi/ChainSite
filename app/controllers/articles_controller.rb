class ArticlesController < ApplicationController
  before_action :validate_search_key, only: [:search]
  before_action :authenticate_user!, :only => [:new, :create, :edit]

  def index
    @article_categories = ArticleCategory.all
    @articles = Article.published.recent.paginate(:page => params[:page], :per_page => 20)
    set_page_title "糖果空投"
    set_page_description "糖果空投、币圈资讯、区块链技术交流"
    set_page_keywords  "数字货币空投,免费数字货币,免费糖果,空投糖果,平台糖果,app糖果,区块链资讯,区块链技术"
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
    @userarticles = @article.user.articles.recent.paginate(:page => params[:page], :per_page => 5)

    if @article.status != "public"
      flash[:warning] = "这篇文章在审核中！不可查看！"
      redirect_to root_path
    end
    
    set_page_title @article.title
    set_page_description "#{@article.content}"

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

  def search
    if @query_string.present?
      search_result = Article.ransack(@search_criteria).result(:distinct => true)
      @articles = search_result.paginate(:page => params[:page], :per_page => 15 )
    end

  end


  protected

  # 取到params[:q]的内容并去掉非法的内容
  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end

  private

  def article_params
    params.require(:article).permit(:title, :content,:summary,:image, :user_id, :author, :source, :status, :article_category_ids =>[] )
  end

end
