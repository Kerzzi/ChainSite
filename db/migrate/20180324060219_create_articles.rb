class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :article_category_id
      t.integer :user_id
      t.string :status, :default => "draft"
      t.string :image
      t.string :summary
      
      t.timestamps
    end
    add_index :articles, :article_category_id
    
  end
end
