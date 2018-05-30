class ArticleCategory < ApplicationRecord
  
  validates :name, presence: true
  
  has_many :article_relationships
  has_many :articles, :through => :article_relationships
  
  scope :recent, -> { order("created_at DESC")}  
end
