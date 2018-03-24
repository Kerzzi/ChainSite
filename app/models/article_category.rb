class ArticleCategory < ApplicationRecord
  has_many :articles
  
  scope :recent, -> { order("created_at DESC")}  
end
