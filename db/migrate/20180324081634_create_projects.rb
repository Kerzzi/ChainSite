class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :ico_start
      t.string :ico_end
      t.string :ico_url
      t.string :website
      t.string :slack
      t.string :facebook
      t.string :telegram
      t.string :twitter
      t.string :weibo
      t.string :github
      t.string :whitepaper
      t.string :ico_amount
      t.string :token_amount
      t.string :raised_ceiling
      t.string :fundraising_cost
      t.string :accept_token
      t.string :token_type
      t.text :introduce
      t.text :rating_report
      t.string :grade
      
      t.integer :user_id
      
      t.timestamps
    end
    add_index :projects, :user_id
    add_index :projects, :title
  end
end
