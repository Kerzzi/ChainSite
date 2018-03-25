class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sites
  has_many :articles
  has_many :projects

  ROLES = ["super_admin","admin", "editor"]

  def is_super_admin?
    self.role == "super_admin"
  end

  def is_admin?
    ["super_admin", "admin"].include?(self.role) # 如果是 super_admin 的话，当然也有 admin 的权限
  end

  def is_editor?
    ["super_admin","admin", "editor"].include?(self.role)
  end

  def display_name
    if self.username.present?
      self.username
    else
      self.email.split("@").first
    end
  end

end
