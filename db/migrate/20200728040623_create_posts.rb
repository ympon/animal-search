class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :text, null: false
      t.string :image, null: false
      t.integer :category_id, null: false
      t.integer :area_id, null: false
      t.references :user, forign_key: true
      t.timestamps null: false
    end
  end
end
