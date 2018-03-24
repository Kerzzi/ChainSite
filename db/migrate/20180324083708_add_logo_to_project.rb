class AddLogoToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :logo, :string
    add_column :projects, :status, :string, :default => "draft"
  end
end
