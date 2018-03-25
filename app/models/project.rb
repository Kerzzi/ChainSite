class Project < ApplicationRecord

  mount_uploader :logo, ProjectLogoUploader

  validates :title, presence: true
  validates :website, presence: true

  belongs_to :user

  STATUS = ["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  # Scope #
  scope :published, -> { where(:status => "public")}
  scope :recent, -> { order("created_at DESC")}

end
