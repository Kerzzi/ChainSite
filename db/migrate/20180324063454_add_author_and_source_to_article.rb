class AddAuthorAndSourceToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :author, :string
    add_column :articles, :source, :string
  end
end
