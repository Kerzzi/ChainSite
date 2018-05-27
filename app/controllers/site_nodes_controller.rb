class SiteNodesController < ApplicationController
  def show
    @site_node = SiteNode.find(params[:id])
    @sites = @site_node.sites
    set_page_title @site_node.name
    set_page_description "#{@site_node.name}"
    set_page_keywords    @site_node.name
  end
end
