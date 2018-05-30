class AddCategoryToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :category, :string, :default => "糖果空投"
  end
end
