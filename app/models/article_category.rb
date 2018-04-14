class ArticleCategory < ApplicationRecord
  has_many :article_relationships
  has_many :articles, :through => :article_relationships
  
  scope :recent, -> { order("created_at DESC")}  
end
