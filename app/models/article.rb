class Article < ApplicationRecord

  mount_uploader :image, ProjectLogoUploader

  validates :title, presence: true
  validates :content, presence: true


  STATUS = ["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  belongs_to :article_category, :optional => true
  belongs_to :user

  scope :recent, -> { order("created_at DESC")}
  scope :published, -> { where(:status => "public")}

end
