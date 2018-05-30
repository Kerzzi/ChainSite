class ArticleCategory < ApplicationRecord
  
  #article_category 是文章的标签，鉴于修改model名涉及多处修改，因此暂不修改为article_tag了，后续抽空修改
  validates :name, presence: true
  
  has_many :article_relationships
  has_many :articles, :through => :article_relationships
  
  scope :recent, -> { order("created_at DESC")}  
end
