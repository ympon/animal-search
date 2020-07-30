class CreatePostsCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_categories do |t|
      t.references :post, null: false
      t.references :category, null: false
      t.timestamps
    end
  end
end
