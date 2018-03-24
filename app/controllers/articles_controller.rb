class ArticlesController < ApplicationController
  def index
    @articles = Article.all.recent.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @article = Article.find(params[:id])
  end
end
