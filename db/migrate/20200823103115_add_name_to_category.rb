class AddNameToCategory < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :name, :integer
  end
end
