class CreateArticleCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :article_categories do |t|
      t.string :name
      t.integer :sort, default: 0

      t.timestamps
    end
    add_index :article_categories, :sort
  end
end
