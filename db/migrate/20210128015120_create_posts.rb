class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,        null: false
      t.text :content,        null: false
      t.integer :category_id, null: false
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
