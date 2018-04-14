class CreateArticleRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :article_relationships do |t|
      t.integer :article_id, :index =>true
      t.integer :article_category_id, :index =>true

      t.timestamps
    end
  end
end
