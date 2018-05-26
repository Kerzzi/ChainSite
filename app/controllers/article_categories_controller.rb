class ArticleCategoriesController < ApplicationController
  def show
    @article_category = ArticleCategory.find(params[:id])
    @articles = @article_category.articles.published.recent.paginate(:page => params[:page], :per_page => 20)
    set_page_title @article_category.name
    set_page_description "#{@article_category.name}"
  end
end
