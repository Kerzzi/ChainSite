class SitesController < ApplicationController
  before_action :validate_search_key, only: [:search]
  def index
    @site_nodes = SiteNode.all
    @site = Site.all
    set_page_title "区块链网址导航"
    set_page_description "区块链网址导航，币圈链圈网址大全，数字货币网址导航，区块链网址导航，
                          全面收录区块链行业网站，覆盖各大交易所官网，行情，挖矿，钱包，区块链技术服务，区块链查询工具，区块链实验室，行业协会等相关网站。
                          如区块链网站、区块链网址、交易所网站、比特币网站、以太坊网站、莱特币网站、数字货币钱包网址。是您交易数字货币的必备网站。"
  end

  def search
    if @query_string.present?

      search_result = Site.ransack(@search_criteria).result(:distinct => true)
      @sites = search_result.paginate(:page => params[:page], :per_page => 15 )
    end
  end


   protected

   # 取到params[:q]的内容并去掉非法的内容
   def validate_search_key
     @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
     @search_criteria = search_criteria(@query_string)
   end


   def search_criteria(query_string)
     { :name_cont => query_string }
   end

end
