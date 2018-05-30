class Article < ApplicationRecord

  mount_uploader :image, ProjectLogoUploader

  validates :title, presence: true
  validates :content, presence: true

  CATEGORY = ["糖果空投", "平台糖果", "APP糖果","电报糖果","新手帮助","链网资讯","技术交流","站点公告"]
  validates_inclusion_of :category, :in => CATEGORY

  STATUS = ["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  has_many :article_relationships
  has_many :article_categories, :through => :article_relationships
  belongs_to :user

  scope :recent, -> { order("created_at DESC")}
  scope :published, -> { where(:status => "public")}
  scope :drop_candy, -> { where(:category => "糖果空投")}
  scope :platform_candy, -> { where(:category => "平台糖果")}
  scope :app_candy, -> { where(:category => "APP糖果")}
  scope :tele_candy, -> { where(:category => "电报糖果")}
  scope :novice_help, -> { where(:category => "新手帮助")}
  scope :news, -> { where(:category => "链网资讯")}
  scope :technology, -> { where(:category => "技术交流")}
  scope :notice, -> { where(:category => "站点公告")}

end
